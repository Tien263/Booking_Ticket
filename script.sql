USE [PROJECTV01]
GO
/****** Object:  Table [dbo].[Advertise]    Script Date: 2/18/2025 11:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertise](
	[a_id] [int] NOT NULL,
	[a_title] [nvarchar](50) NOT NULL,
	[a_startDate] [datetime] NOT NULL,
	[a_endDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Advertise] PRIMARY KEY CLUSTERED 
(
	[a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 2/18/2025 11:05:10 AM ******/
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
/****** Object:  Table [dbo].[Blog]    Script Date: 2/18/2025 11:05:10 AM ******/
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
/****** Object:  Table [dbo].[BookTickets]    Script Date: 2/18/2025 11:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookTickets](
	[bt_id] [int] IDENTITY(1,1) NOT NULL,
	[bt_status] NVARCHAR(20) DEFAULT 'pending' CHECK ([bt_status] IN ('pending', 'confirmed','cancelled'))  NOT NULL,
	[bt_bookingDate] [date] NOT NULL,
	[c_id] [int] NOT NULL,
	[bt_ticketNumber] [float] NOT NULL,
	[t_id] [int] NOT NULL,
	[i_id] [int] NOT NULL,
 CONSTRAINT [PK_BookTickets] PRIMARY KEY CLUSTERED 
(
	[bt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusRoutes]    Script Date: 2/18/2025 11:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusRoutes](
	[br_id] [int] NOT NULL,
	[br_distance] [int] NOT NULL,
	[br_from] [nvarchar](50) NOT NULL,
	[br_to] [nvarchar](50) NOT NULL,
	[br_description] [nvarchar](300) NOT NULL,
	[c_id] [int] NOT NULL,
 CONSTRAINT [PK_BusRoutes] PRIMARY KEY CLUSTERED 
(
	[br_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusTrips]    Script Date: 2/18/2025 11:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusTrips](
	[bt1_id] [int] NOT NULL,
	[bt1_date] [date] NOT NULL,
	[bt1_departureTime] [datetime] NOT NULL,
	[bt1_arrivalTime] [datetime] NOT NULL,
	[bt1_status] [nchar](10) NOT NULL,
	[br_id] [int] NOT NULL,
 CONSTRAINT [PK_BusTrips] PRIMARY KEY CLUSTERED 
(
	[bt1_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/18/2025 11:05:10 AM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 2/18/2025 11:05:10 AM ******/
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
/****** Object:  Table [dbo].[Employee_Role]    Script Date: 2/18/2025 11:05:10 AM ******/
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
/****** Object:  Table [dbo].[Invoice]    Script Date: 2/18/2025 11:05:10 AM ******/
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
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 2/18/2025 11:05:10 AM ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 2/18/2025 11:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[p1_id] [int] NOT NULL,
	[p1_date] [datetime] NOT NULL,
	[p1_amount] [float] NOT NULL,
	[i_id] [int] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[p1_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 2/18/2025 11:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[pm_id] [int] NOT NULL,
	[pm_name] [varchar](50) NOT NULL,
	[p1_id] [int] NOT NULL,
 CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[pm_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 2/18/2025 11:05:10 AM ******/
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
/****** Object:  Table [dbo].[Promotions_By_Code]    Script Date: 2/18/2025 11:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions_By_Code](
	[pbc_id] [int] IDENTITY(1,1) NOT NULL,
	[pbc_code] [varchar](15) NOT NULL,
	[pbc_discount] [float] NOT NULL,
	[pbc_endDate] [datetime] NOT NULL,
	[pbc_quantity] [int] NOT NULL,
	[p_id] [int] NULL,
	[a_id] [int] NULL,
 CONSTRAINT [PK_Promotions_By_Code] PRIMARY KEY CLUSTERED 
(
	[pbc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions_By_Date]    Script Date: 2/18/2025 11:05:10 AM ******/
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
	[a_id] [int] NULL,
 CONSTRAINT [PK_Promotions_By_Date] PRIMARY KEY CLUSTERED 
(
	[pbd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions_By_Passengers]    Script Date: 2/18/2025 11:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions_By_Passengers](
	[pbp_id] [int] NOT NULL,
	[pbp_discount] [float] NOT NULL,
	[pbp_conditions] [nvarchar](150) NOT NULL,
	[p_id] [int] NOT NULL,
	[a_id] [int] NULL,
 CONSTRAINT [PK_Promotions_By_Passengers] PRIMARY KEY CLUSTERED 
(
	[pbp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2/18/2025 11:05:10 AM ******/
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
/****** Object:  Table [dbo].[Seats]    Script Date: 2/18/2025 11:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[s_id] [int] NOT NULL,
	[s_name] [varchar](50) NOT NULL,
	[s_status] NVARCHAR(20) DEFAULT 'available' CHECK (s_status IN ('available', 'reserved', 'booked')) NOT NULL,
	[v_id] [int] NOT NULL,
	[bt1_id] [int] NOT NULL,
	[s_level] [int] NULL,
 CONSTRAINT [PK_Seats] PRIMARY KEY CLUSTERED 
(
	[s_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 2/18/2025 11:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[t_id] [int] IDENTITY(1,1) NOT NULL,
	[t_status] NVARCHAR(20) DEFAULT 'pending' CHECK ([t_status] IN ('pending', 'confirmed', 'cancelled')) NOT NULL,
	[t_price] [float] NOT NULL,
	[bt1_id] [int] NOT NULL,
	[s_id] [int] NOT NULL,
	[t_purchaseDate] [date] NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[t_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/18/2025 11:05:10 AM ******/
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
/****** Object:  Table [dbo].[Vehicles]    Script Date: 2/18/2025 11:05:10 AM ******/
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
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([c_id], [c_email], [c_fullname], [c_phone], [c_gender], [c_address], [c_username], [c_password]) VALUES (1, N'xuantien50d@gmail.com', N'Nguyễn Xuân A', N'039899177', 0, N'thanh hóa', N'xuantien', N'234')
INSERT [dbo].[Customer] ([c_id], [c_email], [c_fullname], [c_phone], [c_gender], [c_address], [c_username], [c_password]) VALUES (2, N'tiennxhe181563@fpt.edu.vn', N'Nguyễn Xuân Tiến', N'0398996177', 0, N'Thái Bình', N'tiennxhe', N'123')
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
INSERT [dbo].[Users] ([u_username], [u_password], [e_id]) VALUES (N'admin1', N'234', 8)
INSERT [dbo].[Users] ([u_username], [u_password], [e_id]) VALUES (N'admin2', N'123', 4)
INSERT [dbo].[Users] ([u_username], [u_password], [e_id]) VALUES (N'admin3', N'123', 5)
INSERT [dbo].[Users] ([u_username], [u_password], [e_id]) VALUES (N'admin4', N'123', 12)
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
ALTER TABLE [dbo].[BookTickets]  WITH CHECK ADD  CONSTRAINT [FK_BookTickets_Tickets] FOREIGN KEY([t_id])
REFERENCES [dbo].[Tickets] ([t_id])
GO
ALTER TABLE [dbo].[BookTickets] CHECK CONSTRAINT [FK_BookTickets_Tickets]
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
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Invoice] FOREIGN KEY([i_id])
REFERENCES [dbo].[Invoice] ([i_id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Invoice]
GO
ALTER TABLE [dbo].[PaymentMethods]  WITH CHECK ADD  CONSTRAINT [FK_PaymentMethods_Payment] FOREIGN KEY([p1_id])
REFERENCES [dbo].[Payment] ([p1_id])
GO
ALTER TABLE [dbo].[PaymentMethods] CHECK CONSTRAINT [FK_PaymentMethods_Payment]
GO
ALTER TABLE [dbo].[Promotions]  WITH CHECK ADD  CONSTRAINT [FK_Promotions_Employee] FOREIGN KEY([e_id])
REFERENCES [dbo].[Employee] ([e_id])
GO
ALTER TABLE [dbo].[Promotions] CHECK CONSTRAINT [FK_Promotions_Employee]
GO
ALTER TABLE [dbo].[Promotions_By_Code]  WITH CHECK ADD  CONSTRAINT [FK_Promotions_By_Code_Advertise] FOREIGN KEY([a_id])
REFERENCES [dbo].[Advertise] ([a_id])
GO
ALTER TABLE [dbo].[Promotions_By_Code] CHECK CONSTRAINT [FK_Promotions_By_Code_Advertise]
GO
ALTER TABLE [dbo].[Promotions_By_Code]  WITH CHECK ADD  CONSTRAINT [FK_Promotions_By_Code_Promotions] FOREIGN KEY([p_id])
REFERENCES [dbo].[Promotions] ([p_id])
GO
ALTER TABLE [dbo].[Promotions_By_Code] CHECK CONSTRAINT [FK_Promotions_By_Code_Promotions]
GO
ALTER TABLE [dbo].[Promotions_By_Date]  WITH CHECK ADD  CONSTRAINT [FK_Promotions_By_Date_Advertise] FOREIGN KEY([a_id])
REFERENCES [dbo].[Advertise] ([a_id])
GO
ALTER TABLE [dbo].[Promotions_By_Date] CHECK CONSTRAINT [FK_Promotions_By_Date_Advertise]
GO
ALTER TABLE [dbo].[Promotions_By_Date]  WITH CHECK ADD  CONSTRAINT [FK_Promotions_By_Date_Promotions] FOREIGN KEY([p_id])
REFERENCES [dbo].[Promotions] ([p_id])
GO
ALTER TABLE [dbo].[Promotions_By_Date] CHECK CONSTRAINT [FK_Promotions_By_Date_Promotions]
GO
ALTER TABLE [dbo].[Promotions_By_Passengers]  WITH CHECK ADD  CONSTRAINT [FK_Promotions_By_Passengers_Advertise] FOREIGN KEY([a_id])
REFERENCES [dbo].[Advertise] ([a_id])
GO
ALTER TABLE [dbo].[Promotions_By_Passengers] CHECK CONSTRAINT [FK_Promotions_By_Passengers_Advertise]
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
