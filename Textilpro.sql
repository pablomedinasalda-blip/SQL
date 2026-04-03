CREATE DATABASE Textilpro ;
USE Textilpro ;

CREATE TABLE tipo_material (
    id_tipo_material INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);
INSERT INTO tipo_material VALUES
(1,'fibra natural'),
(2,'sintetica'),
(3,'hilo'),
(4,'tinte'),
(5,'fibra natural'),
(6,'sintetica'),
(7,'hilo'),
(8,'tinte'),
(9,'fibra natural'),
(10,'sintetica') ;

SELECT * FROM tipo_material ;

CREATE TABLE proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    pais_origen VARCHAR(50)
);

INSERT INTO proveedor VALUES
(1,'Proveedor A','Colombia'),
(2,'Proveedor B','China'),
(3,'Proveedor C','Peru'),
(4,'Proveedor D','Brasil'),
(5,'Proveedor E','Argentina'),
(6,'Proveedor F','India'),
(7,'Proveedor G','Mexico'),
(8,'Proveedor H','Chile'),
(9,'Proveedor I','Ecuador'),
(10,'Proveedor J','España') ;

SELECT * FROM proveedor ;

CREATE TABLE materia_prima (
    codigo INT PRIMARY KEY,
    descripcion VARCHAR(100),
    id_tipo_material INT,
    unidad_medida VARCHAR(20),
    caracteristicas TEXT,
    id_proveedor INT,
    precio_unitario DECIMAL(10,2),
    stock_minimo INT,
    FOREIGN KEY (id_tipo_material) REFERENCES tipo_material(id_tipo_material),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

INSERT INTO materia_prima VALUES
(1,'Algodon',1,'kg','suave',1,60,100),
(2,'Poliester',2,'kg','resistente',2,40,200),
(3,'Hilo blanco',3,'rollo','fino',3,30,50),
(4,'Tinte rojo',4,'litro','intenso',4,55,30),
(5,'Lana',1,'kg','caliente',5,70,80),
(6,'Seda',1,'kg','delicada',6,90,20),
(7,'Hilo negro',3,'rollo','grueso',3,35,60),
(8,'Tinte azul',4,'litro','suave',4,45,40),
(9,'Nylon',2,'kg','flexible',2,65,90),
(10,'Algodon premium',1,'kg','extra suave',1,80,70) ;

SELECT * FROM materia_prima ;

CREATE TABLE tipo_maquina (
    id_tipo_maquina INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

INSERT INTO tipo_maquina VALUES
(1,'telar'),
(2,'maquina de coser'),
(3,'cortadora'),
(4,'estampadora'),
(5,'telar'),
(6,'maquina de coser'),
(7,'cortadora'),
(8,'estampadora'),
(9,'telar'),
(10,'maquina de coser');

SELECT * FROM tipo_maquina ;

CREATE TABLE maquinas (
    numero_serie INT PRIMARY KEY,
    id_tipo_maquina INT,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    anio_fabricacion INT,
    capacidad_produccion INT,
    consumo_electrico DECIMAL(10,2),
    ubicacion VARCHAR(50),
    estado_operativo VARCHAR(50),
    fecha_ultimo_mantenimiento DATE,
    FOREIGN KEY (id_tipo_maquina) REFERENCES tipo_maquina(id_tipo_maquina)
);

INSERT INTO maquinas VALUES
(1,1,'Toyota','T1',2015,100,50,'A1','activo','2024-01-01'),
(2,2,'Singer','S1',2018,80,30,'A2','activo','2024-02-01'),
(3,3,'CutterPro','C1',2020,120,40,'A3','activo','2024-03-01'),
(4,4,'PrintX','P1',2019,90,35,'A4','activo','2024-01-15'),
(5,1,'Toyota','T2',2017,110,55,'A1','activo','2024-02-10'),
(6,2,'Singer','S2',2021,85,28,'A2','activo','2024-03-05'),
(7,3,'CutterPro','C2',2022,130,45,'A3','activo','2024-01-20'),
(8,4,'PrintX','P2',2016,95,33,'A4','activo','2024-02-25'),
(9,1,'Toyota','T3',2014,105,52,'A1','activo','2024-03-10'),
(10,2,'Singer','S3',2023,88,29,'A2','activo','2024-01-30') ;

CREATE TABLE productos (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100),
    categoria VARCHAR(50),
    subcategoria VARCHAR(50),
    composicion VARCHAR(100),
    dimensiones VARCHAR(50),
    peso DECIMAL(10,2),
    colores VARCHAR(100),
    procesos_fabricacion TEXT,
    tiempo_estandar INT,
    costo_objetivo DECIMAL(10,2)
);

INSERT INTO productos VALUES
(1,'Camiseta','ropa','Camisetas','algodon','M',0.2,'rojo', 'tejido, costura',5,10),
(2,'Jean','ropa','Pantalones','denim','L',0.8,'azul','corte, costura',8,20),
(3,'Vestido','ropa','Vestidos','algodon','S',0.3,'rojo','tejido, estampado',6,15),
(4,'Sabana','hogar','Sabanas','algodon','2x2',1.2,'blanco','tejido',7,25),
(5,'Cortina','hogar','Cortinas','poliester','2x3',1.5,'gris','corte',9,30),
(6,'Chaqueta','ropa','Chaquetas','cuero','L',1.8,'negro','costura',12,50),
(7,'Pantalon deportivo','ropa','Pantalones','nylon','M',0.5,'negro','costura',6,18),
(8,'Blusa','ropa','Camisetas','seda','S',0.2,'blanco','tejido',5,22),
(9,'Falda','ropa','Vestidos','algodon','M',0.3,'azul','costura',6,16),
(10,'Camiseta premium','ropa','Camisetas','algodon','L',0.25,'verde','tejido',5,14);

CREATE TABLE clientes (
    codigo INT PRIMARY KEY,
    razon_social VARCHAR(100),
    ruc VARCHAR(20),
    direccion_fiscal VARCHAR(100),
    telefono VARCHAR(20),
    correo VARCHAR(100),
    persona_contacto VARCHAR(100),
    limite_credito DECIMAL(10,2),
    condiciones_pago VARCHAR(50),
    categoria VARCHAR(50)
);

INSERT INTO clientes VALUES
(1,'ModaTex','123','Dir1','111','a@mail.com','Juan',5000,'30 dias','Alta'),
(2,'RopaPlus','456','Dir2','222','b@mail.com','Ana',6000,'30 dias','Media'),
(3,'FashionPro','789','Dir3','333','c@mail.com','Luis',7000,'Contado','Alta'),
(4,'TextilMax','321','Dir4','444','d@mail.com','Carlos',8000,'Credito','Alta'),
(5,'UrbanWear','654','Dir5','555','e@mail.com','Maria',4000,'Contado','Media'),
(6,'JeansCo','987','Dir6','666','f@mail.com','Pedro',9000,'Credito','Alta'),
(7,'ClothWorld','741','Dir7','777','g@mail.com','Laura',3000,'Contado','Baja'),
(8,'EliteWear','852','Dir8','888','h@mail.com','Jose',9500,'Credito','Alta'),
(9,'GlobalTex','963','Dir9','999','i@mail.com','Sofia',2000,'Contado','Baja'),
(10,'MegaModa','159','Dir10','000','j@mail.com','Diego',10000,'Credito','Alta');

CREATE TABLE ordenes_produccion (
    numero INT PRIMARY KEY,
    fecha_emision DATE,
    codigo_cliente INT,
    codigo_producto INT,
    cantidad INT,
    especificaciones TEXT,
    fecha_entrega DATE,
    prioridad VARCHAR(20),
    estado VARCHAR(50),
    FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo),
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo)
);

