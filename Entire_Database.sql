USE [master]
GO
/****** Object:  Database [NWDbFinalSpring2025]    Script Date: 5/6/2025 11:01:06 PM ******/
CREATE DATABASE [NWDbFinalSpring2025]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NWDbFinalSpring2025', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER2022\MSSQL\DATA\NWDbFinalSpring2025.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NWDbFinalSpring2025_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER2022\MSSQL\DATA\NWDbFinalSpring2025_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [NWDbFinalSpring2025] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NWDbFinalSpring2025].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NWDbFinalSpring2025] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET ARITHABORT OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET RECOVERY FULL 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET  MULTI_USER 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NWDbFinalSpring2025] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NWDbFinalSpring2025] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'NWDbFinalSpring2025', N'ON'
GO
ALTER DATABASE [NWDbFinalSpring2025] SET QUERY_STORE = ON
GO
ALTER DATABASE [NWDbFinalSpring2025] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [NWDbFinalSpring2025]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(100,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmpID] [char](36) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[JobTitle] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[CreditCard] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC,
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryTransactions]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryTransactions](
	[TransactionID] [int] IDENTITY(700,1) NOT NULL,
	[TransactionType] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PurchaseOrderID] [int] NULL,
	[CustomerOrderID] [int] NULL,
	[Comments] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_InventoryTransactions] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(100,1) NOT NULL,
	[ProductCode] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[CategoryID] [int] NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NOT NULL,
	[ReorderLevel] [int] NULL,
	[TargetLevel] [int] NULL,
	[Discontinued] [bit] NOT NULL,
	[SupplierID] [int] NULL,
	[AvailableQty] [int] NULL,
	[Reordered] [bit] NULL,
	[prodimage] [nvarchar](30) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrderDetails]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderDetails](
	[OrderDetailID] [int] IDENTITY(600,1) NOT NULL,
	[PurchaseOrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[Quantity] [int] NOT NULL,
	[UnitCost] [money] NOT NULL,
	[PostedToInventory] [bit] NULL,
	[InventoryID] [int] NULL,
 CONSTRAINT [PK_PurchaseOrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrders]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrders](
	[PurchaseOrderID] [int] IDENTITY(500,1) NOT NULL,
	[CreationDate] [datetime2](7) NULL,
	[StatusID] [int] NULL,
	[ExpectedDate] [datetime2](7) NULL,
	[ApprovedBy] [int] NULL,
	[ApprovedDate] [datetime2](7) NULL,
	[EmpID] [char](36) NOT NULL,
 CONSTRAINT [PK_PurchaseOrders] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[CartID] [char](36) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[StandardCost] [money] NOT NULL,
	[QuantityToOrder] [int] NOT NULL,
	[Subtotal]  AS ([QuantityToOrder]*[StandardCost]),
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(300,1) NOT NULL,
	[Company] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[BusinessPhone] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[SupplierImage] [nvarchar](50) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 5/6/2025 11:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/6/2025 11:01:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 5/6/2025 11:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 5/6/2025 11:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 5/6/2025 11:01:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 5/6/2025 11:01:07 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/6/2025 11:01:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InventoryTransactions] ADD  CONSTRAINT [DF_InventoryTransactions_TransactionType]  DEFAULT ((1)) FOR [TransactionType]
GO
ALTER TABLE [dbo].[InventoryTransactions] ADD  CONSTRAINT [DF_InventoryTransactions_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Discontinued]  DEFAULT ((0)) FOR [Discontinued]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Reordered]
GO
ALTER TABLE [dbo].[PurchaseOrderDetails] ADD  CONSTRAINT [DF_PurchaseOrderDetails_PostedToInventory]  DEFAULT ((0)) FOR [PostedToInventory]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD  DEFAULT ((0)) FOR [StatusID]
GO
ALTER TABLE [dbo].[PurchaseOrders] ADD  DEFAULT (getdate()+(5)) FOR [ExpectedDate]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[InventoryTransactions]  WITH CHECK ADD  CONSTRAINT [FK_InventoryTransactions_PurchaseOrders] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[InventoryTransactions] CHECK CONSTRAINT [FK_InventoryTransactions_PurchaseOrders]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[PurchaseOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[PurchaseOrderDetails] CHECK CONSTRAINT [FK_PurchaseOrderDetails_Products]
GO
ALTER TABLE [dbo].[PurchaseOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetails_PurchaseOrder] FOREIGN KEY([PurchaseOrderID])
REFERENCES [dbo].[PurchaseOrders] ([PurchaseOrderID])
GO
ALTER TABLE [dbo].[PurchaseOrderDetails] CHECK CONSTRAINT [FK_PurchaseOrderDetails_PurchaseOrder]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Products]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddProduct]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddProduct]
    -- Add the parameters for the stored procedure here
    @ProductCode NVARCHAR(50),
    @ProductName NVARCHAR(100),
    @Description NVARCHAR(MAX) = NULL,
    @CategoryID INT,
    @StandardCost DECIMAL(19, 4),
    @ListPrice DECIMAL(19, 4),
    @ReorderLevel INT = NULL,
    @TargetLevel INT = NULL,
    @Discontinued BIT,
    @SupplierID INT = NULL, -- Assuming SupplierID can be null
    @AvailableQty INT,
    @Reordered BIT = 0, -- Default to false if not supplied
    @ProdImage NVARCHAR(255) = NULL
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for procedure here
    INSERT INTO dbo.Products (
        ProductCode,
        ProductName,
        Description,
        CategoryID,
        StandardCost,
        ListPrice,
        ReorderLevel,
        TargetLevel,
        Discontinued,
        SupplierID,
        AvailableQty,
        Reordered,
        ProdImage
    )
    VALUES (
        @ProductCode,
        @ProductName,
        @Description,
        @CategoryID,
        @StandardCost,
        @ListPrice,
        @ReorderLevel,
        @TargetLevel,
        @Discontinued,
        @SupplierID,
        @AvailableQty,
        @Reordered,
        @ProdImage
    );

    -- Optionally, you can return the ProductID of the newly inserted product
    -- SELECT SCOPE_IDENTITY() AS NewProductID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteProduct]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteProduct]
    @ProductID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Before deleting, you might want to check for related records
    -- in other tables (e.g., OrderItems, ShoppingCart) if you have
    -- foreign key constraints that would prevent deletion or if you
    -- need to handle cascading deletes or set nulls.

    -- For simplicity, this SP directly deletes the product.
    -- Consider adding error handling or checks if the product exists.

    DELETE FROM dbo.Products
    WHERE ProductID = @ProductID;

    -- Optionally, check if any row was affected
    -- IF @@ROWCOUNT = 0
    -- BEGIN
    --     -- Product not found or already deleted, handle as needed
    --     -- RAISERROR('Product with ID %d not found.', 16, 1, @ProductID);
    --     RETURN; -- Or return a status code
    -- END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllProducts]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[sp_GetAllProducts]
