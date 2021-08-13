# DelilahRestoEmilio
 Proyecto Tercer Sprint DWFS Acámica
 Emilio Oscar Almeida

 USO DE LA API:

 DOCUMENTACION: 
 Archivo swagger.yaml  Para verlo mejor, puede copiarlo y abrirlo con :  https://editor.swagger.io/

 IINSTALACION:
 Clonar el repositorio de: https://github.com/EmilioAlmeida/DelilahRestoEmilio
 Instalación de Dependecias:  npm i  { express, sequelize, mysql2, jsonwebtoken, cors, nodemon }

 BASE DE DATOS SQL: 
 DOCUMENTO: delilarestoemilio.sql
 Instalar Xampp y abrir el panel de control, iniciando MySQL y Apache.
 Abrir el navegador con localhost, phpmyadmin y en sql crear el schema "delilahrestoemilio" y replicar las tablas del documento.

 INICIO DEL SERVIDOR:  
 En la terminal:  nodemom index.js
 Recibirá el mensaje: "El servidor está funcionando correctamente en puerto 3000"

 PROBAR LA API CON POSTMAN: https://www.postman.com/

 1)  USUARIOS: "http://localhost:3000/usuarios"
 a)  METODO POST -  Crear un nuevo usuario con el siguiente formato de body en raw, json:
 {
     "username": "EmiOA",
     "fullname": "Emilio Almeida",
     "email": "almeida.emiliooscar@gmail.com",
     "phone": "3516804386",
     "address": "Gral Bustos 200",
     "password": "MiclavePersonal",
     "is_admin": false
 }

*El campo "is_admin" está seteado para que al poner "false" o "true"; "0" o "1"; siempre se cargue false. Es decir usuario no administrador.
El administrador está ya cargado previamente, con el sign 5
"username": "Emilio",
"password": "28Agosto"

b)  LOGIN: "http://localhost:3000/login"
METODO POST
BODY: raw, jason
{
    "username": "Emilio",
    "password": "28Agosto"

}
* para el caso de querer loguear el administrador; en caso de querer loguear otro usuario existente o el creado recientemente, reemplazar los datos del username y del password, por los correspondientes.

Se recibe el Token que utilizará para las operaciones CRUD de las 3 tablas.

c)  GET: ( Se debe loguear previamente) "http://localhost:3000/usuarios"
METODO GET
Autorización BEARER TOKEN y copiar el Token recibido en el login
a) Si el usuario logueado es un usuario común, podrá ver sus datos.
b) Si quien está logueado es el Administrador, verá los datos de todos los usuarios.


2)  PRODUCTOS  "http://localhost:3000/productos"
a)  METODO GET
Todos los usuarios pueden ver los productos existentes ( Colocando su token de Login en Autorización, Bearer Token)

b)  METODO POST (Solo admnistrador puede cargar nuevos productos)
formato:
{
    "product_name": "Pechuguitas rellenas",
    "price": 350,
    "stock": 1, (ó 0)
    "img_url": "dirección de la imagen del producto",
    "category": "carnes"
}

c)  METODO PUT (Solo admnistrador puede modificar productos)
formato:
{
    "product_name": "Pechuguitas de Pollo rellenas de jamón y queso",
    "price": 350,
    "stock": 1,
    "img_url": "dirección de la imagen del producto",
    "category": "carnes"
}

d)  ELIMINAR PRODUCTOS: "http://localhost:3000/productos/:id"  (Se debe colocar como parámetro el ID del producto a eliminar)
METODO DELETE (Solo administrador puede eliminar productos)


3)  PEDIDOS  "http://localhost:3000/pedidos"
a)  CREAR PEDIDO
METODO POST
formato:
{
    "products": [
        {
            "product_id": 2,
            "quantity": 3
        }, {
            "product_id": 7,
            "quantity": 2
        }
    ],
    "payment_method": "Efectivo"
}

b) VER PEDIDOS
METODO GET
*El usuario común verá la información de su pedido
*El usuario con rol de administrador, verá todos los pedidos, y podrá cruzar la información con los datos de la tabla "info_pedidos"

c) MODIFICAR EL ESTADO DEL PEDIDO  ( Solo el administrador)
"http://localhost:3000/pedidos/:id"  ( reemplazar :id  por el id del pedido a modificar)
METODO PUT
formato del body, raw, jason:
{
    "status": "Enviado"
}

d) ELIMINAR PEDIDOS  ( solo el administrador)
"http://localhost:3000/pedidos/:id"  ( reemplazar :id  por el id del pedido a eliminar)
METODO DELETE

CONDICIONES PARA APROBAR EL PROYECTO:
* Poder registrar un nuevo usuario. 
* Poder listar todos los productos disponibles.
* Poder generar un nuevo pedido, con los platos que desea.
* El administrador debe poder actualizar el status del pedido.
* El administrador debe poder crear, modificar y eliminar productos.
* El usuario no administrador no debe poder crear, modificar o eliminar productos; modificar o eliminar pedidos ni ver la información de los demás usuarios.