USE [cdc_plataforma_oirs]
GO

/****** Object:  Table [dbo].[users_backups]    Script Date: 28/09/2022 23:32:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[users_backups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_bkp] [int] NULL,
 CONSTRAINT [PK_users_backups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE profiles ADD need_branch int DEFAULT 0;
ALTER TABLE profiles ADD need_area int DEFAULT 0;
ALTER TABLE profiles ADD need_bkp int DEFAULT 0;
