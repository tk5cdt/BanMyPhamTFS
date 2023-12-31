-- L?U FILE BACKUP
USE master
GO
BACKUP DATABASE QL_THEFACESHOP
TO DISK = 'C:\Docx\S4\Code\BanMyPhamTFS\SQL\BACKUP AND RESTORE\QL_THEFACESHOP_FULL.bak'
WITH DESCRIPTION = N'SAO L?U',NOFORMAT,NOINIT,
NAME = N'QL_THEFACESHOP-FULL DATABASE BACKUP',SKIP,NOREWIND,NOUNLOAD,COMPRESSION,STATS=10
GO

BACKUP LOG QL_THEFACESHOP
TO DISK = 'C:\Docx\S4\Code\BanMyPhamTFS\SQL\BACKUP AND RESTORE\QL_THEFACESHOP_TRANS.trn' WITH NOFORMAT, NOINIT,
NAME = N'QL_THEFACESHOP-FULL DATABASE BACKUP',SKIP,NOREWIND,NOUNLOAD,COMPRESSION,STATS=10
GO

-- RESTORE DATABASE
-- RESTORE FULL
RESTORE DATABASE QL_THEFACESHOP
FROM DISK = 'C:\Docx\S4\Code\BanMyPhamTFS\SQL\BACKUP AND RESTORE\QL_THEFACESHOP_FULL.bak' WITH FILE = 1,
NOUNLOAD,REPLACE,STATS=5
GO
-- RESTORE + LOG
RESTORE DATABASE QL_THEFACESHOP
FROM DISK = 'C:\Docx\S4\Code\BanMyPhamTFS\SQL\BACKUP AND RESTORE\QL_THEFACESHOP_FULL.bak' WITH FILE = 1,
NORECOVERY,NOUNLOAD,REPLACE,STATS=5
GO
RESTORE LOG QL_THEFACESHOP
FROM DISK = 'C:\Docx\S4\Code\BanMyPhamTFS\SQL\BACKUP AND RESTORE\QL_THEFACESHOP_TRANS.trn' WITH FILE = 1,
NOUNLOAD,STATS=10
GO