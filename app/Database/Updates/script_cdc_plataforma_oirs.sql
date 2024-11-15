USE [master]
GO
/****** Object:  Database [cdc_plataforma_oirs]    Script Date: 08/08/2022 22:14:07 ******/
CREATE DATABASE [cdc_plataforma_oirs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cdc_plataforma_oirs', FILENAME = N'D:\Archivos de Programas\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\cdc_plataforma_oirs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cdc_plataforma_oirs_log', FILENAME = N'D:\Archivos de Programas\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\cdc_plataforma_oirs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [cdc_plataforma_oirs] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cdc_plataforma_oirs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cdc_plataforma_oirs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET ARITHABORT OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET  MULTI_USER 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cdc_plataforma_oirs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cdc_plataforma_oirs] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [cdc_plataforma_oirs] SET QUERY_STORE = OFF
GO
USE [cdc_plataforma_oirs]
GO
/****** Object:  Table [dbo].[actions]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action] [varchar](50) NULL,
	[icon] [varchar](50) NULL,
	[class] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[href] [varchar](500) NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_actions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[areas]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[areas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[area] [varchar](50) NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_areas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[channels]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[channels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel] [varchar](50) NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_channel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[channels_entry]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[channels_entry](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NULL,
	[entry_channel] [varchar](50) NULL,
	[deleted_at] [nchar](10) NULL,
 CONSTRAINT [PK_channels_entry] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[districts]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[districts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[region_id] [int] NULL,
	[district] [varchar](50) NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_districts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emails]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emails](
	[id] [int] NOT NULL,
	[from_email] [varchar](100) NULL,
	[from_name] [varchar](100) NULL,
	[subject] [varchar](100) NULL,
	[body] [varchar](max) NULL,
	[cid_have] [int] NULL,
	[cid_json_list] [varchar](max) NULL,
 CONSTRAINT [PK_emails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[forms]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[invoice_channel] [varchar](100) NULL,
	[invoice] [varchar](100) NULL,
	[form_type_id] [int] NULL,
	[pacient_names] [varchar](100) NULL,
	[pacient_social_name] [varchar](100) NULL,
	[pacient_lastname] [varchar](100) NULL,
	[pacient_mlastname] [varchar](100) NULL,
	[pacient_rut] [varchar](10) NULL,
	[pacient_gender_id] [int] NULL,
	[pacient_phone] [int] NULL,
	[pacient_address] [varchar](100) NULL,
	[pacient_region_id] [int] NULL,
	[pacient_district_id] [int] NULL,
	[pacient_email] [varchar](255) NULL,
	[attention_date] [date] NULL,
	[attention_place] [varchar](100) NULL,
	[is_pacient] [int] NULL,
	[claimant_names] [varchar](100) NULL,
	[claimant_social_name] [varchar](100) NULL,
	[claimant_lastname] [varchar](100) NULL,
	[claimant_mlastname] [varchar](100) NULL,
	[claimant_rut] [varchar](10) NULL,
	[claimant_gender_id] [int] NULL,
	[claimant_phone] [int] NULL,
	[claimant_address] [varchar](100) NULL,
	[claimant_region_id] [int] NULL,
	[claimant_district_id] [int] NULL,
	[claimant_email] [varchar](255) NULL,
	[form_sign] [varchar](max) NULL,
	[form_area_id] [int] NULL,
	[form_channel_id] [int] NULL,
	[form_resume] [varchar](1000) NULL,
	[form_solution] [varchar](1000) NULL,
	[form_channel_entry_id] [int] NULL,
	[form_is_priority] [int] NULL,
	[form_subject_claim] [varchar](100) NULL,
	[form_ot] [varchar](100) NULL,
	[form_management] [varchar](1000) NULL,
	[form_improve] [varchar](1000) NULL,
	[status_id] [int] NOT NULL,
	[user_entry] [int] NULL,
	[user_manager] [int] NULL,
	[user_director] [int] NULL,
	[form_date_received] [datetime] NULL,
	[form_date_entry] [datetime] NULL,
	[form_date_manager] [datetime] NULL,
	[form_date_director] [datetime] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[forms_documents]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forms_documents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[form_id] [int] NULL,
	[doc_desc] [varchar](500) NULL,
	[original_name] [varchar](500) NULL,
	[upload_name] [varchar](500) NULL,
	[user_id] [int] NULL,
	[system] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [date] NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_forms_documents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[forms_history]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forms_history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[form_id] [int] NULL,
	[user_id] [int] NULL,
	[message] [varchar](500) NULL,
	[system] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [date] NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_forms_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[forms_notifications]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forms_notifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[form_id] [int] NULL,
	[user_id] [int] NULL,
	[notification] [varchar](100) NULL,
	[is_read] [int] NULL,
	[class] [varchar](100) NULL,
	[icon] [varchar](100) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [date] NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_forms_notifications] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genders]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gender] [varchar](50) NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_gender] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menus]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[page_id] [int] NULL,
	[profile_id] [int] NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_menus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pages]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[controller] [varchar](100) NULL,
	[description] [varchar](50) NULL,
	[icon] [varchar](50) NULL,
	[parent_id] [int] NULL,
	[is_parent] [int] NULL,
	[section] [varchar](50) NULL,
	[order_parent] [int] NULL,
	[order_child] [int] NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_pages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pages_actions]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pages_actions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[page_id] [int] NULL,
	[profile_id] [int] NULL,
	[status_id] [int] NULL,
	[actions] [varchar](1000) NULL,
	[deleted_at] [int] NULL,
 CONSTRAINT [PK_pages_actions_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profiles]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[profile] [varchar](50) NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_profiles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regions]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[region] [varchar](50) NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_regions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](50) NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status_workflow]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_workflow](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status_current] [int] NULL,
	[status_next] [int] NULL,
	[status_rejection] [int] NULL,
	[assign_profile_id] [int] NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_status_workflow] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[types]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](50) NULL,
	[icon] [varchar](50) NULL,
	[class] [varchar](50) NULL,
	[order_by] [int] NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[lastname] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[password] [varchar](255) NULL,
	[profile_id] [int] NULL,
	[login_at] [datetime] NULL,
	[logout_at] [datetime] NULL,
	[blocked_at] [datetime] NULL,
	[blocked_attempts] [int] NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
	[deleted_at] [date] NULL,
	[updated_password] [datetime] NULL,
	[token_forgot_password] [varchar](500) NULL,
	[token_forgot_password_expiration] [datetime] NULL,
	[assignment_process] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_profiles]    Script Date: 08/08/2022 22:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_profiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[profile_id] [int] NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_users_profiles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[actions] ON 

INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [deleted_at]) VALUES (1, N'SEE', N'fas fa-eye', N'btn-info row-btn-see', N'Ver', N'/Inbox/Read/{invoice}', NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [deleted_at]) VALUES (2, N'ADD', N'fas fa-plus', N'btn-success row-btn-add', N'Ingresar', N'/Inbox/Save', NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [deleted_at]) VALUES (3, N'EDIT', N'fas fa-edit', N'btn-warning row-btn-edit', N'Editar', N'/Inbox/Save/{invoice}', NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [deleted_at]) VALUES (4, N'DELETE', N'fas fa-trash', N'btn-danger row-btn-delete', N'Eliminar', NULL, NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [deleted_at]) VALUES (5, N'REASIGN', N'fas fa-user', N'btn-primary row-btn-reasign', N'Reasignar', NULL, NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [deleted_at]) VALUES (6, N'SEND', N'fas fa-paper-plane', N'btn-primary row-btn-send', N'Enviar', NULL, NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [deleted_at]) VALUES (7, N'INSIST', N'fas fa-exclamation-circle', N'btn-primary row-btn-insist', N'Insistir', NULL, NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [deleted_at]) VALUES (8, N'APPROVE', N'fas fa-thumbs-up', N'btn-success row-btn-approve', N'Aprobar', NULL, NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [deleted_at]) VALUES (9, N'DECLINE', N'fas fa-thumbs-down', N'btn-danger row-btn-decline', N'Rechazar', NULL, NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [deleted_at]) VALUES (11, N'DISCARD', N'fas fa-minus-circle', N'btn-danger row-btn-discard', N'Descartar', NULL, NULL)
SET IDENTITY_INSERT [dbo].[actions] OFF
GO
SET IDENTITY_INSERT [dbo].[areas] ON 

INSERT [dbo].[areas] ([id], [area], [deleted_at]) VALUES (1, N'Clínica', NULL)
INSERT [dbo].[areas] ([id], [area], [deleted_at]) VALUES (2, N'Administrativa', NULL)
INSERT [dbo].[areas] ([id], [area], [deleted_at]) VALUES (3, N'Comercial', NULL)
SET IDENTITY_INSERT [dbo].[areas] OFF
GO
SET IDENTITY_INSERT [dbo].[channels] ON 

INSERT [dbo].[channels] ([id], [channel], [deleted_at]) VALUES (1, N'Correo electrónico', NULL)
INSERT [dbo].[channels] ([id], [channel], [deleted_at]) VALUES (2, N'Carta certificada a domicilio', NULL)
SET IDENTITY_INSERT [dbo].[channels] OFF
GO
SET IDENTITY_INSERT [dbo].[channels_entry] ON 

INSERT [dbo].[channels_entry] ([id], [code], [entry_channel], [deleted_at]) VALUES (1, N'WB', N'Web', NULL)
INSERT [dbo].[channels_entry] ([id], [code], [entry_channel], [deleted_at]) VALUES (2, N'BU', N'Buzón', NULL)
INSERT [dbo].[channels_entry] ([id], [code], [entry_channel], [deleted_at]) VALUES (3, N'MA', N'Mail', NULL)
SET IDENTITY_INSERT [dbo].[channels_entry] OFF
GO
SET IDENTITY_INSERT [dbo].[districts] ON 

INSERT [dbo].[districts] ([id], [region_id], [district], [deleted_at]) VALUES (1, 1, N'Arica
', NULL)
INSERT [dbo].[districts] ([id], [region_id], [district], [deleted_at]) VALUES (2, 2, N'Iquique
', NULL)
INSERT [dbo].[districts] ([id], [region_id], [district], [deleted_at]) VALUES (3, 3, N'Antofagasta
', NULL)
INSERT [dbo].[districts] ([id], [region_id], [district], [deleted_at]) VALUES (4, 4, N'Copiapó
', NULL)
INSERT [dbo].[districts] ([id], [region_id], [district], [deleted_at]) VALUES (5, 5, N'La Serena
', NULL)
INSERT [dbo].[districts] ([id], [region_id], [district], [deleted_at]) VALUES (6, 6, N'Valparaíso
', NULL)
INSERT [dbo].[districts] ([id], [region_id], [district], [deleted_at]) VALUES (7, 7, N'Rancagua
', NULL)
INSERT [dbo].[districts] ([id], [region_id], [district], [deleted_at]) VALUES (8, 8, N'Talca
', NULL)
INSERT [dbo].[districts] ([id], [region_id], [district], [deleted_at]) VALUES (9, 10, N'Cobquecura
', NULL)
INSERT [dbo].[districts] ([id], [region_id], [district], [deleted_at]) VALUES (10, 9, N'Concepción
', NULL)
INSERT [dbo].[districts] ([id], [region_id], [district], [deleted_at]) VALUES (11, 11, N'Temuco
', NULL)
INSERT [dbo].[districts] ([id], [region_id], [district], [deleted_at]) VALUES (12, 12, N'Valdivia
', NULL)
INSERT [dbo].[districts] ([id], [region_id], [district], [deleted_at]) VALUES (13, 13, N'Puerto Montt
', NULL)
INSERT [dbo].[districts] ([id], [region_id], [district], [deleted_at]) VALUES (14, 14, N'Coihaique
', NULL)
INSERT [dbo].[districts] ([id], [region_id], [district], [deleted_at]) VALUES (15, 15, N'Punta Arenas
', NULL)
INSERT [dbo].[districts] ([id], [region_id], [district], [deleted_at]) VALUES (16, 16, N'Cerrillos
', NULL)
SET IDENTITY_INSERT [dbo].[districts] OFF
GO
INSERT [dbo].[emails] ([id], [from_email], [from_name], [subject], [body], [cid_have], [cid_json_list]) VALUES (1, N'develop_caa@hotmail.com', N'Plataforma OIRS', N'Recuperar Contraseña', N'<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
    <meta charset="utf-8"> <!-- utf-8 works for most cases -->
    <meta name="viewport" content="width=device-width"> <!-- Forcing initial-scale shouldn''t be necessary -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!-- Use the latest (edge) version of IE rendering engine -->
    <meta name="x-apple-disable-message-reformatting">  <!-- Disable auto-scale in iOS 10 Mail entirely -->
    <title></title> <!-- The title tag shows in email notifications, like Android 4.4. -->

    <link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700,800" rel="stylesheet">

    <!-- CSS Reset : BEGIN -->
    <style>

        /* What it does: Remove spaces around the email design added by some email clients. */
        /* Beware: It can remove the padding / margin and add a background color to the compose a reply window. */
        html,
