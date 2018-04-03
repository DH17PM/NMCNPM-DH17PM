/*===================================================================================/
	TẬP LỆNH TRUY VẤN TẠO CẤU TRÚC VÀ THAO TÁC CƠ SỞ DỮ LIỆU
	Những người thực hiện: Nguyễn Hoàng Anh Khoa, Trần Ngọc Lượng
	Đơn vị: Lớp DH17PM - Đại học An Giang
	Dự án: Quản lý Linh kiện Máy vi tính
	Môn học: Nhập môn công nghệ phần mềm
/===================================================================================*/

/*-----------------------------------------------------------------------------------/
	PHẦN KHỞI TẠO CƠ SỞ DỮ LIỆU
/-----------------------------------------------------------------------------------*/
-- Dùng cơ sở dữ liệu chính --
USE [master]
GO

-- Tạo cơ sở dữ liệu QLLinhKien --
CREATE DATABASE [QLLinhKien] ON
( NAME = N'QLLinhKien', FILENAME = N'Z:\QLLinhKien\QLLinhKien.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLLinhKien_log', FILENAME = N'Z:\QLLinhKien\QLLinhKien_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB )
GO

-- Sử dụng cơ sở dữ liệu QLLinhKien để thao tác --
USE [QLLinhKien]
GO

/*-----------------------------------------------------------------------------------/
	PHẦN TẠO LẬP CẤU TRÚC CÁC BẢNG VÀ KHÓA RÀNG BUỘC DỮ LIỆU QUAN HỆ
/-----------------------------------------------------------------------------------*/
-- Tạo cấu trúc bảng tblCPU --
CREATE TABLE [tblCPU](
	[id] [char](10) NOT NULL,
	[ten] [nvarchar](50) NOT NULL,
	[hang] [nvarchar](50) NOT NULL,
	[loai] [nchar](10) NOT NULL,
	[thehe] [nchar](10) NOT NULL,
	[socket] [nchar](10) NOT NULL,
	[mau] [nchar](10) NOT NULL,
	[socore] [nchar](10) NOT NULL,
	[sothread] [nchar](10) NOT NULL,
	[xungnhip] [nchar](10) NOT NULL,
	[kichthuocbandan] [nchar](10) NOT NULL,
	[tannhiet] [nchar](10) NOT NULL,
	[dientieuthu] [nchar](10) NOT NULL,
	[gia] [int] NOT NULL,
	[soluong] [int] NOT NULL
)
GO

-- Tạo cấu trúc bảng tblOCung --
CREATE TABLE [tblOCung](
	[id] [char](10) NOT NULL,
	[ten] [nvarchar](50) NOT NULL,
	[hang] [nvarchar](50) NOT NULL,
	[dungluong] [nchar](10) NOT NULL,
	[chuan] [nchar](10) NOT NULL,
	[tocdodoc] [nchar](10) NOT NULL,
	[tocdoghi] [nchar](10) NOT NULL,
	[loai] [nchar](10) NOT NULL,
	[baohanh] [int],
	[gia] [int],
	[soluong] [int]
)
GO

-- Tạo cấu trúc bảng tblRAM --
CREATE TABLE [tblRAM](
	[id] [char](10) NOT NULL,
	[ten] [nvarchar](50) NOT NULL,
	[hang] [nvarchar](50) NOT NULL,
	[kieu] [char](8) NOT NULL,
	[dungluong] [nchar](8) NOT NULL,
	[bus] [nchar](10) NOT NULL,
	[baohanh] [int],
	[gia] [int],
	[soluong] [int]
)
GO

-- Tạo cấu trúc bảng tblMain --
CREATE TABLE [tblMain](
	[id] [char](10) NOT NULL,
	[ten] [nvarchar](50) NOT NULL,
	[hang] [nvarchar](50) NOT NULL,
	[kieu] [char](8) NOT NULL,
	[socket] [nchar](10) NOT NULL,
	[chipset] [nchar](10) NOT NULL,
	[sokheram] [int] NOT NULL,
	[ramtoida] [nchar](10) NOT NULL,
	[loairam] [nvarchar](50) NOT NULL,
	[vgaonboard] [nvarchar](50) NOT NULL,
	[audio] [nvarchar](50) NOT NULL,
	[baohanh] [int],
	[gia] [int],
	[soluong] [int]
)
GO

-- Tạo cấu trúc bảng tblSocket --
CREATE TABLE [tblSocket](
	[id] [nchar](10),
	[loai] [nchar](10),
	CONSTRAINT [PK_Socket] PRIMARY KEY ([id],[loai])
)
GO

-- Tạo cấu trúc bảng tblLoaiRAM --
CREATE TABLE [tblLoaiRAM](
	[id] [nchar](10),
	[loai] [nchar](10),
	CONSTRAINT [PK_LoaiRAM] PRIMARY KEY ([id],[loai])
)
GO

-- Sửa đổi cấu trúc bảng, thêm các thuộc tính Khóa Chính cho các bảng --
ALTER TABLE [tblCPU] ADD CONSTRAINT [PK_CPU] PRIMARY KEY ([id])
ALTER TABLE [tblRAM] ADD CONSTRAINT [PK_RAM] PRIMARY KEY ([id])
ALTER TABLE [tblMain] ADD CONSTRAINT [PK_Main] PRIMARY KEY ([id])
ALTER TABLE [tblOCung] ADD CONSTRAINT [PK_OCung] PRIMARY KEY ([id])
GO

/*-----------------------------------------------------------------------------------/
	PHẦN PHỤ
/-----------------------------------------------------------------------------------*/
-- Xóa cơ sở dữ liệu khi cần HỦY HOÀN TOÀN --
USE [master]
GO
DROP DATABASE [QLLinhKien]
