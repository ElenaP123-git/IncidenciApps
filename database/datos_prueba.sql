
BEGIN;

-- ---------------------------------------------------------------------
-- EMPRESA
-- ---------------------------------------------------------------------
INSERT INTO Empresa (cif, nombre, fecha_alta) VALUES
    ('B41100001', 'Talleres Mecánicos Norte S.L.',   '2025-09-01'),
    ('B41100002', 'Distribuciones Levante S.L.',     '2025-10-15'),
    ('B41100003', 'Clínica Dental Sonrisa S.L.',     '2025-11-03'),
    ('A41100004', 'Hostelería Plaza Mayor S.A.',     '2026-01-20'),
    ('B41100005', 'Academia Futuro Formación S.L.',  '2026-03-09');

-- ---------------------------------------------------------------------
-- USUARIO
-- ---------------------------------------------------------------------
INSERT INTO Usuario (cif, nombre, email, password_hash, rol) VALUES
    -- Talleres Mecánicos Norte
    ('B41100001', 'Isabel Vega Marín',     'isabel.vega@talleresnorte.example',     '$2b$10$FICTICIOhashDePruebaNoEsUnaContrasenaReal0000000000000', 'admin'),
    ('B41100001', 'Carlos Ruiz Ortega',    'carlos.ruiz@talleresnorte.example',     '$2b$10$FICTICIOhashDePruebaNoEsUnaContrasenaReal0000000000000', 'tecnico'),
    ('B41100001', 'Laura Gómez Pérez',     'laura.gomez@talleresnorte.example',     '$2b$10$FICTICIOhashDePruebaNoEsUnaContrasenaReal0000000000000', 'cliente'),
    -- Distribuciones Levante
    ('B41100002', 'Raúl Benítez Soto',     'raul.benitez@distlevante.example',      '$2b$10$FICTICIOhashDePruebaNoEsUnaContrasenaReal0000000000000', 'admin'),
    ('B41100002', 'Miguel Torres Vidal',   'miguel.torres@distlevante.example',     '$2b$10$FICTICIOhashDePruebaNoEsUnaContrasenaReal0000000000000', 'tecnico'),
    ('B41100002', 'Ana Sánchez Mora',      'ana.sanchez@distlevante.example',       '$2b$10$FICTICIOhashDePruebaNoEsUnaContrasenaReal0000000000000', 'cliente'),
    -- Clínica Dental Sonrisa
    ('B41100003', 'Javier Molina Cano',    'javier.molina@clinicasonrisa.example',  '$2b$10$FICTICIOhashDePruebaNoEsUnaContrasenaReal0000000000000', 'tecnico'),
    ('B41100003', 'Elena Navarro Gil',     'elena.navarro@clinicasonrisa.example',  '$2b$10$FICTICIOhashDePruebaNoEsUnaContrasenaReal0000000000000', 'cliente'),
    -- Hostelería Plaza Mayor
    ('A41100004', 'Sofía Delgado Reyes',   'sofia.delgado@plazamayor.example',      '$2b$10$FICTICIOhashDePruebaNoEsUnaContrasenaReal0000000000000', 'tecnico'),
    ('A41100004', 'Pablo Ramos Ibáñez',    'pablo.ramos@plazamayor.example',        '$2b$10$FICTICIOhashDePruebaNoEsUnaContrasenaReal0000000000000', 'cliente'),
    -- Academia Futuro Formación
    ('B41100005', 'David Herrera Luna',    'david.herrera@academiafuturo.example',  '$2b$10$FICTICIOhashDePruebaNoEsUnaContrasenaReal0000000000000', 'tecnico'),
    ('B41100005', 'Marta Castillo Rubio',  'marta.castillo@academiafuturo.example', '$2b$10$FICTICIOhashDePruebaNoEsUnaContrasenaReal0000000000000', 'cliente');

-- ---------------------------------------------------------------------
-- TIPO_INCIDENCIA
-- ---------------------------------------------------------------------
INSERT INTO Tipo_Incidencia (cif, nombre) VALUES
    ('B41100001', 'Avería de equipo'),
    ('B41100001', 'Solicitud de material'),
    ('B41100002', 'Fallo de software'),
    ('B41100002', 'Problema de red'),
    ('B41100003', 'Equipo médico'),
    ('B41100003', 'Acceso y permisos'),
    ('A41100004', 'Impresora y TPV'),
    ('A41100004', 'Mantenimiento'),
    ('B41100005', 'Aula y proyector'),
    ('B41100005', 'Cuenta de usuario');