body {
    margin: 0 auto !important;
    padding: 0 !important;
    height: 100% !important;
    width: 100% !important;
    background: #f1f1f1;
}

/* What it does: Stops email clients resizing small text. */
* {
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
}

/* What it does: Centers email on Android 4.4 */
div[style*="margin: 16px 0"] {
    margin: 0 !important;
}

/* What it does: Stops Outlook from adding extra spacing to tables. */
table,
td {
    mso-table-lspace: 0pt !important;
    mso-table-rspace: 0pt !important;
}

/* What it does: Fixes webkit padding issue. */
table {
    border-spacing: 0 !important;
    border-collapse: collapse !important;
    table-layout: fixed !important;
    margin: 0 auto !important;
}

/* What it does: Uses a better rendering method when resizing images in IE. */
img {
    -ms-interpolation-mode:bicubic;
}

/* What it does: Prevents Windows 10 Mail from underlining links despite inline CSS. Styles for underlined links should be inline. */
a {
    text-decoration: none;
}

/* What it does: A work-around for email clients meddling in triggered links. */
*[x-apple-data-detectors],  /* iOS */
.unstyle-auto-detected-links *,
.aBn {
    border-bottom: 0 !important;
    cursor: default !important;
    color: inherit !important;
    text-decoration: none !important;
    font-size: inherit !important;
    font-family: inherit !important;
    font-weight: inherit !important;
    line-height: inherit !important;
}

/* What it does: Prevents Gmail from displaying a download button on large, non-linked images. */
.a6S {
    display: none !important;
    opacity: 0.01 !important;
}

/* What it does: Prevents Gmail from changing the text color in conversation threads. */
.im {
    color: inherit !important;
}

/* If the above doesn''t work, add a .g-img class to any image in question. */
img.g-img + div {
    display: none !important;
}

/* What it does: Removes right gutter in Gmail iOS app: https://github.com/TedGoas/Cerberus/issues/89  */
/* Create one of these media queries for each additional viewport size you''d like to fix */

/* iPhone 4, 4S, 5, 5S, 5C, and 5SE */
@media only screen and (min-device-width: 320px) and (max-device-width: 374px) {
    u ~ div .email-container {
        min-width: 320px !important;
    }
}
/* iPhone 6, 6S, 7, 8, and X */
@media only screen and (min-device-width: 375px) and (max-device-width: 413px) {
    u ~ div .email-container {
        min-width: 375px !important;
    }
}
/* iPhone 6+, 7+, and 8+ */
@media only screen and (min-device-width: 414px) {
    u ~ div .email-container {
        min-width: 414px !important;
    }
}


    </style>

    <!-- CSS Reset : END -->

    <!-- Progressive Enhancements : BEGIN -->
    <style>

	    .primary{
	background: #0e4194;
}
.bg_white{
	background: #ffffff;
}
.bg_light{
	background: #f7fafa;
}
.bg_black{
	background: #000000;
}
.bg_dark{
	background: rgba(0,0,0,.8);
}
.email-section{
	padding:2.5em;
}

/*BUTTON*/
.btn{
	padding: 10px 15px;
	display: inline-block;
}
.btn.btn-primary{
	border-radius: 5px;
	background: #0e4194;
	color: #ffffff;
}
.btn.btn-white{
	border-radius: 5px;
	background: #ffffff;
	color: #000000;
}
.btn.btn-white-outline{
	border-radius: 5px;
	background: transparent;
	border: 1px solid #fff;
	color: #fff;
}
.btn.btn-black-outline{
	border-radius: 0px;
	background: transparent;
	border: 2px solid #000;
	color: #000;
	font-weight: 700;
}
.btn-custom{
	color: rgba(0,0,0,.3);
	text-decoration: underline;
}

h1,h2,h3,h4,h5,h6{
	font-family: ''Raleway'', sans-serif;
	color: #000000;
	margin-top: 0;
	font-weight: 400;
}

body{
	font-family: ''Raleway'', sans-serif;
	font-weight: 400;
	font-size: 15px;
	line-height: 1.8;
	color: rgba(0,0,0,.4);
}

a{
	color: #0e4194;
}

table{
}
/*LOGO*/

.logo h1{
	margin: 0;
}
.logo h1 a{
	color: #0e4194;
	font-size: 24px;
	font-weight: 700;
	font-family: ''Raleway'', sans-serif;
}

/*HERO*/
.hero{
	position: relative;
	z-index: 0;
}

.hero .text{
	color: rgba(0,0,0,.3);
}
.hero .text h2{
	color: #000;
	font-size: 34px;
	margin-bottom: 0;
	font-weight: 200;
	line-height: 1.4;
}
.hero .text h3{
	font-size: 24px;
	font-weight: 300;
}
.hero .text h2 span{
	font-weight: 600;
	color: #000;
}

.text-author{
	bordeR: 1px solid rgba(0,0,0,.05);
	max-width: 50%;
	margin: 0 auto;
	padding: 2em;
}
.text-author img{
	border-radius: 50%;
	padding-bottom: 20px;
}
.text-author h3{
	margin-bottom: 0;
}
ul.social{
	padding: 0;
}
ul.social li{
	display: inline-block;
	margin-right: 10px;
}

/*FOOTER*/

.footer{
	border-top: 1px solid rgba(0,0,0,.05);
	color: rgba(0,0,0,.5);
}
.footer .heading{
	color: #000;
	font-size: 20px;
}
.footer ul{
	margin: 0;
	padding: 0;
}
.footer ul li{
	list-style: none;
	margin-bottom: 10px;
}
.footer ul li a{
	color: rgba(0,0,0,1);
}


@media screen and (max-width: 500px) {


}


    </style>


</head>

