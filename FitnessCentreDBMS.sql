USE [master]
GO
/****** Object:  Database [FitnessCentreDB]    Script Date: 6/23/2024 10:32:06 AM ******/
CREATE DATABASE [FitnessCentreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FitnessCentreDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FitnessCentreDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FitnessCentreDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FitnessCentreDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FitnessCentreDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FitnessCentreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FitnessCentreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FitnessCentreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FitnessCentreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FitnessCentreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FitnessCentreDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET RECOVERY FULL 
GO
ALTER DATABASE [FitnessCentreDB] SET  MULTI_USER 
GO
ALTER DATABASE [FitnessCentreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FitnessCentreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FitnessCentreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FitnessCentreDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FitnessCentreDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FitnessCentreDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FitnessCentreDB', N'ON'
GO
ALTER DATABASE [FitnessCentreDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [FitnessCentreDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FitnessCentreDB]
GO
/****** Object:  Table [dbo].[Accountant]    Script Date: 6/23/2024 10:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accountant](
	[StaffID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttendanceRecords]    Script Date: 6/23/2024 10:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceRecords](
	[RecordID] [int] NOT NULL,
	[AttendanceDate] [date] NULL,
	[MemberID] [int] NULL,
	[StaffID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 6/23/2024 10:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ClassID] [int] NOT NULL,
	[ClassName] [varchar](100) NULL,
	[Time] [varchar](100) NULL,
	[Location] [varchar](100) NULL,
	[ClassFee] [decimal](10, 2) NULL,
	[TrainerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrolled]    Script Date: 6/23/2024 10:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrolled](
	[MemberID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC,
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 6/23/2024 10:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[EquipmentID] [int] NOT NULL,
	[EquipmentType] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[Condition] [varchar](50) NULL,
	[LastMaintenanceDate] [date] NULL,
	[SupervisorID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinancialTransactions]    Script Date: 6/23/2024 10:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialTransactions](
	[TransactionID] [int] NOT NULL,
	[Amount] [decimal](10, 2) NULL,
	[TransactionType] [varchar](50) NULL,
	[TransactionDate] [date] NULL,
	[MemberID] [int] NULL,
	[StaffID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Memberr]    Script Date: 6/23/2024 10:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberr](
	[MemberID] [int] NOT NULL,
	[Name] [varchar](100) NULL,
	[ContactInfo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 6/23/2024 10:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] NOT NULL,
	[Name] [varchar](100) NULL,
	[Role] [varchar](50) NULL,
	[Schedule] [varchar](100) NULL,
	[PerformanceMetrics] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supervisor]    Script Date: 6/23/2024 10:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supervisor](
	[StaffID] [int] NOT NULL,
	[EquipmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainer]    Script Date: 6/23/2024 10:32:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainer](
	[StaffID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accountant]  WITH CHECK ADD  CONSTRAINT [fk_staff_accountant] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[Accountant] CHECK CONSTRAINT [fk_staff_accountant]
GO
ALTER TABLE [dbo].[AttendanceRecords]  WITH CHECK ADD  CONSTRAINT [fk_member_attendance] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Memberr] ([MemberID])
GO
ALTER TABLE [dbo].[AttendanceRecords] CHECK CONSTRAINT [fk_member_attendance]
GO
ALTER TABLE [dbo].[AttendanceRecords]  WITH CHECK ADD  CONSTRAINT [fk_staff_attendance] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[AttendanceRecords] CHECK CONSTRAINT [fk_staff_attendance]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [fk_trainer_class] FOREIGN KEY([TrainerID])
REFERENCES [dbo].[Trainer] ([StaffID])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [fk_trainer_class]
GO
ALTER TABLE [dbo].[Enrolled]  WITH CHECK ADD  CONSTRAINT [fk_class_enrolled] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
GO
ALTER TABLE [dbo].[Enrolled] CHECK CONSTRAINT [fk_class_enrolled]
GO
ALTER TABLE [dbo].[Enrolled]  WITH CHECK ADD  CONSTRAINT [fk_member_enrolled] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Memberr] ([MemberID])
GO
ALTER TABLE [dbo].[Enrolled] CHECK CONSTRAINT [fk_member_enrolled]
GO
ALTER TABLE [dbo].[FinancialTransactions]  WITH CHECK ADD  CONSTRAINT [fk_member_transaction] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Memberr] ([MemberID])
GO
ALTER TABLE [dbo].[FinancialTransactions] CHECK CONSTRAINT [fk_member_transaction]
GO
ALTER TABLE [dbo].[FinancialTransactions]  WITH CHECK ADD  CONSTRAINT [fk_staff_transaction] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[FinancialTransactions] CHECK CONSTRAINT [fk_staff_transaction]
GO
ALTER TABLE [dbo].[Supervisor]  WITH CHECK ADD  CONSTRAINT [fk_equipment_supervisor] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[Equipment] ([EquipmentID])
GO
ALTER TABLE [dbo].[Supervisor] CHECK CONSTRAINT [fk_equipment_supervisor]
GO
ALTER TABLE [dbo].[Supervisor]  WITH CHECK ADD  CONSTRAINT [fk_staff_supervisor] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[Supervisor] CHECK CONSTRAINT [fk_staff_supervisor]
GO
ALTER TABLE [dbo].[Trainer]  WITH CHECK ADD  CONSTRAINT [fk_staff_trainer] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[Trainer] CHECK CONSTRAINT [fk_staff_trainer]
GO
USE [master]
GO
ALTER DATABASE [FitnessCentreDB] SET  READ_WRITE 
GO
