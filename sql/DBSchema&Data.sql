USE [master]
GO
/****** Object:  Database [SummitAI]    Script Date: 3/28/2023 4:49:42 PM ******/
CREATE DATABASE [SummitAI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SummitAI', FILENAME = N'D:\Softwares\New folder\MSSQL15.MSSQLSERVER\MSSQL\DATA\SummitAI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SummitAI_log', FILENAME = N'D:\Softwares\New folder\MSSQL15.MSSQLSERVER\MSSQL\DATA\SummitAI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SummitAI] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SummitAI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SummitAI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SummitAI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SummitAI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SummitAI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SummitAI] SET ARITHABORT OFF 
GO
ALTER DATABASE [SummitAI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SummitAI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SummitAI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SummitAI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SummitAI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SummitAI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SummitAI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SummitAI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SummitAI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SummitAI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SummitAI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SummitAI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SummitAI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SummitAI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SummitAI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SummitAI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SummitAI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SummitAI] SET RECOVERY FULL 
GO
ALTER DATABASE [SummitAI] SET  MULTI_USER 
GO
ALTER DATABASE [SummitAI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SummitAI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SummitAI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SummitAI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SummitAI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SummitAI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SummitAI', N'ON'
GO
ALTER DATABASE [SummitAI] SET QUERY_STORE = OFF
GO
USE [SummitAI]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/28/2023 4:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[accountName] [varchar](100) NOT NULL,
	[createdDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidate]    Script Date: 3/28/2023 4:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[isInternal] [bit] NOT NULL,
	[employeeId] [int] NULL,
	[firstName] [varchar](30) NOT NULL,
	[lastName] [varchar](30) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[mobileNumber] [varchar](20) NOT NULL,
	[techTrackId] [int] NOT NULL,
	[jobTitle] [varchar](30) NULL,
	[grade] [decimal](18, 0) NULL,
	[baseLocation] [varchar](30) NULL,
	[skill] [varchar](max) NOT NULL,
	[experience] [decimal](18, 0) NOT NULL,
	[lwd] [datetime] NULL,
	[interviewDetailsId] [int] NULL,
	[createdDate] [datetime] NOT NULL,
	[updatedDate] [datetime] NULL,
	[isActive] [bit] NULL,
	[createdBy] [varchar](60) NOT NULL,
	[updatedBy] [varchar](60) NULL,
	[updateComments] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterviewDetails]    Script Date: 3/28/2023 4:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[projectId] [int] NOT NULL,
	[interviewType] [varchar](30) NULL,
	[interviewDate] [datetime] NULL,
	[panel] [varchar](60) NULL,
	[interviewStatus] [varchar](30) NULL,
	[remarks] [varchar](max) NULL,
	[createdBy] [varchar](60) NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[updatedDate] [datetime] NULL,
	[updatedBy] [varchar](60) NULL,
	[updateComments] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 3/28/2023 4:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[projectCode] [varchar](60) NOT NULL,
	[projectName] [varchar](100) NOT NULL,
	[accountId] [int] NOT NULL,
	[createdDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResourceRequirement]    Script Date: 3/28/2023 4:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceRequirement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[requirement] [int] NOT NULL,
	[trackId] [int] NOT NULL,
	[projectId] [int] NOT NULL,
	[createdDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TechnicalTrack]    Script Date: 3/28/2023 4:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechnicalTrack](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](60) NOT NULL,
	[projectId] [int] NOT NULL,
	[createdDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([id], [accountName], [createdDate]) VALUES (1, N'SummitAI', CAST(N'2023-03-28T12:13:02.050' AS DateTime))
GO
INSERT [dbo].[Account] ([id], [accountName], [createdDate]) VALUES (4, N'Storable', CAST(N'2023-03-28T14:49:01.613' AS DateTime))
GO
INSERT [dbo].[Account] ([id], [accountName], [createdDate]) VALUES (5, N'Irobot', CAST(N'2023-03-28T14:50:24.303' AS DateTime))
GO
INSERT [dbo].[Account] ([id], [accountName], [createdDate]) VALUES (6, N'test', CAST(N'2023-03-28T15:55:23.587' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Candidate] ON 
GO
INSERT [dbo].[Candidate] ([id], [isInternal], [employeeId], [firstName], [lastName], [email], [mobileNumber], [techTrackId], [jobTitle], [grade], [baseLocation], [skill], [experience], [lwd], [interviewDetailsId], [createdDate], [updatedDate], [isActive], [createdBy], [updatedBy], [updateComments]) VALUES (1, 1, 12345, N'Joydeep', N'Rana', N'joydeep_rana@abc.com', N'7615243178', 1, N'Software Engineer', CAST(3 AS Decimal(18, 0)), N'Pune', N'.net, Angular', CAST(1 AS Decimal(18, 0)), NULL, 1, CAST(N'2023-03-28T12:14:40.780' AS DateTime), NULL, 1, N'Dwarka Role', NULL, NULL)
GO
INSERT [dbo].[Candidate] ([id], [isInternal], [employeeId], [firstName], [lastName], [email], [mobileNumber], [techTrackId], [jobTitle], [grade], [baseLocation], [skill], [experience], [lwd], [interviewDetailsId], [createdDate], [updatedDate], [isActive], [createdBy], [updatedBy], [updateComments]) VALUES (2, 1, 12346, N'Suharta', N'Banerjee', N'suharta@abc.com', N'7615243179', 2, N'Software Engineer', CAST(3 AS Decimal(18, 0)), N'Pune', N'.net, Angular', CAST(1 AS Decimal(18, 0)), NULL, 2, CAST(N'2023-03-28T12:14:40.780' AS DateTime), NULL, 1, N'Dwarka Role', NULL, NULL)
GO
INSERT [dbo].[Candidate] ([id], [isInternal], [employeeId], [firstName], [lastName], [email], [mobileNumber], [techTrackId], [jobTitle], [grade], [baseLocation], [skill], [experience], [lwd], [interviewDetailsId], [createdDate], [updatedDate], [isActive], [createdBy], [updatedBy], [updateComments]) VALUES (3, 1, 12347, N'Garima', N'Srivastava', N'garima@abc.com', N'7615243175', 3, N'Software Engineer', CAST(3 AS Decimal(18, 0)), N'Pune', N'.net, Angular', CAST(1 AS Decimal(18, 0)), NULL, 3, CAST(N'2023-03-28T12:14:40.780' AS DateTime), NULL, 1, N'Dwarka Role', NULL, NULL)
GO
INSERT [dbo].[Candidate] ([id], [isInternal], [employeeId], [firstName], [lastName], [email], [mobileNumber], [techTrackId], [jobTitle], [grade], [baseLocation], [skill], [experience], [lwd], [interviewDetailsId], [createdDate], [updatedDate], [isActive], [createdBy], [updatedBy], [updateComments]) VALUES (4, 1, 12348, N'Honey', N'.', N'honey@abc.com', N'7615243178', 1, N'Software Engineer', CAST(3 AS Decimal(18, 0)), N'Pune', N'.net, Angular', CAST(1 AS Decimal(18, 0)), NULL, 4, CAST(N'2023-03-28T12:14:40.780' AS DateTime), NULL, 1, N'Dwarka Role', NULL, NULL)
GO
INSERT [dbo].[Candidate] ([id], [isInternal], [employeeId], [firstName], [lastName], [email], [mobileNumber], [techTrackId], [jobTitle], [grade], [baseLocation], [skill], [experience], [lwd], [interviewDetailsId], [createdDate], [updatedDate], [isActive], [createdBy], [updatedBy], [updateComments]) VALUES (5, 1, 12349, N'Shreyash', N'Pawar', N'shreyash@abc.com', N'7615243172', 1, N'Software Engineer', CAST(3 AS Decimal(18, 0)), N'Pune', N'.net, Angular', CAST(1 AS Decimal(18, 0)), NULL, 5, CAST(N'2023-03-28T12:14:40.780' AS DateTime), NULL, 1, N'Dwarka Role', NULL, NULL)
GO
INSERT [dbo].[Candidate] ([id], [isInternal], [employeeId], [firstName], [lastName], [email], [mobileNumber], [techTrackId], [jobTitle], [grade], [baseLocation], [skill], [experience], [lwd], [interviewDetailsId], [createdDate], [updatedDate], [isActive], [createdBy], [updatedBy], [updateComments]) VALUES (7, 0, 46414, N'dasf', N'fdafadf', N'honey@gmail.com', N'1234567890', 1, N'afafa', CAST(3 AS Decimal(18, 0)), N'fdafaaf', N'sdhjvsvb', CAST(3 AS Decimal(18, 0)), CAST(N'2023-03-09T00:00:00.000' AS DateTime), 7, CAST(N'2023-03-28T16:29:42.587' AS DateTime), NULL, 1, N'Admin', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Candidate] OFF
GO
SET IDENTITY_INSERT [dbo].[InterviewDetails] ON 
GO
INSERT [dbo].[InterviewDetails] ([id], [projectId], [interviewType], [interviewDate], [panel], [interviewStatus], [remarks], [createdBy], [createdDate], [updatedDate], [updatedBy], [updateComments]) VALUES (1, 1, N'Client', CAST(N'2023-03-23T00:00:00.000' AS DateTime), N'Kausha', N'Selected', N'Good Knowledge', N'Dwarka Role', CAST(N'2023-03-28T12:13:49.167' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[InterviewDetails] ([id], [projectId], [interviewType], [interviewDate], [panel], [interviewStatus], [remarks], [createdBy], [createdDate], [updatedDate], [updatedBy], [updateComments]) VALUES (2, 1, N'Client', CAST(N'2023-03-25T00:00:00.000' AS DateTime), N'Snehal', N'Rejected', N'No experience', N'Dwarka Role', CAST(N'2023-03-28T12:13:49.167' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[InterviewDetails] ([id], [projectId], [interviewType], [interviewDate], [panel], [interviewStatus], [remarks], [createdBy], [createdDate], [updatedDate], [updatedBy], [updateComments]) VALUES (3, 1, N'Client', CAST(N'2023-04-01T00:00:00.000' AS DateTime), N'Ravi', N'Selected', N'Meets the requirement', N'Dwarka Role', CAST(N'2023-03-28T12:13:49.170' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[InterviewDetails] ([id], [projectId], [interviewType], [interviewDate], [panel], [interviewStatus], [remarks], [createdBy], [createdDate], [updatedDate], [updatedBy], [updateComments]) VALUES (4, 1, N'Client', CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Amit', N'Rejected', N'No experience', N'Dwarka Role', CAST(N'2023-03-28T12:13:49.170' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[InterviewDetails] ([id], [projectId], [interviewType], [interviewDate], [panel], [interviewStatus], [remarks], [createdBy], [createdDate], [updatedDate], [updatedBy], [updateComments]) VALUES (5, 1, N'Client', CAST(N'2023-06-10T00:00:00.000' AS DateTime), N'Dwarka', N'Selected', N'Experienced', N'Dwarka Role', CAST(N'2023-03-28T12:13:49.170' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[InterviewDetails] ([id], [projectId], [interviewType], [interviewDate], [panel], [interviewStatus], [remarks], [createdBy], [createdDate], [updatedDate], [updatedBy], [updateComments]) VALUES (7, 7, N'', CAST(N'2023-03-08T00:00:00.000' AS DateTime), N'naskjfa', N'new', N'', N'Admin', CAST(N'2023-03-28T16:29:42.577' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[InterviewDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 
GO
INSERT [dbo].[Project] ([id], [projectCode], [projectName], [accountId], [createdDate]) VALUES (1, N'Summit_123', N'Summit_NTP1', 1, CAST(N'2023-03-28T12:13:17.127' AS DateTime))
GO
INSERT [dbo].[Project] ([id], [projectCode], [projectName], [accountId], [createdDate]) VALUES (2, N'Summit_456', N'Summit_NTP2', 1, CAST(N'2023-03-28T12:13:17.127' AS DateTime))
GO
INSERT [dbo].[Project] ([id], [projectCode], [projectName], [accountId], [createdDate]) VALUES (5, N'STR_STL', N'Sitelink', 4, CAST(N'2023-03-28T14:49:01.617' AS DateTime))
GO
INSERT [dbo].[Project] ([id], [projectCode], [projectName], [accountId], [createdDate]) VALUES (6, N'IR_123', N'Robot', 5, CAST(N'2023-03-28T14:50:24.310' AS DateTime))
GO
INSERT [dbo].[Project] ([id], [projectCode], [projectName], [accountId], [createdDate]) VALUES (7, N'test', N'test', 6, CAST(N'2023-03-28T15:55:23.590' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
SET IDENTITY_INSERT [dbo].[ResourceRequirement] ON 
GO
INSERT [dbo].[ResourceRequirement] ([id], [requirement], [trackId], [projectId], [createdDate]) VALUES (1, 10, 1, 1, CAST(N'2023-03-28T12:13:35.217' AS DateTime))
GO
INSERT [dbo].[ResourceRequirement] ([id], [requirement], [trackId], [projectId], [createdDate]) VALUES (2, 5, 2, 1, CAST(N'2023-03-28T12:13:35.217' AS DateTime))
GO
INSERT [dbo].[ResourceRequirement] ([id], [requirement], [trackId], [projectId], [createdDate]) VALUES (3, 4, 3, 1, CAST(N'2023-03-28T12:13:35.217' AS DateTime))
GO
INSERT [dbo].[ResourceRequirement] ([id], [requirement], [trackId], [projectId], [createdDate]) VALUES (4, 5, 5, 5, CAST(N'2023-03-28T16:27:44.700' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ResourceRequirement] OFF
GO
SET IDENTITY_INSERT [dbo].[TechnicalTrack] ON 
GO
INSERT [dbo].[TechnicalTrack] ([id], [name], [projectId], [createdDate]) VALUES (1, N'.NetFullstack', 1, CAST(N'2023-03-28T12:13:25.590' AS DateTime))
GO
INSERT [dbo].[TechnicalTrack] ([id], [name], [projectId], [createdDate]) VALUES (2, N'Angular', 1, CAST(N'2023-03-28T12:13:25.590' AS DateTime))
GO
INSERT [dbo].[TechnicalTrack] ([id], [name], [projectId], [createdDate]) VALUES (3, N'.netCore,SQL', 1, CAST(N'2023-03-28T12:13:25.590' AS DateTime))
GO
INSERT [dbo].[TechnicalTrack] ([id], [name], [projectId], [createdDate]) VALUES (5, N'VB.NET', 1, CAST(N'2023-03-28T16:26:21.087' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TechnicalTrack] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Project__C3B33FE525AD7CF4]    Script Date: 3/28/2023 4:49:43 PM ******/
ALTER TABLE [dbo].[Project] ADD UNIQUE NONCLUSTERED 
(
	[projectCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Candidate] ADD  DEFAULT (NULL) FOR [lwd]
GO
ALTER TABLE [dbo].[Candidate] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Candidate] ADD  DEFAULT (NULL) FOR [updatedDate]
GO
ALTER TABLE [dbo].[Candidate] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[InterviewDetails] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[InterviewDetails] ADD  DEFAULT (NULL) FOR [updatedDate]
GO
ALTER TABLE [dbo].[Project] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[ResourceRequirement] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[TechnicalTrack] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Candidate]  WITH CHECK ADD FOREIGN KEY([interviewDetailsId])
REFERENCES [dbo].[InterviewDetails] ([id])
GO
ALTER TABLE [dbo].[Candidate]  WITH CHECK ADD FOREIGN KEY([techTrackId])
REFERENCES [dbo].[TechnicalTrack] ([id])
GO
ALTER TABLE [dbo].[InterviewDetails]  WITH CHECK ADD FOREIGN KEY([projectId])
REFERENCES [dbo].[Project] ([id])
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[ResourceRequirement]  WITH CHECK ADD FOREIGN KEY([projectId])
REFERENCES [dbo].[Project] ([id])
GO
ALTER TABLE [dbo].[ResourceRequirement]  WITH CHECK ADD FOREIGN KEY([trackId])
REFERENCES [dbo].[TechnicalTrack] ([id])
GO
ALTER TABLE [dbo].[TechnicalTrack]  WITH CHECK ADD FOREIGN KEY([projectId])
REFERENCES [dbo].[Project] ([id])
GO
USE [master]
GO
ALTER DATABASE [SummitAI] SET  READ_WRITE 
GO