<body width="100%" style="margin: 0; padding: 0 !important; mso-line-height-rule: exactly; background-color: #f1f1f1;">
	<center style="width: 100%; background-color: #f1f1f1;">
    <div style="display: none; font-size: 1px;max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden; mso-hide: all; font-family: sans-serif;">
      &zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;
    </div>
    <div style="max-width: 800px; margin: 0 auto;" class="email-container">
    	<!-- BEGIN BODY -->
      <table align="center" role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%" style="margin: auto;">
      	<tr>
          <td valign="top" class="bg_white" style="padding: 1em 2.5em 0 2.5em;">
          	<table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%">
          		<tr>
          			<td class="logo" style="text-align: center;">
			            <h1><img src="cid:{cid1}" alt="logo" style="width: 100px;"/></h1>
			          </td>
          		</tr>
          	</table>
          </td>
	      </tr><!-- end tr -->
				<tr>
          <td valign="middle" class="hero bg_white" style="padding: 2em 0 4em 0;">
            <table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%">
            	<tr>
            		<td style="padding: 0 2.5em; text-align: center; padding-bottom: 1em;">
            			<div class="text">
            				<h3>Estimado(a) {nombre} </h3>
            			</div>
            		</td>
            	</tr>
            	<tr>
			          <td style="text-align: center;font-size: 15px;">
			          	<div class="text-author">
				          	<span class="position">Para recuperar su contraseña ingrese aquí:</span>
				           	<p style="margin-top: 2em;"><a href="{url}" class="btn btn-primary">Recuperar mi contraseña</a></p>  
						</div>
			          </td>
			        </tr>
            </table>
          </td>
	      </tr><!-- end tr -->
      <!-- 1 Column Text + Button : END -->
      </table>
      <table align="center" role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%" style="margin: auto;">
      	<tr>
          <td class="bg_light" style="text-align: center;font-size: 15px;">
          	<p>Atentamente <span style="color: #0e4194;">Plataforma OIRS - Clínica Dental Cumbre</span></p>
            <p></p>
          </td>
        </tr>
      </table>

    </div>
  </center>
