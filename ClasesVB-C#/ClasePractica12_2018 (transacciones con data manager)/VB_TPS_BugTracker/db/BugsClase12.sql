USE [BugsClase12]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 10/16/2018 20:28:18 ******/
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
/****** Object:  Table [dbo].[Productos]    Script Date: 10/16/2018 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON
INSERT [dbo].[Productos] ([id_producto], [nombre]) VALUES (1, N'SOFTWARE GESTION II')
SET IDENTITY_INSERT [dbo].[Productos] OFF
/****** Object:  Table [dbo].[Prioridades]    Script Date: 10/16/2018 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Prioridades](
	[id_prioridad] [int] IDENTITY(1,1) NOT NULL,
	[n_prioridad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Prioridades] PRIMARY KEY CLUSTERED 
(
	[id_prioridad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Prioridades] ON
INSERT [dbo].[Prioridades] ([id_prioridad], [n_prioridad]) VALUES (1, N'BAJA')
INSERT [dbo].[Prioridades] ([id_prioridad], [n_prioridad]) VALUES (2, N'MEDIA')
INSERT [dbo].[Prioridades] ([id_prioridad], [n_prioridad]) VALUES (3, N'ALTA')
INSERT [dbo].[Prioridades] ([id_prioridad], [n_prioridad]) VALUES (4, N'URGENTE')
SET IDENTITY_INSERT [dbo].[Prioridades] OFF
/****** Object:  Table [dbo].[Formularios]    Script Date: 10/16/2018 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Formularios](
	[id_formulario] [int] IDENTITY(1,1) NOT NULL,
	[n_formulario] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Formularios] PRIMARY KEY CLUSTERED 
(
	[id_formulario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 10/16/2018 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estados](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[n_estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Estados] ON
INSERT [dbo].[Estados] ([id_estado], [n_estado]) VALUES (1, N'Nuevo')
INSERT [dbo].[Estados] ([id_estado], [n_estado]) VALUES (2, N'Asignado')
INSERT [dbo].[Estados] ([id_estado], [n_estado]) VALUES (3, N'Cerrado')
INSERT [dbo].[Estados] ([id_estado], [n_estado]) VALUES (4, N'En testing')
SET IDENTITY_INSERT [dbo].[Estados] OFF
/****** Object:  Table [dbo].[Criticidades]    Script Date: 10/16/2018 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Criticidades](
	[id_criticidad] [int] IDENTITY(1,1) NOT NULL,
	[n_criticidad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Criticidades] PRIMARY KEY CLUSTERED 
(
	[id_criticidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Criticidades] ON
INSERT [dbo].[Criticidades] ([id_criticidad], [n_criticidad]) VALUES (1, N'LEVE')
INSERT [dbo].[Criticidades] ([id_criticidad], [n_criticidad]) VALUES (2, N'GRAVE')
INSERT [dbo].[Criticidades] ([id_criticidad], [n_criticidad]) VALUES (3, N'INVALIDANTE')
SET IDENTITY_INSERT [dbo].[Criticidades] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 10/16/2018 20:28:18 ******/
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
INSERT [dbo].[Users] ([id_usuario], [n_usuario], [password], [email], [id_perfil], [estado]) VALUES (1, N'ADMIN', N'123', N'admin@gmail.com', 1, N'S')
INSERT [dbo].[Users] ([id_usuario], [n_usuario], [password], [email], [id_perfil], [estado]) VALUES (2, N'Gustavo', N'123', N'gustavo@gmail.com', 2, N'S')
INSERT [dbo].[Users] ([id_usuario], [n_usuario], [password], [email], [id_perfil], [estado]) VALUES (4, N'Maximo', N'123', N'maximo@gmail.com', 3, N'S')
INSERT [dbo].[Users] ([id_usuario], [n_usuario], [password], [email], [id_perfil], [estado]) VALUES (5, N'Ignacio', N'123', N'ignacio@gmail.com', 2, N'S')
INSERT [dbo].[Users] ([id_usuario], [n_usuario], [password], [email], [id_perfil], [estado]) VALUES (6, N'Milena', N'1234', N'milena@gmail.com', 3, N'S')
INSERT [dbo].[Users] ([id_usuario], [n_usuario], [password], [email], [id_perfil], [estado]) VALUES (7, N'Melisa', N'123', N'melisa@gmail.com', 3, N'S')
INSERT [dbo].[Users] ([id_usuario], [n_usuario], [password], [email], [id_perfil], [estado]) VALUES (8, N'Sergio', N'123', N'sergio@gmail.com', 4, N'S')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Bugs]    Script Date: 10/16/2018 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bugs](
	[id_bug] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NOT NULL,
	[descripcion] [varchar](1000) NULL,
	[id_producto] [int] NOT NULL,
	[id_prioridad] [int] NULL,
	[id_criticidad] [int] NULL,
	[fecha_alta] [date] NOT NULL,
 CONSTRAINT [PK_Bugs] PRIMARY KEY CLUSTERED 
(
	[id_bug] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Bugs] ON
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [id_producto], [id_prioridad], [id_criticidad], [fecha_alta]) VALUES (2, N'Bug numero 2', N'Habilitar botones', 1, 1, 3, CAST(0x523D0B00 AS Date))
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [id_producto], [id_prioridad], [id_criticidad], [fecha_alta]) VALUES (5, N'Bug numero 3', N'Deshabilitar botones.', 1, 1, 1, CAST(0x523D0B00 AS Date))
INSERT [dbo].[Bugs] ([id_bug], [titulo], [descripcion], [id_producto], [id_prioridad], [id_criticidad], [fecha_alta]) VALUES (6, N'Bug numero 6', N'Revisar botones', 1, 3, 3, CAST(0x533D0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Bugs] OFF
/****** Object:  Table [dbo].[Permisos]    Script Date: 10/16/2018 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[id_formulario] [int] NOT NULL,
	[id_perfil] [int] NOT NULL,
 CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED 
(
	[id_formulario] ASC,
	[id_perfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historiales_Bug]    Script Date: 10/16/2018 20:28:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historiales_Bug](
	[id_bug] [int] NOT NULL,
	[id_detalle] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[responsable] [int] NOT NULL,
	[id_estado] [int] NOT NULL,
	[asignado_a] [int] NULL,
 CONSTRAINT [PK_Historales_Bug] PRIMARY KEY CLUSTERED 
(
	[id_bug] ASC,
	[id_detalle] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (2, 1, CAST(0x523D0B00 AS Date), 1, 1, NULL)
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (2, 2, CAST(0x533D0B00 AS Date), 1, 1, NULL)
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (2, 3, CAST(0x543D0B00 AS Date), 1, 2, NULL)
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (2, 4, CAST(0x5D3D0B00 AS Date), 1, 4, 2)
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (2, 5, CAST(0x5D3D0B00 AS Date), 1, 3, NULL)
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (2, 6, CAST(0x903E0B00 AS Date), 1, 2, 4)
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (2, 7, CAST(0xD63E0B00 AS Date), 1, 2, 7)
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (5, 1, CAST(0x523D0B00 AS Date), 1, 1, NULL)
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (5, 2, CAST(0x563D0B00 AS Date), 1, 2, 4)
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (5, 3, CAST(0x5D3D0B00 AS Date), 1, 4, NULL)
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (5, 4, CAST(0xD63E0B00 AS Date), 1, 2, 7)
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (6, 1, CAST(0x533D0B00 AS Date), 1, 1, NULL)
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (6, 2, CAST(0x563D0B00 AS Date), 1, 1, NULL)
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (6, 3, CAST(0x563D0B00 AS Date), 1, 2, 4)
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (6, 4, CAST(0x5D3D0B00 AS Date), 1, 4, NULL)
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (6, 5, CAST(0x5D3D0B00 AS Date), 1, 4, NULL)
INSERT [dbo].[Historiales_Bug] ([id_bug], [id_detalle], [fecha], [responsable], [id_estado], [asignado_a]) VALUES (6, 6, CAST(0xD63E0B00 AS Date), 1, 2, 6)
/****** Object:  ForeignKey [FK_Bugs_Criticidades]    Script Date: 10/16/2018 20:28:18 ******/
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Criticidades] FOREIGN KEY([id_criticidad])
REFERENCES [dbo].[Criticidades] ([id_criticidad])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Criticidades]
GO
/****** Object:  ForeignKey [FK_Bugs_Prioridades]    Script Date: 10/16/2018 20:28:18 ******/
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Prioridades] FOREIGN KEY([id_prioridad])
REFERENCES [dbo].[Prioridades] ([id_prioridad])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Prioridades]
GO
/****** Object:  ForeignKey [FK_Bugs_Productos]    Script Date: 10/16/2018 20:28:18 ******/
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Productos] ([id_producto])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Productos]
GO
/****** Object:  ForeignKey [FK_Historales_Bug_Bugs]    Script Date: 10/16/2018 20:28:18 ******/
ALTER TABLE [dbo].[Historiales_Bug]  WITH CHECK ADD  CONSTRAINT [FK_Historales_Bug_Bugs] FOREIGN KEY([id_bug])
REFERENCES [dbo].[Bugs] ([id_bug])
GO
ALTER TABLE [dbo].[Historiales_Bug] CHECK CONSTRAINT [FK_Historales_Bug_Bugs]
GO
/****** Object:  ForeignKey [FK_Historales_Bug_Estados]    Script Date: 10/16/2018 20:28:18 ******/
ALTER TABLE [dbo].[Historiales_Bug]  WITH CHECK ADD  CONSTRAINT [FK_Historales_Bug_Estados] FOREIGN KEY([id_estado])
REFERENCES [dbo].[Estados] ([id_estado])
GO
ALTER TABLE [dbo].[Historiales_Bug] CHECK CONSTRAINT [FK_Historales_Bug_Estados]
GO
/****** Object:  ForeignKey [FK_Historales_Bug_Users]    Script Date: 10/16/2018 20:28:18 ******/
ALTER TABLE [dbo].[Historiales_Bug]  WITH CHECK ADD  CONSTRAINT [FK_Historales_Bug_Users] FOREIGN KEY([responsable])
REFERENCES [dbo].[Users] ([id_usuario])
GO
ALTER TABLE [dbo].[Historiales_Bug] CHECK CONSTRAINT [FK_Historales_Bug_Users]
GO
/****** Object:  ForeignKey [FK_Historales_Bug_Users1]    Script Date: 10/16/2018 20:28:18 ******/
ALTER TABLE [dbo].[Historiales_Bug]  WITH CHECK ADD  CONSTRAINT [FK_Historales_Bug_Users1] FOREIGN KEY([asignado_a])
REFERENCES [dbo].[Users] ([id_usuario])
GO
ALTER TABLE [dbo].[Historiales_Bug] CHECK CONSTRAINT [FK_Historales_Bug_Users1]
GO
/****** Object:  ForeignKey [FK_Permisos_Formularios]    Script Date: 10/16/2018 20:28:18 ******/
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Formularios] FOREIGN KEY([id_formulario])
REFERENCES [dbo].[Formularios] ([id_formulario])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Formularios]
GO
/****** Object:  ForeignKey [FK_Permisos_Perfiles]    Script Date: 10/16/2018 20:28:18 ******/
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Perfiles] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[Perfiles] ([id_perfil])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Perfiles]
GO
/****** Object:  ForeignKey [FK_Users_Perfiles]    Script Date: 10/16/2018 20:28:18 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Perfiles] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[Perfiles] ([id_perfil])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Perfiles]
GO
