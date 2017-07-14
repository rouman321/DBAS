USE [DBSA]
GO
alter TRIGGER [dbo].[tbPRBBulkInser] 
   ON  [dbo].[tbPRB]
   INSTEAD OF INSERT	
AS 
BEGIN
--�ҳ�������������ҪUpdate������ȫ��Ԫ�飬����ʱ�����#UpdateTemp
	select A.* into #UpdateTemp
	from inserted as A , [tbPRB] as B
	where A.[��ʼʱ��] = B.[��ʼʱ��]
	and A.[С����] = B.[С����]

	--tbInserted��#UpdateTemp�����ϲ����
	select A.* into #InsertTemp
	from ((select * from inserted) EXCEPT (select * from #UpdateTemp)) as A

	--���µ����ݲ���cell��
	INSERT INTO [dbo].[tbPRB]
	SELECT * FROM #InsertTemp

	--�����е�������ɾ�������
	DELETE FROM [dbo].[tbPRB]
	WHERE [��ʼʱ��] = (select [��ʼʱ��]
						from #UpdateTemp as B
						)
		and [С����] = (select [С����]
						from #UpdateTemp as C
						where [��ʼʱ��] = C.[��ʼʱ��]
						and [С����] = C.[С����]
						)

	INSERT INTO [dbo].[tbPRB]
	SELECT * FROM #UpdateTemp
END
