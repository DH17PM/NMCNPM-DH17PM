Use Master
GO
    IF exists(Select name From sys.databases Where name='QLNV' )
    DROP Database QLNV
GO
    Create Database QLNV
GO

USE QLNV;

CREATE TABLE chucvu(
	macv nvarchar(5) primary key,
	tencv nvarchar(50) not null,
	hsphucap float
) 
GO

CREATE TABLE nhanvien(
	manv nvarchar(5) primary key,
	holot nvarchar(50) not null,
	tennv nvarchar(10) not null,
	phai nvarchar(3),
	ngaysinh smalldatetime,
	macv nvarchar(5) not null foreign key(macv) references chucvu(macv)
) 
GO
CREATE TABLE quatrinhluong(
	manv nvarchar(5) not null foreign key(manv) references nhanvien(manv),
	ngaybd smalldatetime,
	hsluong float not null,
	ghichu bit,
	primary key(manv,ngaybd)
)
GO

-- Dữ liệu bảng chucvu
INSERT INTO chucvu VALUES(N'TP',N'Trưởng phòng',0.5);
INSERT INTO chucvu VALUES(N'PP',N'Phó trưởng phòng',0.45);
INSERT INTO chucvu VALUES(N'CV',N'Chuyên viên',0.3);
INSERT INTO chucvu VALUES(N'KT',N'Kế toán',0.25);
INSERT INTO chucvu VALUES(N'LX',N'Lái xe cơ quan',0.25);

-- Dữ liệu bảng nhanvien 
INSERT INTO nhanvien VALUES(N'NV001',N'Nguyễn Phước Minh',N'Tân',N'Nam','1975-04-19',N'TP');
INSERT INTO nhanvien VALUES(N'NV002',N'Hà Thị Thanh',N'Nhàn',N'Nữ','1964-03-09',N'PP');
INSERT INTO nhanvien VALUES(N'NV003',N'Văn Minh',N'Tú',N'Nam','1960-02-15',N'CV');
INSERT INTO nhanvien VALUES(N'NV004',N'Lý Văn',N'Sang',N'Nam','1970-12-21',N'CV');
INSERT INTO nhanvien VALUES(N'NV005',N'Nguyễn Thị Thu',N'An',N'Nữ','1981-08-22',N'PP');
INSERT INTO nhanvien VALUES(N'NV006',N'Nguyễn Thanh',N'Tùng',N'Nam','1977-07-07',N'LX');
INSERT INTO nhanvien VALUES(N'NV007',N'Trần Văn',N'Sơn',N'Nam','1979-07-08',N'CV');
INSERT INTO nhanvien VALUES(N'NV008',N'Cao Thị Ngọc',N'Nhung',N'Nữ','1980-06-19',N'KT');
INSERT INTO nhanvien VALUES(N'NV009',N'Lê Thành',N'Tấn',N'Nam','1984-12-05',N'CV');
INSERT INTO nhanvien VALUES(N'NV010',N'Phan Thị Thủy',N'Tiên',N'Nữ','1987-10-25',N'KT');
GO
-- Dữ liệu bảng qtluong
INSERT INTO quatrinhluong VALUES(N'NV003','2001/01/01',2.34,0);
INSERT INTO quatrinhluong VALUES(N'NV001','2001/01/01',4.4,0);
INSERT INTO quatrinhluong VALUES(N'NV002','2001/01/01',4.4,0);
INSERT INTO quatrinhluong VALUES(N'NV008','2001/01/01',1.86,0);
INSERT INTO quatrinhluong VALUES(N'NV004','2002/06/01',2.34,0);
INSERT INTO quatrinhluong VALUES(N'NV008','2003/01/01',2.06,0);
INSERT INTO quatrinhluong VALUES(N'NV003','2004/01/01',2.67,0);
INSERT INTO quatrinhluong VALUES(N'NV002','2004/01/01',4.74,0);
INSERT INTO quatrinhluong VALUES(N'NV001','2004/01/01',4.74,0);
INSERT INTO quatrinhluong VALUES(N'NV008','2005/01/01',2.26,0);
INSERT INTO quatrinhluong VALUES(N'NV004','2005/06/01',2.67,0);
INSERT INTO quatrinhluong VALUES(N'NV005','2005/06/01',4.4,0);
INSERT INTO quatrinhluong VALUES(N'NV006','2005/06/01',2.05,0);
INSERT INTO quatrinhluong VALUES(N'NV008','2007/01/01',2.46,0);
INSERT INTO quatrinhluong VALUES(N'NV009','2007/01/01',2.34,0);
INSERT INTO quatrinhluong VALUES(N'NV003','2007/01/01',3,0);
INSERT INTO quatrinhluong VALUES(N'NV001','2007/01/01',5.08,0);
INSERT INTO quatrinhluong VALUES(N'NV006','2007/06/01',2.23,0);
INSERT INTO quatrinhluong VALUES(N'NV005','2008/06/01',4.74,0);
INSERT INTO quatrinhluong VALUES(N'NV004','2008/06/01',3,0);
INSERT INTO quatrinhluong VALUES(N'NV010','2008/06/01',1.86,0);
INSERT INTO quatrinhluong VALUES(N'NV007','2008/06/01',2.34,0);
INSERT INTO quatrinhluong VALUES(N'NV008','2009/01/01',2.66,0);
INSERT INTO quatrinhluong VALUES(N'NV006','2009/06/01',2.41,0);
INSERT INTO quatrinhluong VALUES(N'NV001','2010/01/01',5.42,1);
INSERT INTO quatrinhluong VALUES(N'NV009','2010/01/01',2.67,1);
INSERT INTO quatrinhluong VALUES(N'NV010','2010/06/01',2.06,1);
INSERT INTO quatrinhluong VALUES(N'NV008','2011/01/01',2.86,1);
INSERT INTO quatrinhluong VALUES(N'NV005','2011/06/01',5.08,1);
INSERT INTO quatrinhluong VALUES(N'NV007','2011/06/01',2.67,1);
INSERT INTO quatrinhluong VALUES(N'NV006','2011/06/01',2.59,1);
INSERT INTO quatrinhluong VALUES(N'NV004','2011/06/01',3.33,1);

select * from quatrinhluong;