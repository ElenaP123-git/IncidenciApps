# Documentación del Proyecto: IncidenciApps

---

## 1. Descripción del Proyecto

### 1.1 Visión General
El proyecto consiste en el desarrollo de **IncidenciApps**, una plataforma web/móvil orientada a empresas que permite gestionar el ciclo de vida completo de incidencias internas de forma eficiente y personalizada.

### 1.2 Características Principales
* **Gestión Multirrol:** 
  * **Administrador:** Crea empresas, gestiona usuarios y roles, parametriza tipos de incidencias y niveles de prioridad/urgencia.
  * **Trabajador:** Reporta nuevas incidencias, adjunta imágenes/archivos descriptivos y hace seguimiento de sus tickets.
  * **Técnico / Encargado:** Visualiza incidencias pendientes, se asigna tickets, añade comentarios de avance, envía avisos y marca las incidencias como resueltas.
* **Personalización:** Adaptación de tipos de incidencias y prioridades según el sector de cada empresa.
* **Módulo de Análisis:** Dashboard estadístico e historial para el monitoreo de resolución de incidencias.

### 1.3 Análisis DAFO

#### Fortalezas
* Problema real y sencillo de entender.
* Facilidad de uso.
* No se limita a ningún sector.
* Solución barata para empresas pequeñas.
* Escalable según las necesidades de los usuarios.

#### Debilidades
* Amplia oferta de este tipo de aplicaciones.
* Soporte y mantenimiento requerido al ser app de pago.
* Reputación o fiabilidad requerida por parte de las empresas.
* Si una empresa usa otro sistema, migrarse a esta app puede ser tedioso y por lo tanto pueden no hacerlo.

#### Oportunidades
* Puede usarse en diferentes sectores (institutos, academias, conservatorios...).
* Ampliación a otros sistemas de rol.
* Crear automatizaciones que hagan más cómodo su uso.
* Poder analizar estadísticas de incidencias.

#### Amenazas
* Hay información que puede ser sensible, por lo que la seguridad tiene que ser una prioridad.
* Las empresas pueden sentir rechazo a cambiar su manera de reportar incidencias actuales.
* Hay competidores consolidados con gran cuota de mercado.

---

## 2. Estructura del Equipo (Equipo Scrum)

El desarrollo del proyecto se gestionará bajo la metodología ágil **Scrum**, con la siguiente distribución de roles y responsabilidades:

| Rol | Persona | Responsabilidades |
| :--- | :--- | :--- |
| **Product Owner** | Jesús (profesor) | Decide qué se hace y en qué orden. Mantiene y prioriza el backlog. |
| **Scrum Master** | Jesús | Organiza las reuniones, detecta bloqueos y vigila que se siga Scrum. |
| **Equipo de Desarrollo** | Jesús y Elena | Diseñan, programan y prueban las historias del sprint. |

---

## 3. Ejecución del Proyecto

### 3.1 Ceremonias Scrum

| Ceremonia | Cuándo | Duración |
| :--- | :--- | :--- |
| **Sprint planning** | Todos los lunes | 30 min |
| **Daily** | A la hora del recreo | 5-10 min |
| **Sprint Review** | Todos los viernes | 15 min |
| **Retrospectiva** | Todos los viernes | 15 min |

### 3.2 Gestión del Trabajo (Trello & Backlog)
El flujo de trabajo se coordina mediante un tablero Kanban en Trello:

* **Enlace a Trello:** [Tablero Trello](https://trello.com/invite/b/6ab6228b88c50cde8b5af38d/ATTlb79532fdb0846ee67ee4a1676093f5d086EFE957/elena-pablo-benitez)
* **Estructura de Columnas:**
  1. **Pendiente de priorizar:** Logger, Gestión de usuarios y roles, Creación empresa, CRUD Incidencias, Gestión de prioridades, Creación de tickets, Adjuntar img tickets, Registrar incidencias, Asignación de incidencias, Mensajería cliente-técnico, Actualización estado tickets, Envío span, Dashboard.
  2. **To do:** Tareas priorizadas para el inicio de sprint.
  3. **Doing:** Planificación del proyecto / Tareas en curso.
  4. **En revisión:** Pruebas y QA.
  5. **Done:** Tareas completadas.

### 3.3 Control de Versiones y Código (Git)
* **Enlace a Git:** [Repositorio GitHub - IncidenciApps](https://github.com/ElenaP123-git/IncidenciApps.git)
* **Política de Commits:** Los comentarios de los commits serán descriptivos dependiendo de lo que se haya actualizado en el proyecto (ej: `subo actualización en dashboard`).