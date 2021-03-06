USE [BugsClase03]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 08/23/2018 16:48:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perfiles](
	[id_perfil] [int] IDENTITY(1,1) NOT NULL,
	[n_perfil] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[id_perfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Perfiles] ON
INSERT [dbo].[Perfiles] ([id_perfil], [n_perfil]) VALUES (1, N'Administrador')
INSERT [dbo].[Perfiles] ([id_perfil], [n_perfil]) VALUES (2, N'Tester')
INSERT [dbo].[Perfiles] ([id_perfil], [n_perfil]) VALUES (3, N'Desarrollador')
INSERT [dbo].[Perfiles] ([id_perfil], [n_perfil]) VALUES (4, N'Responsable de Reportes')
SET IDENTITY_INSERT [dbo].[Perfiles] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 08/23/2018 16:48:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[n_usuario] [varchar](50) NOT NULL,
	[password] [varchar](10) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[id_perfil] [int] NOT NULL,
	[estado] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([id_usuario], [n_usuario], [password], [email], [id_perfil], [estado]) VALUES (1, N'ADMIN', N'123', N'admin@bt.com', 1, N'S')
INSERT [dbo].[Users] ([id_usuario], [n_usuario], [password], [email], [id_perfil], [estado]) VALUES (2, N'acme', N'test123', N'test123', 2, N'N')
INSERT [dbo].[Users] ([id_usuario], [n_usuario], [password], [email], [id_perfil], [estado]) VALUES (4, N'Test3', N'test', N'test2@bt.com', 3, N'')
INSERT [dbo].[Users] ([id_usuario], [n_usuario], [password], [email], [id_perfil], [estado]) VALUES (5, N'one21', N'fhkjasdhfa', N'fhkjasdhfa', 2, N'N')
INSERT [dbo].[Users] ([id_usuario], [n_usuario], [password], [email], [id_perfil], [estado]) VALUES (6, N'Test11-09', N'123', N'test1109@bugs.com.ar', 3, N'N')
INSERT [dbo].[Users] ([id_usuario], [n_usuario], [password], [email], [id_perfil], [estado]) VALUES (7, N'Melisa', N'123', N'meli@gmail.com', 4, N'S')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  ForeignKey [FK_Users_Perfiles]    Script Date: 08/23/2018 16:48:14 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Perfiles] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[Perfiles] ([id_perfil])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Perfiles]
GO
