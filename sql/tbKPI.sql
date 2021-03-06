use DBSA
create table tbKPI
(
起始时间 datetime,
周期 int,
网元名称 nvarchar(63),
小区 nvarchar(255),
小区名 nvarchar(63),
RRC连接建立完成次数 int,
RRC连接请求次数包括重发 int,
RRC建立成功率qf float,
ERAB建立成功总次数 int,
ERAB建立尝试总次数 int,
ERAB建立成功率2 float,
eNodeB触发的ERAB异常释放总次数 int ,
小区切换出ERAB异常释放总次数 int,
ERAB掉线率 float,
无线接通率ay float,
eNodeB发起的S1RESET导致的UEContext释放次数 int,
UEContext异常释放次数 int,
UEContext建立成功总次数 int,
无线掉线率 float,
eNodeB内异频切换出成功次数 int,
eNodeB内异频切换出尝试次数 int,
eNodeB内同频切换出成功次数 int,
eNodeB内同频切换出尝试次数 int,
eNodeB间异频切换出成功次数 int,
eNodeB间异频切换出尝试次数 int,
eNodeB间同频切换出成功次数 int,
eNodeB间同频切换出尝试次数 int,
eNB内切换成功率 float,
eNB间切换成功率 float,
同频切换成功率zsp float,
异频切换成功率zsp float,
切换成功率 float,
小区PDCP层所接收到的上行数据的总吞吐量 bigint,
小区PDCP层所发送的下行数据的总吞吐量 bigint,
RC重建请求次数 int,
RRC连接重建比率 float,
通过重建回源小区的eNodeB间同频切换出执行成功次数 int,
通过重建回源小区的eNodeB间异频切换出执行成功次数 int,
通过重建回源小区的eNodeB内同频切换出执行成功次数 int,
通过重建回源小区的eNodeB内异频切换出执行成功次数 int,
eNB内切换出成功次数 int,
eNB内切换出请求次数 int
)