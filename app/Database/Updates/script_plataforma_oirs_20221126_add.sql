USE [cdc_plataforma_oirs]
GO
ALTER TABLE dbo.forms ADD form_comments varchar(MAX) NULL 
GO
ALTER TABLE dbo.forms ADD intern_invoice varchar(100) NULL
GO
ALTER TABLE dbo.forms_documents ADD type varchar(100) NULL
GO
ALTER TABLE dbo.status_workflow ADD flow_type int DEFAULT 0
GO

delete from [dbo].[pages_actions]
go
SET IDENTITY_INSERT [dbo].[pages_actions] ON 
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1, 3, 1, 1, N'SEE,REASIGN,EDIT,MANAGEMENT,DISCARD', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (2, 3, 1, 2, N'SEE,REASIGN,EDIT,MANAGEMENT,DISCARD', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (3, 3, 1, 3, N'SEE,REASIGN,EDIT,MANAGEMENT,DISCARD', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (4, 3, 1, 4, N'SEE,REASIGN,EDIT,MANAGEMENT,DISCARD', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (5, 3, 1, 5, N'SEE,REASIGN,EDIT,MANAGEMENT,DISCARD', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (6, 3, 1, 6, N'SEE,REASIGN,EDIT,MANAGEMENT,DISCARD', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (7, 3, 1, 7, N'SEE,REASIGN,EDIT,MANAGEMENT,DISCARD', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (8, 3, 2, 1, N'SEE', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (9, 3, 2, 2, N'SEE', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (10, 3, 2, 3, N'SEE', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (11, 3, 2, 4, N'SEE', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (12, 3, 2, 5, N'SEE', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (13, 3, 2, 6, N'SEE', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (15, 3, 3, 1, N'SEE,EDIT,DISCARD,SEND', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (16, 3, 3, 2, N'SEE,INSIST', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (17, 3, 3, 6, N'SEE,REOPEN', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (19, 3, 4, 2, N'SEE,EDIT,MANAGEMENT,DISCARD,SEND', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (20, 3, 4, 3, N'SEE,INSIST', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (21, 3, 4, 4, N'SEE,EDIT,MANAGEMENT,DISCARD,SEND', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (22, 3, 5, 3, N'SEE,EDIT,MANAGEMENT,APPROVE,DECLINE', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (23, 3, 3, 0, N'ADD', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1003, 3, 3, 8, N'SEE,RESTORE,DELETE', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1005, 3, 1, 8, N'SEE,REASIGN,MANAGEMENT,RESTORE,DELETE', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1006, 3, 1, 0, N'ADD', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1007, 3, 4, 6, N'SEE,REOPEN', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1008, 3, 5, 6, N'SEE,REOPEN', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1009, 3, 3, 3, N'SEE,INSIST', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (1010, 3, 3, 4, N'SEE,EDIT,DISCARD,SEND', NULL)
GO
SET IDENTITY_INSERT [dbo].[pages_actions] OFF
GO
SET IDENTITY_INSERT [dbo].[status_workflow] ON 
GO
delete from [dbo].[status_workflow] 
go
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (1, 1, 2, 0, 4, 1, NULL, 1)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (2, 2, 3, 0, 5, 0, NULL, 1)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (3, 3, 4, 1, 4, 1, NULL, 1)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (5, 4, 3, 0, 5, 0, NULL, 1)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (7, 0, 1, 0, 3, 0, NULL, 1)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (8, 3, 6, 0, 0, 0, NULL, 1)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (9, 6, 1, 1, 3, 0, NULL, 1)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (10, 1, 3, 0, 5, 0, NULL, 2)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (11, 3, 4, 1, 3, 0, NULL, 2)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (12, 3, 6, 0, 0, 0, NULL, 2)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (13, 0, 1, 0, 3, 0, NULL, 2)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (14, 4, 3, 0, 5, 0, NULL, 2)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (15, 1, 3, 0, 5, 0, NULL, 3)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (16, 3, 4, 1, 3, 0, NULL, 3)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (17, 3, 6, 0, 0, 0, NULL, 3)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (18, 0, 1, 0, 3, 0, NULL, 3)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (19, 4, 3, 0, 5, 0, NULL, 3)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (20, 6, 1, 1, 3, 0, NULL, 2)
GO
INSERT [dbo].[status_workflow] ([id], [status_current], [status_next], [status_rejection], [assign_profile_id], [assign_area], [deleted_at], [flow_type]) VALUES (21, 6, 1, 1, 3, 0, NULL, 3)
GO
SET IDENTITY_INSERT [dbo].[status_workflow] OFF
GO
