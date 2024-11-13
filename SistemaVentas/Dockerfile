# Etapa de compilación de Angular
FROM node:18.17.1-alpine AS build

# Configurar el directorio de trabajo
WORKDIR /usr/src/app

# Copiar package.json y package-lock.json para instalar dependencias
COPY package.json package-lock.json ./

# Instalar las dependencias de Angular
RUN npm install --legacy-peer-deps

# Copiar el código fuente de Angular al contenedor
COPY . .

# Generar el build de Angular en el directorio `dist`
RUN npm run build --prod

# Etapa de producción con Nginx
FROM nginx:stable-alpine

# Crear un volumen con el nombre /temp
VOLUME /temp

# Eliminar el contenido de la carpeta /usr/share/nginx/html/*
RUN rm -rf /usr/share/nginx/html/*

# Copiar la configuración de Nginx
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./mime.types /etc/nginx/mime.types

# Copiar el contenido del build de Angular al directorio de Nginx
COPY --from=build /usr/src/app/dist/sistema-ventas /usr/share/nginx/html

# Exponer el puerto 80
EXPOSE 80

# Ejecutar el comando para mantener nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]