</body>
</html>', 1, N'[{"key":"{cid1}","file":"\\email\\fixed\\cumbre-logo-sm.png","local":1}]')
INSERT [dbo].[emails] ([id], [from_email], [from_name], [subject], [body], [cid_have], [cid_json_list]) VALUES (2, N'develop_caa@hotmail.com', N'Plataforma OIRS', N'Ingreso de formulario WEB {formID}', N'<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
    <meta charset="utf-8"> <!-- utf-8 works for most cases -->
    <meta name="viewport" content="width=device-width"> <!-- Forcing initial-scale shouldn''t be necessary -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!-- Use the latest (edge) version of IE rendering engine -->
    <meta name="x-apple-disable-message-reformatting">  <!-- Disable auto-scale in iOS 10 Mail entirely -->
    <title></title> <!-- The title tag shows in email notifications, like Android 4.4. -->

    <link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700,800" rel="stylesheet">

    <!-- CSS Reset : BEGIN -->
    <style>

        /* What it does: Remove spaces around the email design added by some email clients. */
        /* Beware: It can remove the padding / margin and add a background color to the compose a reply window. */
        html,
body {
    margin: 0 auto !important;
    padding: 0 !important;
    height: 100% !important;
    width: 100% !important;
    background: #f1f1f1;
	font-family: ''Raleway'',sans-serif;
}

/* What it does: Stops email clients resizing small text. */
* {
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
}

/* What it does: Centers email on Android 4.4 */
div[style*="margin: 16px 0"] {
    margin: 0 !important;
}

/* What it does: Stops Outlook from adding extra spacing to tables. */
table,
td {
    mso-table-lspace: 0pt !important;
    mso-table-rspace: 0pt !important;
}

/* What it does: Fixes webkit padding issue. */
table {
    border-spacing: 0 !important;
    border-collapse: collapse !important;
    table-layout: fixed !important;
    margin: 0 auto !important;
}

/* What it does: Uses a better rendering method when resizing images in IE. */
img {
    -ms-interpolation-mode:bicubic;
}

/* What it does: Prevents Windows 10 Mail from underlining links despite inline CSS. Styles for underlined links should be inline. */
a {
    text-decoration: none;
}

/* What it does: A work-around for email clients meddling in triggered links. */
*[x-apple-data-detectors],  /* iOS */
.unstyle-auto-detected-links *,
.aBn {
    border-bottom: 0 !important;
    cursor: default !important;
    color: inherit !important;
    text-decoration: none !important;
    font-size: inherit !important;
    font-family: inherit !important;
    font-weight: inherit !important;
    line-height: inherit !important;
}

/* What it does: Prevents Gmail from displaying a download button on large, non-linked images. */
.a6S {
    display: none !important;
    opacity: 0.01 !important;
}

/* What it does: Prevents Gmail from changing the text color in conversation threads. */
.im {
    color: inherit !important;
}

/* If the above doesn''t work, add a .g-img class to any image in question. */
img.g-img + div {
    display: none !important;
}

/* What it does: Removes right gutter in Gmail iOS app: https://github.com/TedGoas/Cerberus/issues/89  */
/* Create one of these media queries for each additional viewport size you''d like to fix */

/* iPhone 4, 4S, 5, 5S, 5C, and 5SE */
@media only screen and (min-device-width: 320px) and (max-device-width: 374px) {
    u ~ div .email-container {
        min-width: 320px !important;
    }
}
/* iPhone 6, 6S, 7, 8, and X */
@media only screen and (min-device-width: 375px) and (max-device-width: 413px) {
    u ~ div .email-container {
        min-width: 375px !important;
    }
}
/* iPhone 6+, 7+, and 8+ */
@media only screen and (min-device-width: 414px) {
    u ~ div .email-container {
        min-width: 414px !important;
    }
}


    </style>

    <!-- CSS Reset : END -->

    <!-- Progressive Enhancements : BEGIN -->
    <style>

	    .primary{
	background: #0e4194;
}
.bg_white{
	background: #ffffff;
}
.bg_light{
	background: #f7fafa;
}
.bg_black{
	background: #000000;
}
.bg_dark{
	background: rgba(0,0,0,.8);
}
.email-section{
	padding:2.5em;
}

/*BUTTON*/
.btn{
	padding: 10px 15px;
	display: inline-block;
}
.btn.btn-primary{
	border-radius: 5px;
	background: #0e4194;
	color: #ffffff;
}
.btn.btn-white{
	border-radius: 5px;
	background: #ffffff;
	color: #000000;
}
.btn.btn-white-outline{
	border-radius: 5px;
	background: transparent;
	border: 1px solid #fff;
	color: #fff;
}
.btn.btn-black-outline{
	border-radius: 0px;
	background: transparent;
	border: 2px solid #000;
	color: #000;
	font-weight: 700;
}
.btn-custom{
	color: rgba(0,0,0,.3);
	text-decoration: underline;
}

h1,h2,h3,h4,h5,h6{
	font-family: ''Raleway'', sans-serif;
	color: #000000;
	margin-top: 0;
	font-weight: 400;
}

body{
	font-family: ''Raleway'', sans-serif;
	font-weight: 400;
	font-size: 15px;
	line-height: 1.8;
	color: rgba(0,0,0,.4);
}

a{
	color: #0e4194;
}

.table-content{
	margin-top: 1em!important;
	width: 100%;
}
/*LOGO*/

.logo h1{
	margin: 0;
}
.logo h1 a{
	color: #0e4194;
	font-size: 24px;
	font-weight: 700;
	font-family: ''Raleway'', sans-serif;
}

/*HERO*/
.hero{
	position: relative;
	z-index: 0;
}

.hero .text{
	color: rgba(0,0,0,.3);
}
.hero .text h2{
	color: #000;
	font-size: 34px;
	margin-bottom: 0;
	font-weight: 200;
	line-height: 1.4;
}
.hero .text h3{
	font-size: 24px;
	font-weight: 300;
}
.hero .text h2 span{
	font-weight: 600;
	color: #000;
}

.text-author{
	bordeR: 1px solid rgba(0,0,0,.05);
	max-width: 80%;
	margin: 0 auto;
	padding: 2em;
}
.text-author img{
	border-radius: 50%;
	padding-bottom: 20px;
}
.text-author h3{
	margin-bottom: 0;
}
ul.social{
	padding: 0;
}
ul.social li{
	display: inline-block;
	margin-right: 10px;
}

/*FOOTER*/

.footer{
	border-top: 1px solid rgba(0,0,0,.05);
	color: rgba(0,0,0,.5);
}
.footer .heading{
	color: #000;
	font-size: 20px;
}
.footer ul{
	margin: 0;
	padding: 0;
}
.footer ul li{
	list-style: none;
	margin-bottom: 10px;
}
.footer ul li a{
	color: rgba(0,0,0,1);
}

.table-bordered {
    border: 1px solid #dee2e6;
}
.table.table-bordered td, .table.table-bordered th {
    border-color: #f6f6f6;
	padding: 0.5em;
	text-align: left;
}

.table-bordered td, .table-bordered th {
    border: 1px solid #dee2e6;
}
th {
    background-color: #f8f8f8!important;
    width: 40%;
    padding-left: 1em;
    padding-right: 1em;
}
.text-left{
	text-align: left;
}
.alert.alert-secondary {
    background-color: #f8f8f8;
}
.alert {
    color: #515151;
    border: none;
    padding: 15px 20px;
	/* margin-left: 1.5em;
    margin-right: 1.5em; */
}
.alert-secondary {
    color: #868585;
    background-color: #e2e3e5;
    border-color: #d6d8db;
}
.alert {
    position: relative;
    padding: 0.75rem 1.25rem;
    margin-bottom: 1rem;
    border: 1px solid transparent;
    border-radius: 0.25rem;
}
.text-center{
	text-align: center!important;
}
@media screen and (max-width: 500px) {


}


    </style>


</head>

<body width="100%" style="margin: 0; padding: 0 !important; mso-line-height-rule: exactly; background-color: #f1f1f1;">
	<center style="width: 100%; background-color: #f1f1f1;">
    <div style="display: none; font-size: 1px;max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden; mso-hide: all; font-family: sans-serif;">
      &zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;
    </div>
    <div style="max-width: 800px; margin: 0 auto;" class="email-container">
    	<!-- BEGIN BODY -->
      <table align="center" role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%" style="margin: auto;">
      	<tr>
          <td valign="top" class="bg_white" style="padding: 1em 2.5em 0 2.5em;">
          	<table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%">
          		<tr>
          			<td class="logo" style="text-align: center;">
			            <h1><img src="cid:{cid1}" alt="logo" style="width: 100px;"/></h1>
			          </td>
          		</tr>
          	</table>
          </td>
	      </tr><!-- end tr -->
				<tr>
          <td valign="middle" class="hero bg_white" style="padding: 2em 0 1em 0;">
            <table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%">
            	<tr>
            		<td style="padding: 0 2.5em; text-align: center; padding-bottom: 1em;">
            			<div class="text">
            				<h3>Estimado(a) {name} </h3>
            			</div>
            		</td>
            	</tr>
            	<tr>
			          <td style="text-align: center;font-size: 15px;">
			          	<div class="text-author">
				          	<span class="position">Se ha ingresado el siguiente formulario:</span><br>
				           	<table width="100%">
								<table class="table table-bordered table-content">
									<tbody>
									  <tr>
										<th colspan="2" class="text-center">Datos de Solicitud</th>
									  </tr>
									  <tr>
										<th class="text-left">Folio</th><td>{formID}</td>
									  </tr>
									  <tr>
										<th class="text-left">Tipo</th><td>{type_desc}</td>
									  </tr>
									  <tr>
									  <tr>
										<th class="text-left">Área asociada</th><td>{form_area_desc}</td>
									  </tr>
									  <tr>
										<th class="text-left">Vía de respuesta</th><td>{form_channel_desc}</td>
									  </tr>
									  <tr>
										<th class="text-left">Relato del hecho</th><td>{form_description}</td>
									  </tr>
									  <tr>
										<th class="text-left">Peticiones concretas</th><td>{form_solution}</td>
									  </tr>                            
									</tbody>
								  </table>
							</table><br>
							<div class="alert alert-secondary" role="alert">
								<strong>Nota 1:</strong> El plazo para recibir respuesta a su reclamo será de <strong>quince días hábiles</strong>, contados desde el día hábil siguiente a su recepción, donde el prestador deberá responder con los antecedentes que disponga. (Ley 20.584).
							</div>
							<div class="alert alert-secondary" role="alert">
								<strong>Nota 2:</strong> En caso de disconformidad con el contenido de la respuesta que da nuestra institución, Ud. Podrá solicitar a la superintendencia de salud su revisión, dentro de un plazo de 5 días hábiles, contados desde la fecha de notificación de esta, debiendo acompañar copia de la respuesta y de los antecedentes que disponga (Reclamos por Ley 20.584 de derechos y deberes que tienen las personas en relación con acciones vinculadas a su atención en salud, Decreto N°35, Artículo N° 14).
							</div>
						</div>
			          </td>
			        </tr>
            </table>
          </td>
	      </tr><!-- end tr -->
      <!-- 1 Column Text + Button : END -->
      </table>
      <table align="center" role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%" style="margin: auto;">
      	<tr>
          <td class="bg_light" style="text-align: center;font-size: 15px;">
          	<p>Atentamente <span style="color: #0e4194;">Plataforma OIRS - Clínica Dental Cumbre</span></p>
            <p></p>
          </td>
        </tr>
      </table>

    </div>
  </center>
</body>
</html>', 1, N'[{"key":"{cid1}","file":"\\email\\fixed\\cumbre-logo-sm.png","local":1}]')
INSERT [dbo].[emails] ([id], [from_email], [from_name], [subject], [body], [cid_have], [cid_json_list]) VALUES (3, N'develop_caa@hotmail.com', N'Plataforma OIRS', N'Ingreso de formulario WEB {formID}', N'<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
    <meta charset="utf-8"> <!-- utf-8 works for most cases -->
    <meta name="viewport" content="width=device-width"> <!-- Forcing initial-scale shouldn''t be necessary -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!-- Use the latest (edge) version of IE rendering engine -->
    <meta name="x-apple-disable-message-reformatting">  <!-- Disable auto-scale in iOS 10 Mail entirely -->
    <title></title> <!-- The title tag shows in email notifications, like Android 4.4. -->

    <link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700,800" rel="stylesheet">

    <!-- CSS Reset : BEGIN -->
    <style>

        /* What it does: Remove spaces around the email design added by some email clients. */
        /* Beware: It can remove the padding / margin and add a background color to the compose a reply window. */
        html,
body {
    margin: 0 auto !important;
    padding: 0 !important;
    height: 100% !important;
    width: 100% !important;
    background: #f1f1f1;
	font-family: ''Raleway'',sans-serif;
}

/* What it does: Stops email clients resizing small text. */
* {
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
}

/* What it does: Centers email on Android 4.4 */
div[style*="margin: 16px 0"] {
    margin: 0 !important;
}

/* What it does: Stops Outlook from adding extra spacing to tables. */
table,
td {
    mso-table-lspace: 0pt !important;
    mso-table-rspace: 0pt !important;
}

/* What it does: Fixes webkit padding issue. */
table {
    border-spacing: 0 !important;
    border-collapse: collapse !important;
    table-layout: fixed !important;
    margin: 0 auto !important;
}

/* What it does: Uses a better rendering method when resizing images in IE. */
img {
    -ms-interpolation-mode:bicubic;
}

/* What it does: Prevents Windows 10 Mail from underlining links despite inline CSS. Styles for underlined links should be inline. */
a {
    text-decoration: none;
}

/* What it does: A work-around for email clients meddling in triggered links. */
*[x-apple-data-detectors],  /* iOS */
.unstyle-auto-detected-links *,
.aBn {
    border-bottom: 0 !important;
    cursor: default !important;
    color: inherit !important;
    text-decoration: none !important;
    font-size: inherit !important;
    font-family: inherit !important;
    font-weight: inherit !important;
    line-height: inherit !important;
}

/* What it does: Prevents Gmail from displaying a download button on large, non-linked images. */
.a6S {
    display: none !important;
    opacity: 0.01 !important;
}

/* What it does: Prevents Gmail from changing the text color in conversation threads. */
.im {
    color: inherit !important;
}

/* If the above doesn''t work, add a .g-img class to any image in question. */
img.g-img + div {
    display: none !important;
}

/* What it does: Removes right gutter in Gmail iOS app: https://github.com/TedGoas/Cerberus/issues/89  */
/* Create one of these media queries for each additional viewport size you''d like to fix */

/* iPhone 4, 4S, 5, 5S, 5C, and 5SE */
@media only screen and (min-device-width: 320px) and (max-device-width: 374px) {
    u ~ div .email-container {
        min-width: 320px !important;
    }
}
/* iPhone 6, 6S, 7, 8, and X */
@media only screen and (min-device-width: 375px) and (max-device-width: 413px) {
    u ~ div .email-container {
        min-width: 375px !important;
    }
}
/* iPhone 6+, 7+, and 8+ */
@media only screen and (min-device-width: 414px) {
    u ~ div .email-container {
        min-width: 414px !important;
    }
}


    </style>

    <!-- CSS Reset : END -->

    <!-- Progressive Enhancements : BEGIN -->
    <style>

	    .primary{
	background: #0e4194;
}
.bg_white{
	background: #ffffff;
}
.bg_light{
	background: #f7fafa;
}
.bg_black{
	background: #000000;
}
.bg_dark{
	background: rgba(0,0,0,.8);
}
.email-section{
	padding:2.5em;
}

/*BUTTON*/
.btn{
	padding: 10px 15px;
	display: inline-block;
}
.btn.btn-primary{
	border-radius: 5px;
	background: #0e4194;
	color: #ffffff;
}
.btn.btn-white{
	border-radius: 5px;
	background: #ffffff;
	color: #000000;
}
.btn.btn-white-outline{
	border-radius: 5px;
	background: transparent;
	border: 1px solid #fff;
	color: #fff;
}
.btn.btn-black-outline{
	border-radius: 0px;
	background: transparent;
	border: 2px solid #000;
	color: #000;
	font-weight: 700;
}
.btn-custom{
	color: rgba(0,0,0,.3);
	text-decoration: underline;
}

h1,h2,h3,h4,h5,h6{
	font-family: ''Raleway'', sans-serif;
	color: #000000;
	margin-top: 0;
	font-weight: 400;
}

body{
	font-family: ''Raleway'', sans-serif;
	font-weight: 400;
	font-size: 15px;
	line-height: 1.8;
	color: rgba(0,0,0,.4);
}

a{
	color: #0e4194;
}

.table-content{
	margin-top: 1em!important;
	width: 100%;
}
/*LOGO*/

.logo h1{
	margin: 0;
}
.logo h1 a{
	color: #0e4194;
	font-size: 24px;
	font-weight: 700;
	font-family: ''Raleway'', sans-serif;
}

/*HERO*/
.hero{
	position: relative;
	z-index: 0;
}

.hero .text{
	color: rgba(0,0,0,.3);
}
.hero .text h2{
	color: #000;
	font-size: 34px;
	margin-bottom: 0;
	font-weight: 200;
	line-height: 1.4;
}
.hero .text h3{
	font-size: 24px;
	font-weight: 300;
}
.hero .text h2 span{
	font-weight: 600;
	color: #000;
}

.text-author{
	bordeR: 1px solid rgba(0,0,0,.05);
	max-width: 80%;
	margin: 0 auto;
	padding: 2em;
}
.text-author img{
	border-radius: 50%;
	padding-bottom: 20px;
}
.text-author h3{
	margin-bottom: 0;
}
ul.social{
	padding: 0;
}
ul.social li{
	display: inline-block;
	margin-right: 10px;
}

/*FOOTER*/

.footer{
	border-top: 1px solid rgba(0,0,0,.05);
	color: rgba(0,0,0,.5);
}
.footer .heading{
	color: #000;
	font-size: 20px;
}
.footer ul{
	margin: 0;
	padding: 0;
}
.footer ul li{
	list-style: none;
	margin-bottom: 10px;
}
.footer ul li a{
	color: rgba(0,0,0,1);
}

.table-bordered {
    border: 1px solid #dee2e6;
}
.table.table-bordered td, .table.table-bordered th {
    border-color: #f6f6f6;
	padding: 0.5em;
	text-align: left;
}

.table-bordered td, .table-bordered th {
    border: 1px solid #dee2e6;
}
th {
    background-color: #f8f8f8!important;
    width: 40%;
    padding-left: 1em;
    padding-right: 1em;
}
.text-left{
	text-align: left;
}
.alert.alert-secondary {
    background-color: #f8f8f8;
}
.alert {
    color: #515151;
    border: none;
    padding: 15px 20px;
	/* margin-left: 1.5em;
    margin-right: 1.5em; */
}
.alert-secondary {
    color: #868585;
    background-color: #e2e3e5;
    border-color: #d6d8db;
}
.alert {
    position: relative;
    padding: 0.75rem 1.25rem;
    margin-bottom: 1rem;
    border: 1px solid transparent;
    border-radius: 0.25rem;
}
.text-center{
	text-align: center!important;
}
@media screen and (max-width: 500px) {


}


    </style>


</head>

<body width="100%" style="margin: 0; padding: 0 !important; mso-line-height-rule: exactly; background-color: #f1f1f1;">
	<center style="width: 100%; background-color: #f1f1f1;">
    <div style="display: none; font-size: 1px;max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden; mso-hide: all; font-family: sans-serif;">
      &zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;
    </div>
    <div style="max-width: 800px; margin: 0 auto;" class="email-container">
    	<!-- BEGIN BODY -->
      <table align="center" role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%" style="margin: auto;">
      	<tr>
          <td valign="top" class="bg_white" style="padding: 1em 2.5em 0 2.5em;">
          	<table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%">
          		<tr>
          			<td class="logo" style="text-align: center;">
			            <h1><img src="cid:{cid1}" alt="logo" style="width: 100px;"/></h1>
			          </td>
          		</tr>
          	</table>
          </td>
	      </tr><!-- end tr -->
				<tr>
          <td valign="middle" class="hero bg_white" style="padding: 2em 0 1em 0;">
            <table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%">
            	<tr>
            		<td style="padding: 0 2.5em; text-align: center; padding-bottom: 1em;">
            			<div class="text">
            				<h3>Estimado(a) {name} </h3>
            			</div>
            		</td>
            	</tr>
            	<tr>
			          <td style="text-align: center;font-size: 15px;">
			          	<div class="text-author">
				          	<span class="position">Se ha ingresado el siguiente formulario:</span><br>
				           	<table width="100%">
								<table class="table table-bordered table-content">
									<tbody>
									  <tr>
										<th colspan="2" class="text-center">Datos de Solicitud</th>
									  </tr>
									  <tr>
										<th class="text-left">Folio</th><td>{formID}</td>
									  </tr>
									  <tr>
										<th class="text-left">Tipo</th><td>{type_desc}</td>
									  </tr>
									  <tr>
									  <tr>
										<th class="text-left">Área asociada</th><td>{form_area_desc}</td>
									  </tr>
									  <tr>
										<th class="text-left">Vía de respuesta</th><td>{form_channel_desc}</td>
									  </tr>
									  <tr>
										<th class="text-left">Relato del hecho</th><td>{form_description}</td>
									  </tr>
									  <tr>
										<th class="text-left">Peticiones concretas</th><td>{form_solution}</td>
									  </tr>                            
									</tbody>
								  </table>
							</table><br>
							<span class="position">Muchas gracias por tus comentarios, te responderemos a la brevedad.</span><br>							
						</div>
			          </td>
			        </tr>
            </table>
          </td>
	      </tr><!-- end tr -->
      <!-- 1 Column Text + Button : END -->
      </table>
      <table align="center" role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%" style="margin: auto;">
      	<tr>
          <td class="bg_light" style="text-align: center;font-size: 15px;">
          	<p>Atentamente <span style="color: #0e4194;">Plataforma OIRS - Clínica Dental Cumbre</span></p>
            <p></p>
          </td>
        </tr>
      </table>

    </div>
  </center>
</body>
</html>', 1, N'[{"key":"{cid1}","file":"\\email\\fixed\\cumbre-logo-sm.png","local":1}]')
GO
SET IDENTITY_INSERT [dbo].[forms] ON 

INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (20, N'1', N'WB00020', 2, N'Camila', N'', N'Alvarado', N'Alvarado', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-07-24' AS Date), N'Prueba', 1, N'', N'', N'', N'', N'', NULL, 0, N'', 0, 0, N'', N'jx77ixvvnx43yppumqkbsxsr29e0fsdasu8n07lh3tzhxvyod3.png', 2, 2, N'Prueba', N'Prueba', 1, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, CAST(N'2022-07-26T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (22, N'SC', N'SC00022', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', NULL, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-08-07' AS Date), N'ingreso', 1, N'', N'', N'', N'', N'', NULL, 0, N'', 0, 0, N'', N'', 2, 2, N'Prueba', N'Prueba', 2, 1, N'Prueba', N'', N'Prueba', N'Prueba', 1, 2, NULL, NULL, CAST(N'2022-08-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (23, N'SC', N'SC00023', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-08-07' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'uz1qsc9pt8r06lnodqeno98pnzv4jz5zbakszcu8swci89oe6i.png', 2, 2, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 2, 1, N'Materia del reclamo', N'OT', N'Gestión del reclamo', N'Plan de mejora / Medidas correctivas (Tiempo para realizarlo)', 1, 2, NULL, NULL, CAST(N'2022-08-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (24, N'SC', N'SC00024', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-08-07' AS Date), N'ingreso', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'f2bclskcawjpfg0kq036sn0yszc925bu3gx93a9r19ibhnjcwu.png', 2, 2, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 2, 1, N'Materia del reclamo', N'OT', N'Gestión del reclamo (*)', N'Plan de mejora / Medidas correctivas (Tiempo para realizarlo) (*)', 1, 2, NULL, NULL, CAST(N'2022-08-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (26, N'SC', N'SC00026', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-08-07' AS Date), N'ingreso', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'8ntc8knumjef0xqb6gmqmi57o6gnovsbkij3zro95reuhk5f3w.png', 2, 2, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 2, 1, N'Materia del reclamo', N'', N'Gestión del reclamo', N'Plan de mejora / Medidas correctivas (Tiempo para realizarlo)', 1, 2, NULL, NULL, CAST(N'2022-08-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (27, N'WB', N'WB00027', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-08-07' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'C:/wamp64/www/cdc_plataforma_oirs/writable/uploads/sign_forms/7dmy56418mbnvhcw8vj7a58604uv5gvdehs7nmhnlgsq2b98zv.png', 2, 1, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-07T22:45:18.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (28, N'WB', N'WB00028', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-08-07' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'C:/wamp64/www/cdc_plataforma_oirs/writable/uploads/sign_forms/m0bz0bpp6hg5n3m9uh2sfpv7fzu9qnn3dxj68089an29ootasn.png', 2, 1, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-07T22:46:18.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (29, N'WB', N'WB00029', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-08-07' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'x3dnx5gvt80hlyt6i049es7orpbiy09bwoks7x65g8klaj2xvr.png', 2, 2, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-07T22:50:33.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (30, N'WB', N'WB00030', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-08-07' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'mtyjrstyja667rpobjc5rs7w6dp5iand0cf3cta9hj6qb2755i.png', 2, 2, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(N'2022-08-07T22:53:24.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (31, N'WB', N'WB00031', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-08-07' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'81vfsfoiqu1ziac695clcsahgkbbsd1jssk2w113gjow3qobgj.png', 2, 2, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, CAST(N'2022-08-07T22:55:58.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (32, N'WB', N'WB00032', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-08-07' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'z76hxgs4rmqqga38uvm7iux4ri1bbrhu96cdlj7062x47v0v5g.png', 2, 2, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, CAST(N'2022-08-07T22:56:49.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (33, N'WB', N'WB00033', 1, N'Camila', N'', N'Alvarado', N'Alvarado', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-08-08' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'nbliph5z168yocfroxikm5d65x6gxkxjq8u2sldmt8dnhujp7m.png', 2, 2, N'Relato del hecho (¿Derecho vulnerado?', N'Peticiones concretas', 1, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, CAST(N'2022-08-07T23:41:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (34, N'SC', N'WB00034', 1, N'Camila', N'', N'Alvarado', N'Alvarado', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'llll@llll.cl', CAST(N'2022-08-08' AS Date), N'gar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'wsw9ekct8xid1ueepsfd5zjfk9jkhbvg9mflmj48dgct0rnwxx.png', 2, 2, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 1, 1, N'Gestión', N'', N'Gestión', N'Gestión', 3, 2, 1003, 1004, CAST(N'2022-08-07T00:00:00.000' AS DateTime), CAST(N'2022-08-07T00:00:00.000' AS DateTime), CAST(N'2022-08-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (35, N'WB', N'WB00035', 1, N'Camila', N'', N'Alvarado', N'Alvarado', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-08-08' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'xo170vn4kgqjxcthsoun5sfpu2vrl0h0obxs17mdsz59st1iry.png', 2, 2, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 1, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, CAST(N'2022-08-08T16:41:46.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (40, N'WB', N'WB00040', 1, N'Camila', N'', N'Alvarado', N'Alvarado', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'caaaa@caaa.cl', CAST(N'2022-08-08' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'4hkmnrvfq9rbw6pksibsctt1qgbppiyx8azi38dq3ogt34540b.png', 2, 2, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 1, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, CAST(N'2022-08-08T20:58:44.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (25, N'SC', N'SC00025', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-08-07' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'1oxl8rb8c76jdm66iiz835f281lqoypi3jsst1qizi5upb8ts6.png', 2, 2, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 2, 1, N'Materia del reclamo', N'', N'Gestión del reclamo', N'Plan de mejora / Medidas correctivas (Tiempo para realizarlo)', 2, 1003, 1003, NULL, CAST(N'2022-08-07T00:00:00.000' AS DateTime), CAST(N'2022-08-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (36, N'WB', N'WB00036', 1, N'Camila', N'Cami', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-08-08' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'6v8szk1v8ovsxj38iqo5ml6ognn90v6v7gbed6yy0yk0sadxr1.png', 1, 1, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 1, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, CAST(N'2022-08-08T20:44:58.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (37, N'WB', N'WB00037', 1, N'Camila', N'', N'Alvarado', N'Alvarado', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'caaaa@caaa.cl', CAST(N'2022-08-08' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'8kuy8jewsu5dzr04u5amvuaxgdgskn8v4m0c4n5m8rv8l9ze91.png', 2, 2, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 1, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, CAST(N'2022-08-08T20:54:39.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (38, N'WB', N'WB00038', 1, N'Camila', N'', N'Alvarado', N'Alvarado', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'caaaa@caaa.cl', CAST(N'2022-08-08' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'mzpp108aani3p5u53wlfj2cg85vjjhbyf8lxot9f1yje35ig6g.png', 2, 2, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 1, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, CAST(N'2022-08-08T20:56:42.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry], [form_date_manager], [form_date_director], [created_at], [updated_at], [deleted_at]) VALUES (39, N'WB', N'WB00039', 1, N'Camila', N'', N'Alvarado', N'Alvarado', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'caaaa@caaa.cl', CAST(N'2022-08-08' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'5bj0tkizkohvbpp3gwfxmquwkwxhfnirn0bwcg2q98eo2yzkhl.png', 2, 2, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 1, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, CAST(N'2022-08-08T20:57:26.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[forms] OFF
GO
SET IDENTITY_INSERT [dbo].[forms_documents] ON 

INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1, 20, N'1.png', N'1.png', N'1659311234_9f126d51ecd9114b7110.png', 2, NULL, CAST(N'2022-07-31T00:00:00.000' AS DateTime), CAST(N'2022-07-31' AS Date), CAST(N'2022-07-31' AS Date))
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (2, 20, N'1.png', N'1.png', N'1659312010_c1752a66efb96f2f9a21.png', 2, NULL, CAST(N'2022-07-31T00:00:00.000' AS DateTime), CAST(N'2022-07-31' AS Date), CAST(N'2022-07-31' AS Date))
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (3, 20, N'2.png', N'2.png', N'1659312547_e2a434bd7fed2877a8b4.png', 2, NULL, CAST(N'2022-07-31T00:00:00.000' AS DateTime), CAST(N'2022-07-31' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (4, 20, N'preview.png', N'preview.png', N'1659324664_c9d714723ad42984ece7.png', 2, NULL, CAST(N'2022-07-31T00:00:00.000' AS DateTime), CAST(N'2022-08-01' AS Date), CAST(N'2022-08-01' AS Date))
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (5, 20, N'1.png', N'1.png', N'1659324785_ef289f13d7c8c1f8014d.png', 2, NULL, CAST(N'2022-07-31T00:00:00.000' AS DateTime), CAST(N'2022-07-31' AS Date), CAST(N'2022-07-31' AS Date))
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (6, 20, N'3.png', N'3.png', N'1659324828_5f662f2043071bbb7cfc.png', 2, NULL, CAST(N'2022-07-31T00:00:00.000' AS DateTime), CAST(N'2022-07-31' AS Date), CAST(N'2022-07-31' AS Date))
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (7, 20, N'Formato Experiencia Laboral 19612989-8 CAMILA ALVARADO ASTROZA.xls', N'Formato Experiencia Laboral 19612989-8 CAMILA ALVARADO ASTROZA.xls', N'1659326415_a3adae253f24140374b4.xls', 2, NULL, CAST(N'2022-07-31T23:00:15.000' AS DateTime), CAST(N'2022-07-31' AS Date), CAST(N'2022-07-31' AS Date))
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (8, 20, N'24.06-Prueba_3_DBASE_ELIAS_ALVARADO (1).xlsx', N'24.06-Prueba_3_DBASE_ELIAS_ALVARADO (1).xlsx', N'1659410938_92cec8190ed0e5188ce9.xlsx', 2, NULL, CAST(N'2022-08-01T22:28:58.000' AS DateTime), CAST(N'2022-08-01' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (9, 20, N'Formato Experiencia Laboral 19612989-8 CAMILA ALVARADO ASTROZA.xls', N'Formato Experiencia Laboral 19612989-8 CAMILA ALVARADO ASTROZA.xls', N'1659671052_379ebf4892fb61853fea.xls', 2, NULL, CAST(N'2022-08-04T22:44:12.000' AS DateTime), CAST(N'2022-08-04' AS Date), CAST(N'2022-08-04' AS Date))
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (10, 20, N'2.png', N'2.png', N'1659671064_b2e4485a728604e4628f.png', 2, NULL, CAST(N'2022-08-04T22:44:24.000' AS DateTime), CAST(N'2022-08-04' AS Date), CAST(N'2022-08-04' AS Date))
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (11, 0, N'2.png', N'2.png', N'1659846989_340478fe36b677cb29b3.png', 2, NULL, CAST(N'2022-08-06T23:36:29.000' AS DateTime), CAST(N'2022-08-06' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (12, 23, N'2.png', N'2.png', N'1659921980_52489e66007ebc5ef646.png', 2, NULL, CAST(N'2022-08-07T20:26:25.000' AS DateTime), CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (13, 24, N'24.06-Prueba_3_DBASE_ELIAS_ALVARADO2.pdf', N'24.06-Prueba_3_DBASE_ELIAS_ALVARADO2.pdf', N'1659922201_62406007ca58fad2dcf3.pdf', 2, NULL, CAST(N'2022-08-07T20:30:09.000' AS DateTime), CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (14, 26, N'24.06-Prueba_3_DBASE_ELIAS_ALVARADO (1).xlsx', N'24.06-Prueba_3_DBASE_ELIAS_ALVARADO (1).xlsx', N'1659923125_1165fbf6a220cba2260b.xlsx', 2, NULL, CAST(N'2022-08-07T20:45:43.000' AS DateTime), CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (15, 26, N'24.06-Prueba_3_DBASE_ELIAS_ALVARADO.xlsx', N'24.06-Prueba_3_DBASE_ELIAS_ALVARADO.xlsx', N'1659923128_017e1cdafc80834478ad.xlsx', 2, NULL, CAST(N'2022-08-07T20:45:43.000' AS DateTime), CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (16, 34, N'24.06-Prueba_3_DBASE_ELIAS_ALVARADO (1).xlsx', N'24.06-Prueba_3_DBASE_ELIAS_ALVARADO (1).xlsx', N'1659978958_646828d709df63148d51.xlsx', 2, NULL, CAST(N'2022-08-08T12:15:58.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (17, 34, N'24.06-Prueba_3_DBASE_ELIAS_ALVARADO2 (1).pdf', N'24.06-Prueba_3_DBASE_ELIAS_ALVARADO2 (1).pdf', N'1659980263_c9e9056bc92e4056fa50.pdf', 2, NULL, CAST(N'2022-08-08T12:38:23.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (18, 25, N'24.06-Prueba_3_DBASE_ELIAS_ALVARADO2 (1).pdf', N'24.06-Prueba_3_DBASE_ELIAS_ALVARADO2 (1).pdf', N'1659981691_1cd159648821d20ebbe5.pdf', 1003, NULL, CAST(N'2022-08-08T13:01:34.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (19, 35, N'1.png', N'1.png', N'1659995163_e8c964350c5aa6d61474.png', 2, NULL, CAST(N'2022-08-08T16:46:03.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[forms_documents] OFF
GO
SET IDENTITY_INSERT [dbo].[forms_history] ON 

INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1, 20, 0, N'Se ha creado el formulario', 1, CAST(N'2022-07-31T18:57:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (3, 20, 2, NULL, NULL, CAST(N'2022-07-31T23:22:01.000' AS DateTime), CAST(N'2022-07-31' AS Date), CAST(N'2022-07-31' AS Date))
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (4, 20, 2, N'mi comentareio', NULL, CAST(N'2022-07-31T23:24:25.000' AS DateTime), CAST(N'2022-07-31' AS Date), CAST(N'2022-07-31' AS Date))
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (5, 20, 2, N'Mi comentario de prueba', NULL, CAST(N'2022-07-31T23:34:36.000' AS DateTime), CAST(N'2022-07-31' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (6, 20, 2, N'jeje', NULL, CAST(N'2022-07-31T23:36:05.000' AS DateTime), CAST(N'2022-07-31' AS Date), CAST(N'2022-07-31' AS Date))
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (7, 0, 2, N'ddssd', NULL, CAST(N'2022-08-06T23:55:50.000' AS DateTime), CAST(N'2022-08-06' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (8, 22, 2, N'Se ha creado el formulario', NULL, CAST(N'2022-08-07T20:07:19.000' AS DateTime), CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (9, 23, 2, N'Se ha creado el formulario', NULL, CAST(N'2022-08-07T20:26:25.000' AS DateTime), CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (10, 23, 2, N'Añadir comentario', NULL, CAST(N'2022-08-07T20:26:25.000' AS DateTime), CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (11, 24, 2, N'Se ha creado el formulario', NULL, CAST(N'2022-08-07T20:30:09.000' AS DateTime), CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (12, 24, 2, N'Añadir comentario', NULL, CAST(N'2022-08-07T20:30:09.000' AS DateTime), CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (13, 25, 2, N'Se ha creado el formulario', NULL, CAST(N'2022-08-07T20:39:49.000' AS DateTime), CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (14, 26, 2, N'Se ha creado el formulario', NULL, CAST(N'2022-08-07T20:44:08.000' AS DateTime), CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (15, 26, 2, N'Se ha modificado el formulario', NULL, CAST(N'2022-08-07T20:45:43.000' AS DateTime), CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (16, 26, 2, N'Añadí documentos', NULL, CAST(N'2022-08-07T20:45:43.000' AS DateTime), CAST(N'2022-08-07' AS Date), CAST(N'2022-08-07' AS Date))
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (17, 26, 2, N'Se ha modificado el formulario', NULL, CAST(N'2022-08-07T20:50:38.000' AS DateTime), CAST(N'2022-08-07' AS Date), CAST(N'2022-08-07' AS Date))
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (18, 26, 2, N'Se ha modificado el formulario', 1, CAST(N'2022-08-07T20:53:50.000' AS DateTime), CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (19, 34, 2, N'Se ha modificado el formulario', 1, CAST(N'2022-08-08T12:38:23.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (20, 25, 1003, N'Se ha modificado el formulario', 1, CAST(N'2022-08-08T13:01:34.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (21, 36, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-08T20:44:58.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (22, 37, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-08T20:54:39.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (23, 38, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-08T20:56:42.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (24, 39, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-08T20:57:26.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (25, 39, 0, N'Se ha asignado el formulario al usuario: .', 1, CAST(N'2022-08-08T20:57:26.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (26, 40, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-08T20:58:44.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (27, 40, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-08T20:58:44.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[forms_history] OFF
GO
SET IDENTITY_INSERT [dbo].[forms_notifications] ON 

INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1, 33, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00033', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-07T23:50:26.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2, 34, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00034', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-07T23:50:26.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (3, 34, 1004, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00034', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-07T23:50:26.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (4, 25, 1003, N'Se ha asignado un nuevo formulario registrado en formulario Buzón - Folio: SC00025', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-07T23:50:26.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (5, 35, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00035', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-08T16:41:46.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (6, 36, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00036', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-08T20:44:58.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (7, 37, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00037', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-08T20:54:40.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (8, 38, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00038', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-08T20:56:43.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (9, 39, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00039', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-08T20:57:26.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (10, 40, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00040', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-08T20:58:44.000' AS DateTime), CAST(N'2022-08-08' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[forms_notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[genders] ON 

INSERT [dbo].[genders] ([id], [gender], [deleted_at]) VALUES (1, N'Femenino', NULL)
INSERT [dbo].[genders] ([id], [gender], [deleted_at]) VALUES (2, N'Masculino', NULL)
INSERT [dbo].[genders] ([id], [gender], [deleted_at]) VALUES (3, N'No quiero entregar este dato', NULL)
SET IDENTITY_INSERT [dbo].[genders] OFF
GO
SET IDENTITY_INSERT [dbo].[menus] ON 

INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (1, 1, 2, NULL)
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (3, 3, 2, NULL)
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (4, 1, 1, NULL)
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (5, 3, 1, NULL)
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (7, 4, 1, NULL)
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (8, 1, 3, NULL)
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (9, 2, 3, NULL)
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (10, 3, 3, NULL)
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (1008, 1, 4, NULL)
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (1009, 3, 4, NULL)
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (1010, 1, 5, NULL)
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (1011, 3, 5, NULL)
SET IDENTITY_INSERT [dbo].[menus] OFF
GO
SET IDENTITY_INSERT [dbo].[pages] ON 

INSERT [dbo].[pages] ([id], [controller], [description], [icon], [parent_id], [is_parent], [section], [order_parent], [order_child], [deleted_at]) VALUES (1, N'Home/Index', N'Inicio', N'fas fa-home', 0, 0, NULL, 1, 0, NULL)
INSERT [dbo].[pages] ([id], [controller], [description], [icon], [parent_id], [is_parent], [section], [order_parent], [order_child], [deleted_at]) VALUES (2, N'Inbox/Save', N'Nuevo Formulario', N'fas fa-plus', 0, 0, NULL, 2, 0, NULL)
INSERT [dbo].[pages] ([id], [controller], [description], [icon], [parent_id], [is_parent], [section], [order_parent], [order_child], [deleted_at]) VALUES (3, N'Inbox/Index', N'Bandeja de Formularios', N'fas fa-ticket-alt', 0, 0, NULL, 3, 0, NULL)
INSERT [dbo].[pages] ([id], [controller], [description], [icon], [parent_id], [is_parent], [section], [order_parent], [order_child], [deleted_at]) VALUES (4, N'User/Index', N'Usuarios', N'fas fa-user', 0, 0, N'Mantenedores', 4, 0, NULL)
SET IDENTITY_INSERT [dbo].[pages] OFF
GO
SET IDENTITY_INSERT [dbo].[pages_actions] ON 

INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1, 3, 1, 1, N'SEE,REASIGN,EDIT,DISCARD', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (2, 3, 1, 2, N'SEE,REASIGN,EDIT,DISCARD', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (3, 3, 1, 3, N'SEE,REASIGN,EDIT,DISCARD', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (4, 3, 1, 4, N'SEE,REASIGN,EDIT,DISCARD', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (5, 3, 1, 5, N'SEE,REASIGN,EDIT,DISCARD', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (6, 3, 1, 6, N'SEE,REASIGN,EDIT,DISCARD', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (7, 3, 1, 7, N'SEE,REASIGN,EDIT,DISCARD', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (8, 3, 2, 1, N'SEE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (9, 3, 2, 2, N'SEE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (10, 3, 2, 3, N'SEE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (11, 3, 2, 4, N'SEE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (12, 3, 2, 5, N'SEE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (13, 3, 2, 6, N'SEE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (14, 3, 2, 7, N'SEE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (15, 3, 3, 1, N'EDIT,DISCARD,SEND', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (16, 3, 3, 2, N'SEE,INSIST', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (17, 3, 3, 6, N'SEE,SUBTK', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (18, 3, 3, 7, N'SEE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (19, 3, 4, 2, N'EDIT,DISCARD,SEND', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (20, 3, 4, 3, N'SEE,INSIST', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (21, 3, 4, 4, N'EDIT,DISCARD,SEND', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (22, 3, 5, 3, N'SEE,EDIT,APPROVE,DECLINE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (23, 3, 3, 0, N'ADD,SAVE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1003, 3, 3, 8, N'SEE,RESTORE,DELETE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1004, 3, 4, 0, N'SAVE', NULL)
SET IDENTITY_INSERT [dbo].[pages_actions] OFF
GO
SET IDENTITY_INSERT [dbo].[profiles] ON 

INSERT [dbo].[profiles] ([id], [profile], [deleted_at]) VALUES (1, N'Administrador', NULL)
INSERT [dbo].[profiles] ([id], [profile], [deleted_at]) VALUES (2, N'Lector', NULL)
INSERT [dbo].[profiles] ([id], [profile], [deleted_at]) VALUES (3, N'Ingreso', NULL)
INSERT [dbo].[profiles] ([id], [profile], [deleted_at]) VALUES (4, N'Gestor', NULL)
INSERT [dbo].[profiles] ([id], [profile], [deleted_at]) VALUES (5, N'Director', NULL)
SET IDENTITY_INSERT [dbo].[profiles] OFF
GO
SET IDENTITY_INSERT [dbo].[regions] ON 

INSERT [dbo].[regions] ([id], [region], [deleted_at]) VALUES (1, N'Región de Arica y Parinacota
', NULL)
INSERT [dbo].[regions] ([id], [region], [deleted_at]) VALUES (2, N'Región de Tarapacá
', NULL)
INSERT [dbo].[regions] ([id], [region], [deleted_at]) VALUES (3, N'Región de Antofagasta
', NULL)
INSERT [dbo].[regions] ([id], [region], [deleted_at]) VALUES (4, N'Región de Atacama
', NULL)
INSERT [dbo].[regions] ([id], [region], [deleted_at]) VALUES (5, N'Región de Coquimbo
', NULL)
INSERT [dbo].[regions] ([id], [region], [deleted_at]) VALUES (6, N'Región de Valparaíso
', NULL)
INSERT [dbo].[regions] ([id], [region], [deleted_at]) VALUES (7, N'Región del Libertador Gral. Bernardo O’Higgins
', NULL)
INSERT [dbo].[regions] ([id], [region], [deleted_at]) VALUES (8, N'Región del Maule
', NULL)
INSERT [dbo].[regions] ([id], [region], [deleted_at]) VALUES (9, N'Región del Biobío
', NULL)
INSERT [dbo].[regions] ([id], [region], [deleted_at]) VALUES (10, N'Región de Ñuble
', NULL)
INSERT [dbo].[regions] ([id], [region], [deleted_at]) VALUES (11, N'Región de La Araucanía
', NULL)
INSERT [dbo].[regions] ([id], [region], [deleted_at]) VALUES (12, N'Región de Los Ríos
', NULL)
INSERT [dbo].[regions] ([id], [region], [deleted_at]) VALUES (13, N'Región de Los Lagos
', NULL)
INSERT [dbo].[regions] ([id], [region], [deleted_at]) VALUES (14, N'Región Aisén del Gral. Carlos Ibáñez del Campo
', NULL)
INSERT [dbo].[regions] ([id], [region], [deleted_at]) VALUES (15, N'Región de Magallanes y de La Antártica Chilena
', NULL)
INSERT [dbo].[regions] ([id], [region], [deleted_at]) VALUES (16, N'Región Metropolitana de Santiago
', NULL)
SET IDENTITY_INSERT [dbo].[regions] OFF
GO
SET IDENTITY_INSERT [dbo].[status] ON 

INSERT [dbo].[status] ([id], [status], [deleted_at]) VALUES (1, N'Ingresado', NULL)
INSERT [dbo].[status] ([id], [status], [deleted_at]) VALUES (2, N'En gestión', NULL)
INSERT [dbo].[status] ([id], [status], [deleted_at]) VALUES (3, N'Pendiente aprobación', NULL)
INSERT [dbo].[status] ([id], [status], [deleted_at]) VALUES (4, N'Rechazado', NULL)
INSERT [dbo].[status] ([id], [status], [deleted_at]) VALUES (5, N'Aprobado', NULL)
INSERT [dbo].[status] ([id], [status], [deleted_at]) VALUES (6, N'Cerrado', NULL)
INSERT [dbo].[status] ([id], [status], [deleted_at]) VALUES (7, N'Reabierto', NULL)
INSERT [dbo].[status] ([id], [status], [deleted_at]) VALUES (8, N'Descartado', NULL)
SET IDENTITY_INSERT [dbo].[status] OFF
GO
SET IDENTITY_INSERT [dbo].[status_workflow] ON 

INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [deleted_at]) VALUES (1, 1, 2, NULL, NULL, NULL)
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [deleted_at]) VALUES (2, 2, 3, NULL, NULL, NULL)
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [deleted_at]) VALUES (3, 3, 4, 0, NULL, NULL)
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [deleted_at]) VALUES (4, 3, 5, NULL, NULL, NULL)
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [deleted_at]) VALUES (5, 4, 3, NULL, NULL, NULL)
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [deleted_at]) VALUES (6, 5, 6, NULL, NULL, NULL)
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [deleted_at]) VALUES (7, 0, 1, NULL, 3, NULL)
SET IDENTITY_INSERT [dbo].[status_workflow] OFF
GO
SET IDENTITY_INSERT [dbo].[types] ON 

INSERT [dbo].[types] ([id], [type], [icon], [class], [order_by], [deleted_at]) VALUES (1, N'Reclamo', N'fas fa-exclamation-triangle', N'radio-button-danger', 1, NULL)
INSERT [dbo].[types] ([id], [type], [icon], [class], [order_by], [deleted_at]) VALUES (2, N'Sugerencia', N'fas fa-thumbs-up', N'radio-button-warning', 2, NULL)
INSERT [dbo].[types] ([id], [type], [icon], [class], [order_by], [deleted_at]) VALUES (3, N'Felicitaciones', N'fas fa-smile', N'radio-button-success', 3, NULL)
SET IDENTITY_INSERT [dbo].[types] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (1, N'Administrador', N'Del Sitio', N'alvarado.astroza.camila@gmail.com', N'admin', N'$2y$10$SL0OD2P8hG7lePqrQR0.5.74eLvpK1QZzBJqpbXQ4ewNPBBchwCb.', 1, CAST(N'2022-08-08T16:35:51.000' AS DateTime), CAST(N'2022-08-08T16:38:06.000' AS DateTime), NULL, 0, NULL, CAST(N'2022-08-08' AS Date), NULL, CAST(N'2022-07-17T00:56:31.000' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (2, N'Perfil', N'Ingreso', N'alvarado.astroza.camila@gmail.com', N'ingreso', N'$2y$10$YtfqTPpTTMdzzKn9VKF2DuoogUVeyX3igjWF6LBQAk6.4JuoNIJNG', 3, CAST(N'2022-08-08T20:24:56.000' AS DateTime), CAST(N'2022-08-08T21:11:51.000' AS DateTime), NULL, 0, CAST(N'2022-07-17' AS Date), CAST(N'2022-08-08' AS Date), NULL, CAST(N'2022-07-17T01:01:21.000' AS DateTime), N'', NULL, 1)
INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (3, N'Lector', N'del Sitio', N'alvarado.astroza.camila@gmail.com', N'lector', N'$2y$10$m2eHn1wxXmaWPbJlkH3Zoe5bCiDtd3oOEu03/5Aq.USAhE55b/L6i', 2, CAST(N'2022-08-08T16:51:01.000' AS DateTime), CAST(N'2022-08-08T16:52:30.000' AS DateTime), NULL, 0, CAST(N'2022-07-26' AS Date), CAST(N'2022-08-08' AS Date), NULL, CAST(N'2022-07-26T23:50:24.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (1003, N'Perfil', N'Gestor', N'alvarado.astroza.camila@gmail.com', N'gestor', N'$2y$10$qAeNW7Ep1CvOA8cKT5eNT.nS6cvNjudKzINzUfdLuqylIEhqrr0NK', 4, CAST(N'2022-08-08T16:52:34.000' AS DateTime), CAST(N'2022-08-08T16:54:52.000' AS DateTime), NULL, 0, CAST(N'2022-08-08' AS Date), CAST(N'2022-08-08' AS Date), NULL, CAST(N'2022-08-08T12:52:23.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (1004, N'Perfil', N'Director', N'alvarado.astroza.camila@gmail.com', N'director', N'$2y$10$2oXYyA./lrSLEOmnpwaPjusruRyqTgoibSSC.hcXaAL9XnvOHS5Am', 5, CAST(N'2022-08-08T20:24:45.000' AS DateTime), CAST(N'2022-08-08T20:24:50.000' AS DateTime), NULL, 0, CAST(N'2022-08-08' AS Date), CAST(N'2022-08-08' AS Date), NULL, CAST(N'2022-08-08T12:52:49.000' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[users_profiles] ON 

INSERT [dbo].[users_profiles] ([id], [user_id], [profile_id], [deleted_at]) VALUES (4, 1, 1, NULL)
INSERT [dbo].[users_profiles] ([id], [user_id], [profile_id], [deleted_at]) VALUES (5, 2, 2, NULL)
SET IDENTITY_INSERT [dbo].[users_profiles] OFF
GO
ALTER TABLE [dbo].[forms] ADD  CONSTRAINT [DF_forms_status_id]  DEFAULT ((1)) FOR [status_id]
GO
ALTER TABLE [dbo].[forms_notifications] ADD  CONSTRAINT [DF_forms_notifications_is_read]  DEFAULT ((0)) FOR [is_read]
GO
ALTER TABLE [dbo].[pages] ADD  CONSTRAINT [DF_pages_id_parent]  DEFAULT ((0)) FOR [parent_id]
GO
ALTER TABLE [dbo].[pages] ADD  CONSTRAINT [DF_pages_is_parent]  DEFAULT ((0)) FOR [is_parent]
GO
ALTER TABLE [dbo].[pages] ADD  CONSTRAINT [DF_pages_order_parent]  DEFAULT ((0)) FOR [order_parent]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_assignment_process]  DEFAULT ((0)) FOR [assignment_process]
GO
ALTER TABLE [dbo].[districts]  WITH CHECK ADD  CONSTRAINT [FK_regions_districts] FOREIGN KEY([region_id])
REFERENCES [dbo].[regions] ([id])
GO
ALTER TABLE [dbo].[districts] CHECK CONSTRAINT [FK_regions_districts]
GO
ALTER TABLE [dbo].[menus]  WITH CHECK ADD  CONSTRAINT [FK_menus_pages] FOREIGN KEY([page_id])
REFERENCES [dbo].[pages] ([id])
GO
ALTER TABLE [dbo].[menus] CHECK CONSTRAINT [FK_menus_pages]
GO
ALTER TABLE [dbo].[menus]  WITH CHECK ADD  CONSTRAINT [FK_menus_profiles] FOREIGN KEY([profile_id])
REFERENCES [dbo].[profiles] ([id])
GO
ALTER TABLE [dbo].[menus] CHECK CONSTRAINT [FK_menus_profiles]
GO
ALTER TABLE [dbo].[users_profiles]  WITH CHECK ADD  CONSTRAINT [FK_users_profiles_profiles] FOREIGN KEY([profile_id])
REFERENCES [dbo].[profiles] ([id])
GO
ALTER TABLE [dbo].[users_profiles] CHECK CONSTRAINT [FK_users_profiles_profiles]
GO
USE [master]
GO
ALTER DATABASE [cdc_plataforma_oirs] SET  READ_WRITE 
GO
