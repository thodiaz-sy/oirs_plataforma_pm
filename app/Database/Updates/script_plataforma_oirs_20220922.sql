USE [master]
GO
/****** Object:  Database [cdc_plataforma_oirs]    Script Date: 22/09/2022 13:58:10 ******/
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
/****** Object:  Table [dbo].[actions]    Script Date: 22/09/2022 13:58:11 ******/
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
	[data] [varchar](500) NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_actions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[areas]    Script Date: 22/09/2022 13:58:11 ******/
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
/****** Object:  Table [dbo].[branchs]    Script Date: 22/09/2022 13:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branchs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[branch] [varchar](50) NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_branchs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[channels]    Script Date: 22/09/2022 13:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[channels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel] [varchar](50) NULL,
	[send_email] [int] NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_channel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[channels_entry]    Script Date: 22/09/2022 13:58:11 ******/
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
/****** Object:  Table [dbo].[districts]    Script Date: 22/09/2022 13:58:11 ******/
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
/****** Object:  Table [dbo].[emails]    Script Date: 22/09/2022 13:58:11 ******/
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
/****** Object:  Table [dbo].[forms]    Script Date: 22/09/2022 13:58:11 ******/
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
	[form_branch_id] [int] NULL,
	[form_area_id] [int] NULL,
	[form_channel_id] [int] NULL,
	[form_resume] [varchar](1500) NULL,
	[form_solution] [varchar](1500) NULL,
	[form_channel_entry_id] [int] NULL,
	[form_is_priority] [int] NULL,
	[form_subject_claim] [varchar](100) NULL,
	[form_ot] [varchar](100) NULL,
	[form_management] [varchar](1500) NULL,
	[form_improve] [varchar](1500) NULL,
	[status_id] [int] NOT NULL,
	[user_current] [int] NULL,
	[user_entry] [int] NULL,
	[user_manager] [int] NULL,
	[user_director] [int] NULL,
	[form_date_received] [datetime] NULL,
	[form_date_entry_assign] [datetime] NULL,
	[form_date_entry] [datetime] NULL,
	[form_date_manager_assign] [datetime] NULL,
	[form_date_manager] [datetime] NULL,
	[form_date_director_assign] [datetime] NULL,
	[form_date_director] [datetime] NULL,
	[form_date_closed] [datetime] NULL,
	[form_date_notify_sla] [datetime] NULL,
	[form_log_notify_sla] [varchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[forms_documents]    Script Date: 22/09/2022 13:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forms_documents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[form_id] [int] NULL,
	[doc_desc] [varchar](500) NULL,
	[original_name] [varchar](500) NULL,
	[path] [varchar](500) NULL,
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
/****** Object:  Table [dbo].[forms_history]    Script Date: 22/09/2022 13:58:11 ******/
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
/****** Object:  Table [dbo].[forms_notifications]    Script Date: 22/09/2022 13:58:11 ******/
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
/****** Object:  Table [dbo].[forms_sla]    Script Date: 22/09/2022 13:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forms_sla](
	[id] [int] NULL,
	[type_sla] [varchar](50) NULL,
	[template_id] [int] NULL,
	[emails_cc] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genders]    Script Date: 22/09/2022 13:58:11 ******/
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
/****** Object:  Table [dbo].[menus]    Script Date: 22/09/2022 13:58:11 ******/
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
/****** Object:  Table [dbo].[pages]    Script Date: 22/09/2022 13:58:11 ******/
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
/****** Object:  Table [dbo].[pages_actions]    Script Date: 22/09/2022 13:58:11 ******/
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
/****** Object:  Table [dbo].[profiles]    Script Date: 22/09/2022 13:58:11 ******/
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
/****** Object:  Table [dbo].[regions]    Script Date: 22/09/2022 13:58:11 ******/
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
/****** Object:  Table [dbo].[status]    Script Date: 22/09/2022 13:58:11 ******/
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
/****** Object:  Table [dbo].[status_workflow]    Script Date: 22/09/2022 13:58:11 ******/
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
	[assign_area] [int] NULL,
	[deleted_at] [date] NULL,
 CONSTRAINT [PK_status_workflow] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[types]    Script Date: 22/09/2022 13:58:11 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 22/09/2022 13:58:11 ******/
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
	[branch_id] [int] NULL,
	[area_id] [int] NULL,
	[signature] [varchar](max) NULL,
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_profiles]    Script Date: 22/09/2022 13:58:11 ******/
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

INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [data], [deleted_at]) VALUES (1, N'SEE', N'fas fa-eye', N'btn-info row-btn-see', N'Ver', N'/Inbox/Read/{invoice}', NULL, NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [data], [deleted_at]) VALUES (2, N'ADD', N'fas fa-plus', N'btn-success row-btn-add', N'Ingresar', N'/Inbox/Save', NULL, NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [data], [deleted_at]) VALUES (3, N'EDIT', N'fas fa-edit', N'btn-warning row-btn-edit', N'Editar', N'/Inbox/Save/{invoice}', NULL, NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [data], [deleted_at]) VALUES (4, N'DELETE', N'fas fa-trash', N'btn-danger row-btn-delete', N'Eliminar', N'deleteForm({form_id},this);', NULL, NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [data], [deleted_at]) VALUES (5, N'REASIGN', N'fas fa-user', N'btn-primary row-btn-reasign', N'Reasignar', NULL, N'data-id="{form_id}" data-invoice="{invoice}"', NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [data], [deleted_at]) VALUES (6, N'SEND', N'fas fa-paper-plane', N'btn-primary row-btn-send', N'Enviar', NULL, N'data-id="{form_id}" data-invoice="{invoice}"', NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [data], [deleted_at]) VALUES (7, N'INSIST', N'fas fa-exclamation-circle', N'btn-primary row-btn-insist', N'Insistir', NULL, N'data-id="{form_id}" data-invoice="{invoice}"', NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [data], [deleted_at]) VALUES (8, N'APPROVE', N'fas fa-thumbs-up', N'btn-success row-btn-approve', N'Aprobar', NULL, N'data-id="{form_id}" data-invoice="{invoice}"', NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [data], [deleted_at]) VALUES (9, N'DECLINE', N'fas fa-thumbs-down', N'btn-danger row-btn-decline', N'Rechazar', NULL, N'data-id="{form_id}" data-invoice="{invoice}"', NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [data], [deleted_at]) VALUES (11, N'DISCARD', N'fas fa-minus-circle', N'btn-danger row-btn-discard', N'Descartar', N'discardForm({form_id},this);', NULL, NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [data], [deleted_at]) VALUES (12, N'RESTORE', N'fas fa-check-circle', N'btn-success row-btn-restore', N'Recuperar', N'recoveryForm({form_id},this);', NULL, NULL)
INSERT [dbo].[actions] ([id], [action], [icon], [class], [description], [href], [data], [deleted_at]) VALUES (13, N'REOPEN', N'fas fa-folder-open', N'btn-danger row-btn-reopen', N'Reabrir Caso', NULL, N'data-id="{form_id}" data-invoice="{invoice}"', NULL)
SET IDENTITY_INSERT [dbo].[actions] OFF
GO
SET IDENTITY_INSERT [dbo].[areas] ON 

INSERT [dbo].[areas] ([id], [area], [deleted_at]) VALUES (1, N'Clínica', NULL)
INSERT [dbo].[areas] ([id], [area], [deleted_at]) VALUES (2, N'Administrativa', NULL)
INSERT [dbo].[areas] ([id], [area], [deleted_at]) VALUES (3, N'Comercial', NULL)
SET IDENTITY_INSERT [dbo].[areas] OFF
GO
SET IDENTITY_INSERT [dbo].[branchs] ON 

INSERT [dbo].[branchs] ([id], [branch], [deleted_at]) VALUES (1, N'Sucursal 1', NULL)
INSERT [dbo].[branchs] ([id], [branch], [deleted_at]) VALUES (2, N'Sucursal 2', NULL)
SET IDENTITY_INSERT [dbo].[branchs] OFF
GO
SET IDENTITY_INSERT [dbo].[channels] ON 

