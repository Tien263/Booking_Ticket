USE [PROJECTV01]
GO
/****** Object:  Table [dbo].[Advertise]    Script Date: 3/12/2025 11:16:35 AM ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 3/12/2025 11:16:36 AM ******/
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
/****** Object:  Table [dbo].[Blog]    Script Date: 3/12/2025 11:16:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[b_id] [int] IDENTITY(1,1) NOT NULL,
	[b_title] [nvarchar](150) NOT NULL,
	[b_content] [nvarchar](max) NOT NULL,
	[b_brief] [nvarchar](max) NOT NULL,
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
/****** Object:  Table [dbo].[BookTickets]    Script Date: 3/12/2025 11:16:36 AM ******/
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
/****** Object:  Table [dbo].[BusRoutes]    Script Date: 3/12/2025 11:16:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusRoutes](
	[br_id] [int] IDENTITY(1,1) NOT NULL,
	[br_distance] [int] NOT NULL,
	[br_from] [nvarchar](50) NOT NULL,
	[br_to] [nvarchar](50) NOT NULL,
	[br_price] [float] NOT NULL,
	[br_description] [nvarchar](300) NOT NULL,
	[br_status] [nchar](10) NULL,
 CONSTRAINT [PK_BusRoutes] PRIMARY KEY CLUSTERED 
(
	[br_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusTrips]    Script Date: 3/12/2025 11:16:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusTrips](
	[bt1_id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Contact]    Script Date: 3/12/2025 11:16:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[contact_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/12/2025 11:16:36 AM ******/
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
	[c_password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Customer_1] PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/12/2025 11:16:36 AM ******/
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
	[r_id] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[e_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 3/12/2025 11:16:36 AM ******/
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
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 3/12/2025 11:16:36 AM ******/
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
/****** Object:  Table [dbo].[OTP]    Script Date: 3/12/2025 11:16:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OTP](
	[otpid] [int] IDENTITY(1,1) NOT NULL,
	[c_email] [varchar](50) NULL,
	[otp] [char](6) NULL,
	[created_at] [datetime] NULL,
	[expires_at] [datetime] NULL,
	[used] [bit] NULL,
 CONSTRAINT [PK_OTP] PRIMARY KEY CLUSTERED 
(
	[otpid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 3/12/2025 11:16:36 AM ******/
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
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 3/12/2025 11:16:36 AM ******/
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
/****** Object:  Table [dbo].[Promotions]    Script Date: 3/12/2025 11:16:36 AM ******/
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
/****** Object:  Table [dbo].[Promotions_By_Code]    Script Date: 3/12/2025 11:16:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions_By_Code](
	[pbc_id] [int] IDENTITY(1,1) NOT NULL,
	[pbc_name] [nvarchar](100) NOT NULL,
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
/****** Object:  Table [dbo].[Promotions_By_Date]    Script Date: 3/12/2025 11:16:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions_By_Date](
	[pbd_id] [int] IDENTITY(1,1) NOT NULL,
	[pbd_name] [nvarchar](100) NULL,
	[pbd_startDate] [datetime] NOT NULL,
	[pbd_endDate] [datetime] NOT NULL,
	[pbd_discount] [float] NOT NULL,
	[pbd_quantity] [int] NOT NULL,
	[p_id] [int] NULL,
	[a_id] [int] NULL,
 CONSTRAINT [PK_Promotions_By_Date] PRIMARY KEY CLUSTERED 
(
	[pbd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions_By_Passengers]    Script Date: 3/12/2025 11:16:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions_By_Passengers](
	[pbp_id] [int] NOT NULL,
	[pbp_name] [nvarchar](100) NULL,
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
/****** Object:  Table [dbo].[Roles]    Script Date: 3/12/2025 11:16:36 AM ******/
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
/****** Object:  Table [dbo].[Seats]    Script Date: 3/12/2025 11:16:36 AM ******/
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
/****** Object:  Table [dbo].[Tickets]    Script Date: 3/12/2025 11:16:36 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 3/12/2025 11:16:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[u_username] [varchar](50) NOT NULL,
	[u_password] [varchar](50) NOT NULL,
	[r_id] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[u_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 3/12/2025 11:16:36 AM ******/
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
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([b_id], [b_title], [b_content], [b_brief], [b_createdtime], [b_updatedtime], [b_status], [b_image]) VALUES (3, N'CÔNG TY X TIẾN TỔ CHỨC CHUYẾN DU LỊCH MỚI KẾT NỐI TP.HCM VÀ BUÔN MA THUỘT', N'TỔ CHỨC CHUYẾN MỚI: BẾN XE MIỀN TÂY - BẾN XE BUÔN MA THUỘT
Giá vé: 350.000đ
Thời gian khởi hành: 24-03-2025
Lịch trình chi tiết:
Đón khách tại bến xe Miền Tây (TP.HCM) và xuất phát lúc 6:00 sáng.
Dừng chân tham quan tại các địa điểm nổi bật dọc đường như:
34 giếng phẳng riềng đẹp, mang lại không gian yên bình để thư giãn.
Rừng ngàn cao, thác dăm giấc yên trong mộng lành khạch.
Cồn sạc va wifi miễn phí, giúp kết nối không gian doanh.
Hẻ thòng điệu hoa tiên tién, dầm bão không khí đời chịu suốt hành trình.
Đến bến xe Buôn Ma Thuột vào khoảng 16:00 cùng ngày, với quãng đường khoảng 10km từ trung tâm thành phố.
Khách chen 19 bến vĩen lên TP.HCM tại bến xe Miền Tây, giup Quy Khach de dang tìm kiếm vui ma khong can lăng vệ khoang cách.
Thông tin chuyến đi:
Chuyến đi được tổ chức với sự hỗ trợ từ nhà mạng uy tín, mang lại sự tiện nghi và thoải mái cho hành khách.
Công ty Xuân Tiến hợp tác cùng BusGo để cung cấp dịch vụ đặt vé trực tuyến nhanh chóng và dễ dàng.
ĐẶT VÉ NGAY HÔM NAY VỚI BUSGO!
Thời gian đặt vé: Ngay bây giờ để không bỏ lỡ cơ hội.
Liên hệ: Gọi ngay qua CSKH: 1900 6067 hoặc truy cập ứng dụng BusGo trên Google Play/App Store.
Hãy nhanh tay đặt vé để trải nghiệm hành trình thú vị cùng Công ty Xuân Tiến và BusGo. Chuyến đi không chỉ là cơ hội khám phá mà còn là dịp để tận hưởng những giây phút tuyệt vời bên gia đình và bạn bè!

Trương Tâm - Tổng Đài & CSKH: 1900 6067', N'Công ty Xuân Tiến vừa thông báo mở bán vé cho chuyến du lịch mới kết nối TP.HCM với Buôn Ma Thuột, mang đến cơ hội trải nghiệm những điểm đến nổi bật tại Tây Nguyên. Với hành trình đầy thú vị và tiện nghi, chuyến đi hứa hẹn sẽ mang lại cho bạn những khoảnh khắc đáng nhớ.', CAST(N'2025-03-05T00:00:00.000' AS DateTime), CAST(N'2025-03-12T00:00:00.000' AS DateTime), 1, N'/bookingg/upload/blog1.jpg')
INSERT [dbo].[Blog] ([b_id], [b_title], [b_content], [b_brief], [b_createdtime], [b_updatedtime], [b_status], [b_image]) VALUES (4, N'CÔNG TY XUÂN TIẾN TƯNG BỪNG KHAI TRƯƠNG TUYẾN MỚI KẾT NỐI TUY HÒA VÀ TP.HCM', N'Với sự hỗ trợ của trang web đặt vé tiện lợi Busgo, việc sở hữu vé xe giờ đây trở nên dễ dàng hơn bao giờ hết!

💰 Giá vé chỉ 315.000 đồng/vé, hành trình tuyến bao gồm các điểm chính:

Bến xe Miền Tây ⇔ Đường Kinh Dương Vương ⇔ Quốc lộ 1A ⇔ Quốc lộ 51 ⇔ Các tuyến Cao tốc Bắc Nam ⇔ Quốc lộ 1A ⇔ Bến xe Nam Tuy Hòa (và chiều ngược lại).
Hành trình được thiết kế đảm bảo an toàn, thuận tiện cho mọi hành khách.
🚌 Để mang đến sự thoải mái tối đa, Công ty Xuân Tiến triển khai dòng xe KIMLONG 99 VIP hiện đại:

34 giường phòng riêng biệt, tạo không gian riêng tư tuyệt đối.
Rèm ngăn cách, mang lại sự yên tĩnh và thoải mái.
Cổng sạc và wifi miễn phí, đảm bảo kết nối liên tục suốt chuyến đi.
Hệ thống điều hòa tiên tiến, giữ không khí luôn dễ chịu.
🚐 Đặc biệt, Công ty Xuân Tiến cung cấp:

Dịch vụ trung chuyển miễn phí trong bán kính 10km từ Bến xe Tuy Hòa.
Trung chuyển đến 19 bệnh viện lớn tại TP.HCM từ Bến xe Miền Tây, giúp Quý Khách di chuyển dễ dàng mà không lo về khoảng cách.
🔔 Công ty Xuân Tiến không ngừng cải tiến chất lượng dịch vụ, mở rộng mạng lưới kết nối để mỗi chuyến đi không chỉ là phương tiện di chuyển mà còn là hành trình trải nghiệm tuyệt vời. Đặc biệt, với sự đồng hành của Busgo – trang web đặt vé xe uy tín, Quý Khách có thể dễ dàng tra cứu lịch trình, đặt vé và thanh toán chỉ trong vài cú nhấp chuột!

♥️ Công Ty Cổ Phần Xe Khách Xuân Tiến cùng Busgo hân hạnh phục vụ Quý Khách!

📌 Thông tin chi tiết và đặt vé:

Truy cập ngay: Busgo.vn
Liên hệ: Trung Tâm Tổng Đài & CSKH: 1900.6067
Hãy để Xuân Tiến và Busgo đồng hành cùng bạn trên mọi nẻo đường!', N'Công ty Xuân Tiến hân hoan khai trương tuyến xe mới Bến xe Miền Tây - Bến xe Tuy Hòa, mở ra hành trình kết nối giữa TP.HCM sôi động và thành phố biển tuyệt đẹp Tuy Hòa. Đây không chỉ là một chuyến đi, mà còn là cầu nối đưa Quý Khách đến gần hơn với những khoảnh khắc khó quên bên bờ biển thơ mộng.', CAST(N'2025-03-05T00:00:00.000' AS DateTime), CAST(N'2025-03-05T00:00:00.000' AS DateTime), 1, N'/bookingg/upload/blog2.jpg')
INSERT [dbo].[Blog] ([b_id], [b_title], [b_content], [b_brief], [b_createdtime], [b_updatedtime], [b_status], [b_image]) VALUES (5, N'Khám Phá Vé Xe Tiện Lợi và Uy Tín Cùng Xuân Tiến – BusGo', N'Vì Sao Chọn Xuân Tiến và BusGo?

Dễ Dàng Mua Vé Xe Online: Với trang web BusGo, bạn chỉ cần ngồi tại nhà và mua vé xe trong vài phút. Từ những chuyến đi dài tới những hành trình ngắn, chúng tôi có đầy đủ các tuyến xe cho bạn lựa chọn, tất cả đều được cập nhật liên tục và rõ ràng.

Tiết Kiệm Thời Gian: Bạn không cần phải đến tận bến xe để mua vé hay lo lắng về việc hết vé. Mọi thứ đều có thể được thực hiện dễ dàng trên BusGo, giúp bạn tiết kiệm thời gian quý báu cho những công việc quan trọng khác.

An Toàn và Chất Lượng: Với Công Ty Xuân Tiến, bạn luôn được đảm bảo về chất lượng dịch vụ xe khách. Những chiếc xe mới, đội ngũ tài xế kinh nghiệm và dịch vụ chăm sóc khách hàng tận tình sẽ giúp bạn cảm thấy an tâm trên mọi chuyến đi.

Dịch Vụ Khách Hàng 24/7: Nếu bạn cần hỗ trợ hay có bất kỳ câu hỏi nào, đừng ngần ngại liên hệ ngay với chúng tôi qua hotline. Chúng tôi luôn sẵn sàng phục vụ bạn.

Dễ Dàng Mua Vé Trên BusGo:

Chỉ cần vài bước đơn giản, bạn đã có thể sở hữu vé xe mà không cần phải mất công di chuyển xa. Truy cập vào BusGo, lựa chọn tuyến xe và thời gian phù hợp, thanh toán nhanh chóng qua các hình thức trực tuyến an toàn, và vé của bạn sẽ được gửi ngay đến email hoặc tin nhắn của bạn.

Đảm Bảo Hành Trình Mượt Mà Và Tiện Lợi:

Chúng tôi hiểu rằng việc di chuyển liên tỉnh hay giữa các địa phương không phải lúc nào cũng dễ dàng, vì vậy BusGo đã phát triển một hệ thống hỗ trợ toàn diện giúp khách hàng dễ dàng kết nối với các dịch vụ xe khách chất lượng. Dù bạn đang ở đâu, chỉ cần vài thao tác trên BusGo, hành trình của bạn sẽ trở nên thật sự nhẹ nhàng và thuận tiện.

Với Xuân Tiến, Mỗi Chuyến Đi Đều Trở Nên Đặc Biệt!

Xuân Tiến – BusGo không chỉ là một trang web bán vé xe mà còn là người bạn đồng hành trong mọi hành trình. Chúng tôi cam kết sẽ không ngừng nâng cao chất lượng dịch vụ, mang lại cho bạn những chuyến đi an toàn, tiện lợi và tiết kiệm chi phí.

Liên Hệ Ngay:

Trung Tâm Tổng Đài & CSKH: 1900.6067
Hotline Đặt Vé: 1900.6652
Chúng tôi rất hân hạnh được phục vụ bạn trên mọi cung đường, giúp bạn khám phá thế giới với một hành trình không thể tuyệt vời hơn. Hãy đến với Xuân Tiến – BusGo ngay hôm nay để lên kế hoạch cho chuyến đi tiếp theo của bạn!', N'Bạn đang tìm kiếm một dịch vụ bán vé xe chất lượng, nhanh chóng và tiện lợi? Hãy để Công Ty Xuân Tiến cùng BusGo mang đến cho bạn những trải nghiệm tuyệt vời trong việc di chuyển an toàn và dễ dàng trên mọi hành trình.', CAST(N'2025-03-05T00:00:00.000' AS DateTime), CAST(N'2025-03-05T00:00:00.000' AS DateTime), 1, N'/bookingg/upload/blog3.jpg')
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[BookTickets] ON 

INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (2, N'pending', CAST(N'2025-02-26' AS Date), 1, 2, NULL)
INSERT [dbo].[BookTickets] ([bt_id], [bt_status], [bt_bookingDate], [c_id], [bt_ticketNumber], [i_id]) VALUES (3, N'pending', CAST(N'2025-02-28' AS Date), 1, 2, NULL)
SET IDENTITY_INSERT [dbo].[BookTickets] OFF
GO
SET IDENTITY_INSERT [dbo].[BusRoutes] ON 

INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (1, 192, N'Hà Nội', N'Hải Phòng', 100000, N'Nhanh', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (2, 100, N'Hà Nội', N'Hải Phòng', 150000, N'Tuyến đường phổ biến, xe chạy liên tục', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (3, 200, N'Hà Nội', N'Nam Định', 180000, N'Tuyến đường tiện lợi, đi qua nhiều điểm', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (4, 250, N'Hà Nội', N'Ninh Bình', 200000, N'Tuyến du lịch, đường đẹp', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (5, 300, N'Hà Nội', N'Thanh Hóa', 250000, N'Tuyến dài, có trạm nghỉ', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (6, 350, N'Hà Nội', N'Nghệ An', 300000, N'Tuyến chạy đêm, tiện lợi', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (7, 400, N'Hà Nội', N'Hà Tĩnh', 350000, N'Tuyến đi qua nhiều tỉnh', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (8, 450, N'Hà Nội', N'Quảng Bình', 400000, N'Tuyến đường dài, chạy liên tục', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (9, 500, N'Hà Nội', N'Huế', 450000, N'Tuyến đến cố đô Huế', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (10, 550, N'Hà Nội', N'Đà Nẵng', 500000, N'Tuyến dài, nhiều điểm dừng', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (11, 600, N'Hà Nội', N'Quảng Nam', 550000, N'Tuyến về miền Trung', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (12, 650, N'Hà Nội', N'Quảng Ngãi', 600000, N'Tuyến đường xa, chất lượng xe tốt', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (13, 700, N'Hà Nội', N'Bình Định', 650000, N'Tuyến đường đi qua nhiều tỉnh', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (14, 750, N'Hà Nội', N'Phú Yên', 700000, N'Tuyến du lịch biển', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (15, 800, N'Hà Nội', N'Nha Trang', 750000, N'Tuyến xe chất lượng cao', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (16, 850, N'Hà Nội', N'Phan Thiết', 800000, N'Tuyến về vùng biển đẹp', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (17, 900, N'Hà Nội', N'Sài Gòn', 850000, N'Tuyến dài, đi qua nhiều tỉnh', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (18, 950, N'Hà Nội', N'Bình Dương', 900000, N'Tuyến đến trung tâm công nghiệp', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (19, 1000, N'Hà Nội', N'Đồng Nai', 950000, N'Tuyến xe giường nằm', N'active    ')
INSERT [dbo].[BusRoutes] ([br_id], [br_distance], [br_from], [br_to], [br_price], [br_description], [br_status]) VALUES (20, 1050, N'Hà Nội', N'Cần Thơ', 1000000, N'Tuyến dài nhất, nhiều trạm dừng', N'active    ')
SET IDENTITY_INSERT [dbo].[BusRoutes] OFF
GO
SET IDENTITY_INSERT [dbo].[BusTrips] ON 

INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (1, CAST(N'2025-02-14' AS Date), CAST(N'06:15:00' AS Time), CAST(N'09:30:00' AS Time), N'1         ', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (2, CAST(N'2025-03-01' AS Date), CAST(N'07:30:00' AS Time), CAST(N'10:00:00' AS Time), N'Đang chạy ', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (3, CAST(N'2025-03-01' AS Date), CAST(N'09:00:00' AS Time), CAST(N'12:30:00' AS Time), N'Hoàn thành', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (4, CAST(N'2025-03-02' AS Date), CAST(N'06:30:00' AS Time), CAST(N'09:00:00' AS Time), N'Hoàn thành', 4)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (5, CAST(N'2025-03-02' AS Date), CAST(N'08:00:00' AS Time), CAST(N'11:30:00' AS Time), N'Đang chạy ', 5)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (6, CAST(N'2025-03-02' AS Date), CAST(N'10:30:00' AS Time), CAST(N'14:00:00' AS Time), N'Hủy       ', 6)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (7, CAST(N'2025-03-03' AS Date), CAST(N'07:00:00' AS Time), CAST(N'10:00:00' AS Time), N'Đang chạy ', 7)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (8, CAST(N'2025-03-03' AS Date), CAST(N'08:45:00' AS Time), CAST(N'12:30:00' AS Time), N'Hoàn thành', 8)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (9, CAST(N'2025-03-03' AS Date), CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time), N'Hủy       ', 9)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (10, CAST(N'2025-03-04' AS Date), CAST(N'05:30:00' AS Time), CAST(N'08:30:00' AS Time), N'Đang chạy ', 10)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (11, CAST(N'2025-03-04' AS Date), CAST(N'07:15:00' AS Time), CAST(N'11:00:00' AS Time), N'Hoàn thành', 11)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (12, CAST(N'2025-03-04' AS Date), CAST(N'09:30:00' AS Time), CAST(N'13:30:00' AS Time), N'Đang chạy ', 12)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (13, CAST(N'2025-03-05' AS Date), CAST(N'06:45:00' AS Time), CAST(N'09:45:00' AS Time), N'Hoàn thành', 13)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (14, CAST(N'2025-03-05' AS Date), CAST(N'08:20:00' AS Time), CAST(N'12:20:00' AS Time), N'Đang chạy ', 14)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (15, CAST(N'2025-03-05' AS Date), CAST(N'10:40:00' AS Time), CAST(N'14:40:00' AS Time), N'Hủy       ', 15)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (16, CAST(N'2025-03-06' AS Date), CAST(N'07:10:00' AS Time), CAST(N'11:10:00' AS Time), N'Đang chạy ', 16)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (17, CAST(N'2025-03-06' AS Date), CAST(N'08:55:00' AS Time), CAST(N'13:00:00' AS Time), N'Hoàn thành', 17)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (18, CAST(N'2025-03-06' AS Date), CAST(N'11:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Hủy       ', 18)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (19, CAST(N'2025-03-07' AS Date), CAST(N'06:15:00' AS Time), CAST(N'10:15:00' AS Time), N'Đang chạy ', 19)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (20, CAST(N'2025-03-07' AS Date), CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time), N'Hoàn thành', 20)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (21, CAST(N'2025-03-07' AS Date), CAST(N'06:00:00' AS Time), CAST(N'08:00:00' AS Time), N'Active    ', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (22, CAST(N'2025-03-07' AS Date), CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'Active    ', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (23, CAST(N'2025-03-07' AS Date), CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Active    ', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (24, CAST(N'2025-03-07' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Active    ', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (25, CAST(N'2025-03-07' AS Date), CAST(N'06:00:00' AS Time), CAST(N'08:00:00' AS Time), N'Active    ', 3)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (26, CAST(N'2025-03-07' AS Date), CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'Active    ', 3)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (27, CAST(N'2025-03-07' AS Date), CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Active    ', 3)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (28, CAST(N'2025-03-07' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Active    ', 3)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (29, CAST(N'2025-03-07' AS Date), CAST(N'06:00:00' AS Time), CAST(N'08:00:00' AS Time), N'Active    ', 4)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (30, CAST(N'2025-03-07' AS Date), CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'Active    ', 4)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (31, CAST(N'2025-03-07' AS Date), CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Active    ', 4)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (32, CAST(N'2025-03-07' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Active    ', 4)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (33, CAST(N'2025-03-08' AS Date), CAST(N'06:00:00' AS Time), CAST(N'08:00:00' AS Time), N'Active    ', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (34, CAST(N'2025-03-08' AS Date), CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'Active    ', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (35, CAST(N'2025-03-08' AS Date), CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Active    ', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (36, CAST(N'2025-03-08' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Active    ', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (37, CAST(N'2025-03-08' AS Date), CAST(N'06:00:00' AS Time), CAST(N'08:00:00' AS Time), N'Active    ', 3)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (38, CAST(N'2025-03-08' AS Date), CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'Active    ', 3)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (39, CAST(N'2025-03-08' AS Date), CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Active    ', 3)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (40, CAST(N'2025-03-08' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Active    ', 3)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (41, CAST(N'2025-03-08' AS Date), CAST(N'06:00:00' AS Time), CAST(N'08:00:00' AS Time), N'Active    ', 4)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (42, CAST(N'2025-03-08' AS Date), CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'Active    ', 4)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (43, CAST(N'2025-03-08' AS Date), CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Active    ', 4)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (44, CAST(N'2025-03-08' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), N'Active    ', 4)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (45, CAST(N'2025-03-12' AS Date), CAST(N'06:30:00' AS Time), CAST(N'07:30:00' AS Time), N'Đang chờ  ', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (46, CAST(N'2025-03-12' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), N'Đang chờ  ', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (47, CAST(N'2025-03-12' AS Date), CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Đang chờ  ', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (48, CAST(N'2025-03-13' AS Date), CAST(N'07:30:00' AS Time), CAST(N'09:00:00' AS Time), N'Đang chờ  ', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (49, CAST(N'2025-03-13' AS Date), CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'Đang chờ  ', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (50, CAST(N'2025-03-13' AS Date), CAST(N'14:30:00' AS Time), CAST(N'15:30:00' AS Time), N'Đang chờ  ', 1)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (51, CAST(N'2025-03-12' AS Date), CAST(N'10:00:00' AS Time), CAST(N'12:30:00' AS Time), N'Đang chờ  ', 3)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (52, CAST(N'2025-03-12' AS Date), CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), N'Đang chờ  ', 3)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (53, CAST(N'2025-03-12' AS Date), CAST(N'16:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Đang chờ  ', 3)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (54, CAST(N'2025-03-13' AS Date), CAST(N'07:30:00' AS Time), CAST(N'08:30:00' AS Time), N'Đang chờ  ', 3)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (55, CAST(N'2025-03-13' AS Date), CAST(N'10:30:00' AS Time), CAST(N'12:00:00' AS Time), N'Đang chờ  ', 3)
INSERT [dbo].[BusTrips] ([bt1_id], [bt1_date], [bt1_departureTime], [bt1_arrivalTime], [bt1_status], [br_id]) VALUES (56, CAST(N'2025-03-13' AS Date), CAST(N'14:00:00' AS Time), CAST(N'16:30:00' AS Time), N'Đang chờ  ', 3)
SET IDENTITY_INSERT [dbo].[BusTrips] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([contact_id], [name], [email], [message], [created_at]) VALUES (1, N'Nguyễn Xuân Tiến', N'xuantien50d@gmail.com', N'Chất lượng tốt', CAST(N'2025-03-10T18:14:01.757' AS DateTime))
INSERT [dbo].[Contact] ([contact_id], [name], [email], [message], [created_at]) VALUES (2, N'Nguyễn Xuân Tiến', N'xuantien50d@gmail.com', N'aaaaaaaaaaaa', CAST(N'2025-03-11T07:41:33.550' AS DateTime))
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([c_id], [c_email], [c_fullname], [c_phone], [c_gender], [c_address], [c_username], [c_password]) VALUES (1, N'xuantien50d@gmail.com', N'Nguyễn Xuân tienn', N'039899177', 0, N'thanh hóa', N'Tien', N'234')
INSERT [dbo].[Customer] ([c_id], [c_email], [c_fullname], [c_phone], [c_gender], [c_address], [c_username], [c_password]) VALUES (2, N'tiennxhe181563@fpt.edu.vn', N'Nguyễn Xuân Tiến', N'0398996177', 0, N'Thái Bình', N'tiennxhe', N'123')
INSERT [dbo].[Customer] ([c_id], [c_email], [c_fullname], [c_phone], [c_gender], [c_address], [c_username], [c_password]) VALUES (3, N'tuyennvhe186728', N'Nguyen Van TUyen', N'0814791228', 1, N'Bac Giang', N'Tuyen', N'134')
INSERT [dbo].[Customer] ([c_id], [c_email], [c_fullname], [c_phone], [c_gender], [c_address], [c_username], [c_password]) VALUES (4, N'admin3@gmail.com', N'Nguyễn Xuân Tiếnnnnnnnnn', N'0319546877', 0, N'Thái Bình', N'tieeeeeeeeeeeeeeeeee', N'$2a$10$6Bu78jWRDrvsE2d0G1wYQ.7EJgfYYhuxo/zAWsDa2ogk33sp.UiKy')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender], [r_id]) VALUES (1, N'Tran Van B', N'0123456789', N'Ho Chi Minh City', 0, 1)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender], [r_id]) VALUES (2, N'Nguyễn Xuân Tiến', N'0398996177', N'Thái Bình', 1, 2)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender], [r_id]) VALUES (3, N'Nguyen Van A', N'0987654321', N'Hanoi, Vietnam', 1, 3)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender], [r_id]) VALUES (4, N'Vũ Ngọc Thắng', N'39899617', N'Nam Định', 1, 4)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender], [r_id]) VALUES (5, N'Vũ Tiến Hiếu', N'39899617', N'Nam Định', 1, 5)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender], [r_id]) VALUES (6, N'Trương Thị Phương Anh', N'0334376015', N'Hà Nội', 0, 6)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender], [r_id]) VALUES (7, N'Nguyen Van A', N'0987654321', N'Hanoi, Vietnam', 1, 7)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender], [r_id]) VALUES (8, N'Leê Thu Huyền Tiến', N'4678902927', N'Hưng Yên', 1, 1)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender], [r_id]) VALUES (9, N'Đào Khánh Long', N'0912267311', N'Hà Nam', 1, 2)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender], [r_id]) VALUES (10, N'vũ ngọc A', N'123456789', N'Tha', 1, 3)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender], [r_id]) VALUES (11, N'Trần Quang Thắng', N'123456789', N'Lào Cai', 1, 4)
INSERT [dbo].[Employee] ([e_id], [e_name], [e_phone], [e_address], [e_gender], [r_id]) VALUES (12, N'Trần Quang Thắng', N'0398996177', N'Lào Cai', 0, 5)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[OTP] ON 

INSERT [dbo].[OTP] ([otpid], [c_email], [otp], [created_at], [expires_at], [used]) VALUES (1, N'xuantien50d@gmail.com', N'882805', CAST(N'2025-03-05T09:52:31.360' AS DateTime), CAST(N'2025-03-05T09:56:31.360' AS DateTime), 0)
INSERT [dbo].[OTP] ([otpid], [c_email], [otp], [created_at], [expires_at], [used]) VALUES (2, N'xuantien50d@gmail.com', N'153040', CAST(N'2025-03-05T10:58:47.410' AS DateTime), CAST(N'2025-03-05T11:02:47.410' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[OTP] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotions_By_Code] ON 

INSERT [dbo].[Promotions_By_Code] ([pbc_id], [pbc_name], [pbc_code], [pbc_discount], [pbc_endDate], [pbc_quantity], [p_id], [a_id]) VALUES (7, N'chao don he', N'SSQKFCY9', 10, CAST(N'2025-02-28T00:00:00.000' AS DateTime), 20, NULL, NULL)
INSERT [dbo].[Promotions_By_Code] ([pbc_id], [pbc_name], [pbc_code], [pbc_discount], [pbc_endDate], [pbc_quantity], [p_id], [a_id]) VALUES (11, N'hihi', N'DS4BXS37', 20, CAST(N'2025-02-13T00:00:00.000' AS DateTime), 20, NULL, NULL)
INSERT [dbo].[Promotions_By_Code] ([pbc_id], [pbc_name], [pbc_code], [pbc_discount], [pbc_endDate], [pbc_quantity], [p_id], [a_id]) VALUES (14, N'ffffff', N'8DYQBXBT', 11, CAST(N'2025-02-25T00:00:00.000' AS DateTime), 11, NULL, NULL)
INSERT [dbo].[Promotions_By_Code] ([pbc_id], [pbc_name], [pbc_code], [pbc_discount], [pbc_endDate], [pbc_quantity], [p_id], [a_id]) VALUES (15, N'haaaaaaaaaa', N'881JS4AH', 12, CAST(N'2025-02-17T00:00:00.000' AS DateTime), 2000, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Promotions_By_Code] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotions_By_Date] ON 

INSERT [dbo].[Promotions_By_Date] ([pbd_id], [pbd_name], [pbd_startDate], [pbd_endDate], [pbd_discount], [pbd_quantity], [p_id], [a_id]) VALUES (4, N'Chuc mung nam moi', CAST(N'2025-02-06T00:00:00.000' AS DateTime), CAST(N'2025-03-01T00:00:00.000' AS DateTime), 1, 2222, NULL, NULL)
INSERT [dbo].[Promotions_By_Date] ([pbd_id], [pbd_name], [pbd_startDate], [pbd_endDate], [pbd_discount], [pbd_quantity], [p_id], [a_id]) VALUES (5, N'fdfdf', CAST(N'2025-02-07T00:00:00.000' AS DateTime), CAST(N'2025-02-28T00:00:00.000' AS DateTime), 30, 200, NULL, NULL)
INSERT [dbo].[Promotions_By_Date] ([pbd_id], [pbd_name], [pbd_startDate], [pbd_endDate], [pbd_discount], [pbd_quantity], [p_id], [a_id]) VALUES (6, N'Code giua thang 3', CAST(N'2025-03-05T00:00:00.000' AS DateTime), CAST(N'2025-03-21T00:00:00.000' AS DateTime), 10, 11111, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Promotions_By_Date] OFF
GO
INSERT [dbo].[Roles] ([r_id], [r_name]) VALUES (1, N'Blog Manager')
INSERT [dbo].[Roles] ([r_id], [r_name]) VALUES (2, N'Ticket Manager')
INSERT [dbo].[Roles] ([r_id], [r_name]) VALUES (3, N'Trip Manager ')
INSERT [dbo].[Roles] ([r_id], [r_name]) VALUES (4, N'Route Manager')
INSERT [dbo].[Roles] ([r_id], [r_name]) VALUES (5, N'Promotion Manager')
INSERT [dbo].[Roles] ([r_id], [r_name]) VALUES (6, N'Vehicle Manager')
INSERT [dbo].[Roles] ([r_id], [r_name]) VALUES (7, N'Invoice Manager')
GO
SET IDENTITY_INSERT [dbo].[Seats] ON 

INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (4, N'A01', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (5, N'A02', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (6, N'A03', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (7, N'A04', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (8, N'A05', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (9, N'A06', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (10, N'A07', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (11, N'A08', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (12, N'A09', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (13, N'A10', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (14, N'A11', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (15, N'A12', N'booked', 1, 1, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (16, N'B01', N'booked', 1, 1, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (17, N'B02', N'booked', 1, 1, 2)
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
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (28, N'A01', N'available', 2, 2, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (29, N'B01', N'available', 2, 2, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (30, N'A01', N'Available', 15, 25, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (31, N'A02', N'Available', 15, 25, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (32, N'A03', N'Available', 15, 25, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (33, N'A04', N'Available', 15, 25, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (34, N'A05', N'Available', 15, 25, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (35, N'A06', N'Available', 15, 25, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (36, N'A07', N'Available', 15, 25, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (37, N'A08', N'Available', 15, 25, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (38, N'A09', N'Available', 15, 25, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (39, N'A10', N'Available', 15, 25, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (40, N'A11', N'Available', 15, 25, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (41, N'A12', N'Available', 15, 25, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (42, N'B01', N'Available', 15, 25, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (43, N'B02', N'Available', 15, 25, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (44, N'B03', N'Available', 15, 25, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (45, N'B04', N'Available', 15, 25, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (46, N'B05', N'Available', 15, 25, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (47, N'B06', N'Available', 15, 25, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (48, N'B07', N'Available', 15, 25, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (49, N'B08', N'Available', 15, 25, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (50, N'B09', N'Available', 15, 25, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (51, N'B10', N'Available', 15, 25, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (52, N'B11', N'Available', 15, 25, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (53, N'B12', N'Available', 15, 25, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (54, N'A01', N'Available', 16, 29, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (55, N'A02', N'Available', 16, 29, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (56, N'A03', N'Available', 16, 29, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (57, N'A04', N'Available', 16, 29, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (58, N'A05', N'Available', 16, 29, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (59, N'A06', N'Available', 16, 29, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (60, N'A07', N'Available', 16, 29, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (61, N'A08', N'Available', 16, 29, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (62, N'A09', N'Available', 16, 29, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (63, N'A10', N'Available', 16, 29, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (64, N'A11', N'Available', 16, 29, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (65, N'A12', N'Available', 16, 29, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (66, N'B01', N'Available', 16, 29, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (67, N'B02', N'Available', 16, 29, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (68, N'B03', N'Available', 16, 29, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (69, N'B04', N'Available', 16, 29, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (70, N'B05', N'Available', 16, 29, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (71, N'B06', N'Available', 16, 29, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (72, N'B07', N'Available', 16, 29, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (73, N'B08', N'Available', 16, 29, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (74, N'B09', N'Available', 16, 29, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (75, N'B10', N'Available', 16, 29, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (76, N'B11', N'Available', 16, 29, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (77, N'B12', N'Available', 16, 29, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (78, N'A01', N'Available', 17, 21, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (79, N'A02', N'Available', 17, 21, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (80, N'A03', N'Available', 17, 21, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (81, N'A04', N'Available', 17, 21, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (82, N'A05', N'Available', 17, 21, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (83, N'A06', N'Available', 17, 21, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (84, N'A07', N'Available', 17, 21, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (85, N'A08', N'Available', 17, 21, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (86, N'A09', N'Available', 17, 21, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (87, N'A10', N'Available', 17, 21, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (88, N'A11', N'Available', 17, 21, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (89, N'A12', N'Available', 17, 21, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (90, N'B01', N'Available', 17, 21, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (91, N'B02', N'Available', 17, 21, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (92, N'B03', N'Available', 17, 21, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (93, N'B04', N'Available', 17, 21, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (94, N'B05', N'Available', 17, 21, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (95, N'B06', N'Available', 17, 21, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (96, N'B07', N'Available', 17, 21, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (97, N'B08', N'Available', 17, 21, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (98, N'B09', N'Available', 17, 21, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (99, N'B10', N'Available', 17, 21, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (100, N'B11', N'Available', 17, 21, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (101, N'B12', N'Available', 17, 21, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (102, N'A01', N'Available', 18, 22, 1)
GO
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (103, N'A02', N'Available', 18, 22, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (104, N'A03', N'Available', 18, 22, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (105, N'A04', N'Available', 18, 22, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (106, N'A05', N'Available', 18, 22, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (107, N'A06', N'Available', 18, 22, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (108, N'A07', N'Available', 18, 22, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (109, N'A08', N'Available', 18, 22, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (110, N'A09', N'Available', 18, 22, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (111, N'A10', N'Available', 18, 22, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (112, N'A11', N'Available', 18, 22, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (113, N'A12', N'Available', 18, 22, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (114, N'B01', N'Available', 18, 22, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (115, N'B02', N'Available', 18, 22, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (116, N'B03', N'Available', 18, 22, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (117, N'B04', N'Available', 18, 22, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (118, N'B05', N'Available', 18, 22, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (119, N'B06', N'Available', 18, 22, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (120, N'B07', N'Available', 18, 22, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (121, N'B08', N'Available', 18, 22, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (122, N'B09', N'Available', 18, 22, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (123, N'B10', N'Available', 18, 22, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (124, N'B11', N'Available', 18, 22, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (125, N'B12', N'Available', 18, 22, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (126, N'A01', N'Available', 17, 23, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (127, N'A02', N'Available', 17, 23, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (128, N'A03', N'Available', 17, 23, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (129, N'A04', N'Available', 17, 23, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (130, N'A05', N'Available', 17, 23, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (131, N'A06', N'Available', 17, 23, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (132, N'A07', N'Available', 17, 23, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (133, N'A08', N'Available', 17, 23, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (134, N'A09', N'Available', 17, 23, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (135, N'A10', N'Available', 17, 23, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (136, N'A11', N'Available', 17, 23, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (137, N'A12', N'Available', 17, 23, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (138, N'B01', N'Available', 17, 23, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (139, N'B02', N'Available', 17, 23, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (140, N'B03', N'Available', 17, 23, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (141, N'B04', N'Available', 17, 23, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (142, N'B05', N'Available', 17, 23, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (143, N'B06', N'Available', 17, 23, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (144, N'B07', N'Available', 17, 23, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (145, N'B08', N'Available', 17, 23, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (146, N'B09', N'Available', 17, 23, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (147, N'B10', N'Available', 17, 23, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (148, N'B11', N'Available', 17, 23, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (149, N'B12', N'Available', 17, 23, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (150, N'A01', N'Available', 18, 24, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (151, N'A02', N'Available', 18, 24, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (152, N'A03', N'Available', 18, 24, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (153, N'A04', N'Available', 18, 24, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (154, N'A05', N'Available', 18, 24, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (155, N'A06', N'Available', 18, 24, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (156, N'A07', N'Available', 18, 24, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (157, N'A08', N'Available', 18, 24, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (158, N'A09', N'Available', 18, 24, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (159, N'A10', N'Available', 18, 24, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (160, N'A11', N'Available', 18, 24, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (161, N'A12', N'Available', 18, 24, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (162, N'B01', N'Available', 18, 24, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (163, N'B02', N'Available', 18, 24, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (164, N'B03', N'Available', 18, 24, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (165, N'B04', N'Available', 18, 24, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (166, N'B05', N'Available', 18, 24, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (167, N'B06', N'Available', 18, 24, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (168, N'B07', N'Available', 18, 24, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (169, N'B08', N'Available', 18, 24, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (170, N'B09', N'Available', 18, 24, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (171, N'B10', N'Available', 18, 24, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (172, N'B11', N'Available', 18, 24, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (173, N'B12', N'Available', 18, 24, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (174, N'A01', N'Available', 15, 27, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (175, N'A02', N'Available', 15, 27, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (176, N'A03', N'Available', 15, 27, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (177, N'A04', N'Available', 15, 27, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (178, N'A05', N'Available', 15, 27, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (179, N'A06', N'Available', 15, 27, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (180, N'A07', N'Available', 15, 27, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (181, N'A08', N'Available', 15, 27, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (182, N'A09', N'Available', 15, 27, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (183, N'A10', N'Available', 15, 27, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (184, N'A11', N'Available', 15, 27, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (185, N'A12', N'Available', 15, 27, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (186, N'B01', N'Available', 15, 27, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (187, N'B02', N'Available', 15, 27, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (188, N'B03', N'Available', 15, 27, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (189, N'B04', N'Available', 15, 27, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (190, N'B05', N'Available', 15, 27, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (191, N'B06', N'Available', 15, 27, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (192, N'B07', N'Available', 15, 27, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (193, N'B08', N'Available', 15, 27, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (194, N'B09', N'Available', 15, 27, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (195, N'B10', N'Available', 15, 27, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (196, N'B11', N'Available', 15, 27, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (197, N'B12', N'Available', 15, 27, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (198, N'A01', N'Available', 16, 31, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (199, N'A02', N'Available', 16, 31, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (200, N'A03', N'Available', 16, 31, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (201, N'A04', N'Available', 16, 31, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (202, N'A05', N'Available', 16, 31, 1)
GO
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (203, N'A06', N'Available', 16, 31, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (204, N'A07', N'Available', 16, 31, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (205, N'A08', N'Available', 16, 31, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (206, N'A09', N'Available', 16, 31, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (207, N'A10', N'Available', 16, 31, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (208, N'A11', N'Available', 16, 31, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (209, N'A12', N'Available', 16, 31, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (210, N'B01', N'Available', 16, 31, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (211, N'B02', N'Available', 16, 31, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (212, N'B03', N'Available', 16, 31, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (213, N'B04', N'Available', 16, 31, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (214, N'B05', N'Available', 16, 31, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (215, N'B06', N'Available', 16, 31, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (216, N'B07', N'Available', 16, 31, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (217, N'B08', N'Available', 16, 31, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (218, N'B09', N'Available', 16, 31, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (219, N'B10', N'Available', 16, 31, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (220, N'B11', N'Available', 16, 31, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (221, N'B12', N'Available', 16, 31, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (222, N'A01', N'Available', 21, 30, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (223, N'A02', N'Available', 21, 30, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (224, N'A03', N'Available', 21, 30, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (225, N'A04', N'Available', 21, 30, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (226, N'A05', N'Available', 21, 30, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (227, N'A06', N'Available', 21, 30, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (228, N'A07', N'Available', 21, 30, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (229, N'A08', N'Available', 21, 30, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (230, N'A09', N'Available', 21, 30, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (231, N'A10', N'Available', 21, 30, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (232, N'A11', N'Available', 21, 30, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (233, N'A12', N'Available', 21, 30, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (234, N'B01', N'Available', 21, 30, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (235, N'B02', N'Available', 21, 30, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (236, N'B03', N'Available', 21, 30, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (237, N'B04', N'Available', 21, 30, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (238, N'B05', N'Available', 21, 30, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (239, N'B06', N'Available', 21, 30, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (240, N'B07', N'Available', 21, 30, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (241, N'B08', N'Available', 21, 30, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (242, N'B09', N'Available', 21, 30, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (243, N'B10', N'Available', 21, 30, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (244, N'B11', N'Available', 21, 30, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (245, N'B12', N'Available', 21, 30, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (246, N'A01', N'Available', 21, 32, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (247, N'A02', N'Available', 21, 32, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (248, N'A03', N'Available', 21, 32, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (249, N'A04', N'Available', 21, 32, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (250, N'A05', N'Available', 21, 32, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (251, N'A06', N'Available', 21, 32, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (252, N'A07', N'Available', 21, 32, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (253, N'A08', N'Available', 21, 32, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (254, N'A09', N'Available', 21, 32, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (255, N'A10', N'Available', 21, 32, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (256, N'A11', N'Available', 21, 32, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (257, N'A12', N'Available', 21, 32, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (258, N'B01', N'Available', 21, 32, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (259, N'B02', N'Available', 21, 32, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (260, N'B03', N'Available', 21, 32, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (261, N'B04', N'Available', 21, 32, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (262, N'B05', N'Available', 21, 32, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (263, N'B06', N'Available', 21, 32, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (264, N'B07', N'Available', 21, 32, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (265, N'B08', N'Available', 21, 32, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (266, N'B09', N'Available', 21, 32, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (267, N'B10', N'Available', 21, 32, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (268, N'B11', N'Available', 21, 32, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (269, N'B12', N'Available', 21, 32, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (270, N'A01', N'Available', 22, 26, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (271, N'A02', N'Available', 22, 26, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (272, N'A03', N'Available', 22, 26, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (273, N'A04', N'Available', 22, 26, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (274, N'A05', N'Available', 22, 26, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (275, N'A06', N'Available', 22, 26, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (276, N'A07', N'Available', 22, 26, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (277, N'A08', N'Available', 22, 26, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (278, N'A09', N'Available', 22, 26, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (279, N'A10', N'Available', 22, 26, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (280, N'A11', N'Available', 22, 26, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (281, N'A12', N'Available', 22, 26, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (282, N'B01', N'Available', 22, 26, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (283, N'B02', N'Available', 22, 26, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (284, N'B03', N'Available', 22, 26, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (285, N'B04', N'Available', 22, 26, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (286, N'B05', N'Available', 22, 26, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (287, N'B06', N'Available', 22, 26, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (288, N'B07', N'Available', 22, 26, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (289, N'B08', N'Available', 22, 26, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (290, N'B09', N'Available', 22, 26, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (291, N'B10', N'Available', 22, 26, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (292, N'B11', N'Available', 22, 26, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (293, N'B12', N'Available', 22, 26, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (294, N'A01', N'Available', 22, 28, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (295, N'A02', N'Available', 22, 28, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (296, N'A03', N'Available', 22, 28, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (297, N'A04', N'Available', 22, 28, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (298, N'A05', N'Available', 22, 28, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (299, N'A06', N'Available', 22, 28, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (300, N'A07', N'Available', 22, 28, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (301, N'A08', N'Available', 22, 28, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (302, N'A09', N'Available', 22, 28, 1)
GO
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (303, N'A10', N'Available', 22, 28, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (304, N'A11', N'Available', 22, 28, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (305, N'A12', N'Available', 22, 28, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (306, N'B01', N'Available', 22, 28, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (307, N'B02', N'Available', 22, 28, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (308, N'B03', N'Available', 22, 28, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (309, N'B04', N'Available', 22, 28, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (310, N'B05', N'Available', 22, 28, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (311, N'B06', N'Available', 22, 28, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (312, N'B07', N'Available', 22, 28, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (313, N'B08', N'Available', 22, 28, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (314, N'B09', N'Available', 22, 28, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (315, N'B10', N'Available', 22, 28, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (316, N'B11', N'Available', 22, 28, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (317, N'B12', N'Available', 22, 28, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (318, N'A01', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (319, N'A02', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (320, N'A03', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (321, N'A04', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (322, N'A05', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (323, N'A06', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (324, N'A07', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (325, N'A08', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (326, N'A09', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (327, N'A10', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (328, N'A11', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (329, N'A12', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (330, N'A13', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (331, N'A14', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (332, N'A15', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (333, N'A16', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (334, N'A17', N'Available', 4, 45, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (335, N'B01', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (336, N'B02', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (337, N'B03', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (338, N'B04', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (339, N'B05', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (340, N'B06', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (341, N'B07', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (342, N'B08', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (343, N'B09', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (344, N'B10', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (345, N'B11', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (346, N'B12', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (347, N'B13', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (348, N'B14', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (349, N'B15', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (350, N'B16', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (351, N'B17', N'Available', 4, 45, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (352, N'A01', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (353, N'A02', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (354, N'A03', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (355, N'A04', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (356, N'A05', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (357, N'A06', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (358, N'A07', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (359, N'A08', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (360, N'A09', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (361, N'A10', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (362, N'A11', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (363, N'A12', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (364, N'A13', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (365, N'A14', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (366, N'A15', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (367, N'A16', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (368, N'A17', N'Available', 4, 46, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (369, N'B01', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (370, N'B02', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (371, N'B03', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (372, N'B04', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (373, N'B05', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (374, N'B06', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (375, N'B07', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (376, N'B08', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (377, N'B09', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (378, N'B10', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (379, N'B11', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (380, N'B12', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (381, N'B13', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (382, N'B14', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (383, N'B15', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (384, N'B16', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (385, N'B17', N'Available', 4, 46, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (386, N'A01', N'Available', 5, 47, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (387, N'A02', N'Available', 5, 47, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (388, N'A03', N'Available', 5, 47, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (389, N'A04', N'Available', 5, 47, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (390, N'A05', N'Available', 5, 47, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (391, N'A06', N'Available', 5, 47, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (392, N'A07', N'Available', 5, 47, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (393, N'A08', N'Available', 5, 47, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (394, N'A09', N'Available', 5, 47, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (395, N'A10', N'Available', 5, 47, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (396, N'A11', N'Available', 5, 47, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (397, N'A12', N'Available', 5, 47, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (398, N'A13', N'Available', 5, 47, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (399, N'A14', N'Available', 5, 47, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (400, N'A15', N'Available', 5, 47, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (401, N'A16', N'Available', 5, 47, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (402, N'A17', N'Available', 5, 47, 1)
GO
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (403, N'B01', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (404, N'B02', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (405, N'B03', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (406, N'B04', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (407, N'B05', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (408, N'B06', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (409, N'B07', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (410, N'B08', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (411, N'B09', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (412, N'B10', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (413, N'B11', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (414, N'B12', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (415, N'B13', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (416, N'B14', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (417, N'B15', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (418, N'B16', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (419, N'B17', N'Available', 5, 47, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (420, N'A01', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (421, N'A02', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (422, N'A03', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (423, N'A04', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (424, N'A05', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (425, N'A06', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (426, N'A07', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (427, N'A08', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (428, N'A09', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (429, N'A10', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (430, N'A11', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (431, N'A12', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (432, N'A13', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (433, N'A14', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (434, N'A15', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (435, N'A16', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (436, N'A17', N'Available', 3, 48, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (437, N'B01', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (438, N'B02', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (439, N'B03', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (440, N'B04', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (441, N'B05', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (442, N'B06', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (443, N'B07', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (444, N'B08', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (445, N'B09', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (446, N'B10', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (447, N'B11', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (448, N'B12', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (449, N'B13', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (450, N'B14', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (451, N'B15', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (452, N'B16', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (453, N'B17', N'Available', 3, 48, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (454, N'A01', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (455, N'A02', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (456, N'A03', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (457, N'A04', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (458, N'A05', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (459, N'A06', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (460, N'A07', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (461, N'A08', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (462, N'A09', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (463, N'A10', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (464, N'A11', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (465, N'A12', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (466, N'A13', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (467, N'A14', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (468, N'A15', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (469, N'A16', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (470, N'A17', N'Available', 4, 49, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (471, N'B01', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (472, N'B02', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (473, N'B03', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (474, N'B04', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (475, N'B05', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (476, N'B06', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (477, N'B07', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (478, N'B08', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (479, N'B09', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (480, N'B10', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (481, N'B11', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (482, N'B12', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (483, N'B13', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (484, N'B14', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (485, N'B15', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (486, N'B16', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (487, N'B17', N'Available', 4, 49, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (488, N'A01', N'Available', 5, 50, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (489, N'A02', N'Available', 5, 50, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (490, N'A03', N'Available', 5, 50, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (491, N'A04', N'Available', 5, 50, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (492, N'A05', N'Available', 5, 50, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (493, N'A06', N'Available', 5, 50, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (494, N'A07', N'Available', 5, 50, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (495, N'A08', N'Available', 5, 50, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (496, N'A09', N'Available', 5, 50, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (497, N'A10', N'Available', 5, 50, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (498, N'A11', N'Available', 5, 50, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (499, N'A12', N'Available', 5, 50, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (500, N'A13', N'Available', 5, 50, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (501, N'A14', N'Available', 5, 50, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (502, N'A15', N'Available', 5, 50, 1)
GO
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (503, N'A16', N'Available', 5, 50, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (504, N'A17', N'Available', 5, 50, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (505, N'B01', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (506, N'B02', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (507, N'B03', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (508, N'B04', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (509, N'B05', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (510, N'B06', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (511, N'B07', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (512, N'B08', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (513, N'B09', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (514, N'B10', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (515, N'B11', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (516, N'B12', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (517, N'B13', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (518, N'B14', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (519, N'B15', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (520, N'B16', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (521, N'B17', N'Available', 5, 50, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (522, N'A01', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (523, N'A02', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (524, N'A03', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (525, N'A04', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (526, N'A05', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (527, N'A06', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (528, N'A07', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (529, N'A08', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (530, N'A09', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (531, N'A10', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (532, N'A11', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (533, N'A12', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (534, N'A13', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (535, N'A14', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (536, N'A15', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (537, N'A16', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (538, N'A17', N'Available', 10, 51, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (539, N'B01', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (540, N'B02', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (541, N'B03', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (542, N'B04', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (543, N'B05', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (544, N'B06', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (545, N'B07', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (546, N'B08', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (547, N'B09', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (548, N'B10', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (549, N'B11', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (550, N'B12', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (551, N'B13', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (552, N'B14', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (553, N'B15', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (554, N'B16', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (555, N'B17', N'Available', 10, 51, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (556, N'A01', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (557, N'A02', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (558, N'A03', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (559, N'A04', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (560, N'A05', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (561, N'A06', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (562, N'A07', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (563, N'A08', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (564, N'A09', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (565, N'A10', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (566, N'A11', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (567, N'A12', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (568, N'A13', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (569, N'A14', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (570, N'A15', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (571, N'A16', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (572, N'A17', N'Available', 3, 52, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (573, N'B01', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (574, N'B02', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (575, N'B03', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (576, N'B04', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (577, N'B05', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (578, N'B06', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (579, N'B07', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (580, N'B08', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (581, N'B09', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (582, N'B10', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (583, N'B11', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (584, N'B12', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (585, N'B13', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (586, N'B14', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (587, N'B15', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (588, N'B16', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (589, N'B17', N'Available', 3, 52, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (590, N'A01', N'Available', 9, 53, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (591, N'A02', N'Available', 9, 53, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (592, N'A03', N'Available', 9, 53, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (593, N'A04', N'Available', 9, 53, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (594, N'A05', N'Available', 9, 53, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (595, N'A06', N'Available', 9, 53, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (596, N'A07', N'Available', 9, 53, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (597, N'A08', N'Available', 9, 53, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (598, N'A09', N'Available', 9, 53, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (599, N'A10', N'Available', 9, 53, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (600, N'A11', N'Available', 9, 53, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (601, N'A12', N'Available', 9, 53, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (602, N'A13', N'Available', 9, 53, 1)
GO
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (603, N'A14', N'Available', 9, 53, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (604, N'A15', N'Available', 9, 53, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (605, N'A16', N'Available', 9, 53, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (606, N'A17', N'Available', 9, 53, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (607, N'B01', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (608, N'B02', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (609, N'B03', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (610, N'B04', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (611, N'B05', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (612, N'B06', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (613, N'B07', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (614, N'B08', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (615, N'B09', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (616, N'B10', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (617, N'B11', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (618, N'B12', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (619, N'B13', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (620, N'B14', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (621, N'B15', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (622, N'B16', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (623, N'B17', N'Available', 9, 53, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (624, N'A01', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (625, N'A02', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (626, N'A03', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (627, N'A04', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (628, N'A05', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (629, N'A06', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (630, N'A07', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (631, N'A08', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (632, N'A09', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (633, N'A10', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (634, N'A11', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (635, N'A12', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (636, N'A13', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (637, N'A14', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (638, N'A15', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (639, N'A16', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (640, N'A17', N'Available', 11, 54, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (641, N'B01', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (642, N'B02', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (643, N'B03', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (644, N'B04', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (645, N'B05', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (646, N'B06', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (647, N'B07', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (648, N'B08', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (649, N'B09', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (650, N'B10', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (651, N'B11', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (652, N'B12', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (653, N'B13', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (654, N'B14', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (655, N'B15', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (656, N'B16', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (657, N'B17', N'Available', 11, 54, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (658, N'A01', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (659, N'A02', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (660, N'A03', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (661, N'A04', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (662, N'A05', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (663, N'A06', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (664, N'A07', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (665, N'A08', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (666, N'A09', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (667, N'A10', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (668, N'A11', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (669, N'A12', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (670, N'A13', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (671, N'A14', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (672, N'A15', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (673, N'A16', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (674, N'A17', N'Available', 3, 55, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (675, N'B01', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (676, N'B02', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (677, N'B03', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (678, N'B04', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (679, N'B05', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (680, N'B06', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (681, N'B07', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (682, N'B08', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (683, N'B09', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (684, N'B10', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (685, N'B11', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (686, N'B12', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (687, N'B13', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (688, N'B14', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (689, N'B15', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (690, N'B16', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (691, N'B17', N'Available', 3, 55, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (692, N'A01', N'Available', 10, 56, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (693, N'A02', N'Available', 10, 56, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (694, N'A03', N'Available', 10, 56, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (695, N'A04', N'Available', 10, 56, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (696, N'A05', N'Available', 10, 56, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (697, N'A06', N'Available', 10, 56, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (698, N'A07', N'Available', 10, 56, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (699, N'A08', N'Available', 10, 56, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (700, N'A09', N'Available', 10, 56, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (701, N'A10', N'Available', 10, 56, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (702, N'A11', N'Available', 10, 56, 1)
GO
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (703, N'A12', N'Available', 10, 56, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (704, N'A13', N'Available', 10, 56, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (705, N'A14', N'Available', 10, 56, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (706, N'A15', N'Available', 10, 56, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (707, N'A16', N'Available', 10, 56, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (708, N'A17', N'Available', 10, 56, 1)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (709, N'B01', N'Available', 10, 56, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (710, N'B02', N'Available', 10, 56, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (711, N'B03', N'Available', 10, 56, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (712, N'B04', N'Available', 10, 56, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (713, N'B05', N'Available', 10, 56, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (714, N'B06', N'Available', 10, 56, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (715, N'B07', N'Available', 10, 56, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (716, N'B08', N'Available', 10, 56, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (717, N'B09', N'Available', 10, 56, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (718, N'B10', N'Available', 10, 56, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (719, N'B11', N'Available', 10, 56, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (720, N'B12', N'Available', 10, 56, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (721, N'B13', N'Available', 10, 56, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (722, N'B14', N'Available', 10, 56, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (723, N'B15', N'Available', 10, 56, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (724, N'B16', N'Available', 10, 56, 2)
INSERT [dbo].[Seats] ([s_id], [s_name], [s_status], [v_id], [bt1_id], [s_level]) VALUES (725, N'B17', N'Available', 10, 56, 2)
SET IDENTITY_INSERT [dbo].[Seats] OFF
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (360, N'pending', 1, 16, CAST(N'2025-02-26' AS Date), 2)
INSERT [dbo].[Tickets] ([t_id], [t_status], [bt1_id], [s_id], [t_purchaseDate], [bt_id]) VALUES (361, N'pending', 1, 17, CAST(N'2025-02-26' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
INSERT [dbo].[Users] ([u_username], [u_password], [r_id]) VALUES (N'admin1', N'123', 1)
INSERT [dbo].[Users] ([u_username], [u_password], [r_id]) VALUES (N'admin2', N'123', 2)
INSERT [dbo].[Users] ([u_username], [u_password], [r_id]) VALUES (N'admin3', N'123', 3)
INSERT [dbo].[Users] ([u_username], [u_password], [r_id]) VALUES (N'admin4', N'123', 4)
INSERT [dbo].[Users] ([u_username], [u_password], [r_id]) VALUES (N'admin5', N'123', 5)
INSERT [dbo].[Users] ([u_username], [u_password], [r_id]) VALUES (N'admin6', N'123', 6)
INSERT [dbo].[Users] ([u_username], [u_password], [r_id]) VALUES (N'admin7', N'123', 7)
GO
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (1, N'BUS', 35, 1223456, N'Avaiable')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (2, N'Limosine', 35, 223344, N'Available')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (3, N'Xe Giường Nằm', 34, 10001, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (4, N'Xe Giường Nằm', 34, 10002, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (5, N'Xe Giường Nằm', 34, 10003, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (6, N'Xe Giường Nằm', 34, 10004, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (7, N'Xe Giường Nằm', 34, 10005, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (8, N'Xe Giường Nằm', 34, 10006, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (9, N'Xe Ghế Ngồi', 34, 10007, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (10, N'Xe Ghế Ngồi', 34, 10008, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (11, N'Xe Ghế Ngồi', 34, 10009, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (12, N'Xe Ghế Ngồi', 34, 10010, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (13, N'Xe Ghế Ngồi', 34, 10011, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (14, N'Xe Ghế Ngồi', 34, 10012, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (15, N'Xe Limousine', 24, 10013, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (16, N'Xe Limousine', 24, 10014, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (17, N'Xe Limousine', 24, 10015, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (18, N'Xe Limousine', 24, 10016, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (19, N'Xe Limousine', 24, 10017, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (20, N'Xe Limousine', 24, 10018, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (21, N'Xe Limousine', 24, 10019, N'Active')
INSERT [dbo].[Vehicles] ([v_id], [v_type], [v_capacity], [v_licensePlate], [v_status]) VALUES (22, N'Xe Limousine', 24, 10020, N'Active')
GO
ALTER TABLE [dbo].[BookTickets] ADD  CONSTRAINT [DF__BookTicke__bt_st__3D5E1FD2]  DEFAULT ('pending') FOR [bt_status]
GO
ALTER TABLE [dbo].[Seats] ADD  CONSTRAINT [DF__Seats__s_status__628FA481]  DEFAULT ('available') FOR [s_status]
GO
ALTER TABLE [dbo].[Tickets] ADD  DEFAULT ('pending') FOR [t_status]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Payment] FOREIGN KEY([p1_id])
REFERENCES [dbo].[Payment] ([p1_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Payment]
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
ALTER TABLE [dbo].[BusTrips]  WITH CHECK ADD  CONSTRAINT [FK_BusTrips_BusRoutes] FOREIGN KEY([br_id])
REFERENCES [dbo].[BusRoutes] ([br_id])
GO
ALTER TABLE [dbo].[BusTrips] CHECK CONSTRAINT [FK_BusTrips_BusRoutes]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Roles] FOREIGN KEY([r_id])
REFERENCES [dbo].[Roles] ([r_id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Roles]
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
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([r_id])
REFERENCES [dbo].[Roles] ([r_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[BookTickets]  WITH CHECK ADD  CONSTRAINT [CK__BookTicke__bt_st__3E52440B] CHECK  (([bt_status]='cancelled' OR [bt_status]='confirmed' OR [bt_status]='pending'))
GO
ALTER TABLE [dbo].[BookTickets] CHECK CONSTRAINT [CK__BookTicke__bt_st__3E52440B]
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [CK__Seats__s_status__7D439ABD] CHECK  (([s_status]='booked' OR [s_status]='reserved' OR [s_status]='available'))
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [CK__Seats__s_status__7D439ABD]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD CHECK  (([t_status]='cancelled' OR [t_status]='confirmed' OR [t_status]='pending'))
GO
