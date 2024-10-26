USE [BOOKS]
GO
/****** Object:  Table [dbo].[tblCliente]    Script Date: 25/10/2024 23:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCliente](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[ClienteNome] [varchar](150) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[ClienteTelefone] [varchar](50) NULL,
	[ClienteCPF] [varchar](50) NOT NULL,
 CONSTRAINT [PK__tblClien__71ABD0A70A2F6743] PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__tblClien__E2224591E2071561] UNIQUE NONCLUSTERED 
(
	[ClienteCPF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLivro]    Script Date: 25/10/2024 23:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLivro](
	[LivroID] [int] IDENTITY(1,1) NOT NULL,
	[LivroNome] [varchar](150) NOT NULL,
	[QuantidadePaginas] [int] NOT NULL,
	[NomeAutor] [varchar](150) NOT NULL,
	[LivroGenero] [varchar](150) NOT NULL,
	[Preco] [decimal](7, 2) NOT NULL,
	[CodigoISBN] [char](13) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LivroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CodigoISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPedido]    Script Date: 25/10/2024 23:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPedido](
	[PedidoID] [int] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[ClienteID] [int] NOT NULL,
	[SituacaPedido] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPedidoItem]    Script Date: 25/10/2024 23:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPedidoItem](
	[PedidoItemID] [int] IDENTITY(1,1) NOT NULL,
	[PedidoID] [int] NOT NULL,
	[ClienteID] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
	[ValorUnitario] [decimal](7, 2) NOT NULL,
	[ValorTotal] [decimal](7, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PedidoID] ASC,
	[PedidoItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLivro] ADD  DEFAULT ('(0.00)') FOR [Preco]
GO
ALTER TABLE [dbo].[tblPedido] ADD  DEFAULT ('P') FOR [SituacaPedido]
GO
ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK__tblPedido__Clien__5070F446] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[tblCliente] ([ClienteID])
GO
ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK__tblPedido__Clien__5070F446]
GO
ALTER TABLE [dbo].[tblPedidoItem]  WITH CHECK ADD  CONSTRAINT [FK__tblPedido__Clien__59FA5E80] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[tblCliente] ([ClienteID])
GO
ALTER TABLE [dbo].[tblPedidoItem] CHECK CONSTRAINT [FK__tblPedido__Clien__59FA5E80]
GO
ALTER TABLE [dbo].[tblPedidoItem]  WITH CHECK ADD FOREIGN KEY([PedidoID])
REFERENCES [dbo].[tblPedido] ([PedidoID])
GO
ALTER TABLE [dbo].[tblPedidoItem]  WITH CHECK ADD  CONSTRAINT [FK_tblPedidoItem_tblLivro] FOREIGN KEY([PedidoItemID])
REFERENCES [dbo].[tblLivro] ([LivroID])
GO
ALTER TABLE [dbo].[tblPedidoItem] CHECK CONSTRAINT [FK_tblPedidoItem_tblLivro]
GO
