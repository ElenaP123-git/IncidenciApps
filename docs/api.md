
# CRUD INCIDENCIAS
| Método | Ruta | Qué hace | Devuelve |
|--------|------|----------|----------|
| GET    | `/api/incidencias` | Lista todas las incidencias de la empresa del usuario | 200 + lista |
| GET    | `/api/incidencias/id` | Muestra los detalles de una incidencia | 200 o 404 |
| POST   | `/api/incidencias` | Crea una nueva incidencia asociada a una empresa, un creador y un tipo | 201 o 400 |
| PUT    | `/api/incidencias/id` | Modifica la descripción, estado, prioridad o técnico asignado | 200, 400 o 404 |
| DELETE | `/api/incidencias/id` | Elimina una incidencia registrada | 200 o 404


# CRUD USUARIOS
| Método | Ruta | Qué hace | Devuelve |
| --- | --- | --- | --- |
| GET | `/api/usuarios/id` | Muestra los datos de un usuario concreto. | 200 o 404 |
| POST | `/api/usuarios` | Registra un nuevo usuario asociado a una empresa. | 201 o 400 |
| PUT | `/api/usuarios/id` | Modifica los datos de un usuario, como nombre, email o rol. | 200, 400 o 404 |
| DELETE | `/api/usuarios/id` | Elimina un usuario del sistema. | 200 o 404 |


# CRUD EMPRESA


| Método | Ruta | Qué hace | Devuelve |
| --- | --- | --- | --- |
| GET | `/api/empresas` | Lista todas las empresas registradas. | 200 + lista |
| GET | `/api/empresas/cif` | Muestra los datos de una empresa concreta. | 200 o 404 |
| GET | `/api/empresas/cif/usuarios` | Lista los usuarios registrados en la empresa. | 200 + lista
| POST | `/api/empresas` | Registra una nueva empresa en el sistema. | 201 o 400 |
| PUT | `/api/empresas/cif` | Modifica los datos de una empresa, como su nombre. | 200, 400 o 404 |
| DELETE | `/api/empresas/cif` | Elimina una empresa del sistema si no tiene registros asociados. | 200 o 404 |


## CRUD COMENTARIOS


| Método | Ruta | Qué hace | Devuelve |
| --- | --- | --- | --- |
| GET | `/api/comentarios` | Lista los comentarios registrados. | 200 + lista |
| GET | `/api/comentarios/id` | Muestra un comentario concreto. | 200 o 404 |
| POST | `/api/comentarios` | Crea un comentario asociado a una incidencia y a un usuario autor. | 201 o 400 |
| PUT | `/api/comentarios/id` | Modifica el texto de un comentario. | 200, 400 o 404 |
| DELETE | `/api/comentarios/id` | Elimina un comentario registrado. | 200 o 404 |


## 4. CRUD TIPO INCIDENCIAS


| Método | Ruta | Qué hace | Devuelve
| --- | --- | --- | --- |
| GET | `/api/tipos-incidencia` | Lista todos los tipos de incidencias de la empresa. | 200 + lista |
| GET | `/api/tipos-incidencia/id` | Muestra los datos de un tipo de incidencia concreto. | 200 o 404 |
| POST | `/api/tipos-incidencia` | Crea un nuevo tipo de incidencia asociado a una empresa. | 201 o 400 |
| PUT | `/api/tipos-incidencia/id` | Modifica el nombre de un tipo de incidencia. | 200, 400 o 404 |
| DELETE | `/api/tipos-incidencia/id` | Elimina un tipo de incidencia si no está siendo utilizado. | 200 o 404 |