INSERT INTO ordenes_produccion VALUES
(1,'2024-03-01',1,1,100,'ninguna','2024-04-05','alta','pendiente'),
(2,'2024-03-02',2,2,200,'urgente','2024-04-10','alta','proceso'),
(3,'2024-03-03',3,3,150,'ninguna','2024-04-15','media','pendiente'),
(4,'2024-03-04',4,4,120,'especial','2024-04-20','alta','proceso'),
(5,'2024-03-05',5,5,90,'ninguna','2024-04-25','baja','pendiente'),
(6,'2024-03-06',6,6,80,'urgente','2024-05-01','alta','proceso'),
(7,'2024-03-07',7,7,70,'ninguna','2024-05-05','media','pendiente'),
(8,'2024-03-08',8,8,60,'especial','2024-05-10','alta','proceso'),
(9,'2024-03-09',9,9,50,'ninguna','2024-05-15','baja','pendiente'),
(10,'2024-03-10',10,10,40,'urgente','2024-05-20','alta','proceso');

CREATE TABLE procesos (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    secuencia INT,
    materias_primas TEXT,
    maquinas TEXT,
    personal TEXT,
    parametros_configuracion TEXT,
    tiempo_estandar INT
);

INSERT INTO procesos VALUES
(1,'Tejido','tejido',1,'algodon','telar','tejedor','config1',5),
(2,'Corte','corte',2,'poliester','cortadora','cortador','config2',4),
(3,'Costura','costura',3,'hilo','maquina','costurero','config3',6),
(4,'Estampado','estampado',4,'tinte','estampadora','estampador','config4',3),
(5,'Lavado','lavado',5,'agua','lavadora','operario','config5',2),
(6,'Secado','secado',6,'aire','secadora','operario','config6',2),
(7,'Planchado','planchado',7,'energia','plancha','operario','config7',3),
(8,'Empaque','empaque',8,'bolsa','manual','operario','config8',2),
(9,'Control','control',9,'ninguno','manual','inspector','config9',1),
(10,'Distribucion','distribucion',10,'ninguno','vehiculo','operario','config10',4);

