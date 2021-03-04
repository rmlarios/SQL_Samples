SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquiposBaja](
	[IDEquipoBaja] [int] IDENTITY(1,1) NOT NULL,
	[TipoEquipo] [nvarchar](150) NOT NULL,
	[NumeroInventario] [nvarchar](150) NOT NULL,
    [NumeroSerie] [nvarchar](max) not null,
    [Estado] [nvarchar](max) not null
 CONSTRAINT [PK_EquiposBaja] PRIMARY KEY CLUSTERED 
(
	[IDEquipoBaja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


insert into EquiposBaja
select 'CPU','N/D','00144-038-523-965','Obsoleto' UNION
select 'MOUSE','24-10-4-648-409','X78183001787','Mal Estado' UNION
select 'MONITOR','24-10-4-23-267','CN-0U072N-64180-94K-07CU','De Baja' UNION
select 'MOUSE','24-10-4-648-386','YB1BC1U01205','De Baja' UNION
select 'SWITCH','24-10-4-458-31','F39L2A1000179','Mal Estado' UNION
select 'DISCO DURO EXTERNO','24-10-4-467-59','E3A1JJHF60205F','De Baja' UNION
select 'MONITOR','24-10-4-467-67','CNC809R6BB*','Obsoleto' UNION
select 'TECLADO','24-10-4-250-168','FB7330A9WV0W406','Obsoleto' UNION
select 'MOUSE','24-10-4-163-44','XP122S863169','Obsoleto' UNION
select 'LAPTOP','24-10-4-163-507','5CG514044H','Robado' UNION
select 'UPS','24-10-4-250-16','9806EY0OM659902803','Mal Estado' UNION
select 'MOUSE','24-10-4-648-296','160212909782','Mal Estado' UNION
select 'MOUSE','24-10-4-648-176','HC8140B07KN','Mal Estado'


EXEC DBO.SP_BajaBienConsolidado
