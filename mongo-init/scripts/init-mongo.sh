#!/bin/bash

# Variables de autenticación
MONGO_USER="admin"
MONGO_PASS="admin"
MONGO_HOST="mongo"

# Crear un documento de prueba en la base de datos (esto asegura que la base de datos se cree)
echo '{"name": "test"}' | mongoimport --host $MONGO_HOST --username $MONGO_USER --password $MONGO_PASS --authenticationDatabase admin --db MeanSistemaVentas --collection test --type json --jsonArray

# Importar inventario
mongoimport --host $MONGO_HOST --username $MONGO_USER --password $MONGO_PASS --authenticationDatabase admin --db MeanSistemaVentas --collection Inventario --type json --file /docker-entrypoint-initdb.d/datos/Inventario.json --jsonArray

# Importar producto
mongoimport --host $MONGO_HOST --username $MONGO_USER --password $MONGO_PASS --authenticationDatabase admin --db MeanSistemaVentas --collection Producto --type json --file /docker-entrypoint-initdb.d/datos/Producto.json --jsonArray

# Importar proveedor
mongoimport --host $MONGO_HOST --username $MONGO_USER --password $MONGO_PASS --authenticationDatabase admin --db MeanSistemaVentas --collection Proveedor --type json --file /docker-entrypoint-initdb.d/datos/Proveedor.json --jsonArray

# Importar transportista
mongoimport --host $MONGO_HOST --username $MONGO_USER --password $MONGO_PASS --authenticationDatabase admin --db MeanSistemaVentas --collection Transportista --type json --file /docker-entrypoint-initdb.d/datos/Transportista.json --jsonArray

# Importar ventas
mongoimport --host $MONGO_HOST --username $MONGO_USER --password $MONGO_PASS --authenticationDatabase admin --db MeanSistemaVentas --collection Ventas --type json --file /docker-entrypoint-initdb.d/datos/Ventas.json --jsonArray

# Importar compra
mongoimport --host $MONGO_HOST --username $MONGO_USER --password $MONGO_PASS --authenticationDatabase admin --db MeanSistemaVentas --collection Compra --type json --file /docker-entrypoint-initdb.d/datos/Compra.json --jsonArray

# Importar carrito
mongoimport --host $MONGO_HOST --username $MONGO_USER --password $MONGO_PASS --authenticationDatabase admin --db MeanSistemaVentas --collection Carrito --type json --file /docker-entrypoint-initdb.d/datos/Carrito.json --jsonArray
