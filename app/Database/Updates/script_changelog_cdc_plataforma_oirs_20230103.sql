
USE [cdc_plataforma_oirs]
GO

-- ALTER FORMS

ALTER TABLE dbo.forms ADD
	profile_current int NULL
GO
ALTER TABLE dbo.forms ADD CONSTRAINT
	DF_forms_profile_current DEFAULT 0 FOR profile_current
GO
ALTER TABLE dbo.forms SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

--INSERT TABLES
GO
DELETE FROM [dbo].[profiles];
GO
SET IDENTITY_INSERT [dbo].[profiles] ON 
GO
INSERT [dbo].[profiles] ([id], [profile], [deleted_at], [need_bkp], [need_branch], [need_area]) VALUES (1, N'Administrador', NULL, 0, 0, 0)
GO
INSERT [dbo].[profiles] ([id], [profile], [deleted_at], [need_bkp], [need_branch], [need_area]) VALUES (2, N'Lector', NULL, 0, 0, 0)
GO
INSERT [dbo].[profiles] ([id], [profile], [deleted_at], [need_bkp], [need_branch], [need_area]) VALUES (3, N'Ingreso', NULL, 0, 1, 0)
GO
INSERT [dbo].[profiles] ([id], [profile], [deleted_at], [need_bkp], [need_branch], [need_area]) VALUES (4, N'Gestor', NULL, 0, 1, 1)
GO
INSERT [dbo].[profiles] ([id], [profile], [deleted_at], [need_bkp], [need_branch], [need_area]) VALUES (5, N'Director', NULL, 0, 1, 0)
GO
INSERT [dbo].[profiles] ([id], [profile], [deleted_at], [need_bkp], [need_branch], [need_area]) VALUES (6, N'Director Subrogante', NULL, 0, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[profiles] OFF
GO
DELETE FROM [dbo].[menus];
GO
SET IDENTITY_INSERT [dbo].[menus] ON 
GO
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (1, 1, 2, NULL)
GO
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (3, 3, 2, NULL)
GO
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (4, 1, 1, NULL)
GO
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (5, 3, 1, NULL)
GO
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (7, 4, 1, NULL)
GO
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (8, 1, 3, NULL)
GO
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (9, 2, 3, NULL)
GO
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (10, 3, 3, NULL)
GO
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (1008, 1, 4, NULL)
GO
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (1009, 3, 4, NULL)
GO
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (1010, 1, 5, NULL)
GO
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (1011, 3, 5, NULL)
GO
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (1012, 1, 6, NULL)
GO
INSERT [dbo].[menus] ([id], [page_id], [profile_id], [deleted_at]) VALUES (1013, 3, 6, NULL)
GO
SET IDENTITY_INSERT [dbo].[menus] OFF
GO
DELETE FROM [dbo].[pages_actions];
GO
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
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (2009, 3, 6, 3, N'SEE,EDIT,MANAGEMENT,APPROVE,DECLINE', NULL)
GO
INSERT [dbo].[pages_actions] ([id], [page_id], [profile_id], [status_id], [actions], [deleted_at]) VALUES (2010, 3, 6, 6, N'SEE,REOPEN', NULL)
GO
SET IDENTITY_INSERT [dbo].[pages_actions] OFF
GO


-- ALTER SP

GO
/****** Object:  StoredProcedure [dbo].[SLA_NOTIFICATION_EMAIL]    Script Date: 01/01/2023 20:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CA
-- Create date: 10/09/22
-- Last update: 03/01/23 - Modifica destinatario de correos por perfil
-- Description: Obtiene formularios para la notificación de SLA
-- =============================================
ALTER PROCEDURE [dbo].[SLA_NOTIFICATION_EMAIL]
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
	forms.status_id, status.status, forms.user_current, '' as user_name, forms.emails_to as email, forms.email_director_branch,
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
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND users.profile_id = 3 FOR XML PATH ('')), 1 ,1, '') AS emails_to,
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND (users.profile_id = 5 OR users.profile_id = 6)  FOR XML PATH ('')), 1 ,1, '') AS email_director_branch,
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
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND users.profile_id = 3 FOR XML PATH ('')), 1 ,1, '') AS emails_to,
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND (users.profile_id = 5 OR users.profile_id = 6)  FOR XML PATH ('')), 1 ,1, '') AS email_director_branch,
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
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND users.profile_id = 3 FOR XML PATH ('')), 1 ,1, '') AS emails_to,
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND (users.profile_id = 5 OR users.profile_id = 6) FOR XML PATH ('')), 1 ,1, '') AS email_director_branch,
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
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND users.profile_id = 4 AND users.area_id = forms.form_area_id FOR XML PATH ('')), 1 ,1, '') AS emails_to,
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND (users.profile_id = 5 OR users.profile_id = 6)  FOR XML PATH ('')), 1 ,1, '') AS email_director_branch,
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
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND users.profile_id = 4 AND users.area_id = forms.form_area_id FOR XML PATH ('')), 1 ,1, '') AS emails_to,
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND (users.profile_id = 5 OR users.profile_id = 6)  FOR XML PATH ('')), 1 ,1, '') AS email_director_branch,
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
	STUFF((SELECT @V_SEPARATOR_EMAIL + users.email FROM users WHERE users.branch_id = forms.form_branch_id AND (users.profile_id = 5 OR users.profile_id = 6) FOR XML PATH ('')), 1 ,1, '') AS emails_to,
	'' AS email_director_branch,
	@V_CC_1_DAYS_REST as cc, @V_TEMPLATE_1_DAYS_REST as template_id, forms.form_date_received
	FROM forms
	WHERE forms.status_id = 3 AND forms.form_date_director_assign IS NOT NULL
	AND (forms.form_date_notify_sla IS NULL OR FORMAT(forms.form_date_notify_sla,'yyyyMMdd') != FORMAT(GETDATE(),'yyyyMMdd'))
	AND (DATEADD(day, 12, forms.form_date_received) > GETDATE() AND DATEADD(day, 14, forms.form_date_received) <= GETDATE() AND (forms.form_date_director IS NULL OR forms.form_date_director < forms.form_date_director_assign))
	) forms
	LEFT JOIN types ON forms.form_type_id = types.id
	LEFT JOIN branchs ON forms.form_branch_id = branchs.id
	LEFT JOIN status ON forms.status_id = status.id;

END