-- ---------------------------------------------------------------------
-- INCIDENCIA
--   creador: siempre un usuario con rol 'cliente' de la misma empresa
--   tecnico: usuario con rol 'tecnico' de la misma empresa, o NULL si
--            la incidencia aún no está asignada
-- ---------------------------------------------------------------------
INSERT INTO Incidencia (cif_empresa, creador, tecnico, tipo, descripcion, estado, fecha_creacion, prioridad) VALUES
    -- Talleres Mecánicos Norte
    ('B41100001',
     (SELECT id FROM Usuario WHERE email = 'laura.gomez@talleresnorte.example'),
     (SELECT id FROM Usuario WHERE email = 'carlos.ruiz@talleresnorte.example'),
     (SELECT id FROM Tipo_Incidencia WHERE cif = 'B41100001' AND nombre = 'Avería de equipo'),
     'El elevador del taller 2 no sube con carga y hace un ruido metálico.',
     'en_progreso', '2026-11-02 09:15:00', 'alta'),

    ('B41100001',
     (SELECT id FROM Usuario WHERE email = 'laura.gomez@talleresnorte.example'),
     (SELECT id FROM Usuario WHERE email = 'carlos.ruiz@talleresnorte.example'),
     (SELECT id FROM Tipo_Incidencia WHERE cif = 'B41100001' AND nombre = 'Solicitud de material'),
     'Faltan guantes de nitrilo y mascarillas en el almacén de seguridad.',
     'resuelta', '2026-10-20 08:40:00', 'baja'),

    ('B41100001',
     (SELECT id FROM Usuario WHERE email = 'laura.gomez@talleresnorte.example'),
     NULL,
     (SELECT id FROM Tipo_Incidencia WHERE cif = 'B41100001' AND nombre = 'Avería de equipo'),
     'El ordenador de recepción se reinicia solo varias veces al día.',
     'abierta', '2026-11-17 11:05:00', 'media'),

    -- Distribuciones Levante
    ('B41100002',
     (SELECT id FROM Usuario WHERE email = 'ana.sanchez@distlevante.example'),
     (SELECT id FROM Usuario WHERE email = 'miguel.torres@distlevante.example'),
     (SELECT id FROM Tipo_Incidencia WHERE cif = 'B41100002' AND nombre = 'Fallo de software'),
     'El sistema de albaranes no deja guardar pedidos nuevos desde esta mañana.',
     'en_progreso', '2026-11-10 10:30:00', 'critica'),

    ('B41100002',
     (SELECT id FROM Usuario WHERE email = 'ana.sanchez@distlevante.example'),
     (SELECT id FROM Usuario WHERE email = 'miguel.torres@distlevante.example'),
     (SELECT id FROM Tipo_Incidencia WHERE cif = 'B41100002' AND nombre = 'Problema de red'),
     'Sin conexión wifi en el almacén B, los lectores de códigos no sincronizan.',
     'cerrada', '2026-09-28 16:20:00', 'alta'),

    ('B41100002',
     (SELECT id FROM Usuario WHERE email = 'ana.sanchez@distlevante.example'),
     NULL,
     (SELECT id FROM Tipo_Incidencia WHERE cif = 'B41100002' AND nombre = 'Fallo de software'),
     'La aplicación de rutas muestra las entregas de ayer en lugar de las de hoy.',
     'abierta', '2026-11-18 09:00:00', 'baja'),

    -- Clínica Dental Sonrisa
    ('B41100003',
     (SELECT id FROM Usuario WHERE email = 'elena.navarro@clinicasonrisa.example'),
     (SELECT id FROM Usuario WHERE email = 'javier.molina@clinicasonrisa.example'),
     (SELECT id FROM Tipo_Incidencia WHERE cif = 'B41100003' AND nombre = 'Equipo médico'),
     'La lámpara de fotocurado del gabinete 1 no enciende.',
     'en_progreso', '2026-11-12 12:45:00', 'alta'),

    ('B41100003',
     (SELECT id FROM Usuario WHERE email = 'elena.navarro@clinicasonrisa.example'),
     (SELECT id FROM Usuario WHERE email = 'javier.molina@clinicasonrisa.example'),
     (SELECT id FROM Tipo_Incidencia WHERE cif = 'B41100003' AND nombre = 'Acceso y permisos'),
     'No puedo abrir el historial de pacientes desde el puesto de recepción.',
     'resuelta', '2026-11-05 15:10:00', 'media'),

    -- Hostelería Plaza Mayor
    ('A41100004',
     (SELECT id FROM Usuario WHERE email = 'pablo.ramos@plazamayor.example'),
     (SELECT id FROM Usuario WHERE email = 'sofia.delgado@plazamayor.example'),
     (SELECT id FROM Tipo_Incidencia WHERE cif = 'A41100004' AND nombre = 'Impresora y TPV'),
     'El TPV de la terraza no imprime los tickets de cobro.',
     'en_progreso', '2026-11-14 19:25:00', 'alta'),

    ('A41100004',
     (SELECT id FROM Usuario WHERE email = 'pablo.ramos@plazamayor.example'),
     NULL,
     (SELECT id FROM Tipo_Incidencia WHERE cif = 'A41100004' AND nombre = 'Mantenimiento'),
     'La campana extractora de la cocina hace un zumbido constante.',
     'abierta', '2026-11-16 08:10:00', 'media'),

    -- Academia Futuro Formación
    ('B41100005',
     (SELECT id FROM Usuario WHERE email = 'marta.castillo@academiafuturo.example'),
     (SELECT id FROM Usuario WHERE email = 'david.herrera@academiafuturo.example'),
     (SELECT id FROM Tipo_Incidencia WHERE cif = 'B41100005' AND nombre = 'Aula y proyector'),
     'El proyector del aula 3 muestra la imagen con un tono amarillento.',
     'resuelta', '2026-10-30 09:50:00', 'media'),

    ('B41100005',
     (SELECT id FROM Usuario WHERE email = 'marta.castillo@academiafuturo.example'),
     (SELECT id FROM Usuario WHERE email = 'david.herrera@academiafuturo.example'),
     (SELECT id FROM Tipo_Incidencia WHERE cif = 'B41100005' AND nombre = 'Cuenta de usuario'),
     'Alta de cuenta de correo y plataforma para un profesor que se incorpora.',
     'cerrada', '2026-10-05 13:00:00', 'baja');

