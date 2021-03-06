USE [DB_Usuarios]
GO
/****** Object:  ForeignKey [FK_Usuarios_Perfiles]    Script Date: 09/23/2018 16:28:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuarios_Perfiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_Usuarios_Perfiles]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 09/23/2018 16:28:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuarios_Perfiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_Usuarios_Perfiles]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
DROP TABLE [dbo].[Usuarios]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 09/23/2018 16:28:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles]') AND type in (N'U'))
DROP TABLE [dbo].[Perfiles]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 09/23/2018 16:28:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Perfiles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Perfiles](
	[id_perfil] [int] IDENTITY(1,1) NOT NULL,
	[n_perfil] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[id_perfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Perfiles] ON
INSERT [dbo].[Perfiles] ([id_perfil], [n_perfil]) VALUES (1, N'Administrador')
INSERT [dbo].[Perfiles] ([id_perfil], [n_perfil]) VALUES (2, N'Tester')
INSERT [dbo].[Perfiles] ([id_perfil], [n_perfil]) VALUES (3, N'Desarrollador')
INSERT [dbo].[Perfiles] ([id_perfil], [n_perfil]) VALUES (4, N'Responsable de Reportes')
SET IDENTITY_INSERT [dbo].[Perfiles] OFF
/****** Object:  Table [dbo].[Usuarios]    Script Date: 09/23/2018 16:28:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre_usuario] [varchar](50) NOT NULL,
	[password] [varchar](10) NOT NULL,
	[correo_electronico] [varchar](50) NOT NULL,
	[id_perfil] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON
INSERT [dbo].[Usuarios] ([id_usuario], [nombre_usuario], [password], [correo_electronico], [id_perfil]) VALUES (1, N'admin', N'test123', N'test@test.com', 1)
INSERT [dbo].[Usuarios] ([id_usuario], [nombre_usuario], [password], [correo_electronico], [id_perfil]) VALUES (2, N'carlos.romero', N'testt123', N'user2010@test.com', 2)
INSERT [dbo].[Usuarios] ([id_usuario], [nombre_usuario], [password], [correo_electronico], [id_perfil]) VALUES (3, N'ricardo.rodriguez', N'pepe123', N'ricardo@test.com', 2)
INSERT [dbo].[Usuarios] ([id_usuario], [nombre_usuario], [password], [correo_electronico], [id_perfil]) VALUES (4, N'juan.perez', N'perez123', N'perez@test.com', 3)
INSERT [dbo].[Usuarios] ([id_usuario], [nombre_usuario], [password], [correo_electronico], [id_perfil]) VALUES (6, N'esteban.quito', N'quito@1234', N'quito@test.com', 4)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
/****** Object:  ForeignKey [FK_Usuarios_Perfiles]    Script Date: 09/23/2018 16:28:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuarios_Perfiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Perfiles] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[Perfiles] ([id_perfil])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuarios_Perfiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Perfiles]
GO
