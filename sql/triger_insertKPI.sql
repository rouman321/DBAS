USE [DBSA]
GO
create TRIGGER [dbo].[tbKPIBulkInser] 
   ON  [dbo].[tbKPI]
   INSTEAD OF INSERT	
AS 
BEGIN
	--�ҳ�������������ҪUpdate������ȫ��Ԫ�飬����ʱ�����#UpdateTemp
	select A.* into #UpdateTemp
	from inserted as A , [tbKPI] as B
	where A.[��ʼʱ��] = B.[��ʼʱ��]
	and A.[��Ԫ����] = B.[��Ԫ����]
	and A.[С����] = B.[С����]

	--tbInserted��#UpdateTemp�����ϲ����
	select A.* into #InsertTemp
	from ((select * from inserted) EXCEPT (select * from #UpdateTemp)) as A

	--���µ����ݲ���cell��
	INSERT INTO [dbo].[tbKPI]
	SELECT * FROM #InsertTemp

	--�����е�������ɾ�������
	DELETE FROM [dbo].[tbKPI]
	WHERE [��ʼʱ��] = (select [��ʼʱ��]
						from #UpdateTemp as B
						)
		and [��Ԫ����] = (select [��Ԫ����]
						from #UpdateTemp as C
						where [��ʼʱ��] = C.[��ʼʱ��]
						and [��Ԫ����] = C.[��Ԫ����]
						)
		and [С����] = (select [С����]
						from #UpdateTemp as D
						where [��ʼʱ��] = D.[��ʼʱ��]
						and [��Ԫ����] = D.[��Ԫ����]
						and [С����] = D.[С����]
						)

	INSERT INTO [dbo].[tbKPI]
	SELECT * FROM #UpdateTemp
END