-- ---------------------------------------------------------------------
-- COMENTARIO 
--   autor: el creador o el técnico de esa incidencia
--   La incidencia se localiza por el inicio de su descripción.
-- ---------------------------------------------------------------------
INSERT INTO Comentario (incidencia, autor, texto, fecha_creacion) VALUES
    -- Elevador del taller 2
    ((SELECT id FROM Incidencia WHERE descripcion LIKE 'El elevador del taller 2%'),
     (SELECT id FROM Usuario WHERE email = 'carlos.ruiz@talleresnorte.example'),
     'Revisado el sistema hidráulico: hay una pérdida de aceite en el cilindro principal.',
     '2026-11-02 12:30:00'),
    ((SELECT id FROM Incidencia WHERE descripcion LIKE 'El elevador del taller 2%'),
     (SELECT id FROM Usuario WHERE email = 'laura.gomez@talleresnorte.example'),
     'Entendido. Dejamos el elevador precintado hasta que esté arreglado.',
     '2026-11-02 13:05:00'),
    ((SELECT id FROM Incidencia WHERE descripcion LIKE 'El elevador del taller 2%'),
     (SELECT id FROM Usuario WHERE email = 'carlos.ruiz@talleresnorte.example'),
     'He pedido el kit de juntas al proveedor, llega el jueves.',
     '2026-11-03 09:00:00'),

    -- Guantes y mascarillas
    ((SELECT id FROM Incidencia WHERE descripcion LIKE 'Faltan guantes de nitrilo%'),
     (SELECT id FROM Usuario WHERE email = 'carlos.ruiz@talleresnorte.example'),
     'Pedido realizado y material repuesto en el almacén.',
     '2026-10-21 10:15:00'),

    -- Ordenador de recepción (sin técnico)
    ((SELECT id FROM Incidencia WHERE descripcion LIKE 'El ordenador de recepción%'),
     (SELECT id FROM Usuario WHERE email = 'laura.gomez@talleresnorte.example'),
     'Ocurre sobre todo por la tarde, cuando hay más clientes en el taller.',
     '2026-11-17 11:30:00'),

    -- Sistema de albaranes
    ((SELECT id FROM Incidencia WHERE descripcion LIKE 'El sistema de albaranes%'),
     (SELECT id FROM Usuario WHERE email = 'miguel.torres@distlevante.example'),
     'Detectado un error de conexión con la base de datos. Estoy reiniciando el servicio.',
     '2026-11-10 10:50:00'),
    ((SELECT id FROM Incidencia WHERE descripcion LIKE 'El sistema de albaranes%'),
     (SELECT id FROM Usuario WHERE email = 'ana.sanchez@distlevante.example'),
     'Seguimos sin poder guardar pedidos, hay camiones esperando para cargar.',
     '2026-11-10 11:20:00'),

    -- Wifi almacén B
    ((SELECT id FROM Incidencia WHERE descripcion LIKE 'Sin conexión wifi en el almacén B%'),
     (SELECT id FROM Usuario WHERE email = 'miguel.torres@distlevante.example'),
     'Sustituido el punto de acceso averiado. Cobertura restablecida.',
     '2026-09-29 09:40:00'),
    ((SELECT id FROM Incidencia WHERE descripcion LIKE 'Sin conexión wifi en el almacén B%'),
     (SELECT id FROM Usuario WHERE email = 'ana.sanchez@distlevante.example'),
     'Confirmado, los lectores ya sincronizan. Se puede cerrar.',
     '2026-09-29 12:10:00'),

    -- Lámpara de fotocurado
    ((SELECT id FROM Incidencia WHERE descripcion LIKE 'La lámpara de fotocurado%'),
     (SELECT id FROM Usuario WHERE email = 'javier.molina@clinicasonrisa.example'),
     'La batería no carga. Contacto con el fabricante para pedir una nueva.',
     '2026-11-13 09:30:00'),

    -- Historial de pacientes
    ((SELECT id FROM Incidencia WHERE descripcion LIKE 'No puedo abrir el historial%'),
     (SELECT id FROM Usuario WHERE email = 'javier.molina@clinicasonrisa.example'),
     'Faltaba el permiso de lectura en tu perfil. Ya está corregido, prueba de nuevo.',
     '2026-11-05 16:00:00'),
    ((SELECT id FROM Incidencia WHERE descripcion LIKE 'No puedo abrir el historial%'),
     (SELECT id FROM Usuario WHERE email = 'elena.navarro@clinicasonrisa.example'),
     'Ahora sí puedo acceder, gracias.',
     '2026-11-05 16:25:00'),

    -- TPV de la terraza
    ((SELECT id FROM Incidencia WHERE descripcion LIKE 'El TPV de la terraza%'),
     (SELECT id FROM Usuario WHERE email = 'sofia.delgado@plazamayor.example'),
     'Cambiado el rollo y limpiado el cabezal, sigue sin imprimir. Probaré con otra impresora.',
     '2026-11-15 10:00:00'),

    -- Campana extractora (sin técnico)
    ((SELECT id FROM Incidencia WHERE descripcion LIKE 'La campana extractora%'),
     (SELECT id FROM Usuario WHERE email = 'pablo.ramos@plazamayor.example'),
     'El ruido aumenta cuando se enciende la segunda velocidad.',
     '2026-11-16 08:30:00'),

    -- Proyector del aula 3
    ((SELECT id FROM Incidencia WHERE descripcion LIKE 'El proyector del aula 3%'),
     (SELECT id FROM Usuario WHERE email = 'david.herrera@academiafuturo.example'),
     'Ajustados los colores y limpiado el filtro de la lámpara. Imagen correcta.',
     '2026-10-30 12:15:00'),

    -- Alta de cuenta del profesor
    ((SELECT id FROM Incidencia WHERE descripcion LIKE 'Alta de cuenta de correo%'),
     (SELECT id FROM Usuario WHERE email = 'david.herrera@academiafuturo.example'),
     'Cuenta creada y credenciales enviadas al profesor.',
     '2026-10-06 09:20:00');

COMMIT;
