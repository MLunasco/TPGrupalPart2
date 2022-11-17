--aca se crea la tabla que almacena el stock por sucursal de los productos
CREATE TABLE StockProductos(
Cod_Producto VARCHAR(50) COLLATE Modern_Spanish_CI_AS NULL,
Cod_Sucursal VARCHAR(50) COLLATE Modern_Spanish_CI_AS NULL,
Cantidad INTEGER NULL DEFAULT 0)

INSERT INTO StockProductos(Cod_Producto,Cod_Sucursal)
SELECT Producto.Cod_Producto,Sucursales.Cod_Sucursal FROM Producto,Sucursales;


--de este codigo saque la salida testoutput
SELECT distinct Producto.Producto,Categoria.Categoria,SubCategoria.SubCategoria,StockProductos.Cantidad,Sucursales.Sucursal FROM StockProductos
INNER JOIN Producto ON StockProductos.Cod_Producto = Producto.Cod_Producto
INNER JOIN Sucursales ON StockProductos.Cod_Sucursal = Sucursales.Cod_Sucursal
INNER JOIN SubCategoria ON Producto.Cod_SubCategoria = SubCategoria.Cod_SubCategoria
INNER JOIN Categoria ON SubCategoria.Cod_Categoria =Categoria.Cod_Categoria
WHERE NOT Sucursales.Sucursal='NA';

SELECT distinct Categoria FROM Categoria
SELECT distinct SubCategoria FROM SubCategoria
SELECT distinct Producto FROM Producto

select distinct Sucursal from Sucursales