USE [master]
GO
/****** Object:  Database [cdc_plataforma_oirs]    Script Date: 21/09/2022 21:45:58 ******/
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
/****** Object:  Table [dbo].[actions]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[areas]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[branchs]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[channels]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[channels_entry]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[districts]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[emails]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[forms]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[forms_documents]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[forms_history]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[forms_notifications]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[forms_sla]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[genders]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[menus]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[pages]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[pages_actions]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[profiles]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[regions]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[status]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[status_workflow]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[types]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  Table [dbo].[users_profiles]    Script Date: 21/09/2022 21:45:59 ******/
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
/****** Object:  StoredProcedure [dbo].[SLA_NOTIFICATION_EMAIL]    Script Date: 21/09/2022 21:45:59 ******/
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