CREATE TABLE lotes (
    id_lote INT PRIMARY KEY,
    codigo_producto INT,
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo)
);

INSERT INTO lotes VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10);

CREATE TABLE inspectores (
    id_inspector INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

INSERT INTO inspectores VALUES
(1,'Juan'),(2,'Ana'),(3,'Luis'),(4,'Maria'),(5,'Carlos'),
(6,'Laura'),(7,'Pedro'),(8,'Sofia'),(9,'Diego'),(10,'Elena');

CREATE TABLE control_calidad (
    codigo INT PRIMARY KEY,
    id_lote INT,
    fecha DATE,
    id_inspector INT,
    puntos_verificados TEXT,
    resultados TEXT,
    defectos TEXT,
    porcentaje_rechazo DECIMAL(5,2),
    decision VARCHAR(50),
    FOREIGN KEY (id_lote) REFERENCES lotes(id_lote),
    FOREIGN KEY (id_inspector) REFERENCES inspectores(id_inspector)
);

INSERT INTO control_calidad VALUES
(1,1,'2024-03-11',1,'ok','ok','ninguno',0,'aprobado'),
(2,2,'2024-03-12',2,'ok','ok','leve',2,'aprobado'),
(3,3,'2024-03-13',3,'ok','fallo','grave',10,'rechazo'),
(4,4,'2024-03-14',4,'ok','ok','ninguno',0,'aprobado'),
(5,5,'2024-03-15',5,'ok','fallo','leve',5,'reproceso'),
(6,6,'2024-03-16',6,'ok','ok','ninguno',0,'aprobado'),
(7,7,'2024-03-17',7,'ok','ok','leve',3,'aprobado'),
(8,8,'2024-03-18',8,'ok','fallo','grave',12,'rechazo'),
(9,9,'2024-03-19',9,'ok','ok','ninguno',0,'aprobado'),
(10,10,'2024-03-20',10,'ok','ok','leve',1,'aprobado');

CREATE TABLE especialidad_empleado (
    id_especialidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

INSERT INTO especialidad_empleado VALUES
(1,'tejedor'),
(2,'costurero'),
(3,'cortador'),
(4,'estampador'),
(5,'tejedor'),
(6,'costurero'),
(7,'cortador'),
(8,'estampador'),
(9,'tejedor'),
(10,'costurero');

CREATE TABLE empleados (
    numero INT PRIMARY KEY,
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    documento_identidad VARCHAR(20),
    id_especialidad INT,
    nivel_habilidad VARCHAR(50),
    area_asignada VARCHAR(50),
    turno_trabajo VARCHAR(50),
    fecha_contratacion DATE,
    productividad_promedio DECIMAL(5,2),
    FOREIGN KEY (id_especialidad) REFERENCES especialidad_empleado(id_especialidad)
);

INSERT INTO empleados VALUES
(1,'Juan','Perez','111',1,'alto','produccion','mañana','2020-01-01',90),
(2,'Ana','Gomez','222',2,'medio','produccion','tarde','2021-02-01',80),
(3,'Luis','Diaz','333',3,'alto','produccion','mañana','2019-03-01',85),
(4,'Maria','Lopez','444',4,'medio','produccion','noche','2022-04-01',75),
(5,'Carlos','Ruiz','555',1,'alto','produccion','mañana','2020-05-01',88),
(6,'Laura','Torres','666',2,'medio','produccion','tarde','2021-06-01',82),
(7,'Pedro','Sanchez','777',3,'alto','produccion','mañana','2018-07-01',87),
(8,'Sofia','Ramirez','888',4,'medio','produccion','noche','2022-08-01',76),
(9,'Diego','Morales','999',1,'alto','produccion','mañana','2017-09-01',91),
(10,'Elena','Castro','000',2,'medio','produccion','tarde','2023-01-01',79);

CREATE TABLE estado_inventario (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

INSERT INTO estado_inventario VALUES
(1,'disponible'),
(2,'reservado'),
(3,'defectuoso'),
(4,'disponible'),
(5,'reservado'),
(6,'defectuoso'),
(7,'disponible'),
(8,'reservado'),
(9,'defectuoso'),
(10,'disponible');

CREATE TABLE inventario (
    codigo_producto INT,
    color VARCHAR(50),
    talla VARCHAR(20),
    cantidad INT,
    ubicacion VARCHAR(50),
    id_lote INT,
    fecha_fabricacion DATE,
    id_estado INT,
    PRIMARY KEY (codigo_producto, color, talla),
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo),
    FOREIGN KEY (id_lote) REFERENCES lotes(id_lote),
    FOREIGN KEY (id_estado) REFERENCES estado_inventario(id_estado)
);

INSERT INTO inventario VALUES
(1,'rojo','M',50,'A',1,'2024-03-01',1),
(2,'azul','L',40,'B',2,'2024-03-02',2),
(3,'rojo','S',30,'C',3,'2024-03-03',3),
(4,'blanco','2x2',20,'D',4,'2024-03-04',1),
(5,'gris','2x3',10,'E',5,'2024-03-05',2),
(6,'negro','L',15,'F',6,'2024-03-06',3),
(7,'negro','M',25,'G',7,'2024-03-07',1),
(8,'blanco','S',35,'H',8,'2024-03-08',2),
(9,'azul','M',45,'I',9,'2024-03-09',1),
(10,'verde','L',60,'J',10,'2024-03-10',1);

CREATE TABLE estado_diseno (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

INSERT INTO estado_diseno VALUES
(1,'borrador'),
(2,'aprobado'),
(3,'en produccion'),
(4,'descontinuado'),
(5,'aprobado'),
(6,'borrador'),
(7,'en produccion'),
(8,'aprobado'),
(9,'descontinuado'),
(10,'aprobado');

CREATE TABLE disenos (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    disenador VARCHAR(100),
    fecha_creacion DATE,
    categoria_producto VARCHAR(50),
    archivo_digital VARCHAR(100),
    version VARCHAR(20),
    id_estado INT,
    productos TEXT,
    FOREIGN KEY (id_estado) REFERENCES estado_diseno(id_estado)
);

INSERT INTO disenos VALUES
(1,'Floral','estampado floral','Ana','2024-01-01','ropa','file1','v1',2,'1'),
(2,'Rayas','lineas','Luis','2024-01-02','ropa','file2','v1',2,'2'),
(3,'Cuadros','cuadros','Maria','2024-01-03','ropa','file3','v1',1,'3'),
(4,'Abstracto','formas','Carlos','2024-01-04','ropa','file4','v1',2,'4'),
(5,'Minimalista','simple','Laura','2024-01-05','ropa','file5','v1',2,'5'),
(6,'Vintage','retro','Pedro','2024-01-06','ropa','file6','v1',3,'6'),
(7,'Moderno','nuevo','Sofia','2024-01-07','ropa','file7','v1',2,'7'),
(8,'Deportivo','sport','Diego','2024-01-08','ropa','file8','v1',2,'8'),
(9,'Elegante','floral','Elena','2024-01-09','ropa','file9','v1',4,'9'),
(10,'Casual','estampado','Juan','2024-01-10','ropa','file10','v1',2,'10');

-- ¿Cuáles son todas las órdenes de un cliente específico? --
SELECT * FROM ordenes_produccion 
WHERE codigo_cliente = 1;

-- ¿Qué materias primas tienen precio unitario mayor a 50? --
SELECT * FROM materia_prima 
WHERE precio_unitario > 50;

-- ¿Cuáles son los productos de categoría Ropa que contienen algodón en su composición? --
SELECT * FROM productos 
WHERE categoria = 'ropa' 
AND composicion LIKE '%algodon%';

-- ¿Qué empleados son especialistas en tejido o costura? --
SELECT * FROM empleados 
WHERE id_especialidad IN (
SELECT id_especialidad 
FROM especialidad_empleado 
WHERE nombre IN ('tejedor','costurero'));

-- ¿Cuáles son las órdenes con fecha de entrega en abril de 2024? --
SELECT * FROM ordenes_produccion 
WHERE MONTH(fecha_entrega)=4 
AND YEAR(fecha_entrega)=2024;

--¿Qué productos son de subcategoría Camisetas, Pantalones o Vestidos? --
SELECT * FROM productos 
WHERE subcategoria IN ('Camisetas','Pantalones','Vestidos');

-- ¿Cuáles son los diseños con características "estampado" o "floral" en su descripción? --
SELECT * FROM disenos 
WHERE descripcion LIKE '%estampado%' 
OR descripcion LIKE '%floral%';

-- ¿Qué productos en inventario no tienen lote de producción asignado? --
SELECT * FROM inventario 
WHERE id_lote IS NULL;

-- ¿Cuáles son las máquinas ordenadas por capacidad de producción descendente? --
SELECT * FROM maquinas 
ORDER BY capacidad_produccion DESC;

-- ¿Cuál es el rendimiento de producción por tipo de máquina? --
SELECT id_tipo_maquina, AVG(capacidad_produccion) AS rendimiento
FROM maquinas
GROUP BY id_tipo_maquina;