USE [master]
GO
/****** Object:  Database [RBDB]    Script Date: 3/23/2022 5:16:05 PM ******/
CREATE DATABASE [RBDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RBDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.OMSQL\MSSQL\DATA\RBDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RBDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.OMSQL\MSSQL\DATA\RBDB_log.ldf' , SIZE = 4096KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RBDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RBDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RBDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RBDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RBDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RBDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RBDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RBDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RBDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RBDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RBDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RBDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RBDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RBDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RBDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RBDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RBDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RBDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RBDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RBDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RBDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RBDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RBDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RBDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RBDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RBDB] SET  MULTI_USER 
GO
ALTER DATABASE [RBDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RBDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RBDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RBDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RBDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [RBDB]
GO
/****** Object:  User [RBDBUser]    Script Date: 3/23/2022 5:16:05 PM ******/
CREATE USER [RBDBUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [RBDBrole]    Script Date: 3/23/2022 5:16:05 PM ******/
CREATE USER [RBDBrole] FOR LOGIN [RBDBrole] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [OM-SERVER\pola]    Script Date: 3/23/2022 5:16:05 PM ******/
CREATE USER [OM-SERVER\pola] FOR LOGIN [OM-SERVER\pola] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [RBDBUser]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [RBDBUser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [RBDBUser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [RBDBUser]
GO
ALTER ROLE [db_owner] ADD MEMBER [RBDBrole]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [RBDBrole]
GO
ALTER ROLE [db_datareader] ADD MEMBER [RBDBrole]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [RBDBrole]
GO
ALTER ROLE [db_owner] ADD MEMBER [OM-SERVER\pola]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [OM-SERVER\pola]
GO
ALTER ROLE [db_datareader] ADD MEMBER [OM-SERVER\pola]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [OM-SERVER\pola]
GO
/****** Object:  Table [dbo].[CancelWait]    Script Date: 3/23/2022 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CancelWait](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [varchar](50) NOT NULL,
	[Patient_Name] [varchar](50) NOT NULL,
	[Phone_Number] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Appt_Date] [varchar](50) NOT NULL,
	[New_Date] [varchar](50) NOT NULL,
	[Initials] [varchar](50) NOT NULL,
	[Status] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLSFU]    Script Date: 3/23/2022 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLSFU](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Appt_Date] [varchar](50) NOT NULL,
	[Patient_Name] [varchar](255) NOT NULL,
	[Phone_Number] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[CLS_Try] [varchar](255) NOT NULL,
	[FU_Date] [varchar](255) NOT NULL,
	[Initials] [varchar](50) NOT NULL,
	[Status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedRecords]    Script Date: 3/23/2022 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [varchar](255) NOT NULL,
	[PatientName] [varchar](255) NOT NULL,
	[PhoneNumber] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[DrName] [varchar](255) NOT NULL,
	[DrPrName] [varchar](255) NOT NULL,
	[DrPhone] [varchar](255) NOT NULL,
	[DrFax] [varchar](255) NOT NULL,
	[DateDone] [varchar](255) NOT NULL,
	[Initials] [varchar](255) NOT NULL,
	[Status] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEC_MSG]    Script Date: 3/23/2022 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEC_MSG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MSGFor] [varchar](255) NOT NULL,
	[Caller_Name] [varchar](255) NOT NULL,
	[DateTime] [varchar](255) NOT NULL,
	[Caller_Number] [varchar](255) NOT NULL,
	[Message] [varchar](1000) NOT NULL,
	[Action] [varchar](255) NOT NULL,
	[Initials] [varchar](255) NOT NULL,
	[Status] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ptCancelled]    Script Date: 3/23/2022 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ptCancelled](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [varchar](255) NOT NULL,
	[PatientName] [varchar](255) NOT NULL,
	[PhoneNumber] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[ReasonForCancel] [varchar](255) NOT NULL,
	[NewDate] [varchar](255) NOT NULL,
	[Initials] [varchar](255) NOT NULL,
	[Status] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt_Request]    Script Date: 3/23/2022 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt_Request](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [varchar](50) NOT NULL,
	[Patient_Name] [varchar](50) NOT NULL,
	[Phone_Number] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Service_Provider] [varchar](50) NOT NULL,
	[Receiving_Via] [varchar](50) NOT NULL,
	[Date_Done] [varchar](50) NOT NULL,
	[Initials] [varchar](50) NOT NULL,
	[Status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Referral]    Script Date: 3/23/2022 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referral](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [varchar](255) NOT NULL,
	[Patient_Name] [varchar](255) NOT NULL,
	[Phone_Number] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[RFR] [varchar](255) NOT NULL,
	[RefDate] [varchar](255) NOT NULL,
	[Initials] [varchar](255) NOT NULL,
	[Status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reorder_Contacts]    Script Date: 3/23/2022 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reorder_Contacts](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [varchar](255) NULL,
	[Patient_Name] [varchar](255) NULL,
	[Phone_Number] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[OrderDescription] [varchar](255) NULL,
	[OD] [varchar](255) NULL,
	[OS] [varchar](255) NULL,
	[CCNumber] [varchar](255) NULL,
	[Expiration] [varchar](255) NULL,
	[CVC] [varchar](255) NULL,
	[HomeOffice] [varchar](255) NULL,
	[Status] [varchar](255) NULL,
	[Initials] [varchar](255) NULL,
	[OrderFrom] [varchar](255) NULL,
	[IsOrdered] [varchar](255) NULL,
	[IsInsBilled] [varchar](255) NULL,
	[InsAmount] [varchar](255) NULL,
	[Charged] [varchar](255) NULL,
	[ChargeAmt] [varchar](255) NULL,
	[Rebate] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rx_Request]    Script Date: 3/23/2022 5:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx_Request](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [varchar](50) NOT NULL,
	[Patient_Name] [varchar](50) NOT NULL,
	[Phone_Number] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Rx] [varchar](50) NOT NULL,
	[Receiving_Via] [varchar](50) NOT NULL,
	[Date_Done] [varchar](50) NOT NULL,
	[Initials] [varchar](50) NOT NULL,
	[Status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [cancellationList_dateNameDone]    Script Date: 3/23/2022 5:16:05 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [cancellationList_dateNameDone] ON [dbo].[CancelWait]
(
	[Patient_Name] ASC,
	[Initials] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [all]    Script Date: 3/23/2022 5:16:05 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [all] ON [dbo].[Reorder_Contacts]
(
	[OrderID] ASC,
	[Date] ASC,
	[Patient_Name] ASC,
	[Phone_Number] ASC,
	[Email] ASC,
	[OrderDescription] ASC,
	[OD] ASC,
	[OS] ASC,
	[CCNumber] ASC,
	[Expiration] ASC,
	[CVC] ASC,
	[HomeOffice] ASC,
	[Status] ASC,
	[Initials] ASC,
	[OrderFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [RBDB] SET  READ_WRITE 
GO
