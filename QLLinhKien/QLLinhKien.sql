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
( NAME = N'QLLinhKien', FILENAME = N'Z:\Private\Database\QLLinhKien.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLLinhKien_log', FILENAME = N'Z:\Private\Database\QLLinhKien_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB )
GO

-- Sử dụng cơ sở dữ liệu QLLinhKien để thao tác --
USE [QLLinhKien]
GO

/*-----------------------------------------------------------------------------------/
	PHẦN TẠO LẬP CẤU TRÚC CÁC BẢNG VÀ KHÓA RÀNG BUỘC DỮ LIỆU QUAN HỆ
/-----------------------------------------------------------------------------------*/
CREATE TABLE [Users]
(
	[id] [nchar](10) NOT NULL,
	[username][nvarchar](50) NOT NULL,
	[password][nvarchar](50) NOT NULL,
	[email][nvarchar](50) NOT NULL,
	CONSTRAINT [PK_Users] PRIMARY KEY ([id],[username])
)
GO

CREATE TABLE [Manufacturiers]
(
	[id][nchar](10) NOT NULL,
	[name][nvarchar](50) NOT NULL,
	CONSTRAINT [PK_Manufacturiers] PRIMARY KEY ([id],[name])
)
GO

CREATE TABLE [RAMTypes]
(
	[id][nchar](10) NOT NULL,
	[type][nvarchar](50) NOT NULL,
	CONSTRAINT [PK_RAMTypes] PRIMARY KEY ([id])
)
GO

CREATE TABLE [Sockets]
(
	[id][nchar](10) NOT NULL,
	[type][nvarchar](50) NOT NULL,
	CONSTRAINT [PK_Sockets] PRIMARY KEY ([id])
)
GO

CREATE TABLE [CPUs]
(
	[id][nchar](10) NOT NULL,
	[name][nvarchar](50),
	[manufacturier][nchar](10) NOT NULL,
	[corename][nvarchar](50),
	[core][int],
	[thread][int],
	[socket][nchar](10) NOT NULL,
	[price][int],
	[quantity][int],
	CONSTRAINT [PK_CPUs] PRIMARY KEY ([id]),
	CONSTRAINT [FK_CPUs_Socket] FOREIGN KEY ([socket]) REFERENCES [Sockets]([id])
)
GO

CREATE TABLE [RAMs]
(
	[id][nchar](10) NOT NULL,
	[name][nvarchar](50),
	[manufacturier][nchar](10) NOT NULL,
	[bus][int],
	[capacity][nchar](10) NOT NULL,
	[price][int],
	[quantity][int],
	CONSTRAINT [PK_RAMs] PRIMARY KEY ([id])
)
GO

CREATE TABLE [Cases]
(
	[id][nchar](10) NOT NULL,
	[name][nvarchar](50),
	[manufacturier][nchar](10) NOT NULL,
	[color][nchar](10),
	[price][int],
	[quantity][int],
	CONSTRAINT [PK_Cases] PRIMARY KEY ([id])
)
GO

CREATE TABLE [Disks]
(
	[id][nchar](10) NOT NULL,
	[name][nvarchar](50),
	[manufacturier][nchar](10) NOT NULL,
	[type][nchar](10) NOT NULL,
	[capacity][nchar](10) NOT NULL,
	[connect][nchar](10),
	[price][int],
	[quantity][int],
	CONSTRAINT [PK_Disks] PRIMARY KEY ([id])
)
GO

CREATE TABLE [Mains]
(
	[id][nchar](10) NOT NULL,
	[name][nvarchar](50),
	[manufacturier][nchar](10) NOT NULL,
	[socket][nchar](10) NOT NULL,
	[chipset][nvarchar](50) NOT NULL,
	[type][nchar](10) NOT NULL,
	[ramchannel][int],
	[price][int],
	[quantity][int],
	CONSTRAINT [PK_Mains] PRIMARY KEY ([id]),
	CONSTRAINT [FK_Mains_Socket] FOREIGN KEY ([socket]) REFERENCES [Sockets]([id])
)
GO

CREATE TABLE [PSUs]
(
	[id][nchar](10) NOT NULL,
	[name][nvarchar](50),
	[manufacturier][nchar](10) NOT NULL,
	[performance][int],
	[price][int],
	[quantity][int],
	CONSTRAINT [PK_PSUs] PRIMARY KEY ([id])
)
GO

CREATE TABLE [VGAs]
(
	[id][nchar](10) NOT NULL,
	[name][nvarchar](50),
	[manufacturier][nchar](10) NOT NULL,
	[monitor][int],
	[radiator][nvarchar](50),
	[price][int],
	[quantity][int],
	CONSTRAINT [PK_VGAs] PRIMARY KEY ([id])
)
GO

CREATE TABLE [CPUsupportRAMs]
(
	[idCPU][nchar](10) NOT NULL,
	[idRAM][nchar](10) NOT NULL,
	CONSTRAINT [PK_CPU_RAMs] PRIMARY KEY ([idCPU],[idRAM])
)
GO

CREATE TABLE [MainsupportRAMs]
(
	[idMain][nchar](10) NOT NULL,
	[idRAM][nchar](10) NOT NULL,
	CONSTRAINT [PK_Main_RAMs] PRIMARY KEY ([idMain],[idRAM])
)
GO

/*-----------------------------------------------------------------------------------/
	PHẦN PHỤ
/-----------------------------------------------------------------------------------*/
-- Xóa cơ sở dữ liệu khi cần HỦY HOÀN TOÀN --
USE [master]
GO
DROP DATABASE [QLLinhKien]
