USE [master]
GO
/****** Object:  Database [ducute]    Script Date: 02/03/2025 12:02:43 CH ******/
CREATE DATABASE [ducute]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ducute', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MINHDUC\MSSQL\DATA\ducute.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ducute_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MINHDUC\MSSQL\DATA\ducute_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ducute] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ducute].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ducute] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ducute] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ducute] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ducute] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ducute] SET ARITHABORT OFF 
GO
ALTER DATABASE [ducute] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ducute] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ducute] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ducute] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ducute] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ducute] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ducute] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ducute] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ducute] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ducute] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ducute] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ducute] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ducute] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ducute] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ducute] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ducute] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ducute] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ducute] SET RECOVERY FULL 
GO
ALTER DATABASE [ducute] SET  MULTI_USER 
GO
ALTER DATABASE [ducute] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ducute] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ducute] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ducute] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ducute] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ducute] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ducute] SET QUERY_STORE = ON
GO
ALTER DATABASE [ducute] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ducute]
GO
/****** Object:  Table [dbo].[Advertise]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertise](
	[a_id] [int] NOT NULL,
	[a_title] [nvarchar](50) NOT NULL,
	[a_startDate] [datetime] NOT NULL,
	[a_endDate] [datetime] NOT NULL,
	[e_id] [int] NOT NULL,
 CONSTRAINT [PK_Advertise] PRIMARY KEY CLUSTERED 
(
	[a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[b_id] [varbinary](10) NOT NULL,
	[p1_id] [int] NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[b_id] ASC,
	[p1_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[b_id] [int] NOT NULL,
	[b_title] [nvarchar](150) NOT NULL,
	[b_content] [nvarchar](max) NOT NULL,
	[b_brief] [nvarchar](150) NOT NULL,
	[b_createdby] [int] NOT NULL,
	[b_updatedby] [int] NOT NULL,
	[b_createdtime] [datetime] NOT NULL,
	[b_updatedtime] [datetime] NOT NULL,
	[b_status] [bit] NOT NULL,
	[b_image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[b_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookTickets]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookTickets](
	[bt_id] [int] IDENTITY(1,1) NOT NULL,
	[bt_status] [nvarchar](20) NOT NULL,
	[bt_bookingDate] [date] NOT NULL,
	[c_id] [int] NOT NULL,
	[bt_ticketNumber] [float] NOT NULL,
	[i_id] [int] NULL,
 CONSTRAINT [PK_BookTickets] PRIMARY KEY CLUSTERED 
(
	[bt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusRoutes]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusRoutes](
	[br_id] [int] NOT NULL,
	[br_distance] [int] NOT NULL,
	[br_from] [nvarchar](50) NOT NULL,
	[br_to] [nvarchar](50) NOT NULL,
	[br_price] [float] NULL,
	[br_description] [nvarchar](300) NOT NULL,
	[c_id] [int] NOT NULL,
 CONSTRAINT [PK_BusRoutes] PRIMARY KEY CLUSTERED 
(
	[br_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusTrips]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusTrips](
	[bt1_id] [int] NOT NULL,
	[bt1_date] [date] NOT NULL,
	[bt1_departureTime] [time](0) NOT NULL,
	[bt1_arrivalTime] [time](0) NOT NULL,
	[bt1_status] [nchar](10) NOT NULL,
	[br_id] [int] NOT NULL,
 CONSTRAINT [PK_BusTrips] PRIMARY KEY CLUSTERED 
(
	[bt1_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[c_email] [nvarchar](50) NOT NULL,
	[c_fullname] [nvarchar](100) NOT NULL,
	[c_phone] [varchar](11) NOT NULL,
	[c_gender] [bit] NULL,
	[c_address] [nvarchar](100) NOT NULL,
	[c_username] [nvarchar](50) NOT NULL,
	[c_password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customer_1] PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[e_id] [int] IDENTITY(1,1) NOT NULL,
	[e_name] [nvarchar](100) NOT NULL,
	[e_phone] [varchar](11) NOT NULL,
	[e_address] [nvarchar](100) NOT NULL,
	[e_gender] [bit] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[e_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Role]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Role](
	[e_id] [int] NOT NULL,
	[r_id] [int] NOT NULL,
 CONSTRAINT [PK_Employee_Role] PRIMARY KEY CLUSTERED 
(
	[e_id] ASC,
	[r_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[i_id] [int] NOT NULL,
	[i_totalPrice] [datetime] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[i_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHistory](
	[oh_id] [int] NOT NULL,
	[p1_id] [int] NOT NULL,
	[oh_date] [datetime] NOT NULL,
	[oh_status] [varchar](50) NOT NULL,
	[oh_totalAmount] [float] NOT NULL,
	[e_id] [int] NOT NULL,
 CONSTRAINT [PK_OrderHistory] PRIMARY KEY CLUSTERED 
(
	[oh_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[p1_id] [int] NOT NULL,
	[p1_date] [datetime] NOT NULL,
	[p1_amount] [float] NOT NULL,
	[pm_id] [int] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[p1_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[pm_id] [int] NOT NULL,
	[pm_name] [varchar](50) NOT NULL,
	[i_id] [int] NOT NULL,
 CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[pm_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[p_id] [int] NOT NULL,
	[p_date] [varchar](50) NOT NULL,
	[e_id] [int] NOT NULL,
 CONSTRAINT [PK_Promotions] PRIMARY KEY CLUSTERED 
(
	[p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions_By_Code]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions_By_Code](
	[pbc_id] [int] NOT NULL,
	[pbc_code] [varchar](15) NOT NULL,
	[pbc_discount] [float] NOT NULL,
	[p_id] [int] NOT NULL,
 CONSTRAINT [PK_Promotions_By_Code] PRIMARY KEY CLUSTERED 
(
	[pbc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions_By_Date]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions_By_Date](
	[pbd_id] [int] NOT NULL,
	[pbd_startDate] [datetime] NOT NULL,
	[pbd_endDate] [datetime] NOT NULL,
	[pbd_discount] [float] NOT NULL,
	[p_id] [int] NOT NULL,
 CONSTRAINT [PK_Promotions_By_Date] PRIMARY KEY CLUSTERED 
(
	[pbd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions_By_Passengers]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions_By_Passengers](
	[pbp_id] [int] NOT NULL,
	[pbp_discount] [float] NOT NULL,
	[pbp_conditions] [nvarchar](150) NOT NULL,
	[p_id] [int] NOT NULL,
 CONSTRAINT [PK_Promotions_By_Passengers] PRIMARY KEY CLUSTERED 
(
	[pbp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[r_id] [int] NOT NULL,
	[r_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[r_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[s_id] [int] IDENTITY(1,1) NOT NULL,
	[s_name] [varchar](50) NOT NULL,
	[s_status] [nvarchar](20) NOT NULL,
	[v_id] [int] NOT NULL,
	[bt1_id] [int] NOT NULL,
	[s_level] [int] NULL,
 CONSTRAINT [PK_Seats] PRIMARY KEY CLUSTERED 
(
	[s_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[t_id] [int] IDENTITY(1,1) NOT NULL,
	[t_status] [nvarchar](20) NOT NULL,
	[bt1_id] [int] NOT NULL,
	[s_id] [int] NOT NULL,
	[t_purchaseDate] [date] NOT NULL,
	[bt_id] [int] NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[t_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[u_username] [varchar](50) NOT NULL,
	[u_password] [varchar](50) NOT NULL,
	[e_id] [int] NULL,
 CONSTRAINT [PK_Users_1] PRIMARY KEY CLUSTERED 
(
	[u_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 02/03/2025 12:02:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[v_id] [int] NOT NULL,
	[v_type] [nvarchar](50) NOT NULL,
	[v_capacity] [int] NOT NULL,
	[v_licensePlate] [int] NOT NULL,
	[v_status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[v_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BookTickets] ON 

INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (14, N'confirmed', CAST(N'2025-02-15' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (18, N'confirmed', CAST(N'2025-02-15' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (22, N'confirmed', CAST(N'2025-02-15' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (23, N'confirmed', CAST(N'2025-02-17' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (24, N'confirmed', CAST(N'2025-02-17' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (25, N'confirmed', CAST(N'2025-02-18' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (26, N'confirmed', CAST(N'2025-02-19' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (190, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (191, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (192, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (193, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (194, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (195, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (196, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (197, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (198, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (199, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (200, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (201, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (202, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (203, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (204, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (205, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (206, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (207, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (208, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (209, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (210, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (211, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (212, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (213, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (214, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (215, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (216, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (217, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (218, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (219, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (220, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (221, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (222, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (223, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (224, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (225, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (226, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (227, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (228, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (229, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (230, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (231, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (232, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (233, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (234, N'confirmed', CAST(N'2025-02-21' AS Date), 3, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (235, N'confirmed', CAST(N'2025-02-21' AS Date), 3, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (238, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (239, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (240, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (241, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (242, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (243, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (244, N'pending', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (245, N'pending', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (246, N'pending', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (247, N'pending', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (248, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (249, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (250, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (251, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (252, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (253, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (254, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (255, N'confirmed', CAST(N'2025-02-21' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (256, N'pending', CAST(N'2025-02-22' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (257, N'pending', CAST(N'2025-02-22' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (258, N'pending', CAST(N'2025-02-22' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (259, N'pending', CAST(N'2025-02-22' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (260, N'pending', CAST(N'2025-02-22' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (261, N'pending', CAST(N'2025-02-22' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (262, N'pending', CAST(N'2025-02-22' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (263, N'pending', CAST(N'2025-02-22' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (264, N'pending', CAST(N'2025-02-22' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (265, N'pending', CAST(N'2025-02-22' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (266, N'pending', CAST(N'2025-02-22' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (267, N'pending', CAST(N'2025-02-22' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (268, N'pending', CAST(N'2025-02-22' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (269, N'pending', CAST(N'2025-02-22' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (270, N'pending', CAST(N'2025-02-22' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (271, N'pending', CAST(N'2025-02-22' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (272, N'pending', CAST(N'2025-02-22' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (273, N'pending', CAST(N'2025-02-22' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (274, N'pending', CAST(N'2025-02-22' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (275, N'pending', CAST(N'2025-02-22' AS Date), 1, 3, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (276, N'pending', CAST(N'2025-02-22' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (277, N'pending', CAST(N'2025-02-22' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (278, N'pending', CAST(N'2025-02-22' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (279, N'pending', CAST(N'2025-02-22' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (280, N'pending', CAST(N'2025-02-22' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (281, N'pending', CAST(N'2025-02-22' AS Date), 1, 1, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (282, N'pending', CAST(N'2025-02-22' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (283, N'pending', CAST(N'2025-02-22' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (284, N'pending', CAST(N'2025-02-22' AS Date), 1, 3, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (285, N'pending', CAST(N'2025-02-22' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (286, N'pending', CAST(N'2025-02-24' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (287, N'pending', CAST(N'2025-02-24' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (288, N'pending', CAST(N'2025-02-25' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (289, N'pending', CAST(N'2025-02-25' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (290, N'pending', CAST(N'2025-02-28' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (291, N'pending', CAST(N'2025-02-28' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (1290, N'pending', CAST(N'2025-03-01' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (2290, N'pending', CAST(N'2025-03-02' AS Date), 1, 2, NULL)
SET IDENTITY_INSERT [dbo].[BookTickets] OFF
GO
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [c_id]) VALUES (1, 192, N'Hà Nội', N'Hải Phòng', 100000, N'Nhanh', 1)
GO
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (1, CAST(N'2025-02-14' AS Date), CAST(N'06:15:00' AS Time), CAST(N'09:30:00' AS Time), N'1         ', 1)
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([c_id], [c_email], [c_fullname], [c_phone], [c_gender], [c_address], [c_username], [c_password]) VALUES (1, N'xuantien50d@gmail.com', N'Nguyễn Xuân Tiến', N'0398996176', 1, N'thanh hóa', N'dfdfdftdđ', N'234')
INSERT [dbo].[Customer] ([c_id], [c_email], [c_fullname], [c_phone], [c_gender], [c_address], [c_username], [c_password]) VALUES (2, N'tiennxhe181563@fpt.edu.vn', N'Nguyễn Xuân Tiến', N'0398996177', 0, N'Thái Bình', N'tiennxhe', N'123')
INSERT [dbo].[Customer] ([c_id], [c_email], [c_fullname], [c_phone], [c_gender], [c_address], [c_username], [c_password]) VALUES (3, N'tuyennvhe186728', N'Nguyen Van TUyen', N'0814791228', 1, N'Bac Giang', N'Tuyen', N'134')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender]) VALUES (1, N'Tran Van B', N'0123456789', N'Ho Chi Minh City', 0)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender]) VALUES (2, N'Nguyễn Xuân Tiến', N'0398996177', N'Thái Bình', 1)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender]) VALUES (3, N'Nguyen Van A', N'0987654321', N'Hanoi, Vietnam', 1)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender]) VALUES (4, N'Vũ Ngọc Thắng', N'39899617', N'Nam Định', 1)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender]) VALUES (5, N'Vũ Tiến Hiếu', N'39899617', N'Nam Định', 1)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender]) VALUES (6, N'Trương Thị Phương Anh', N'0334376015', N'Hà Nội', 0)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender]) VALUES (7, N'Nguyen Van A', N'0987654321', N'Hanoi, Vietnam', 1)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender]) VALUES (8, N'Leê Thu Huyền Tiến', N'4678902927', N'Hưng Yên', 1)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender]) VALUES (9, N'Đào Khánh Long', N'0912267311', N'Hà Nam', 1)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender]) VALUES (10, N'vũ ngọc A', N'123456789', N'Tha', 1)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender]) VALUES (11, N'Trần Quang Thắng', N'123456789', N'Lào Cai', 1)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender]) VALUES (12, N'Trần Quang Thắng', N'0398996177', N'Lào Cai', 0)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
INSERT [dbo].[Employee_Role] ([e_id], [r_id]) VALUES (4, 2)
INSERT [dbo].[Employee_Role] ([e_id], [r_id]) VALUES (8, 1)
GO
INSERT [dbo].[Roles] ([r_id], [r_name]) VALUES (1, N'Marketing')
INSERT [dbo].[Roles] ([r_id], [r_name]) VALUES (2, N'Sale')
INSERT [dbo].[Roles] ([r_id], [r_name]) VALUES (3, N'History')
GO
SET IDENTITY_INSERT [dbo].[Seats] ON 

INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (4, N'A01', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (5, N'A02', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (6, N'A03', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (7, N'A04', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (8, N'A05', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (9, N'A06', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (10, N'A07', N'available', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (11, N'A08', N'available', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (12, N'A09', N'available', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (13, N'A10', N'available', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (14, N'A11', N'available', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (15, N'A12', N'available', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (16, N'B01', N'available', 1, 1, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (17, N'B02', N'available', 1, 1, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (18, N'B03', N'available', 1, 1, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (19, N'B04', N'available', 1, 1, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (20, N'B05', N'available', 1, 1, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (21, N'B06', N'available', 1, 1, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (22, N'B07', N'available', 1, 1, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (23, N'B08', N'available', 1, 1, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (24, N'B09', N'available', 1, 1, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (25, N'B10', N'available', 1, 1, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (26, N'B11', N'available', 1, 1, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (27, N'B12', N'available', 1, 1, 2)
SET IDENTITY_INSERT [dbo].[Seats] OFF
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (17, N'confirmed', 1, 4, CAST(N'2025-02-15' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (21, N'confirmed', 1, 7, CAST(N'2025-02-15' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (25, N'confirmed', 1, 8, CAST(N'2025-02-15' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (26, N'confirmed', 1, 5, CAST(N'2025-02-17' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (27, N'confirmed', 1, 6, CAST(N'2025-02-17' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (28, N'confirmed', 1, 9, CAST(N'2025-02-18' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (29, N'confirmed', 1, 10, CAST(N'2025-02-19' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (193, N'confirmed', 1, 11, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (194, N'confirmed', 1, 12, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (195, N'confirmed', 1, 13, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (196, N'confirmed', 1, 14, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (197, N'confirmed', 1, 15, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (198, N'confirmed', 1, 16, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (199, N'confirmed', 1, 17, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (200, N'confirmed', 1, 18, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (201, N'confirmed', 1, 19, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (202, N'confirmed', 1, 20, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (203, N'confirmed', 1, 23, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (204, N'confirmed', 1, 21, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (205, N'confirmed', 1, 22, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (206, N'confirmed', 1, 24, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (207, N'confirmed', 1, 25, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (208, N'confirmed', 1, 26, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (209, N'confirmed', 1, 27, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (210, N'confirmed', 1, 4, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (211, N'confirmed', 1, 5, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (212, N'confirmed', 1, 6, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (213, N'confirmed', 1, 7, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (214, N'confirmed', 1, 8, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (215, N'confirmed', 1, 9, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (216, N'confirmed', 1, 10, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (217, N'confirmed', 1, 11, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (218, N'confirmed', 1, 12, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (219, N'confirmed', 1, 13, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (220, N'confirmed', 1, 14, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (221, N'confirmed', 1, 15, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (222, N'confirmed', 1, 16, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (223, N'confirmed', 1, 17, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (224, N'confirmed', 1, 18, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (225, N'confirmed', 1, 19, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (226, N'confirmed', 1, 20, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (227, N'confirmed', 1, 21, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (228, N'confirmed', 1, 22, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (229, N'confirmed', 1, 23, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (230, N'confirmed', 1, 24, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (231, N'confirmed', 1, 25, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (232, N'confirmed', 1, 26, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (233, N'confirmed', 1, 27, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (234, N'confirmed', 1, 4, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (235, N'confirmed', 1, 5, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (236, N'confirmed', 1, 6, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (237, N'confirmed', 1, 7, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (238, N'confirmed', 1, 8, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (241, N'confirmed', 1, 9, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (242, N'confirmed', 1, 10, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (243, N'confirmed', 1, 11, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (244, N'confirmed', 1, 12, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (245, N'confirmed', 1, 13, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (246, N'confirmed', 1, 14, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (247, N'pending', 1, 15, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (248, N'pending', 1, 16, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (249, N'pending', 1, 17, CAST(N'2025-02-21' AS Date), NULL)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (250, N'pending', 1, 15, CAST(N'2025-02-21' AS Date), 247)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (251, N'confirmed', 1, 26, CAST(N'2025-02-21' AS Date), 248)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (252, N'confirmed', 1, 27, CAST(N'2025-02-21' AS Date), 249)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (253, N'confirmed', 1, 16, CAST(N'2025-02-21' AS Date), 250)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (254, N'confirmed', 1, 17, CAST(N'2025-02-21' AS Date), 251)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (255, N'confirmed', 1, 18, CAST(N'2025-02-21' AS Date), 252)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (256, N'confirmed', 1, 19, CAST(N'2025-02-21' AS Date), 253)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (257, N'confirmed', 1, 20, CAST(N'2025-02-21' AS Date), 254)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (258, N'confirmed', 1, 21, CAST(N'2025-02-21' AS Date), 255)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (259, N'pending', 1, 22, CAST(N'2025-02-22' AS Date), 256)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (260, N'pending', 1, 23, CAST(N'2025-02-22' AS Date), 256)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (261, N'pending', 1, 22, CAST(N'2025-02-22' AS Date), 257)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (262, N'pending', 1, 5, CAST(N'2025-02-22' AS Date), 258)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (263, N'pending', 1, 6, CAST(N'2025-02-22' AS Date), 258)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (264, N'pending', 1, 4, CAST(N'2025-02-22' AS Date), 259)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (265, N'pending', 1, 5, CAST(N'2025-02-22' AS Date), 259)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (266, N'pending', 1, 6, CAST(N'2025-02-22' AS Date), 260)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (267, N'pending', 1, 7, CAST(N'2025-02-22' AS Date), 260)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (268, N'pending', 1, 5, CAST(N'2025-02-22' AS Date), 261)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (269, N'pending', 1, 4, CAST(N'2025-02-22' AS Date), 262)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (270, N'pending', 1, 7, CAST(N'2025-02-22' AS Date), 263)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (271, N'pending', 1, 7, CAST(N'2025-02-22' AS Date), 264)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (272, N'pending', 1, 9, CAST(N'2025-02-22' AS Date), 264)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (273, N'pending', 1, 7, CAST(N'2025-02-22' AS Date), 265)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (274, N'pending', 1, 8, CAST(N'2025-02-22' AS Date), 265)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (275, N'pending', 1, 8, CAST(N'2025-02-22' AS Date), 266)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (276, N'pending', 1, 9, CAST(N'2025-02-22' AS Date), 266)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (277, N'pending', 1, 7, CAST(N'2025-02-22' AS Date), 267)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (278, N'pending', 1, 8, CAST(N'2025-02-22' AS Date), 268)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (279, N'pending', 1, 9, CAST(N'2025-02-22' AS Date), 268)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (280, N'pending', 1, 9, CAST(N'2025-02-22' AS Date), 269)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (281, N'pending', 1, 11, CAST(N'2025-02-22' AS Date), 269)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (282, N'pending', 1, 9, CAST(N'2025-02-22' AS Date), 270)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (283, N'pending', 1, 9, CAST(N'2025-02-22' AS Date), 271)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (284, N'pending', 1, 9, CAST(N'2025-02-22' AS Date), 272)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (285, N'pending', 1, 9, CAST(N'2025-02-22' AS Date), 273)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (286, N'pending', 1, 9, CAST(N'2025-02-22' AS Date), 274)
GO
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (287, N'pending', 1, 9, CAST(N'2025-02-22' AS Date), 275)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (288, N'pending', 1, 10, CAST(N'2025-02-22' AS Date), 275)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (289, N'pending', 1, 11, CAST(N'2025-02-22' AS Date), 275)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (290, N'pending', 1, 9, CAST(N'2025-02-22' AS Date), 276)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (291, N'pending', 1, 11, CAST(N'2025-02-22' AS Date), 276)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (292, N'pending', 1, 9, CAST(N'2025-02-22' AS Date), 277)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (293, N'pending', 1, 9, CAST(N'2025-02-22' AS Date), 278)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (294, N'pending', 1, 9, CAST(N'2025-02-22' AS Date), 279)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (295, N'pending', 1, 9, CAST(N'2025-02-22' AS Date), 280)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (296, N'pending', 1, 9, CAST(N'2025-02-22' AS Date), 281)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (297, N'pending', 1, 10, CAST(N'2025-02-22' AS Date), 282)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (298, N'pending', 1, 13, CAST(N'2025-02-22' AS Date), 282)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (299, N'pending', 1, 11, CAST(N'2025-02-22' AS Date), 283)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (300, N'pending', 1, 12, CAST(N'2025-02-22' AS Date), 284)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (301, N'pending', 1, 14, CAST(N'2025-02-22' AS Date), 284)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (302, N'pending', 1, 15, CAST(N'2025-02-22' AS Date), 284)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (303, N'pending', 1, 16, CAST(N'2025-02-22' AS Date), 285)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (304, N'pending', 1, 19, CAST(N'2025-02-22' AS Date), 285)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (305, N'pending', 1, 18, CAST(N'2025-02-24' AS Date), 286)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (306, N'pending', 1, 20, CAST(N'2025-02-24' AS Date), 286)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (307, N'pending', 1, 17, CAST(N'2025-02-24' AS Date), 287)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (308, N'pending', 1, 21, CAST(N'2025-02-24' AS Date), 287)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (309, N'pending', 1, 22, CAST(N'2025-02-25' AS Date), 288)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (310, N'pending', 1, 23, CAST(N'2025-02-25' AS Date), 288)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (311, N'pending', 1, 24, CAST(N'2025-02-25' AS Date), 289)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (312, N'pending', 1, 25, CAST(N'2025-02-25' AS Date), 289)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (313, N'pending', 1, 26, CAST(N'2025-02-28' AS Date), 290)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (314, N'pending', 1, 27, CAST(N'2025-02-28' AS Date), 290)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (315, N'pending', 1, 4, CAST(N'2025-02-28' AS Date), 291)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (316, N'pending', 1, 5, CAST(N'2025-02-28' AS Date), 291)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (1313, N'pending', 1, 6, CAST(N'2025-03-01' AS Date), 1290)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (1314, N'pending', 1, 7, CAST(N'2025-03-01' AS Date), 1290)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (2313, N'pending', 1, 8, CAST(N'2025-03-02' AS Date), 2290)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (2314, N'pending', 1, 9, CAST(N'2025-03-02' AS Date), 2290)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
INSERT [dbo].[Users] ([u_username], [u_password], [e_id]) VALUES (N'admin1', N'123', 8)
INSERT [dbo].[Users] ([u_username], [u_password], [e_id]) VALUES (N'admin2', N'123', 4)
INSERT [dbo].[Users] ([u_username], [u_password], [e_id]) VALUES (N'admin3', N'123', 5)
INSERT [dbo].[Users] ([u_username], [u_password], [e_id]) VALUES (N'admin4', N'123', 12)
GO
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (1, N'BUS', 35, 1223456, N'Avaiable')
GO
ALTER TABLE [dbo].[BookTickets] ADD  CONSTRAINT [DF__BookTicke__bt_st__3D5E1FD2]  DEFAULT ('pending') FOR [bt_status]
GO
ALTER TABLE [dbo].[Seats] ADD  DEFAULT ('available') FOR [s_status]
GO
ALTER TABLE [dbo].[Tickets] ADD  DEFAULT ('pending') FOR [t_status]
GO
ALTER TABLE [dbo].[Advertise]  WITH CHECK ADD  CONSTRAINT [FK_Advertise_Employee] FOREIGN KEY([e_id])
REFERENCES [dbo].[Employee] ([e_id])
GO
ALTER TABLE [dbo].[Advertise] CHECK CONSTRAINT [FK_Advertise_Employee]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Payment] FOREIGN KEY([p1_id])
REFERENCES [dbo].[Payment] ([p1_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Payment]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Employee] FOREIGN KEY([b_createdby])
REFERENCES [dbo].[Employee] ([e_id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Employee]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Employee1] FOREIGN KEY([b_updatedby])
REFERENCES [dbo].[Employee] ([e_id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Employee1]
GO
ALTER TABLE [dbo].[BookTickets]  WITH CHECK ADD  CONSTRAINT [FK_BookTickets_Customer1] FOREIGN KEY([c_id])
REFERENCES [dbo].[Customer] ([c_id])
GO
ALTER TABLE [dbo].[BookTickets] CHECK CONSTRAINT [FK_BookTickets_Customer1]
GO
ALTER TABLE [dbo].[BookTickets]  WITH CHECK ADD  CONSTRAINT [FK_BookTickets_Invoice] FOREIGN KEY([i_id])
REFERENCES [dbo].[Invoice] ([i_id])
GO
ALTER TABLE [dbo].[BookTickets] CHECK CONSTRAINT [FK_BookTickets_Invoice]
GO
ALTER TABLE [dbo].[BookTickets]  WITH CHECK ADD  CONSTRAINT [FK_BookTickets_Promotions] FOREIGN KEY([i_id])
REFERENCES [dbo].[Promotions] ([p_id])
GO
ALTER TABLE [dbo].[BookTickets] CHECK CONSTRAINT [FK_BookTickets_Promotions]
GO
ALTER TABLE [dbo].[BusRoutes]  WITH CHECK ADD  CONSTRAINT [FK_BusRoutes_Customer1] FOREIGN KEY([c_id])
REFERENCES [dbo].[Customer] ([c_id])
GO
ALTER TABLE [dbo].[BusRoutes] CHECK CONSTRAINT [FK_BusRoutes_Customer1]
GO
ALTER TABLE [dbo].[BusTrips]  WITH CHECK ADD  CONSTRAINT [FK_BusTrips_BusRoutes] FOREIGN KEY([br_id])
REFERENCES [dbo].[BusRoutes] ([br_id])
GO
ALTER TABLE [dbo].[BusTrips] CHECK CONSTRAINT [FK_BusTrips_BusRoutes]
GO
ALTER TABLE [dbo].[Employee_Role]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role_Employee] FOREIGN KEY([e_id])
REFERENCES [dbo].[Employee] ([e_id])
GO
ALTER TABLE [dbo].[Employee_Role] CHECK CONSTRAINT [FK_Employee_Role_Employee]
GO
ALTER TABLE [dbo].[Employee_Role]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role_Employee1] FOREIGN KEY([e_id])
REFERENCES [dbo].[Employee] ([e_id])
GO
ALTER TABLE [dbo].[Employee_Role] CHECK CONSTRAINT [FK_Employee_Role_Employee1]
GO
ALTER TABLE [dbo].[Employee_Role]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role_Roles] FOREIGN KEY([r_id])
REFERENCES [dbo].[Roles] ([r_id])
GO
ALTER TABLE [dbo].[Employee_Role] CHECK CONSTRAINT [FK_Employee_Role_Roles]
GO
ALTER TABLE [dbo].[OrderHistory]  WITH CHECK ADD  CONSTRAINT [FK_OrderHistory_Employee] FOREIGN KEY([e_id])
REFERENCES [dbo].[Employee] ([e_id])
GO
ALTER TABLE [dbo].[OrderHistory] CHECK CONSTRAINT [FK_OrderHistory_Employee]
GO
ALTER TABLE [dbo].[OrderHistory]  WITH CHECK ADD  CONSTRAINT [FK_OrderHistory_Payment] FOREIGN KEY([p1_id])
REFERENCES [dbo].[Payment] ([p1_id])
GO
ALTER TABLE [dbo].[OrderHistory] CHECK CONSTRAINT [FK_OrderHistory_Payment]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_PaymentMethods] FOREIGN KEY([pm_id])
REFERENCES [dbo].[PaymentMethods] ([pm_id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_PaymentMethods]
GO
ALTER TABLE [dbo].[PaymentMethods]  WITH CHECK ADD  CONSTRAINT [FK_PaymentMethods_Invoice] FOREIGN KEY([i_id])
REFERENCES [dbo].[Invoice] ([i_id])
GO
ALTER TABLE [dbo].[PaymentMethods] CHECK CONSTRAINT [FK_PaymentMethods_Invoice]
GO
ALTER TABLE [dbo].[Promotions]  WITH CHECK ADD  CONSTRAINT [FK_Promotions_Employee] FOREIGN KEY([e_id])
REFERENCES [dbo].[Employee] ([e_id])
GO
ALTER TABLE [dbo].[Promotions] CHECK CONSTRAINT [FK_Promotions_Employee]
GO
ALTER TABLE [dbo].[Promotions_By_Code]  WITH CHECK ADD  CONSTRAINT [FK_Promotions_By_Code_Promotions] FOREIGN KEY([p_id])
REFERENCES [dbo].[Promotions] ([p_id])
GO
ALTER TABLE [dbo].[Promotions_By_Code] CHECK CONSTRAINT [FK_Promotions_By_Code_Promotions]
GO
ALTER TABLE [dbo].[Promotions_By_Date]  WITH CHECK ADD  CONSTRAINT [FK_Promotions_By_Date_Promotions] FOREIGN KEY([p_id])
REFERENCES [dbo].[Promotions] ([p_id])
GO
ALTER TABLE [dbo].[Promotions_By_Date] CHECK CONSTRAINT [FK_Promotions_By_Date_Promotions]
GO
ALTER TABLE [dbo].[Promotions_By_Passengers]  WITH CHECK ADD  CONSTRAINT [FK_Promotions_By_Passengers_Promotions] FOREIGN KEY([p_id])
REFERENCES [dbo].[Promotions] ([p_id])
GO
ALTER TABLE [dbo].[Promotions_By_Passengers] CHECK CONSTRAINT [FK_Promotions_By_Passengers_Promotions]
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_BusTrips] FOREIGN KEY([bt1_id])
REFERENCES [dbo].[BusTrips] ([bt1_id])
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_BusTrips]
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_Vehicles1] FOREIGN KEY([v_id])
REFERENCES [dbo].[Vehicles] ([v_id])
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_Vehicles1]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_BookTickets] FOREIGN KEY([bt_id])
REFERENCES [dbo].[BookTickets] ([bt_id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_BookTickets]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Seats] FOREIGN KEY([s_id])
REFERENCES [dbo].[Seats] ([s_id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Seats]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Employee] FOREIGN KEY([e_id])
REFERENCES [dbo].[Employee] ([e_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Employee]
GO
ALTER TABLE [dbo].[BookTickets]  WITH CHECK ADD  CONSTRAINT [CK__BookTicke__bt_st__3E52440B] CHECK  (([bt_status]='cancelled' OR [bt_status]='confirmed' OR [bt_status]='pending'))
GO
ALTER TABLE [dbo].[BookTickets] CHECK CONSTRAINT [CK__BookTicke__bt_st__3E52440B]
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD CHECK  (([s_status]='booked' OR [s_status]='reserved' OR [s_status]='available'))
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD CHECK  (([t_status]='cancelled' OR [t_status]='confirmed' OR [t_status]='pending'))
GO
USE [master]
GO
ALTER DATABASE [ducute] SET  READ_WRITE 
GO
