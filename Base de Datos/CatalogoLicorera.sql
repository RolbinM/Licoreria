---Tipos Licor

EXEC sp_InsertarTipoMaduracion 'Barrica'
EXEC sp_InsertarTipoMaduracion 'Botella'


--Comida
EXEC sp_InsertarComida 'Pasta'
EXEC sp_InsertarComida 'Carnes'
EXEC sp_InsertarComida 'Frutas'
EXEC sp_InsertarComida 'Mariscos'


--Puesto
EXEC sp_InsertarPuesto 'Bodeguero',300000
EXEC sp_InsertarPuesto 'Cajero',400000
EXEC sp_InsertarPuesto 'Seguridad',350000

--TipoCliente

EXEC sp_InsertarTipoCliente 'Regular'
EXEC sp_InsertarTipoCliente 'VIP'

--TipoUsuario

EXEC sp_InsertarTipoUsuario'Administrador'
EXEC sp_InsertarTipoUsuario 'Facturador'
EXEC sp_InsertarTipoUsuario 'Consulta'

--TipoPago

EXEC sp_InsertarTipoPago 'Efectivo'
EXEC sp_InsertarTipoPago 'Tarjeta'