USE [master]
GO
/****** Object:  Database [MyHealth2]    Script Date: 4/8/2020 1:54:20 AM ******/
CREATE DATABASE [MyHealth2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyHealth1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MyHealth1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyHealth1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MyHealth1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MyHealth2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyHealth2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyHealth2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyHealth2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyHealth2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyHealth2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyHealth2] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyHealth2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyHealth2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyHealth2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyHealth2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyHealth2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyHealth2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyHealth2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyHealth2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyHealth2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyHealth2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyHealth2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyHealth2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyHealth2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyHealth2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyHealth2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyHealth2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyHealth2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyHealth2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyHealth2] SET  MULTI_USER 
GO
ALTER DATABASE [MyHealth2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyHealth2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyHealth2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyHealth2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyHealth2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyHealth2] SET QUERY_STORE = OFF
GO
USE [MyHealth2]
GO
/****** Object:  Table [dbo].[Meds]    Script Date: 4/8/2020 1:54:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meds](
	[Num_Meds] [int] IDENTITY(1,1) NOT NULL,
	[MedsName] [nvarchar](50) NULL,
	[MedsDescription] [nvarchar](1000) NULL,
	[CreateDateTime] [datetime] NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[PatientID] [int] NULL,
	[Num_ProblemList] [int] NULL,
	[ActiveUse] [bit] NULL,
	[MedsDosage] [nvarchar](50) NULL,
	[MedsFrequency] [nvarchar](50) NULL,
	[MedsComment] [nvarchar](500) NULL,
 CONSTRAINT [PK_Meds] PRIMARY KEY CLUSTERED 
(
	[Num_Meds] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProblemList]    Script Date: 4/8/2020 1:54:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProblemList](
	[ProblemListName] [nvarchar](50) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ProblemList_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProblemList_Good]    Script Date: 4/8/2020 1:54:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProblemList_Good](
	[Num_ProblemList] [int] IDENTITY(1,1) NOT NULL,
	[ProblemListName] [nvarchar](50) NULL,
	[ProblemListDescription] [nvarchar](1000) NULL,
	[CreateDateTime] [datetime] NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[PatientID] [int] NULL,
	[Resolve] [bit] NULL,
	[Num_ProblemList_Tmplt] [int] NULL,
 CONSTRAINT [PK_ProblemList] PRIMARY KEY CLUSTERED 
(
	[Num_ProblemList] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProblemList_Tmplt]    Script Date: 4/8/2020 1:54:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProblemList_Tmplt](
	[Num_ProblemList_Tmplt] [int] IDENTITY(1,1) NOT NULL,
	[ProblemListName] [nvarchar](50) NULL,
	[ProblemListDescription] [nvarchar](1000) NULL,
	[CreateDateTime] [datetime] NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_ProblemList_Tmplt] PRIMARY KEY CLUSTERED 
(
	[Num_ProblemList_Tmplt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserShip]    Script Date: 4/8/2020 1:54:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserShip](
	[Num_UserShip] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[NameFirst] [nvarchar](50) NULL,
	[NameLast] [nvarchar](50) NULL,
	[NameMiddle] [nvarchar](50) NULL,
	[Gender] [nchar](10) NULL,
	[DOB] [date] NULL,
	[MyPassword] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[AddressLine1] [nvarchar](250) NULL,
	[AddressLine2] [nvarchar](250) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserShip] PRIMARY KEY CLUSTERED 
(
	[Num_UserShip] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserShip_Relations]    Script Date: 4/8/2020 1:54:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserShip_Relations](
	[Num_UserShip_Relations] [int] IDENTITY(1,1) NOT NULL,
	[Num_UserShip_Master] [int] NULL,
	[Num_UserShip_Child] [int] NULL,
 CONSTRAINT [PK_UserShip_Relations] PRIMARY KEY CLUSTERED 
(
	[Num_UserShip_Relations] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Meds] ADD  CONSTRAINT [DF_Meds_CreateDateTime]  DEFAULT (getdate()) FOR [CreateDateTime]
GO
ALTER TABLE [dbo].[Meds] ADD  CONSTRAINT [DF_Meds_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [dbo].[Meds] ADD  CONSTRAINT [DF_Meds_ActiveUse]  DEFAULT ((1)) FOR [ActiveUse]
GO
ALTER TABLE [dbo].[ProblemList_Good] ADD  CONSTRAINT [DF_ProblemList_CreateDateTime]  DEFAULT (getdate()) FOR [CreateDateTime]
GO
ALTER TABLE [dbo].[ProblemList_Good] ADD  CONSTRAINT [DF_ProblemList_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [dbo].[ProblemList_Good] ADD  CONSTRAINT [DF_ProblemList_Resolve]  DEFAULT ((0)) FOR [Resolve]
GO
ALTER TABLE [dbo].[ProblemList_Tmplt] ADD  CONSTRAINT [DF_ProblemList_Tmplt_CreateDateTime]  DEFAULT (getdate()) FOR [CreateDateTime]
GO
ALTER TABLE [dbo].[ProblemList_Tmplt] ADD  CONSTRAINT [DF_ProblemList_Tmplt_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [dbo].[ProblemList_Tmplt] ADD  CONSTRAINT [DF_ProblemList_Tmplt_Active]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  StoredProcedure [dbo].[Add_To_Meds]    Script Date: 4/8/2020 1:54:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Add_To_Meds] 
--Add_To_ProblemList '1','142'
	-- Add the parameters for the stored procedure here

@PatientID int,
@Num_ProblemList int,
@MedsName nvarchar(50),
@MedsDosage nvarchar(50),
@MedsFrequency nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

BEGIN
	INSERT INTO Meds (PatientID, Num_ProblemList, MedsName, MedsDosage, MedsFrequency)
	VALUES (@PatientID, @Num_ProblemList, @MedsName, @MedsDosage, @MedsFrequency)  
END

	--Select * from Meds
	--delete from Meds

END
GO
/****** Object:  StoredProcedure [dbo].[Add_To_ProblemList]    Script Date: 4/8/2020 1:54:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Add_To_ProblemList] 
--Add_To_ProblemList '1','142'
	-- Add the parameters for the stored procedure here

@PatientID int,
@Num_ProblemList_Tmplt int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DECLARE @Counter1 int

IF NOT EXISTS ( SELECT 1 FROM ProblemList 
				WHERE Num_ProblemList_Tmplt = @Num_ProblemList_Tmplt AND 
				PatientID=@PatientID)
BEGIN
	INSERT INTO ProblemList (ProblemListName, ProblemListDescription, Num_ProblemList_Tmplt, PatientID)
	SELECT ProblemListName, ProblemListDescription, Num_ProblemList_Tmplt, @PatientID 
	FROM ProblemList_Tmplt
	WHERE Num_ProblemList_Tmplt=@Num_ProblemList_Tmplt
END

	--Select * from ProblemList
	--delete from ProblemList

END
GO
/****** Object:  StoredProcedure [dbo].[AddBack_To_ProblemList]    Script Date: 4/8/2020 1:54:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[AddBack_To_ProblemList] 
--Add_To_ProblemList '1','142'
	-- Add the parameters for the stored procedure here

@PatientID int,
@Num_ProblemList int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

UPDATE ProblemList
SET Resolve=0
WHERE Num_ProblemList=@Num_ProblemList AND PatientID=@PatientID

END
GO
/****** Object:  StoredProcedure [dbo].[Create_User]    Script Date: 4/8/2020 1:54:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Create_User]
	-- Add the parameters for the stored procedure here

@Name nvarchar(50),
@Email nvarchar(50),
@MyPassword nvarchar(50)



AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
DECLARE @Num_UserShip int

	IF NOT EXISTS ( SELECT 1 FROM UserShip 
				WHERE Email = @Email)
	BEGIN
		INSERT INTO UserShip (Email, NameLast, MyPassword)
		VALUES (@Email, @Name, @MyPassword)

		SET @Num_UserShip = (Select Num_UserShip from UserShip where Email = @Email) 

		INSERT INTO UserShip_Relations (Num_UserShip_Master, Num_UserShip_Child)
		VALUES (@Num_UserShip, @Num_UserShip)
	END

END
GO
/****** Object:  StoredProcedure [dbo].[Del_Fr_Meds]    Script Date: 4/8/2020 1:54:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Del_Fr_Meds] 

@PatientID int,
@Num_Meds int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DELETE FROM Meds WHERE Num_Meds=@Num_Meds AND PatientID=@PatientID

END
GO
/****** Object:  StoredProcedure [dbo].[Del_Fr_ProblemList]    Script Date: 4/8/2020 1:54:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[Del_Fr_ProblemList] 
--Add_To_ProblemList '1','142'
	-- Add the parameters for the stored procedure here

@PatientID int,
@Num_ProblemList int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DELETE FROM ProblemList WHERE Num_ProblemList=@Num_ProblemList AND PatientID=@PatientID

END
GO
/****** Object:  StoredProcedure [dbo].[Login_User]    Script Date: 4/8/2020 1:54:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Login_User]
	-- Add the parameters for the stored procedure here
	--[dbo].[Login_User] 'j@gm.com', '13'

@LoginEmail nvarchar(50),
@LoginPassword nvarchar(50)



AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
DECLARE @Num_UserShip int

	IF EXISTS ( SELECT 1 FROM UserShip 
				WHERE Email = @LoginEmail AND MyPassword = @LoginPassword)
	BEGIN
		
		Select Num_UserShip from UserShip where  Email = @LoginEmail AND MyPassword = @LoginPassword
		
	END

END
GO
/****** Object:  StoredProcedure [dbo].[Rem_Fr_ProblemList]    Script Date: 4/8/2020 1:54:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Rem_Fr_ProblemList] 
--Add_To_ProblemList '1','142'
	-- Add the parameters for the stored procedure here

@PatientID int,
@Num_ProblemList int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

UPDATE ProblemList
SET Resolve=1
WHERE Num_ProblemList=@Num_ProblemList AND PatientID=@PatientID

END
GO
USE [master]
GO
ALTER DATABASE [MyHealth2] SET  READ_WRITE 
GO