as
begin
	select * from Products
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProductDetails]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[sp_GetProductDetails]
@ProductID int
as
begin
	select * from Products
	where @ProductID = ProductID
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProductsByCategory]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[sp_GetProductsByCategory]
    @CategoryID INT = 0
AS
BEGIN
    SELECT
        *
    FROM dbo.Products AS p
    LEFT JOIN dbo.Category AS c
        ON p.CategoryID = c.CategoryID
    WHERE @CategoryID = 0 OR p.CategoryID = @CategoryID;
END;
GO
/****** Object:  StoredProcedure [dbo].[spAddPurchaseOrderDetail]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[spAddPurchaseOrderDetail]
(@PurchaseOrderID int,
@ProductID int,
@Quantity int,
@UnitCost money, -- should be named ListPrice in table
@OrderDetailID int out)

AS
BEGIN
	Insert into PurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity, UnitCost)
	Values (@PurchaseOrderID, @ProductID, @Quantity, @UnitCost);
	
	set @orderDetailID = scope_identity();
END

GO
/****** Object:  StoredProcedure [dbo].[spAddToInventory]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spAddToInventory]
(@prodid int)
AS

BEGIN

	declare @quantity int
	declare @purchaseorderid int

	select @quantity = quantity, @purchaseorderid = purchaseorderid
	from purchaseorderdetails
	where productid = @prodid

	insert into inventorytransactions (productid, quantity, purchaseorderid, comments)
	values (@prodid, @quantity, @purchaseorderid, 'none')
	
	declare @transactionid int = scope_identity()


	update PurchaseOrderDetails
	set postedtoinventory = 1, inventoryid = @transactionid
	where ProductID = @prodid

	update products
	set reordered = 0, availableqty = availableqty + @quantity
	where productid = @prodid




END
GO
/****** Object:  StoredProcedure [dbo].[spAddUserInfoToDB]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spAddUserInfoToDB]
@UserName nvarchar(50),
@EmpId char(36)
AS

	insert into Employees(EmpId, Username)
	values (@EmpId, @UserName)
GO
/****** Object:  StoredProcedure [dbo].[spCalcFinalPriceForOrderDetail]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spCalcFinalPriceForOrderDetail]
(@OrderDetailID int)
AS

BEGIN
	Select (quantity * unitcost) 
	from PurchaseOrderDetails
	where OrderDetailID = @OrderDetailID
	
END

GO
/****** Object:  StoredProcedure [dbo].[spCalcOrderTotal]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spCalcOrderTotal]
(@PurchaseOrderID int)

AS
BEGIN

	select sum(Quantity *  UnitCost) from PurchaseOrderDetails
	where purchaseorderID = @PurchaseOrderID

END

GO
/****** Object:  StoredProcedure [dbo].[spCreatePurchaseOrder]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spCreatePurchaseOrder]

(@CartID char(36), @EmpID char(36))

AS
BEGIN
	/* Insert a new record into Orders */
	DECLARE @PurchaseOrderID int
	INSERT INTO PurchaseOrders (EmpID) VALUES (@EmpID)
	
	/* Save the new Order ID */
	SET @PurchaseOrderID = scope_identity()
	
	/* Add the order details to OrderDetail */
	INSERT INTO PurchaseOrderDetails
	(PurchaseOrderID, ProductID, ProductName, Quantity, UnitCost)
	
	SELECT
	@PurchaseOrderID, ProductID, ProductName, QuantityToOrder, StandardCost
	FROM ShoppingCart
	WHERE CartID = @CartID

	/* Clear the shopping cart */
	DELETE FROM ShoppingCart
	WHERE CartID = @CartID

	