INSERT [dbo].[channels] ([id], [channel], [send_email], [deleted_at]) VALUES (1, N'Correo electrónico', 1, NULL)
INSERT [dbo].[channels] ([id], [channel], [send_email], [deleted_at]) VALUES (2, N'Carta certificada a domicilio', 0, NULL)
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
INSERT [dbo].[emails] ([id], [from_email], [from_name], [subject], [body], [cid_have], [cid_json_list]) VALUES (1, N'oirs_prueba@cumbredental.cl', N'Plataforma OIRS', N'Recuperar Contraseña', N'<!DOCTYPE html>
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
INSERT [dbo].[emails] ([id], [from_email], [from_name], [subject], [body], [cid_have], [cid_json_list]) VALUES (2, N'oirs_prueba@cumbredental.cl', N'Plataforma OIRS', N'Ingreso de Reclamo {formID}', N'<!DOCTYPE html>
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
INSERT [dbo].[emails] ([id], [from_email], [from_name], [subject], [body], [cid_have], [cid_json_list]) VALUES (3, N'oirs_prueba@cumbredental.cl', N'Plataforma OIRS', N'Ingreso de Felicitación/Sugerencia {formID}', N'<!DOCTYPE html>
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
							<span class="position" style="text-align: center;display: block;">Muchas gracias por tus comentarios, te responderemos a la brevedad.</span><br>							
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
INSERT [dbo].[emails] ([id], [from_email], [from_name], [subject], [body], [cid_have], [cid_json_list]) VALUES (4, N'oirs_prueba@cumbredental.cl', N'Plataforma OIRS', N'Asignación de formulario Folio: {formID}', N'<!DOCTYPE html>
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
				          	<span class="position">Se le ha asignado el siguiente formulario para su gestión:</span><br>
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
										<th class="text-left">Estado</th><td>{status}</td>
									  </tr>
									  <tr>
										<th class="text-left">Comentario</th><td>{comment}</td>
									  </tr>                         
									</tbody>
								  </table>
							</table><br>
							<p style="text-align:center;margin:0px 0px 0px 0px"><a href="http://localhost/cdc_plataforma_oirs/index.php/Inbox/Read/{formID}" class="btn btn-primary">Ver detalle de formulario</a></p><br>
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
INSERT [dbo].[emails] ([id], [from_email], [from_name], [subject], [body], [cid_have], [cid_json_list]) VALUES (5, N'oirs_prueba@cumbredental.cl', N'Plataforma OIRS', N'Resolución de Reclamo Folio: {formID}', N'<!DOCTYPE html>
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
				          	<span class="position">Le adjuntamos la respuesta a su reclamo.</span><br>
				          	<span class="position">Gracias por preferir este canal de atención.</span><br>				           	
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
INSERT [dbo].[emails] ([id], [from_email], [from_name], [subject], [body], [cid_have], [cid_json_list]) VALUES (6, N'oirs_prueba@cumbredental.cl', N'Plataforma OIRS', N'Insistencia en formulario Folio: {formID}', N'<!DOCTYPE html>
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
				          	<span class="position">Se ha realizado una insistencia en el formulario para su gestión:</span><br>
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
										<th class="text-left">Insistencia por:</th><td>{user}</td>
									  </tr>
									  <tr>
										<th class="text-left">Comentario</th><td>{comment}</td>
									  </tr>                         
									</tbody>
								  </table>
							</table><br>
							<p style="text-align:center;margin:0px 0px 0px 0px"><a href="http://localhost/cdc_plataforma_oirs/index.php/Inbox/Read/{formID}" class="btn btn-primary">Ver detalle de formulario</a></p><br>
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

INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_branch_id], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_current], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry_assign], [form_date_entry], [form_date_manager_assign], [form_date_manager], [form_date_director_assign], [form_date_director], [form_date_closed], [form_date_notify_sla], [form_log_notify_sla], [created_at], [updated_at], [deleted_at]) VALUES (2070, N'WB', N'WB02070', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-09-10' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'', 1, 2, 1, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, CAST(N'2022-09-07T00:28:41.000' AS DateTime), CAST(N'2022-09-09T00:28:41.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-09-12T00:03:52.000' AS DateTime), N'[Estado de notificación]: Se ha guardado la alerta en motor de correo', NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_branch_id], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_current], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry_assign], [form_date_entry], [form_date_manager_assign], [form_date_manager], [form_date_director_assign], [form_date_director], [form_date_closed], [form_date_notify_sla], [form_log_notify_sla], [created_at], [updated_at], [deleted_at]) VALUES (2071, N'WB', N'WB02071', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-09-10' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'', 1, 2, 1, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 1, NULL, NULL, NULL, NULL, NULL, 4, 1003, 2, 1003, 1012, CAST(N'2022-08-30T00:32:44.000' AS DateTime), NULL, CAST(N'2022-09-11T21:33:06.000' AS DateTime), CAST(N'2022-09-11T21:43:12.000' AS DateTime), CAST(N'2022-09-11T21:41:31.000' AS DateTime), CAST(N'2022-09-11T21:41:31.000' AS DateTime), CAST(N'2022-09-11T21:43:12.000' AS DateTime), NULL, CAST(N'2022-09-12T00:16:02.000' AS DateTime), N'[Estado de notificación]: Se ha guardado la alerta en motor de correo', NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_branch_id], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_current], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry_assign], [form_date_entry], [form_date_manager_assign], [form_date_manager], [form_date_director_assign], [form_date_director], [form_date_closed], [form_date_notify_sla], [form_log_notify_sla], [created_at], [updated_at], [deleted_at]) VALUES (2072, N'WB', N'WB02072', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-09-10' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'', 1, 2, 1, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, CAST(N'2022-09-10T00:35:05.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_branch_id], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_current], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry_assign], [form_date_entry], [form_date_manager_assign], [form_date_manager], [form_date_director_assign], [form_date_director], [form_date_closed], [form_date_notify_sla], [form_log_notify_sla], [created_at], [updated_at], [deleted_at]) VALUES (2073, N'WB', N'WB02073', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-09-10' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'', 1, 2, 1, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, CAST(N'2022-09-10T01:39:47.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_branch_id], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_current], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry_assign], [form_date_entry], [form_date_manager_assign], [form_date_manager], [form_date_director_assign], [form_date_director], [form_date_closed], [form_date_notify_sla], [form_log_notify_sla], [created_at], [updated_at], [deleted_at]) VALUES (2075, N'WB', N'WB02075', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-09-10' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'', 1, 2, 1, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 1, 1, N'Materia del reclamo', N'OT', N'Gestión del reclamo', N'Plan de mejora / Medidas correctivas (Tiempo para realizarlo)', 1, 2, 2, 1003, 1004, CAST(N'2022-09-10T00:00:00.000' AS DateTime), CAST(N'2022-09-10T23:16:36.000' AS DateTime), CAST(N'2022-09-10T22:23:25.000' AS DateTime), CAST(N'2022-09-10T22:30:50.000' AS DateTime), CAST(N'2022-09-10T22:32:44.000' AS DateTime), CAST(N'2022-09-10T22:32:44.000' AS DateTime), CAST(N'2022-09-10T23:16:36.000' AS DateTime), CAST(N'2022-09-10T23:08:59.000' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[forms] ([id], [invoice_channel], [invoice], [form_type_id], [pacient_names], [pacient_social_name], [pacient_lastname], [pacient_mlastname], [pacient_rut], [pacient_gender_id], [pacient_phone], [pacient_address], [pacient_region_id], [pacient_district_id], [pacient_email], [attention_date], [attention_place], [is_pacient], [claimant_names], [claimant_social_name], [claimant_lastname], [claimant_mlastname], [claimant_rut], [claimant_gender_id], [claimant_phone], [claimant_address], [claimant_region_id], [claimant_district_id], [claimant_email], [form_sign], [form_branch_id], [form_area_id], [form_channel_id], [form_resume], [form_solution], [form_channel_entry_id], [form_is_priority], [form_subject_claim], [form_ot], [form_management], [form_improve], [status_id], [user_current], [user_entry], [user_manager], [user_director], [form_date_received], [form_date_entry_assign], [form_date_entry], [form_date_manager_assign], [form_date_manager], [form_date_director_assign], [form_date_director], [form_date_closed], [form_date_notify_sla], [form_log_notify_sla], [created_at], [updated_at], [deleted_at]) VALUES (2074, N'WB', N'WB02074', 1, N'Camila', N'', N'Alvarado', N'Astroza', N'19612989-8', 1, 978959147, N'Puerto Montt 3894, Renca', 16, 16, N'alvarado.astroza.camila@gmail.com', CAST(N'2022-09-10' AS Date), N'Lugar de atención', 1, N'', N'', N'', N'', N'', 0, 0, N'', 0, 0, N'', N'', 1, 2, 2, N'Relato del hecho (¿Derecho vulnerado?)', N'Peticiones concretas', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, CAST(N'2022-09-10T01:59:20.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[forms] OFF
GO
SET IDENTITY_INSERT [dbo].[forms_documents] ON 

INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (20, 41, N'killua.docx', N'killua.docx', NULL, N'1660614454_3ff1278eccac373a1e49.docx', 2, NULL, CAST(N'2022-08-15T20:47:42.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (21, 42, N'24.06-Prueba_3_DBASE_ELIAS_ALVARADO (1).xlsx', N'24.06-Prueba_3_DBASE_ELIAS_ALVARADO (1).xlsx', NULL, N'1660615488_dcd40d3925ea64ccec21.xlsx', 1003, NULL, CAST(N'2022-08-15T21:08:34.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (22, 41, N'ARCHIVO_WORD.docx', N'ARCHIVO_WORD.docx', NULL, N'1660615746_b150bdb394e1f9c93713.docx', 1003, NULL, CAST(N'2022-08-15T21:09:10.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (23, 1, N'ReciboReclamo_1.pdf', N'ReciboReclamo_1.pdf', NULL, N'C:\wamp64\www\cdc_formulario_oirs\writable\uploads/receipt_forms/ReciboReclamo_1.pdf', 0, NULL, CAST(N'2022-08-17T22:43:17.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (24, 1, N'ReciboReclamo_1.pdf', N'ReciboReclamo_1.pdf', NULL, N'C:\wamp64\www\cdc_formulario_oirs\writable\uploads/receipt_forms/ReciboReclamo_1.pdf', 0, NULL, CAST(N'2022-08-17T22:44:21.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (25, 1, N'ReciboReclamo_1.pdf', N'ReciboReclamo_1.pdf', NULL, N'C:\wamp64\www\cdc_formulario_oirs\writable\uploads/receipt_forms/ReciboReclamo_1.pdf', 0, NULL, CAST(N'2022-08-17T22:45:47.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (26, 1, N'ReciboReclamo_1.pdf', N'ReciboReclamo_1.pdf', NULL, N'C:\wamp64\www\cdc_formulario_oirs\writable\uploads/receipt_forms/ReciboReclamo_1.pdf', 0, NULL, CAST(N'2022-08-17T22:47:09.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (27, 1, N'ReciboReclamo_1.pdf', N'ReciboReclamo_1.pdf', NULL, N'C:\wamp64\www\cdc_formulario_oirs\writable\uploads/receipt_forms/ReciboReclamo_1.pdf', 0, NULL, CAST(N'2022-08-17T22:47:39.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (28, 1, N'ReciboReclamo_1.pdf', N'ReciboReclamo_1.pdf', NULL, N'C:\wamp64\www\cdc_formulario_oirs\writable\uploads/receipt_forms/ReciboReclamo_1.pdf', 0, NULL, CAST(N'2022-08-17T22:48:19.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (29, 1, N'ReciboReclamo_1.pdf', N'ReciboReclamo_1.pdf', NULL, N'C:\wamp64\www\cdc_formulario_oirs\writable\uploads/receipt_forms/ReciboReclamo_1.pdf', 0, NULL, CAST(N'2022-08-17T22:49:21.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (30, 45, N'ReciboReclamo_WB00045.pdf', N'ReciboReclamo_WB00045.pdf', NULL, N'receipt_forms/ReciboReclamo_WB00045.pdf', 0, NULL, CAST(N'2022-08-17T23:15:05.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (31, 46, N'ReciboReclamo_WB00046.pdf', N'ReciboReclamo_WB00046.pdf', NULL, N'receipt_forms/ReciboReclamo_WB00046.pdf', 0, NULL, CAST(N'2022-08-17T23:17:28.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (32, 47, N'ReciboReclamo_WB00047.pdf', N'ReciboReclamo_WB00047.pdf', NULL, N'receipt_forms/ReciboReclamo_WB00047.pdf', 0, NULL, CAST(N'2022-08-17T23:23:33.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1023, 1045, N'ReciboReclamo_WB01045.pdf', N'ReciboReclamo_WB01045.pdf', NULL, N'receipt_forms/ReciboReclamo_WB01045.pdf', 0, NULL, CAST(N'2022-08-17T23:40:19.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1024, 1046, N'ReciboReclamo_WB01046.pdf', N'ReciboReclamo_WB01046.pdf', NULL, N'receipt_forms/ReciboReclamo_WB01046.pdf', 0, NULL, CAST(N'2022-08-17T23:44:46.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1025, 1047, N'ReciboReclamo_WB01047.pdf', N'ReciboReclamo_WB01047.pdf', NULL, N'receipt_forms/ReciboReclamo_WB01047.pdf', 0, NULL, CAST(N'2022-08-17T23:46:04.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1026, 1048, N'ReciboReclamo_WB01048.pdf', N'ReciboReclamo_WB01048.pdf', NULL, N'receipt_forms/ReciboReclamo_WB01048.pdf', 0, NULL, CAST(N'2022-08-17T23:58:51.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1027, 1049, N'ReciboReclamo_WB01049.pdf', N'ReciboReclamo_WB01049.pdf', NULL, N'receipt_forms/ReciboReclamo_WB01049.pdf', 0, NULL, CAST(N'2022-08-18T00:00:50.000' AS DateTime), CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1028, 1050, N'ReciboReclamo_WB01050.pdf', N'ReciboReclamo_WB01050.pdf', NULL, N'receipt_forms/ReciboReclamo_WB01050.pdf', 0, NULL, CAST(N'2022-08-18T00:03:10.000' AS DateTime), CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1029, 1051, N'ReciboReclamo_WB01051.pdf', N'ReciboReclamo_WB01051.pdf', N'receipt_forms/', N'ReciboReclamo_WB01051.pdf', 0, NULL, CAST(N'2022-08-18T23:52:03.000' AS DateTime), CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1030, 1052, N'ReciboReclamo_WB01052.pdf', N'ReciboReclamo_WB01052.pdf', N'receipt_forms/', N'ReciboReclamo_WB01052.pdf', 0, NULL, CAST(N'2022-08-18T23:55:44.000' AS DateTime), CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1031, 1053, N'ReciboReclamo_WB01053.pdf', N'ReciboReclamo_WB01053.pdf', N'receipt_forms/', N'ReciboReclamo_WB01053.pdf', 0, NULL, CAST(N'2022-08-19T00:02:33.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1032, 1054, N'ReciboReclamo_WB01054.pdf', N'ReciboReclamo_WB01054.pdf', N'receipt_forms/', N'ReciboReclamo_WB01054.pdf', 0, NULL, CAST(N'2022-08-19T00:03:01.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1033, 1055, N'ReciboReclamo_WB01055.pdf', N'ReciboReclamo_WB01055.pdf', N'receipt_forms/', N'ReciboReclamo_WB01055.pdf', 0, NULL, CAST(N'2022-08-19T00:04:38.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1034, 1056, N'ReciboReclamo_WB01056.pdf', N'ReciboReclamo_WB01056.pdf', N'receipt_forms/', N'ReciboReclamo_WB01056.pdf', 0, NULL, CAST(N'2022-08-19T00:12:22.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1035, 1057, N'ReciboReclamo_WB01057.pdf', N'ReciboReclamo_WB01057.pdf', N'receipt_forms/', N'ReciboReclamo_WB01057.pdf', 0, NULL, CAST(N'2022-08-19T00:13:17.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1036, 1058, N'ReciboReclamo_WB01058.pdf', N'ReciboReclamo_WB01058.pdf', N'receipt_forms/', N'ReciboReclamo_WB01058.pdf', 0, NULL, CAST(N'2022-08-19T00:14:46.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1037, 1059, N'ReciboReclamo_WB01059.pdf', N'ReciboReclamo_WB01059.pdf', N'receipt_forms/', N'ReciboReclamo_WB01059.pdf', 0, NULL, CAST(N'2022-08-19T00:16:04.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1038, 1060, N'ReciboReclamo_WB01060.pdf', N'ReciboReclamo_WB01060.pdf', N'receipt_forms/', N'ReciboReclamo_WB01060.pdf', 0, NULL, CAST(N'2022-08-19T00:17:37.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1039, 1060, N'PLATAFORMA RECLAMOS.docx', N'PLATAFORMA RECLAMOS.docx', N'forms_docs', N'1660887245_86d7bba3dcac6846a5b7.docx', 2, NULL, CAST(N'2022-08-19T00:34:06.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1040, 1059, N'PLATAFORMA RECLAMOS (1).docx', N'PLATAFORMA RECLAMOS (1).docx', N'forms_docs', N'1660888195_270d2e3dbf9ea51189d3.docx', 2, NULL, CAST(N'2022-08-19T00:50:18.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1041, 1063, N'ReciboReclamo_SC01063.pdf', N'ReciboReclamo_SC01063.pdf', N'receipt_forms', N'ReciboReclamo_SC01063.pdf', 2, NULL, CAST(N'2022-08-19T01:04:40.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1042, 1064, N'ReciboReclamo_SC01064.pdf', N'ReciboReclamo_SC01064.pdf', N'receipt_forms', N'ReciboReclamo_SC01064.pdf', 2, NULL, CAST(N'2022-08-19T01:06:11.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1043, 1065, N'ReciboReclamo_SC01065.pdf', N'ReciboReclamo_SC01065.pdf', N'receipt_forms', N'ReciboReclamo_SC01065.pdf', 2, NULL, CAST(N'2022-08-19T01:15:15.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1045, 1065, N'ResolucionReclamo_SC01065.pdf', N'ResolucionReclamo_SC01065.pdf', N'resolution_forms', N'ResolucionReclamo_SC01065.pdf', 1004, NULL, CAST(N'2022-08-19T02:22:03.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1046, 1066, N'ReciboReclamo_WB01066.pdf', N'ReciboReclamo_WB01066.pdf', N'receipt_forms', N'ReciboReclamo_WB01066.pdf', 0, NULL, CAST(N'2022-08-22T20:29:12.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1047, 1067, N'ReciboReclamo_WB01067.pdf', N'ReciboReclamo_WB01067.pdf', N'receipt_forms', N'ReciboReclamo_WB01067.pdf', 0, NULL, CAST(N'2022-08-22T20:34:53.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1048, 1067, N'ResolucionReclamo_WB01067.pdf', N'ResolucionReclamo_WB01067.pdf', N'resolution_forms', N'ResolucionReclamo_WB01067.pdf', 1011, NULL, CAST(N'2022-08-22T23:03:10.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1049, 1067, N'ResolucionReclamo_WB01067.pdf', N'ResolucionReclamo_WB01067.pdf', N'C:\wamp64\www\cdc_plataforma_oirs\writable\uploads/sign_forms/ikvoj9l2vdd2mgr6ywdqtjjcysm9u65ox7o4viy5yz1dgt8onr.png', N'ResolucionReclamo_WB01067.pdf', 1011, NULL, CAST(N'2022-08-22T23:11:22.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1050, 1067, N'ResolucionReclamo_WB01067.pdf', N'ResolucionReclamo_WB01067.pdf', N'C:\wamp64\www\cdc_plataforma_oirs\writable\uploads/sign_users/ikvoj9l2vdd2mgr6ywdqtjjcysm9u65ox7o4viy5yz1dgt8onr.png', N'ResolucionReclamo_WB01067.pdf', 1011, NULL, CAST(N'2022-08-22T23:14:57.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1051, 1067, N'ResolucionReclamo_WB01067.pdf', N'ResolucionReclamo_WB01067.pdf', N'C:\wamp64\www\cdc_plataforma_oirs\writable\uploads/sign_users/ikvoj9l2vdd2mgr6ywdqtjjcysm9u65ox7o4viy5yz1dgt8onr.png', N'ResolucionReclamo_WB01067.pdf', 1011, NULL, CAST(N'2022-08-22T23:18:06.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1052, 1067, N'ResolucionReclamo_WB01067.pdf', N'ResolucionReclamo_WB01067.pdf', N'C:\wamp64\www\cdc_plataforma_oirs\writable\uploads/sign_users/ikvoj9l2vdd2mgr6ywdqtjjcysm9u65ox7o4viy5yz1dgt8onr.png', N'ResolucionReclamo_WB01067.pdf', 1011, NULL, CAST(N'2022-08-22T23:20:59.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1053, 1068, N'ReciboReclamo_WB01068.pdf', N'ReciboReclamo_WB01068.pdf', N'receipt_forms', N'ReciboReclamo_WB01068.pdf', 0, NULL, CAST(N'2022-08-23T17:19:20.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1054, 1069, N'ReciboReclamo_WB01069.pdf', N'ReciboReclamo_WB01069.pdf', N'receipt_forms', N'ReciboReclamo_WB01069.pdf', 0, NULL, CAST(N'2022-08-23T17:25:03.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1055, 1068, N'ResolucionReclamo_WB01068.pdf', N'ResolucionReclamo_WB01068.pdf', N'resolution_forms', N'ResolucionReclamo_WB01068.pdf', 1004, NULL, CAST(N'2022-08-23T17:45:55.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1056, 1070, N'ReciboReclamo_WB01070.pdf', N'ReciboReclamo_WB01070.pdf', N'receipt_forms', N'ReciboReclamo_WB01070.pdf', 0, NULL, CAST(N'2022-08-23T22:15:13.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (1057, 1071, N'ReciboReclamo_WB01071.pdf', N'ReciboReclamo_WB01071.pdf', N'receipt_forms', N'ReciboReclamo_WB01071.pdf', 0, NULL, CAST(N'2022-08-23T22:26:34.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (2055, 1, N'ReciboReclamo_WB00001.pdf', N'ReciboReclamo_WB00001.pdf', N'receipt_forms', N'ReciboReclamo_WB00001.pdf', 0, NULL, CAST(N'2022-09-10T01:21:15.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (2056, 1, N'ReciboReclamo_WB00001.pdf', N'ReciboReclamo_WB00001.pdf', N'receipt_forms', N'ReciboReclamo_WB00001.pdf', 0, NULL, CAST(N'2022-09-10T01:31:12.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (2057, 1, N'ReciboReclamo_WB00001.pdf', N'ReciboReclamo_WB00001.pdf', N'receipt_forms', N'ReciboReclamo_WB00001.pdf', 0, NULL, CAST(N'2022-09-10T01:32:17.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (2058, 1, N'ReciboReclamo_WB00001.pdf', N'ReciboReclamo_WB00001.pdf', N'receipt_forms', N'ReciboReclamo_WB00001.pdf', 0, NULL, CAST(N'2022-09-10T01:33:42.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (2059, 1, N'ReciboReclamo_WB00001.pdf', N'ReciboReclamo_WB00001.pdf', N'receipt_forms', N'ReciboReclamo_WB00001.pdf', 0, NULL, CAST(N'2022-09-10T01:34:40.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (2060, 2073, N'ReciboReclamo_WB02073.pdf', N'ReciboReclamo_WB02073.pdf', N'receipt_forms', N'ReciboReclamo_WB02073.pdf', 0, NULL, CAST(N'2022-09-10T01:39:47.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (2061, 2074, N'ReciboReclamo_WB02074.pdf', N'ReciboReclamo_WB02074.pdf', N'receipt_forms', N'ReciboReclamo_WB02074.pdf', 0, NULL, CAST(N'2022-09-10T01:59:22.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (2062, 2075, N'ReciboReclamo_WB02075.pdf', N'ReciboReclamo_WB02075.pdf', N'receipt_forms', N'ReciboReclamo_WB02075.pdf', 0, NULL, CAST(N'2022-09-10T22:16:08.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (2063, 2075, N'1.png', N'1.png', N'forms_docs', N'1662867038_82bf487e747a361203a3.png', 1004, NULL, CAST(N'2022-09-10T22:30:38.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (2064, 2075, N'ResolucionReclamo_WB02075.pdf', N'ResolucionReclamo_WB02075.pdf', N'resolution_forms', N'ResolucionReclamo_WB02075.pdf', 1004, NULL, CAST(N'2022-09-10T22:35:09.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (2065, 2075, N'ResolucionReclamo_WB02075.pdf', N'ResolucionReclamo_WB02075.pdf', N'resolution_forms', N'ResolucionReclamo_WB02075.pdf', 1004, NULL, CAST(N'2022-09-10T22:45:02.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (2066, 2075, N'ResolucionReclamo_WB02075.pdf', N'ResolucionReclamo_WB02075.pdf', N'resolution_forms', N'ResolucionReclamo_WB02075.pdf', 1004, NULL, CAST(N'2022-09-10T23:04:30.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_documents] ([id], [form_id], [doc_desc], [original_name], [path], [upload_name], [user_id], [system], [created_at], [updated_at], [deleted_at]) VALUES (2067, 2075, N'ResolucionReclamo_WB02075.pdf', N'ResolucionReclamo_WB02075.pdf', N'resolution_forms', N'ResolucionReclamo_WB02075.pdf', 1004, NULL, CAST(N'2022-09-10T23:09:16.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[forms_documents] OFF
GO
SET IDENTITY_INSERT [dbo].[forms_history] ON 

INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (92, 41, 2, N'Se ha creado el formulario', 1, CAST(N'2022-08-15T20:47:42.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (93, 41, 2, N'Favor gestionar', 0, CAST(N'2022-08-15T20:49:53.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (94, 41, 2, N'Se ha asignado el formulario al usuario: Perfil Gestor, con el estado: En gestión.', 1, CAST(N'2022-08-15T20:49:53.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (95, 42, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-15T20:54:37.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (96, 42, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-15T20:54:37.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (97, 42, 2, N'Se ha modificado el formulario', 1, CAST(N'2022-08-15T20:56:01.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (98, 42, 2, N'Favor gestionar caso WEB', 0, CAST(N'2022-08-15T20:56:16.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (99, 42, 2, N'Se ha asignado el formulario al usuario: Perfil Gestor, con el estado: En gestión.', 1, CAST(N'2022-08-15T20:56:16.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (100, 42, 1003, N'Se ha modificado el formulario', 1, CAST(N'2022-08-15T20:58:43.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (101, 42, 1003, N'Se ha modificado el formulario', 1, CAST(N'2022-08-15T21:08:34.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (102, 41, 1003, N'Se ha modificado el formulario', 1, CAST(N'2022-08-15T21:09:10.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (103, 41, 1003, N'Favor gestionar', 0, CAST(N'2022-08-15T21:10:37.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (104, 41, 1003, N'Se ha asignado el formulario al usuario: Perfil Director, con el estado: Pendiente aprobación.', 1, CAST(N'2022-08-15T21:10:37.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (105, 42, 1003, N'Favor gestionar', 0, CAST(N'2022-08-15T21:10:57.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (106, 42, 1003, N'Se ha asignado el formulario al usuario: Perfil Director, con el estado: Pendiente aprobación.', 1, CAST(N'2022-08-15T21:10:57.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (107, 42, 1004, N'Rechazado pq le faltan documentos', 0, CAST(N'2022-08-15T21:13:08.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (108, 42, 1004, N'Se ha asignado el formulario al usuario: Perfil Gestor, con el estado: Rechazado.', 1, CAST(N'2022-08-15T21:13:08.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (110, 41, 1004, N'Se ha asignado el formulario al usuario: Perfil Gestor, con el estado: Rechazado.', 1, CAST(N'2022-08-15T21:13:34.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (111, 42, 1003, N'Favor aprobar', 0, CAST(N'2022-08-15T21:21:41.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (112, 42, 1003, N'Se ha asignado el formulario al usuario: Perfil Director, con el estado: Pendiente aprobación.', 1, CAST(N'2022-08-15T21:21:41.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (113, 41, 1003, N'Aprobar', 0, CAST(N'2022-08-15T21:23:22.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (114, 41, 1003, N'Se ha asignado el formulario al usuario: Perfil Director, con el estado: Pendiente aprobación.', 1, CAST(N'2022-08-15T21:23:22.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (115, 41, 1004, N'Aprobado', 0, CAST(N'2022-08-15T21:28:25.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (116, 41, 1004, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-08-15T21:28:25.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (117, 42, 1004, N'Rechazado otra vez', 0, CAST(N'2022-08-15T21:31:00.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (118, 42, 1004, N'Se ha asignado el formulario al usuario: Perfil Gestor, con el estado: Rechazado.', 1, CAST(N'2022-08-15T21:31:00.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (119, 42, 1003, N'Favor aprobalo po :c', 0, CAST(N'2022-08-15T21:32:17.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (120, 42, 1003, N'Se ha asignado el formulario al usuario: Perfil Director, con el estado: Pendiente aprobación.', 1, CAST(N'2022-08-15T21:32:17.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (121, 42, 1003, N'Se realizó insistencia: Insistencia', 1, CAST(N'2022-08-15T21:32:28.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (122, 42, 1004, N'Aprobado', 0, CAST(N'2022-08-15T21:33:29.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (123, 42, 1004, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-08-15T21:33:29.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (124, 42, 1004, N'Se reabre caso', 1, CAST(N'2022-08-15T21:41:41.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (125, 42, 1004, N'Se ha asignado el formulario al usuario: Perfil Ingreso, con el estado: Ingresado.', 1, CAST(N'2022-08-15T21:41:41.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (126, 42, 2, N'El formulario fue descartado.', 1, CAST(N'2022-08-15T21:42:28.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (127, 43, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-15T22:09:32.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (128, 43, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-15T22:09:33.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (129, 44, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-15T22:19:46.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (130, 44, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-15T22:19:46.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (131, 45, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-17T23:14:58.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (132, 45, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-17T23:14:59.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (133, 46, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-17T23:17:21.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (134, 46, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-17T23:17:22.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (135, 47, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-17T23:23:25.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (136, 47, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-17T23:23:25.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1131, 1045, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-17T23:40:12.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1132, 1045, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-17T23:40:12.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1133, 1046, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-17T23:44:38.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1134, 1046, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-17T23:44:38.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1135, 1047, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-17T23:45:58.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1136, 1047, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-17T23:45:58.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1137, 1048, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-17T23:58:45.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1138, 1048, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-17T23:58:45.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1139, 1049, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-18T00:00:44.000' AS DateTime), CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1140, 1049, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-18T00:00:44.000' AS DateTime), CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1141, 1050, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-18T00:03:03.000' AS DateTime), CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1142, 1050, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-18T00:03:03.000' AS DateTime), CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1143, 1051, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-18T23:51:56.000' AS DateTime), CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1144, 1051, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-18T23:51:56.000' AS DateTime), CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1145, 1052, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-18T23:55:38.000' AS DateTime), CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1146, 1052, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-18T23:55:38.000' AS DateTime), CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1147, 1053, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-19T00:02:33.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1148, 1053, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-19T00:02:33.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1149, 1054, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-19T00:03:01.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1150, 1054, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-19T00:03:01.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1151, 1055, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-19T00:04:32.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1152, 1055, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-19T00:04:32.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1153, 1056, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-19T00:12:15.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1154, 1056, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-19T00:12:15.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1155, 1057, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-19T00:13:09.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1156, 1057, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-19T00:13:10.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1157, 1058, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-19T00:14:41.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1158, 1058, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-19T00:14:41.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1159, 1059, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-19T00:15:58.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1160, 1059, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-19T00:15:58.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1161, 1060, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-19T00:17:31.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1162, 1060, 0, N'Se ha asignado el formulario al usuario: Perfil Ingreso.', 1, CAST(N'2022-08-19T00:17:32.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1163, 1059, 2, N'Se ha modificado el formulario', 1, CAST(N'2022-08-19T00:50:18.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1164, 1061, 2, N'Se ha creado el formulario', 1, CAST(N'2022-08-19T00:56:05.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1165, 1062, 2, N'Se ha creado el formulario', 1, CAST(N'2022-08-19T01:02:35.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1166, 1063, 2, N'Se ha creado el formulario', 1, CAST(N'2022-08-19T01:04:36.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1167, 1064, 2, N'Se ha creado el formulario', 1, CAST(N'2022-08-19T01:06:10.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1168, 1065, 2, N'Se ha creado el formulario', 1, CAST(N'2022-08-19T01:15:14.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1169, 1065, 2, N'Favor gestionar', 1, CAST(N'2022-08-19T01:18:00.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1170, 1065, 2, N'Se ha asignado el formulario al usuario: Perfil Gestor, con el estado: En gestión.', 1, CAST(N'2022-08-19T01:18:00.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1171, 1065, 1003, N'Se ha modificado el formulario', 1, CAST(N'2022-08-19T02:03:41.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1172, 1065, 1003, N'Favor gestionar', 1, CAST(N'2022-08-19T02:07:31.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1173, 1065, 1003, N'Se ha asignado el formulario al usuario: Perfil Director, con el estado: Pendiente aprobación.', 1, CAST(N'2022-08-19T02:07:31.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1174, 1065, 1004, N'Aprobado', 1, CAST(N'2022-08-19T02:08:33.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1175, 1065, 1004, N'Aprobado', 1, CAST(N'2022-08-19T02:14:38.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1176, 1065, 1004, N'Aprobado', 1, CAST(N'2022-08-19T02:15:32.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1177, 1065, 1004, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-08-19T02:15:33.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1178, 1065, 1004, N'Aprobado', 1, CAST(N'2022-08-19T02:20:49.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1179, 1065, 1004, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-08-19T02:20:49.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1180, 1065, 1004, N'Aprobado', 1, CAST(N'2022-08-19T02:22:03.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1181, 1065, 1004, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-08-19T02:22:03.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1182, 1066, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-22T20:29:02.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1183, 1066, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-08-22T20:29:03.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1184, 1067, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-22T20:34:44.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1185, 1067, 0, N'Se ha asignado el formulario al usuario: Ingreso Dos.', 1, CAST(N'2022-08-22T20:34:45.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
GO
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1186, 1067, 1005, N'Se ha modificado el formulario', 1, CAST(N'2022-08-22T21:37:28.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1187, 1067, 1005, N'Favor gestionar', 1, CAST(N'2022-08-22T21:37:42.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1188, 1067, 1005, N'Se ha asignado el formulario al usuario: Gestor Administrativo, con el estado: En gestión.', 1, CAST(N'2022-08-22T21:37:42.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1189, 1067, 1005, N'gestionar', 1, CAST(N'2022-08-22T22:05:20.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1190, 1067, 1005, N'ehehe', 1, CAST(N'2022-08-22T22:05:40.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1191, 1067, 1005, N'enviarrrrrrrr', 1, CAST(N'2022-08-22T22:13:00.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1192, 1067, 1005, N'Se ha asignado el formulario al usuario: Gestor  Dos Administrativo, con el estado: En gestión.', 1, CAST(N'2022-08-22T22:13:00.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1193, 1067, 1005, N'Se realizó insistencia: Insistencia para gestionar', 1, CAST(N'2022-08-22T22:22:28.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1194, 1067, 1006, N'Se ha modificado el formulario', 1, CAST(N'2022-08-22T22:27:29.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1195, 1067, 1006, N'Director favor gestionar', 1, CAST(N'2022-08-22T22:27:47.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1196, 1067, 1006, N'Se ha asignado el formulario al usuario: Director Dos, con el estado: Pendiente aprobación.', 1, CAST(N'2022-08-22T22:27:47.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1197, 1067, 1006, N'Se realizó insistencia: gestionar', 1, CAST(N'2022-08-22T22:28:31.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1198, 1067, 1003, N'Se realizó insistencia: Insistir', 1, CAST(N'2022-08-22T22:29:45.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1199, 1067, 1011, N'Favor insertar documentos', 1, CAST(N'2022-08-22T22:32:38.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1200, 1067, 1011, N'Se ha asignado el formulario al usuario: Gestor  Dos Administrativo, con el estado: Rechazado.', 1, CAST(N'2022-08-22T22:32:39.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1201, 1067, 1006, N'Favor gestionar', 1, CAST(N'2022-08-22T22:33:58.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1202, 1067, 1006, N'Se ha asignado el formulario al usuario: Director Dos, con el estado: Pendiente aprobación.', 1, CAST(N'2022-08-22T22:33:58.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1203, 1067, 1011, N'Rechazadoooooooo', 1, CAST(N'2022-08-22T22:36:11.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1204, 1067, 1011, N'Se ha asignado el formulario al usuario: Gestor  Dos Administrativo, con el estado: Rechazado.', 1, CAST(N'2022-08-22T22:36:11.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1205, 1067, 1006, N'Favor gestionar', 1, CAST(N'2022-08-22T22:37:11.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1206, 1067, 1006, N'Se ha asignado el formulario al usuario: Director Dos, con el estado: Pendiente aprobación.', 1, CAST(N'2022-08-22T22:37:12.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1207, 1067, 1011, N'Aprobado', 1, CAST(N'2022-08-22T22:44:31.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1208, 1067, 1011, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-08-22T22:44:31.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1209, 1067, 1011, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-08-22T22:48:21.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1210, 1067, 1011, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-08-22T22:49:56.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1211, 1067, 1011, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-08-22T23:03:06.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1212, 1067, 1011, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-08-22T23:08:26.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1213, 1067, 1011, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-08-22T23:11:21.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1214, 1067, 1011, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-08-22T23:14:56.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1215, 1067, 1011, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-08-22T23:18:05.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1216, 1067, 1011, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-08-22T23:20:58.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1217, 1067, 1011, N'si', 1, CAST(N'2022-08-22T23:22:20.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1218, 1067, 1011, N'Se ha asignado el formulario al usuario: Ingreso Dos, con el estado: Ingresado.', 1, CAST(N'2022-08-22T23:22:20.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1219, 1068, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-23T17:19:10.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1220, 1068, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-08-23T17:19:11.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1221, 1069, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-23T17:24:56.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1222, 1069, 0, N'Se ha asignado el formulario al usuario: Ingreso Dos.', 1, CAST(N'2022-08-23T17:24:56.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1223, 1068, 2, N'Favor gestionar', 1, CAST(N'2022-08-23T17:32:58.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1224, 1068, 2, N'Se ha asignado el formulario al usuario: Gestor Uno Administrativo, con el estado: En gestión.', 1, CAST(N'2022-08-23T17:32:58.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1225, 1068, 2, N'Se realizó insistencia: Insistir', 1, CAST(N'2022-08-23T17:34:01.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1226, 1068, 1003, N'Se ha modificado el formulario', 1, CAST(N'2022-08-23T17:41:31.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1227, 1068, 1003, N'Director favor gestionar', 1, CAST(N'2022-08-23T17:41:52.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1228, 1068, 1003, N'Se ha asignado el formulario al usuario: Director Uno, con el estado: Pendiente aprobación.', 1, CAST(N'2022-08-23T17:41:52.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1229, 1068, 1004, N'Rechazado', 1, CAST(N'2022-08-23T17:44:03.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1230, 1068, 1004, N'Se ha asignado el formulario al usuario: Gestor Uno Administrativo, con el estado: Rechazado.', 1, CAST(N'2022-08-23T17:44:03.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1231, 1068, 1003, N'Favor gestionar', 1, CAST(N'2022-08-23T17:45:05.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1232, 1068, 1003, N'Se ha asignado el formulario al usuario: Director Uno, con el estado: Pendiente aprobación.', 1, CAST(N'2022-08-23T17:45:06.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1233, 1068, 1004, N'Se aprueba', 1, CAST(N'2022-08-23T17:45:38.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1234, 1068, 1004, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-08-23T17:45:38.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1235, 1068, 1004, N'Se reabre caso', 1, CAST(N'2022-08-23T17:50:26.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1236, 1068, 1004, N'Se ha asignado el formulario al usuario: Ingreso Uno, con el estado: Ingresado.', 1, CAST(N'2022-08-23T17:50:26.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1237, 1070, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-23T22:15:02.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1238, 1070, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-08-23T22:15:02.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1239, 1070, 2, N'Se ha asignado el formulario al usuario: Gestor Uno Administrativo, con el estado: En gestión.', 1, CAST(N'2022-08-23T22:21:13.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1240, 1071, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-08-23T22:26:24.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (1241, 1071, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-08-23T22:26:24.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2233, 2070, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T00:28:41.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2234, 2070, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T00:28:41.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2235, 2071, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T00:32:44.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2236, 2071, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T00:32:44.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2237, 2072, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T00:35:05.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2238, 2072, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T00:35:06.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2239, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T00:36:57.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2240, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T00:36:57.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2241, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T00:37:46.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2242, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T00:37:47.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2243, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T00:38:33.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2244, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T00:38:33.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2245, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T00:39:17.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2246, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T00:39:17.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2247, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T00:40:57.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2248, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T00:40:57.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2249, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T00:42:52.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2250, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T00:42:52.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2251, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T00:43:39.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2252, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T00:43:39.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2253, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T00:44:51.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2254, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T00:44:52.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2255, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T00:46:00.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2256, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T00:46:00.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2257, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T00:47:07.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2258, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T00:47:07.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2259, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T00:49:12.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2260, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T00:49:12.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2261, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T00:58:44.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2262, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T00:58:44.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2263, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:01:40.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2264, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:01:40.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2265, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:02:22.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2266, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:02:22.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2267, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:04:48.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2268, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:04:48.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2269, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:06:10.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2270, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:06:10.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2271, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:06:58.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2272, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:06:58.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2273, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:09:12.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2274, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:09:12.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2275, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:12:56.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2276, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:12:56.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
GO
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2277, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:14:17.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2278, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:14:17.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2279, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:16:28.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2280, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:16:28.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2281, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:17:52.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2282, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:17:52.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2283, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:21:14.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2284, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:21:14.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2285, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:31:11.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2286, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:31:11.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2287, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:32:16.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2288, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:32:16.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2289, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:33:42.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2290, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:33:42.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2291, 1, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:34:39.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2292, 1, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:34:40.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2293, 2073, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:39:47.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2294, 2073, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:39:47.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2295, 2074, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T01:59:20.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2296, 2074, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T01:59:21.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2297, 2075, 0, N'Se ha creado el formulario a través del formulario Web.', 1, CAST(N'2022-09-10T22:16:06.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2298, 2075, 0, N'Se ha asignado el formulario al usuario: Ingreso Uno.', 1, CAST(N'2022-09-10T22:16:07.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2299, 2075, 2, N'Favor gestionar', 1, CAST(N'2022-09-10T22:23:25.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2300, 2075, 2, N'Se ha asignado el formulario al usuario: Gestor Uno Administrativo, con el estado: En gestión.', 1, CAST(N'2022-09-10T22:23:25.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2301, 2075, 2, N'Se realizó insistencia: Insistir', 1, CAST(N'2022-09-10T22:24:33.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2302, 2075, 1003, N'Se ha modificado el formulario', 1, CAST(N'2022-09-10T22:28:15.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2303, 2075, 1003, N'Director favor gestionar', 1, CAST(N'2022-09-10T22:28:52.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2304, 2075, 1003, N'Se ha asignado el formulario al usuario: Director Uno, con el estado: Pendiente aprobación.', 1, CAST(N'2022-09-10T22:28:52.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2305, 2075, 1004, N'Favor revisar', 1, CAST(N'2022-09-10T22:30:50.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2306, 2075, 1004, N'Se ha asignado el formulario al usuario: Gestor Uno Administrativo, con el estado: Rechazado.', 1, CAST(N'2022-09-10T22:30:50.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2307, 2075, 1003, N'Director gestione por favor', 1, CAST(N'2022-09-10T22:32:44.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2308, 2075, 1003, N'Se ha asignado el formulario al usuario: Director Uno, con el estado: Pendiente aprobación.', 1, CAST(N'2022-09-10T22:32:44.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2309, 2075, 1004, N'Aprobado', 1, CAST(N'2022-09-10T22:34:51.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2310, 2075, 1004, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-09-10T22:34:51.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2311, 2075, 1004, N'okk', 1, CAST(N'2022-09-10T22:43:20.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2312, 2075, 1004, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-09-10T22:43:20.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2313, 2075, 1004, N'dd', 1, CAST(N'2022-09-10T22:58:51.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2314, 2075, 1004, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-09-10T22:58:51.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2315, 2075, 1004, N'dd', 1, CAST(N'2022-09-10T23:00:27.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2316, 2075, 1004, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-09-10T23:00:27.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2317, 2075, 1004, N'JJ', 1, CAST(N'2022-09-10T23:04:13.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2318, 2075, 1004, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-09-10T23:04:13.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2319, 2075, 1004, N'FF', 1, CAST(N'2022-09-10T23:08:59.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2320, 2075, 1004, N'Se ha asignado el formulario al estado: Cerrado.', 1, CAST(N'2022-09-10T23:08:59.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2321, 2075, 1004, N'55', 1, CAST(N'2022-09-10T23:16:36.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2322, 2075, 1004, N'Se ha asignado el formulario al usuario: Ingreso Uno, con el estado: Ingresado.', 1, CAST(N'2022-09-10T23:16:36.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2323, 2071, 2, N'Envia a gestion', 1, CAST(N'2022-09-11T21:33:06.000' AS DateTime), CAST(N'2022-09-11' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2324, 2071, 2, N'Se ha asignado el formulario al usuario: Gestor Uno Administrativo, con el estado: En gestión.', 1, CAST(N'2022-09-11T21:33:06.000' AS DateTime), CAST(N'2022-09-11' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2325, 2071, 1003, N'Gestionar', 1, CAST(N'2022-09-11T21:41:31.000' AS DateTime), CAST(N'2022-09-11' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2326, 2071, 1003, N'Se ha asignado el formulario al usuario: Director Uno, con el estado: Pendiente aprobación.', 1, CAST(N'2022-09-11T21:41:31.000' AS DateTime), CAST(N'2022-09-11' AS Date), NULL)
INSERT [dbo].[forms_history] ([id], [form_id], [user_id], [message], [system], [created_at], [updated_at], [deleted_at]) VALUES (2327, 2071, 1012, N'Se ha asignado el formulario al usuario: Gestor Uno Administrativo, con el estado: Rechazado.', 1, CAST(N'2022-09-11T21:43:12.000' AS DateTime), CAST(N'2022-09-11' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[forms_history] OFF
GO
SET IDENTITY_INSERT [dbo].[forms_notifications] ON 

INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (34, 41, 1003, N'Se ha asignado el formulario: SC00041 para su gestión con el estado: En gestión.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-15T20:49:53.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (35, 42, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00042', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-15T20:54:37.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (36, 42, 1003, N'Se ha asignado el formulario: WB00042 para su gestión con el estado: En gestión.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-15T20:56:16.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (37, 41, 1004, N'Se ha asignado el formulario: SC00041 para su gestión con el estado: Pendiente aprobación.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-15T21:10:37.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (38, 42, 1004, N'Se ha asignado el formulario: WB00042 para su gestión con el estado: Pendiente aprobación.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-15T21:10:57.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (39, 42, 1003, N'Se ha asignado el formulario: WB00042 para su gestión con el estado: Rechazado.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-15T21:13:08.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (40, 41, 1003, N'Se ha asignado el formulario: SC00041 para su gestión con el estado: Rechazado.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-15T21:13:34.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (41, 42, 1004, N'Se ha asignado el formulario: WB00042 para su gestión con el estado: Pendiente aprobación.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-15T21:21:41.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (42, 41, 1004, N'Se ha asignado el formulario: SC00041 para su gestión con el estado: Pendiente aprobación.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-15T21:23:22.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (43, 42, 1003, N'Se ha asignado el formulario: WB00042 para su gestión con el estado: Rechazado.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-15T21:31:00.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (44, 42, 1004, N'Se ha asignado el formulario: WB00042 para su gestión con el estado: Pendiente aprobación.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-15T21:32:17.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (45, 42, 1004, N'Se ha realizado una insistencia en el formulario: WB00042, para recordar su gestión', 0, N'bg-warning', N'fas fa-stopwatch', CAST(N'2022-08-15T21:32:28.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (46, 42, 2, N'Se ha asignado el formulario: WB00042 para su gestión con el estado: Ingresado.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-15T21:41:41.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (47, 43, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00043', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-15T22:09:33.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (48, 44, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00044', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-15T22:19:46.000' AS DateTime), CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (49, 45, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00045', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-17T23:14:59.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (50, 46, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00046', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-17T23:17:22.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (51, 47, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00047', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-17T23:23:25.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1049, 1045, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01045', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-17T23:40:12.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1050, 1046, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01046', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-17T23:44:38.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1051, 1047, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01047', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-17T23:45:58.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1052, 1048, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01048', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-17T23:58:45.000' AS DateTime), CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1053, 1049, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01049', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-18T00:00:44.000' AS DateTime), CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1054, 1050, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01050', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-18T00:03:03.000' AS DateTime), CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1055, 1051, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01051', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-18T23:51:56.000' AS DateTime), CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1056, 1052, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01052', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-18T23:55:38.000' AS DateTime), CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1057, 1053, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01053', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-19T00:02:33.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1058, 1054, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01054', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-19T00:03:01.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1059, 1055, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01055', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-19T00:04:32.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1060, 1056, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01056', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-19T00:12:15.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1061, 1057, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01057', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-19T00:13:10.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1062, 1058, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01058', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-19T00:14:41.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1063, 1059, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01059', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-19T00:15:58.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1064, 1060, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01060', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-19T00:17:32.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1065, 1065, 1003, N'Se ha asignado el formulario: SC01065 para su gestión con el estado: En gestión.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-19T01:18:00.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1066, 1065, 1004, N'Se ha asignado el formulario: SC01065 para su gestión con el estado: Pendiente aprobación.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-19T02:07:31.000' AS DateTime), CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1067, 1066, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01066', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-22T20:29:03.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1068, 1067, 1005, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01067', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-22T20:34:45.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1069, 1067, 1003, N'Se ha asignado el formulario: WB01067 para su gestión con el estado: En gestión.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-22T21:37:42.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1070, 1067, 1006, N'Se ha asignado el formulario: WB01067 para su gestión con el estado: En gestión.', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-22T22:13:00.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1071, 1067, 1006, N'Se ha realizado una insistencia en el formulario: WB01067, para recordar su gestión', 0, N'bg-warning', N'fas fa-stopwatch', CAST(N'2022-08-22T22:22:28.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1072, 1067, 1011, N'Se ha asignado el formulario: WB01067 para su gestión con el estado: Pendiente aprobación.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-22T22:27:48.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1073, 1067, 1011, N'Se ha realizado una insistencia en el formulario: WB01067, para recordar su gestión', 0, N'bg-warning', N'fas fa-stopwatch', CAST(N'2022-08-22T22:28:31.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1074, 1067, 1011, N'Se ha realizado una insistencia en el formulario: WB01067, para recordar su gestión', 0, N'bg-warning', N'fas fa-stopwatch', CAST(N'2022-08-22T22:29:45.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1075, 1067, 1006, N'Se ha asignado el formulario: WB01067 para su gestión con el estado: Rechazado.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-22T22:32:39.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1076, 1067, 1011, N'Se ha asignado el formulario: WB01067 para su gestión con el estado: Pendiente aprobación.', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-22T22:33:58.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1077, 1067, 1006, N'Se ha asignado el formulario: WB01067 para su gestión con el estado: Rechazado.', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-22T22:36:11.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1078, 1067, 1011, N'Se ha asignado el formulario: WB01067 para su gestión con el estado: Pendiente aprobación.', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-22T22:37:12.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1079, 1067, 1005, N'Se ha asignado el formulario: WB01067 para su gestión con el estado: Ingresado.', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-22T23:22:20.000' AS DateTime), CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1080, 1068, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01068', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-23T17:19:11.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1081, 1069, 1005, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01069', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-23T17:24:56.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1082, 1068, 1003, N'Se ha asignado el formulario: WB01068 para su gestión con el estado: En gestión.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-23T17:32:58.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1083, 1068, 1003, N'Se ha realizado una insistencia en el formulario: WB01068, para recordar su gestión', 1, N'bg-warning', N'fas fa-stopwatch', CAST(N'2022-08-23T17:34:01.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1084, 1068, 1004, N'Se ha asignado el formulario: WB01068 para su gestión con el estado: Pendiente aprobación.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-23T17:41:53.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1085, 1068, 1003, N'Se ha asignado el formulario: WB01068 para su gestión con el estado: Rechazado.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-23T17:44:04.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1086, 1068, 1004, N'Se ha asignado el formulario: WB01068 para su gestión con el estado: Pendiente aprobación.', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-23T17:45:06.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1087, 1068, 2, N'Se ha asignado el formulario: WB01068 para su gestión con el estado: Ingresado.', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-23T17:50:26.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1088, 1070, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01070', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-23T22:15:02.000' AS DateTime), CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1089, 1070, 1003, N'Se ha asignado el formulario: WB01070 para su gestión con el estado: En gestión.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-23T22:21:13.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (1090, 1071, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB01071', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-08-23T22:26:24.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2087, 2070, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB02070', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T00:28:41.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2088, 2071, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB02071', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T00:32:44.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2089, 2072, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB02072', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T00:35:06.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2090, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T00:36:57.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2091, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T00:37:47.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2092, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T00:38:33.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2093, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T00:39:17.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2094, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T00:40:57.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2095, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T00:42:52.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2096, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T00:43:39.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2097, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T00:44:51.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2098, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T00:46:00.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2099, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T00:47:07.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2100, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T00:49:12.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2101, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T00:58:44.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2102, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:01:40.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2103, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:02:22.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2104, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:04:48.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2105, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:06:10.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2106, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:06:58.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2107, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:09:12.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2108, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:12:56.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2109, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:14:17.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2110, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:16:28.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2111, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:17:52.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2112, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:21:14.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2113, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:31:11.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2114, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:32:16.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2115, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:33:42.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2116, 1, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB00001', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:34:40.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2117, 2073, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB02073', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:39:47.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2118, 2074, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB02074', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T01:59:21.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2119, 2075, 2, N'Se ha asignado un nuevo formulario registrado en formulario WEB - Folio: WB02075', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T22:16:07.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2120, 2075, 1003, N'Se ha asignado el formulario: WB02075 para su gestión con el estado: En gestión.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T22:23:25.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2121, 2075, 1003, N'Se ha realizado una insistencia en el formulario: WB02075, para recordar su gestión', 1, N'bg-warning', N'fas fa-stopwatch', CAST(N'2022-09-10T22:24:33.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2122, 2075, 1004, N'Se ha asignado el formulario: WB02075 para su gestión con el estado: Pendiente aprobación.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T22:28:52.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2123, 2075, 1003, N'Se ha asignado el formulario: WB02075 para su gestión con el estado: Rechazado.', 1, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T22:30:50.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2124, 2075, 1004, N'Se ha asignado el formulario: WB02075 para su gestión con el estado: Pendiente aprobación.', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T22:32:45.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2125, 2075, 2, N'Se ha asignado el formulario: WB02075 para su gestión con el estado: Ingresado.', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-10T23:16:36.000' AS DateTime), CAST(N'2022-09-10' AS Date), NULL)
GO
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2126, 2071, 1003, N'Se ha asignado el formulario: WB02071 para su gestión con el estado: En gestión.', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-11T21:33:06.000' AS DateTime), CAST(N'2022-09-11' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2127, 2071, 1012, N'Se ha asignado el formulario: WB02071 para su gestión con el estado: Pendiente aprobación.', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-11T21:41:31.000' AS DateTime), CAST(N'2022-09-11' AS Date), NULL)
INSERT [dbo].[forms_notifications] ([id], [form_id], [user_id], [notification], [is_read], [class], [icon], [created_at], [updated_at], [deleted_at]) VALUES (2128, 2071, 1003, N'Se ha asignado el formulario: WB02071 para su gestión con el estado: Rechazado.', 0, N'bg-info', N'fas fa-ticket-alt', CAST(N'2022-09-11T21:43:13.000' AS DateTime), CAST(N'2022-09-11' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[forms_notifications] OFF
GO
INSERT [dbo].[forms_sla] ([id], [type_sla], [template_id], [emails_cc]) VALUES (1, N'SLA_48', 7, N'gabriela@cumbredental.cl;paulina@cumbredental.cl')
INSERT [dbo].[forms_sla] ([id], [type_sla], [template_id], [emails_cc]) VALUES (2, N'3_DAYS_REST', 8, N'gabriela@cumbredental.cl;paulina@cumbredental.cl')
INSERT [dbo].[forms_sla] ([id], [type_sla], [template_id], [emails_cc]) VALUES (3, N'1_DAYS_REST', 9, N'director@cumbredental.cl;gabriela@cumbredental.cl;paulina@cumbredental.cl')
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

INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1, 3, 1, 1, N'SEE,REASIGN,EDIT,MANAGEMENT,DISCARD', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (2, 3, 1, 2, N'SEE,REASIGN,EDIT,MANAGEMENT,DISCARD', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (3, 3, 1, 3, N'SEE,REASIGN,EDIT,MANAGEMENT,DISCARD', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (4, 3, 1, 4, N'SEE,REASIGN,EDIT,MANAGEMENT,DISCARD', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (5, 3, 1, 5, N'SEE,REASIGN,EDIT,MANAGEMENT,DISCARD', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (6, 3, 1, 6, N'SEE,REASIGN,EDIT,MANAGEMENT,DISCARD', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (7, 3, 1, 7, N'SEE,REASIGN,EDIT,MANAGEMENT,DISCARD', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (8, 3, 2, 1, N'SEE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (9, 3, 2, 2, N'SEE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (10, 3, 2, 3, N'SEE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (11, 3, 2, 4, N'SEE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (12, 3, 2, 5, N'SEE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (13, 3, 2, 6, N'SEE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (15, 3, 3, 1, N'SEE,EDIT,DISCARD,SEND', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (16, 3, 3, 2, N'SEE,INSIST', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (17, 3, 3, 6, N'SEE,REOPEN', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (19, 3, 4, 2, N'SEE,EDIT,MANAGEMENT,DISCARD,SEND', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (20, 3, 4, 3, N'SEE,INSIST', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (21, 3, 4, 4, N'SEE,EDIT,MANAGEMENT,DISCARD,SEND', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (22, 3, 5, 3, N'SEE,EDIT,MANAGEMENT,APPROVE,DECLINE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (23, 3, 3, 0, N'ADD', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1003, 3, 3, 8, N'SEE,RESTORE,DELETE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1005, 3, 1, 8, N'SEE,REASIGN,MANAGEMENT,RESTORE,DELETE', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1006, 3, 1, 0, N'ADD', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1007, 3, 4, 6, N'SEE,REOPEN', NULL)
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1008, 3, 5, 6, N'SEE,REOPEN', NULL)
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

INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at]) VALUES (1, 1, 2, 0, 4, 1, NULL)
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at]) VALUES (2, 2, 3, 0, 5, 0, NULL)
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at]) VALUES (3, 3, 4, 1, 4, 1, NULL)
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at]) VALUES (5, 4, 3, 0, 5, 0, NULL)
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at]) VALUES (7, 0, 1, 0, 3, 0, NULL)
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at]) VALUES (8, 3, 6, 0, 0, 0, NULL)
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at]) VALUES (9, 6, 1, 1, 3, 0, NULL)
SET IDENTITY_INSERT [dbo].[status_workflow] OFF
GO
SET IDENTITY_INSERT [dbo].[types] ON 

INSERT [dbo].[types] ([id], [type], [icon], [class], [order_by], [deleted_at]) VALUES (1, N'Reclamo', N'fas fa-exclamation-triangle', N'radio-button-danger', 1, NULL)
INSERT [dbo].[types] ([id], [type], [icon], [class], [order_by], [deleted_at]) VALUES (2, N'Sugerencia', N'fas fa-thumbs-up', N'radio-button-warning', 2, NULL)
INSERT [dbo].[types] ([id], [type], [icon], [class], [order_by], [deleted_at]) VALUES (3, N'Felicitaciones', N'fas fa-smile', N'radio-button-success', 3, NULL)
SET IDENTITY_INSERT [dbo].[types] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [branch_id], [area_id], [signature], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (1, N'Administrador', N'Del Sitio', N'alvarado.astroza.camila@gmail.com', N'admin', N'$2y$10$SL0OD2P8hG7lePqrQR0.5.74eLvpK1QZzBJqpbXQ4ewNPBBchwCb.', 1, NULL, NULL, NULL, CAST(N'2022-09-11T01:24:47.000' AS DateTime), CAST(N'2022-08-08T16:38:06.000' AS DateTime), NULL, 0, NULL, CAST(N'2022-09-11' AS Date), NULL, CAST(N'2022-07-17T00:56:31.000' AS DateTime), N'$2y$10$Gw4NBJypuo.NIHjjHD1cyOwKoK8cG4m9iE0SDYlSkWD8OLt6nH0.', CAST(N'2022-09-10T23:18:24.000' AS DateTime), NULL)
INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [branch_id], [area_id], [signature], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (2, N'Ingreso', N'Uno', N'alvarado.astroza.camila@gmail.com', N'ingreso', N'$2y$10$YtfqTPpTTMdzzKn9VKF2DuoogUVeyX3igjWF6LBQAk6.4JuoNIJNG', 3, 1, 0, NULL, CAST(N'2022-09-11T21:32:43.000' AS DateTime), CAST(N'2022-11-09T21:35:58.000' AS DateTime), NULL, 0, CAST(N'2022-07-17' AS Date), CAST(N'2022-09-11' AS Date), NULL, CAST(N'2022-07-17T01:01:21.000' AS DateTime), N'', NULL, 1)
INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [branch_id], [area_id], [signature], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (3, N'Lector', N'del Sitio', N'alvarado.astroza.camila@gmail.com', N'lector', N'$2y$10$m2eHn1wxXmaWPbJlkH3Zoe5bCiDtd3oOEu03/5Aq.USAhE55b/L6i', 2, 1, 0, NULL, CAST(N'2022-08-08T16:51:01.000' AS DateTime), CAST(N'2022-08-08T16:52:30.000' AS DateTime), NULL, 0, CAST(N'2022-07-26' AS Date), CAST(N'2022-08-22' AS Date), NULL, CAST(N'2022-07-26T23:50:24.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [branch_id], [area_id], [signature], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (1003, N'Gestor Uno', N'Administrativo', N'alvarado.astroza.camila@gmail.com', N'gestoradm', N'$2y$10$TX6rvc75o8PhRqkaGGNjdexVAW6x2AKBkQwFnXI8ShuoMVbiC/q9q', 4, 1, 2, NULL, CAST(N'2022-09-11T21:43:28.000' AS DateTime), CAST(N'2022-11-09T21:41:51.000' AS DateTime), NULL, 0, CAST(N'2022-08-08' AS Date), CAST(N'2022-09-11' AS Date), NULL, CAST(N'2022-08-22T21:43:55.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [branch_id], [area_id], [signature], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (1004, N'Director', N'Uno', N'alvarado.astroza.camila@gmail.com', N'director', N'$2y$10$2oXYyA./lrSLEOmnpwaPjusruRyqTgoibSSC.hcXaAL9XnvOHS5Am', 5, 1, 0, N'8b8bffjx0uijfi0zavwug57gwzwqypopptydokhug70dywg06j.png', CAST(N'2022-09-11T21:42:26.000' AS DateTime), CAST(N'2022-11-09T21:42:33.000' AS DateTime), NULL, 0, CAST(N'2022-08-08' AS Date), CAST(N'2022-09-11' AS Date), NULL, CAST(N'2022-08-08T12:52:49.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [branch_id], [area_id], [signature], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (1005, N'Ingreso', N'Dos', N'alvarado.astroza.camila@gmail.com', N'ingresodos', N'$2y$10$5.euR/vE5bQT8W.nNqVzWOE9BalKu2a/Y5XNQh4aj1M0QccLRtuFu', 3, 2, 0, NULL, CAST(N'2022-08-22T23:22:37.000' AS DateTime), NULL, NULL, 0, CAST(N'2022-08-22' AS Date), CAST(N'2022-09-10' AS Date), NULL, CAST(N'2022-08-22T20:08:42.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [branch_id], [area_id], [signature], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (1006, N'Gestor  Dos', N'Administrativo', N'alvarado.astroza.camila@gmail.com', N'gestordosadm', N'$2y$10$ufBx8w3c6WwSbo83QUCpUelKK5PFba0oLDTv5/k31MASDSrj1MN.m', 4, 2, 2, NULL, CAST(N'2022-08-22T22:36:55.000' AS DateTime), NULL, NULL, 0, CAST(N'2022-08-22' AS Date), CAST(N'2022-09-11' AS Date), NULL, CAST(N'2022-08-22T22:12:20.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [branch_id], [area_id], [signature], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (1007, N'Gestor Uno', N'Clinica', N'alvarado.astroza.camila@gmail.com', N'gestorcli', N'$2y$10$HAlcBkjBGiVVaVdsFl.nGe8vSeoiYVw1a8SDkM65yIc2fFcPMhqEK', 4, 1, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-08-22' AS Date), CAST(N'2022-09-11' AS Date), NULL, CAST(N'2022-08-22T20:13:13.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [branch_id], [area_id], [signature], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (1008, N'Gestor  Dos', N'Clinica', N'alvarado.astroza.camila@gmail.com', N'gestordoscli', N'$2y$10$thaHmPlI3VRD4HW.NcTSYe.sE/TEkBqxDGA0garQGy/8BsjcC/l9y', 4, 2, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-08-22' AS Date), CAST(N'2022-09-11' AS Date), NULL, CAST(N'2022-08-22T20:13:51.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [branch_id], [area_id], [signature], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (1009, N'Gestor Uno', N'Comercial', N'alvarado.astroza.camila@gmail.com', N'gestorcom', N'$2y$10$jt1DZa8CjGLeKXHzhlHAy.nzRFxsmIhUz.rM4Ml2UiRERg56kQTW6', 4, 1, 3, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-08-22' AS Date), CAST(N'2022-09-11' AS Date), NULL, CAST(N'2022-08-22T20:14:48.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [branch_id], [area_id], [signature], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (1010, N'Gestor Dos', N'Comercial', N'alvarado.astroza.camila@gmail.com', N'gestordoscom', N'$2y$10$EbGGw8IiFYY2kaeMztqKr.r6.NrgoqznsUiAyjEiN049.8QPRq9N6', 4, 2, 3, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-08-22' AS Date), CAST(N'2022-09-11' AS Date), NULL, CAST(N'2022-08-22T20:15:19.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [branch_id], [area_id], [signature], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (1011, N'Director', N'Dos', N'alvarado.astroza.camila@gmail.com', N'directordos', N'$2y$10$KSJJxxS4DhJtj3UwdWM7jOoV4avyD.qJ7XdMiyVAFQDVWiUCwg0Wy', 5, 2, 0, N'ikvoj9l2vdd2mgr6ywdqtjjcysm9u65ox7o4viy5yz1dgt8onr.png', CAST(N'2022-08-22T22:44:21.000' AS DateTime), NULL, NULL, 0, CAST(N'2022-08-22' AS Date), CAST(N'2022-09-10' AS Date), NULL, CAST(N'2022-08-22T20:16:16.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[users] ([id], [name], [lastname], [email], [username], [password], [profile_id], [branch_id], [area_id], [signature], [login_at], [logout_at], [blocked_at], [blocked_attempts], [created_at], [updated_at], [deleted_at], [updated_password], [token_forgot_password], [token_forgot_password_expiration], [assignment_process]) VALUES (1012, N'Director', N'Uno', N'alvarado.astroza.camila@gmail.com', N'directoruno', N'$2y$10$psFEavEEg9dTxDa85Uof5eizdo4j5kmfD1Q9puC6L/xKTACABlmE2', 5, 1, 0, NULL, CAST(N'2022-09-11T21:43:01.000' AS DateTime), CAST(N'2022-11-09T21:43:20.000' AS DateTime), NULL, 0, CAST(N'2022-09-11' AS Date), CAST(N'2022-09-11' AS Date), NULL, CAST(N'2022-09-11T01:25:46.000' AS DateTime), NULL, NULL, 1)
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
ALTER TABLE [dbo].[status_workflow] ADD  CONSTRAINT [DF_status_workflow_status_rejection]  DEFAULT ((0)) FOR [status_rejection]
GO
ALTER TABLE [dbo].[status_workflow] ADD  CONSTRAINT [DF_status_workflow_assign_area]  DEFAULT ((0)) FOR [assign_area]
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
/****** Object:  StoredProcedure [dbo].[SLA_NOTIFICATION_EMAIL]    Script Date: 22/09/2022 13:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CA
-- Create date: 10/09/22
-- Description: Obtiene formularios para la notificación de SLA
-- =============================================
CREATE PROCEDURE [dbo].[SLA_NOTIFICATION_EMAIL]
AS
BEGIN
	DECLARE @V_DAYS_TO_RESOLUTE as INT = 15;
	DECLARE @V_SEPARATOR_EMAIL as VARCHAR(1) = ';';
	DECLARE @V_TEMPLATE_SLA_48 as INT = 7;
	DECLARE @V_CC_SLA_48 as VARCHAR(MAX);
	DECLARE @V_TEMPLATE_3_DAYS_REST as INT = 8;
	DECLARE @V_CC_3_DAYS_REST as VARCHAR(MAX);
	DECLARE @V_TEMPLATE_1_DAYS_REST as INT = 9;
	DECLARE @V_CC_1_DAYS_REST as VARCHAR(MAX);
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY  
		SELECT @V_TEMPLATE_SLA_48 = template_id, @V_CC_SLA_48 = emails_cc FROM forms_sla WHERE id = 1;
		SELECT @V_TEMPLATE_3_DAYS_REST = template_id, @V_CC_3_DAYS_REST = emails_cc FROM forms_sla WHERE id = 2;
		SELECT @V_TEMPLATE_1_DAYS_REST = template_id, @V_CC_1_DAYS_REST = emails_cc FROM forms_sla WHERE id = 3;
	END TRY  
	BEGIN CATCH  
		SET  @V_CC_SLA_48 = '';
		SET  @V_TEMPLATE_SLA_48 = 7;
		SET  @V_CC_3_DAYS_REST = ''; 
		SET  @V_TEMPLATE_3_DAYS_REST = 8;
		SET  @V_CC_1_DAYS_REST = '';
		SET  @V_TEMPLATE_1_DAYS_REST = 9;
	END CATCH  
	
	SELECT DISTINCT 
	forms.id, forms.invoice, forms.form_branch_id, branchs.branch, forms.form_type_id, ISNULL(types.type,'Sin información') type, forms.form_resume, forms.form_solution, 
	forms.status_id, status.status, forms.user_current, users.name+' '+users.lastname as user_name, users.email, forms.email_director_branch,
	FORMAT(forms.form_start_date,'dd/MM/yyyy HH:mm:ss') as form_start_date, forms.form_sla_hours, 
	FORMAT(forms.form_date_closed,'dd/MM/yyyy') as form_date_closed, forms.form_sla_rest, 
	CASE WHEN LEN(forms.email_director_branch) > 0 THEN forms.cc+@V_SEPARATOR_EMAIL+forms.email_director_branch ELSE forms.cc END as cc,
	forms.template_id, FORMAT(forms.form_date_received,'dd/MM/yyyy HH:mm:ss') as form_date_received
	FROM (
	
	--TICKETS FUERA DE SLA PARA PERFIL INGRESO
	SELECT forms.id, forms.invoice, forms.form_branch_id, forms.form_type_id, forms.form_resume, forms.form_solution, 
	forms.status_id, forms.user_entry as user_current, forms.form_date_entry_assign as form_start_date,  
	ROUND((DATEDIFF(HOUR, forms.form_date_entry_assign, GETDATE())),2,1) as form_sla_hours,
	DATEADD(day, @V_DAYS_TO_RESOLUTE, forms.form_date_received) as form_date_closed,
	ROUND((DATEDIFF(HOUR, GETDATE(), DATEADD(day, @V_DAYS_TO_RESOLUTE, forms.form_date_received))),2,1) as form_sla_rest,
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND users.profile_id = 5 FOR XML PATH ('')), 1 ,1, '') AS email_director_branch,
	@V_CC_SLA_48 as cc, @V_TEMPLATE_SLA_48 as template_id, forms.form_date_received
	FROM forms
	WHERE forms.status_id = 1 AND forms.form_date_entry_assign IS NOT NULL
	AND (forms.form_date_notify_sla IS NULL OR FORMAT(forms.form_date_notify_sla,'yyyyMMdd') != FORMAT(GETDATE(),'yyyyMMdd'))
	AND (DATEDIFF(HOUR, forms.form_date_entry_assign, GETDATE())) > 48 AND (forms.form_date_entry IS NULL OR forms.form_date_entry < forms.form_date_entry_assign)

	UNION ALL

	--TICKETS QUE LES QUEDAN 3 DÍAS DE GESTIÓN PARA PERFIL INGRESO
	SELECT forms.id, forms.invoice, forms.form_branch_id, forms.form_type_id, forms.form_resume, forms.form_solution, 
	forms.status_id, forms.user_entry as user_current, forms.form_date_entry_assign as form_start_date,
	ROUND((DATEDIFF(HOUR, forms.form_date_entry_assign, GETDATE())),2,1) as form_sla_hours,  
	DATEADD(day, @V_DAYS_TO_RESOLUTE, forms.form_date_received) as form_date_closed,
	ROUND((DATEDIFF(HOUR, GETDATE(), DATEADD(day, @V_DAYS_TO_RESOLUTE, forms.form_date_received))),2,1) as form_sla_rest,
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND users.profile_id = 5 FOR XML PATH ('')), 1 ,1, '') AS email_director_branch,
	@V_CC_3_DAYS_REST as cc, @V_TEMPLATE_3_DAYS_REST as template_id, forms.form_date_received
	FROM forms
	WHERE forms.status_id = 1 AND forms.form_date_entry_assign IS NOT NULL
	AND (forms.form_date_notify_sla IS NULL OR FORMAT(forms.form_date_notify_sla,'yyyyMMdd') != FORMAT(GETDATE(),'yyyyMMdd'))
	AND (DATEADD(day, 12, forms.form_date_received) <= GETDATE() AND (forms.form_date_entry IS NULL OR forms.form_date_entry < forms.form_date_entry_assign))

	UNION ALL

	--TICKETS QUE LES QUEDAN 1 DÍA DE GESTIÓN PARA PERFIL INGRESO
	SELECT forms.id, forms.invoice, forms.form_branch_id, forms.form_type_id, forms.form_resume, forms.form_solution, 
	forms.status_id, forms.user_entry as user_current, forms.form_date_entry_assign as form_start_date,
	ROUND((DATEDIFF(HOUR, forms.form_date_entry_assign, GETDATE())),2,1) as form_sla_hours,  
	DATEADD(day, @V_DAYS_TO_RESOLUTE, forms.form_date_received) as form_date_closed,
	ROUND((DATEDIFF(HOUR, GETDATE(), DATEADD(day, @V_DAYS_TO_RESOLUTE, forms.form_date_received))),2,1) as form_sla_rest,
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND users.profile_id = 5 FOR XML PATH ('')), 1 ,1, '') AS email_director_branch,
	@V_CC_1_DAYS_REST as cc, @V_TEMPLATE_1_DAYS_REST as template_id, forms.form_date_received
	FROM forms
	WHERE forms.status_id = 1 AND forms.form_date_entry_assign IS NOT NULL
	AND (forms.form_date_notify_sla IS NULL OR FORMAT(forms.form_date_notify_sla,'yyyyMMdd') != FORMAT(GETDATE(),'yyyyMMdd'))
	AND (DATEADD(day, 12, forms.form_date_received) > GETDATE() AND DATEADD(day, 14, forms.form_date_received) <= GETDATE() AND (forms.form_date_entry IS NULL OR forms.form_date_entry < forms.form_date_entry_assign))

	UNION ALL

	--TICKETS QUE LES QUEDAN 3 DÍAS DE GESTIÓN PARA PERFIL GESTOR
	SELECT forms.id, forms.invoice, forms.form_branch_id, forms.form_type_id, forms.form_resume, forms.form_solution, 
	forms.status_id, forms.user_manager as user_current, forms.form_date_manager_assign as form_start_date,
	ROUND((DATEDIFF(HOUR, forms.form_date_manager_assign, GETDATE())),2,1) as form_sla_hours,  
	DATEADD(day, @V_DAYS_TO_RESOLUTE, forms.form_date_received) as form_date_closed,
	ROUND((DATEDIFF(HOUR, GETDATE(), DATEADD(day, @V_DAYS_TO_RESOLUTE, forms.form_date_received))),2,1) as form_sla_rest,
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND users.profile_id = 5 FOR XML PATH ('')), 1 ,1, '') AS email_director_branch,
	@V_CC_3_DAYS_REST as cc, @V_TEMPLATE_3_DAYS_REST as template_id, forms.form_date_received
	FROM forms
	WHERE (forms.status_id = 2 OR forms.status_id = 4) AND forms.form_date_manager_assign IS NOT NULL
	AND (forms.form_date_notify_sla IS NULL OR FORMAT(forms.form_date_notify_sla,'yyyyMMdd') != FORMAT(GETDATE(),'yyyyMMdd'))
	AND (DATEADD(day, 12, forms.form_date_received) <= GETDATE() AND (forms.form_date_manager IS NULL OR forms.form_date_manager < forms.form_date_manager_assign))
	
	UNION ALL

	--TICKETS QUE LES QUEDAN 1 DÍA DE GESTIÓN PARA PERFIL GESTOR
	SELECT forms.id, forms.invoice, forms.form_branch_id, forms.form_type_id, forms.form_resume, forms.form_solution, 
	forms.status_id, forms.user_manager as user_current, forms.form_date_manager_assign as form_start_date,
	ROUND((DATEDIFF(HOUR, forms.form_date_manager_assign, GETDATE())),2,1) as form_sla_hours,  
	DATEADD(day, @V_DAYS_TO_RESOLUTE, forms.form_date_received) as form_date_closed,
	ROUND((DATEDIFF(HOUR, GETDATE(), DATEADD(day, @V_DAYS_TO_RESOLUTE, forms.form_date_received))),2,1) as form_sla_rest,
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND users.profile_id = 5 FOR XML PATH ('')), 1 ,1, '') AS email_director_branch,
	@V_CC_1_DAYS_REST as cc, @V_TEMPLATE_1_DAYS_REST as template_id, forms.form_date_received
	FROM forms
	WHERE (forms.status_id = 2 OR forms.status_id = 4) AND forms.form_date_manager_assign IS NOT NULL
	AND (forms.form_date_notify_sla IS NULL OR FORMAT(forms.form_date_notify_sla,'yyyyMMdd') != FORMAT(GETDATE(),'yyyyMMdd'))
	AND (DATEADD(day, 12, forms.form_date_received) > GETDATE() AND DATEADD(day, 14, forms.form_date_received) <= GETDATE() AND (forms.form_date_manager IS NULL OR forms.form_date_manager < forms.form_date_manager_assign))
	
	UNION ALL

	--TICKETS QUE LES QUEDAN 1 DÍA DE GESTIÓN PARA PERFIL DIRECTOR
	SELECT forms.id, forms.invoice, forms.form_branch_id, forms.form_type_id, forms.form_resume, forms.form_solution, 
	forms.status_id, forms.user_director as user_current, forms.form_date_director_assign as form_start_date,
	ROUND((DATEDIFF(HOUR, forms.form_date_director_assign, GETDATE())),2,1) as form_sla_hours,  
	DATEADD(day, @V_DAYS_TO_RESOLUTE, forms.form_date_received) as form_date_closed,
	ROUND((DATEDIFF(HOUR, GETDATE(), DATEADD(day, @V_DAYS_TO_RESOLUTE, forms.form_date_received))),2,1) as form_sla_rest,
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND users.profile_id = 5 FOR XML PATH ('')), 1 ,1, '') AS email_director_branch,
	@V_CC_1_DAYS_REST as cc, @V_TEMPLATE_1_DAYS_REST as template_id, forms.form_date_received
	FROM forms
	WHERE forms.status_id = 3 AND forms.form_date_director_assign IS NOT NULL
	AND (forms.form_date_notify_sla IS NULL OR FORMAT(forms.form_date_notify_sla,'yyyyMMdd') != FORMAT(GETDATE(),'yyyyMMdd'))
	AND (DATEADD(day, 12, forms.form_date_received) > GETDATE() AND DATEADD(day, 14, forms.form_date_received) <= GETDATE() AND (forms.form_date_director IS NULL OR forms.form_date_director < forms.form_date_director_assign))
	) forms
	JOIN users ON forms.user_current = users.id
	LEFT JOIN types ON forms.form_type_id = types.id
	LEFT JOIN branchs ON forms.form_branch_id = branchs.id
	LEFT JOIN status ON forms.status_id = status.id;

END
GO
USE [master]
GO
ALTER DATABASE [cdc_plataforma_oirs] SET  READ_WRITE 
GO
