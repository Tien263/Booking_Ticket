USE [master]
GO
/****** Object:  Database [ducute]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[Advertise]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 07/03/2025 11:23:43 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[p1_id] [int] NOT NULL,
	[b_id] [int] IDENTITY(1,1) NOT NULL,
	[c_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[b_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[BookTickets]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[BusRoutes]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[BusTrips]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 07/03/2025 11:23:43 SA ******/
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
	[c_CCCD] [int] NULL,
 CONSTRAINT [PK_Customer_1] PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[Employee_Role]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[Invoice]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[Promotions]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[Promotions_By_Code]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[Promotions_By_Date]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[Promotions_By_Passengers]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[Seats]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[Tickets]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 07/03/2025 11:23:43 SA ******/
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
/****** Object:  Table [dbo].[Vehicles]    Script Date: 07/03/2025 11:23:43 SA ******/
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