END



GO
/****** Object:  StoredProcedure [dbo].[spDeletePurchaseOrderDetail]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spDeletePurchaseOrderDetail]
(@OrderDetailID int)
AS

BEGIN
	Delete from PurchaseOrderDetails
	where OrderDetailID = @OrderDetailID

END

GO
/****** Object:  StoredProcedure [dbo].[spGetAllCategories]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spGetAllCategories]
as
begin 
	select categoryID, CategoryName
	from category
end

GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeID]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spGetEmployeeID]
		@UserName nvarchar(50),
		@EmpID nvarchar output
		AS

			select @EmpID = EmpID from Employees
			where username = @UserName
GO
/****** Object:  StoredProcedure [dbo].[spGetProductsByCategoryID]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetProductsByCategoryID]
( @categoryID int )
as

begin
	select p.productID, name, 
	case 
		when len(description) <= 60 then description
		else SUBSTRING(description, 1, 60) + '...'
	end as description,
	price, thumbnail, image, promofront, promodept
	from products P inner join ProductCategory PC
	on P.productID = PC.ProductID
	where categoryid = @categoryID

end

GO
/****** Object:  StoredProcedure [dbo].[spShoppingCartAdditem]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spShoppingCartAdditem]
(@cartid char(36),
@prodid int
)
AS

BEGIN

	if Not exists
	(Select Cartid from shoppingcart 
	where cartid=@cartid and productid=@prodid)
	
	begin
			declare @productname nvarchar(100)
			declare @standardcost money
			declare @quantitytoorder int

			Select @productname = productname, @standardcost = standardcost,
			@quantitytoorder = targetlevel - availableqty
			from products 
			where productid = @prodid

			insert into shoppingcart (cartID, ProductID, ProductName, StandardCost, QuantityToOrder)
			values(@cartID, @prodID, @productname, @standardcost, @quantitytoorder)

			Update Products
			set Reordered = 1
			where productid = @prodid
	end

END

GO
/****** Object:  StoredProcedure [dbo].[spShoppingCartAddItem2]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spShoppingCartAddItem2]
    @cartid CHAR(36),
    @prodid INT
AS
BEGIN
    IF NOT EXISTS (SELECT Cartid FROM shoppingcart WHERE cartid = @cartid AND productid = @prodid)
    BEGIN
        DECLARE @productname NVARCHAR(100);
        DECLARE @standardcost MONEY;
        -- DECLARE @quantitytoorder INT; -- No longer needed to select from products table for quantity

        SELECT @productname = productname, @standardcost = standardcost
        FROM products
        WHERE productid = @prodid;

        -- Set quantity to 1 for a new cart item
        INSERT INTO shoppingcart (cartID, ProductID, ProductName, StandardCost, QuantityToOrder)
        VALUES (@cartID, @prodid, @productname, @standardcost, 1); -- Set QuantityToOrder to 1

        UPDATE Products
        SET Reordered = 1 -- This logic might also need review depending on its purpose
        WHERE productid = @prodid;
    END
    -- ELSE
    -- BEGIN
        -- Optionally, if the item already exists, you could increment the quantity:
        -- UPDATE shoppingcart
        -- SET QuantityToOrder = QuantityToOrder + 1
        -- WHERE cartid = @cartid AND productid = @prodid;
    -- END
END
GO
/****** Object:  StoredProcedure [dbo].[spShoppingCartGetItemCount]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spShoppingCartGetItemCount]
    @CartID CHAR(36)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ISNULL(SUM(QuantityToOrder), 0)
    FROM dbo.ShoppingCart
    WHERE CartID = @CartID;
END
GO
/****** Object:  StoredProcedure [dbo].[spShoppingCartGetItems]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spShoppingCartGetItems]
    @CartID CHAR(36)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
		sc.CartID,
        sc.ProductID,
        sc.ProductName,
        sc.StandardCost, -- Using StandardCost from ShoppingCart table
        sc.QuantityToOrder,
        sc.Subtotal, -- Using the computed Subtotal column from ShoppingCart table
        p.prodimage AS ProductImage
    FROM dbo.ShoppingCart sc
    INNER JOIN dbo.Products p ON sc.ProductID = p.ProductID
    WHERE sc.CartID = @CartID;
END
GO
/****** Object:  StoredProcedure [dbo].[spShoppingCartGetTotal]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spShoppingCartGetTotal]
    @CartID CHAR(36)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ISNULL(SUM(Subtotal), 0) -- Using the computed Subtotal column from ShoppingCart table
    FROM dbo.ShoppingCart as sc
    WHERE sc.CartID = @CartID;
END
GO
/****** Object:  StoredProcedure [dbo].[spShoppingCartRemoveItem]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spShoppingCartRemoveItem]
    @CartID CHAR(36),
    @ProductID INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM dbo.ShoppingCart
    WHERE CartID = @CartID AND ProductID = @ProductID;

    -- Update the Reordered flag on the Products table
    -- Set Reordered to 0 only if this product is not in any other user's cart for reordering.
    -- This might be too simplistic if multiple users can reorder the same product.
    -- For this scenario, we assume an item being removed from cart means it's no longer "marked" for reorder *by this cart*.
    -- If the product is not in any shopping cart (for this specific cart ID or potentially across all carts if logic demands)
    -- then we can reset its Reordered status.
    -- A safer approach for Reordered flag might be to manage it based on actual Purchase Orders or Inventory levels.
    -- For now, we will assume that if a product is removed from the cart, the intention to reorder (via this cart) is removed.
    UPDATE Products
    SET Reordered = 0
    WHERE ProductID = @ProductID
    AND NOT EXISTS (SELECT 1 FROM ShoppingCart sc WHERE sc.ProductID = @ProductID AND sc.CartID = @CartID); -- check if it exists in current cart for other reasons
    -- A more robust logic for `Reordered` flag might be needed depending on overall system design.
    -- The current spShoppingCartAddItem sets it to 1. This SP can set it to 0.
END
GO
/****** Object:  StoredProcedure [dbo].[spShoppingCartUpdateItem]    Script Date: 5/6/2025 11:01:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spShoppingCartUpdateItem]
    @CartID CHAR(36),
    @ProductID INT,
    @Quantity INT
AS
BEGIN
    SET NOCOUNT ON;

    IF @Quantity > 0
    BEGIN
        UPDATE dbo.ShoppingCart
        SET QuantityToOrder = @Quantity
        WHERE CartID = @CartID AND ProductID = @ProductID;
    END
    ELSE
    BEGIN
        -- If quantity is zero or less, remove the item
        DELETE FROM dbo.ShoppingCart
        WHERE CartID = @CartID AND ProductID = @ProductID;

        -- Optionally, update the Reordered flag on the Products table
        -- if your business logic requires it when an item is removed by zeroing quantity
        -- For now, spShoppingCartRemoveItem handles the Reordered flag explicitly
        -- Consider if setting Reordered to 0 here is appropriate
        -- Update Products set Reordered = 0 where ProductID = @ProductID
        -- AND NOT EXISTS (SELECT 1 FROM ShoppingCart WHERE ProductID = @ProductID AND CartID = @CartID)
    END
END
GO
USE [master]
GO
ALTER DATABASE [NWDbFinalSpring2025] SET  READ_WRITE 
GO
