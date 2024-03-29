INSERT INTO clients (id_client, client_name, client_lastname, client_rut, client_birthday, client_address, client_phone,client_email)
VALUES              (0,'Ana','Ramos Sánchez','15.152.156-5','1982-02-20','OUTER HEBRIDES','(306) 906-7975','parkes@hotmail.com'),
                    (0,'Alfredo','Perez Reina','15.192.156-2','1991-02-19','82 Windsor Road','(452) 597-0784','sjava@yahoo.ca'),
                    (0,'Sergio','Garrido Arrizabalaga','15.192.156-3','1981-02-20','PH82 4OY','(363) 441-6561','jipsen@outlook.com'),
                    (0,'Ana','Ramos Sánchez','15.192.156-4','1971-02-22','WESTERN CENTRAL LONDON','(550) 890-6346','lahvak@optonline.net'),
                    (0,'Alfredo','Perez Reina','15.192.156-5','1961-02-23','10 Kings Road','(906) 421-7305','mlewan@yahoo.com'),
                    (0,'Sergio','Garrido Arrizabalaga','15.192.156-6','1951-02-25','WR45 4AU','(977) 707-4772','zwood@verizon.net'),
                    (0,'Ana','Ramos Sánchez','15.192.156-7','1941-02-26','MANCHESTER','(871) 218-8630','kassiesa@hotmail.com'),
                    (0,'Alfredo','Perez Reina','15.192.156-8','1931-02-28','472 Mill Lane','(522) 326-9656','rnewman@hotmail.com'),
                    (0,'Sergio','Garrido Arrizabalaga','15.192.156-9','1921-03-01','RG6 1SR','(924) 599-2856','jaxweb@gmail.com'),
                    (0,'Ana','Ramos Sánchez','15.192.156-10','1911-03-03','TORQUAY','(998) 710-2563','eidac@aol.com'),
                    (0,'Alfredo','Perez Reina','15.192.156-11','1901-03-04','80 Chester Road','(319) 810-1693','lishoy@gmail.com'),
                    (0,'Sergio','Garrido Arrizabalaga','15.192.156-12','1991-02-19','HA62 8DU','(794) 504-1808','delpino@aol.com'),
                    (0,'Ana','Ramos Sánchez','15.192.156-13','1981-02-20','PAISLEY','(493) 999-4390','catalog@att.net'),
                    (0,'Alfredo','Perez Reina','15.192.156-14','1991-02-19','304 Springfield Road','(804) 655-0207','hoyer@hotmail.com'),
                    (0,'Sergio','Garrido Arrizabalaga','15.192.156-15','1981-02-20','BD84 2HP','(554) 800-9842','esokullu@live.com'),
                    (0,'Ana','Ramos Sánchez','15.192.156-16','1991-02-19','CHESTER','(548) 446-1387','heidrich@hotmail.com'),
                    (0,'Alfredo','Perez Reina','15.192.156-17','1981-02-20','28 London Road','(517) 369-6486','kohlis@live.com'),
                    (0,'Sergio','Garrido Arrizabalaga','15.192.156-18','1991-02-19','HU74 4ER','(893) 798-8990','corrada@att.net');
SELECT * FROM clients;

INSERT INTO advisers(id_adviser, adviser_username, adviser_password, adviser_role, adviser_name, adviser_lastname, adviser_rut, adviser_email, adviser_birthday, adviser_phone)
VALUES  (0, 'adv1', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'admin', 'John', 'Doe', '123456789', 'john.doe@example.com', '1980-05-15','7792014'),
        (0, 'adv2', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'worker', 'Alice', 'Smith', '987654321', 'alice.smith@example.com', '1985-08-20','7722014'),
        (0, 'adv3', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'worker', 'Bob', 'Johnson', '456789012', 'bob.johnson@example.com', '1992-11-10','7792024'),
        (0, 'adv4', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'admin', 'Eva', 'Brown', '789012345', 'eva.brown@example.com', '1978-04-25','7791014'),
        (0, 'adv5', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'worker', 'Charlie', 'Miller', '234567890', 'charlie.miller@example.com', '1995-07-05','7794044'),
        (0, 'adv6', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'admin', 'Grace', 'Williams', '543210987', 'grace.williams@example.com', '1988-06-12','7792064'),
        (0, 'adv7', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'worker', 'Daniel', 'Davis', '678901234', 'daniel.davis@example.com', '1991-07-22','7792054'),
        (0, 'adv8', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'worker', 'Sophie', 'Wilson', '345678901', 'sophie.wilson@example.com', '1983-08-08','7792044'),
        (0, 'adv9', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'administrator', 'Michael', 'Jones', '890123456', 'michael.jones@example.com', '1977-09-30','7392014'),
        (0, 'adv10', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'worker', 'Emma', 'Taylor', '012345678', 'emma.taylor@example.com', '1999-10-18','7792012');
  SELECT * FROM advisers;

  INSERT INTO status(id_status, status_name)
VALUES  (0,'no iniciado'),
        (1,'En proceso'),
        (2,'completado');
  SELECT * FROM status;

  INSERT INTO sectors (id_sector, sector_name,sector_description) 
VALUES              (0,'fachada frontal ','desc_repair_1'),
                    (0,'living comedor','desc_repair_2'),
                    (0,'dormitorio 1 (principal)','desc_repair_3'),
                    (0,'baño (1er nive)','desc_repair_4'),
                    (0,'baño (2do nivel)','desc_repair_5'),
                    (0,'cocina','desc_repair_6'),
                    (0,'caja escala / sala de estar','desc_repair_7'),
                    (0,'dormitorio 2','desc_repair_8'),
                    (0,'cierre perimetral','desc_repair_9'),
                    (0,'logia','desc_repair_10'),
                    (0,'bodega','desc_repair_11'),
                    (0,'sala de estar primer piso','desc_repair_12'),
                    (0,'sala de estar segundo piso','desc_repair_13'),
                    (0,'hall de acceso','desc_repair_14'),
                    (0,'pasillo','desc_repair_15');

 SELECT * FROM sectors;

 INSERT INTO incidents (id_incident, incident_code, incident_date, incident_description)
VALUES      (0, 'AK420', '2022-01-15', 'Terremoto en la región A, magnitud 6.5'),
            (0, 'AK421', '2022-01-20', 'Alerta de tsunami a lo largo de las áreas costeras'),
            (0, 'AK422', '2022-02-05', 'Inundaciones en la ciudad X debido a lluvias intensas'),
            (0, 'AK422', '2022-02-12', 'Brote de incendios forestales en el bosque B'),
            (0, 'AK423', '2022-03-08', 'Huracán de categoría 4 se aproxima a la región costera'),
            (0, 'AK424', '2022-03-18', 'Tornado golpea la ciudad Y, causando daños extensos'),
            (0, 'AK424', '2022-04-02', 'Erupción volcánica en la isla C'),
            (0, 'AK425', '2022-04-10', 'Ventisca severa afecta áreas del norte'),
            (0, 'AK426', '2022-05-05', 'Deslizamiento de tierra en la ladera de la montaña D'),
            (0, 'AK427', '2022-05-20', 'Sequía prolongada en la región E, impactando la agricultura');

  SELECT * from incidents; 

INSERT INTO damages (id_damage,damage_unit, damage_name, damage_description) 
VALUES              (0,'mm','fisura en muro','desc 1'),
                    (0,'mm','fisura en sello de marco de puerta','desc 2'),
                    (0,'mm','fisura en sello de marco de ventana','desc 3'),
                    (0,'mm','fisura en cielo','desc 4'),
                    (0,'mm','fisura dintel','desc 5'),
                    (0,'mm','fisura antepecho','desc 6'),
                    (0,'mm','fisura encuentro de muros','desc 7'),
                    (0,'mm','fisura encuentro tabique y cielo','desc 8'),
                    (0,'mm','fisura sello cornisa','desc 10'),
                    (0,'cm','fijaciones a la vista en tabiques','desc 11'),
                    (0,'cm','fijaciones a la vista en cielo','desc 12'),
                    (0,'cm','cerámicas muro fisuradas','desc 13'),
                    (0,'cm','cerámicas piso fisuradas','desc 14'),
                    (0,'mm','fisura de emboquillado','desc 15'),
                    (0,'uni','placas fisuradas','desc 16'),
                    (0,'uni','pilares fisurados','desc 17'),
                    (0,'mm','bardas fisurados','desc 18'),
                    (0,'m','pintura muro','desc 19');

  SELECT * FROM damages;

INSERT INTO repairs (id_repair, repair_name,repair_unit,repair_price, repair_description) 
VALUES              (0,'Reparación de fisura en muro ','ML','20500','desc_1'),
                    (0,'Empaste y lijado de muro ','M2','4750','desc_2'),
                    (0,'Preparación de superficie de muro ','M2','2100','desc_3'),
                    (0,'Aplicación de textura martellina muro','M2','7600','desc_4'),
                    (0,'Aplicación de pintura de muro ','M2','7300','desc_5'),
                    (0,'Sellado y pintura de marco de puerta','ML','3500','desc_6'),
                    (0,'Sellado y pintura de marco de ventana','ML','3500','desc_7'),
                    (0,'Reparación de fisura en cielo','ML','20500','desc_8'),
                    (0,'Empaste y lijado de cielo','M2','4750','desc_9'),
                    (0,'Preparación de superficie de cielo ','M2','2100','desc_10'),
                    (0,'Aplicación de textura martellina cielo ','M2','7600','desc_11'),
                    (0,'Aplicación de pintura de cielo ','M2','7300','desc_12'),
                    (0,'Reparación de fisura en muro','ML','20500','desc_13'),
                    (0,'Aplicación de textura martellina muro ','M2','7600','desc_14'),
                    (0,'Sellado y pintura de cornisas','ML','3500','desc_15'),
                    (0,'Preparación de superficie de cielo','M2','2100','desc_16'),
                    (0,'Aplicación de pintura de cielo','M2','7300','desc_17'),
                    (0,'Retiro de ceramica de muro ','M2','7300','desc_18'),
                    (0,'Preparacion de superficie ','M2','3100','desc_19'),
                    (0,'Provision e instalacion de ceramica de muro ','M2','18500','desc_20'),
                    (0,'Fraguado de ceramica de muro ','M2','4100','desc_21'),
                    (0,'Retiro e instalacion de artefacto','UN','32000','desc_22'),
                    (0,'Revoque muro','ML','3500','desc_23'),
                    (0,'Retiro de placas fisuradas','UN','4900','desc_24'),
                    (0,'Instalación de placas nuevas','UN','11500','desc_25'),
                    (0,'Retiro de pilares fisurados','UN','9500','desc_26'),
                    (0,'Instalación de pilares nuevos','UN','16500','desc_27'),
                    (0,'Retiro de bardas fisuradas','UN','3500','desc_28'),
                    (0,'Instalación de bardas nuevas','UN','8100','desc_29'),
                    (0,'Aplicación de pintura de muro ','M2','8200','desc_30'),
                    (0,'Flete de materiales','UN','30000','desc_31'),
                    (0,'Protección de areas de trabajo','GL','35000','desc_32'),
                    (0,'Acomodo de mobiliario','GL','50000','desc_33'),
                    (0,'Retiro de escombros','M3','50000','desc_34'),
                    (0,'Aseo y entrega ','GL','75000','desc_35');
  SELECT * FROM repairs;

INSERT INTO damages_repairs(id_damage_repair,id_damage, id_repair) 
VALUES  (0,1,1),
        (0,1,2),
        (0,2,6),
        (0,3,6),
        (0,4,8),
        (0,4,9),
        (0,4,10),
        (0,4,11),
        (0,4,12),
        (0,5,1),
        (0,5,2),
        (0,5,3),
        (0,5,4),
        (0,5,5),
        (0,6,1),
        (0,6,2),
        (0,6,3),
        (0,6,4),
        (0,6,5),
        (0,7,1),
        (0,7,2),
        (0,7,3),
        (0,7,4),
        (0,7,5),
        (0,8,1),
        (0,8,2),
        (0,8,3),
        (0,8,4),
        (0,8,5),
        (0,8,8),
        (0,8,9),
        (0,8,10),
        (0,8,11),
        (0,8,12),
        (0,9,15),
        (0,10,2),
        (0,10,3),
        (0,10,4),
        (0,10,5),
        (0,11,9),
        (0,11,10),
        (0,11,11),
        (0,11,12),
        (0,12,18),
        (0,12,19),
        (0,12,20),
        (0,12,21),
        (0,12,22),
        (0,14,23),
        (0,15,24),
        (0,15,25),
        (0,16,26),
        (0,16,27),
        (0,17,28),
        (0,17,29),
        (0,18,30);

  SELECT * FROM damages_repairs;



INSERT INTO cases (id_case,id_status,id_adviser,id_client,id_incident, case_date)values
(0,2,2,18,9,'2015-05-22'),
(0,1,8,14,9,'2015-05-23'),
(0,2,1,12,2,'2015-05-24'),
(0,2,2,7,6,'2015-05-25'),
(0,1,1,6,4,'2015-05-26'),
(0,2,8,18,4,'2015-05-27'),
(0,1,5,11,2,'2015-05-28'),
(0,0,6,9,3,'2015-05-29'),
(0,2,10,5,3,'2015-05-30'),
(0,2,7,18,5,'2015-05-31'),
(0,1,2,2,1,'2015-06-01'),
(0,2,9,12,5,'2015-06-02'),
(0,0,1,6,4,'2015-06-03'),
(0,1,4,11,10,'2015-06-04'),
(0,2,3,14,6,'2015-06-05'),
(0,0,8,10,5,'2015-06-06'),
(0,0,8,6,8,'2015-06-07'),
(0,2,6,10,5,'2017-06-08'),
(0,1,7,11,10,'2017-06-09'),
(0,2,9,9,8,'2017-06-10'),
(0,2,3,4,7,'2017-06-11'),
(0,0,8,12,8,'2017-06-12'),
(0,2,1,13,9,'2017-06-13'),
(0,1,5,10,2,'2017-06-14'),
(0,2,3,4,2,'2017-06-15'),
(0,1,1,14,10,'2017-06-16'),
(0,2,2,9,6,'2017-06-17'),
(0,2,2,5,9,'2017-06-18'),
(0,2,2,15,8,'2017-06-19'),
(0,2,4,14,4,'2017-06-20'),
(0,1,8,15,8,'2017-06-21'),
(0,1,7,12,3,'2017-06-22'),
(0,0,7,5,2,'2017-06-23'),
(0,1,6,15,5,'2017-06-24'),
(0,1,2,11,1,'2017-06-25'),
(0,1,4,12,5,'2017-06-26'),
(0,1,2,8,3,'2017-06-27'),
(0,0,10,13,10,'2017-06-28'),
(0,1,4,11,10,'2017-06-29'),
(0,2,5,3,6,'2017-06-30'),
(0,1,7,2,2,'2017-07-01'),
(0,2,6,10,4,'2017-07-02'),
(0,0,2,4,9,'2017-07-03'),
(0,2,9,12,10,'2017-07-04'),
(0,2,8,10,7,'2017-07-05'),
(0,2,8,6,2,'2017-07-06'),
(0,1,8,8,3,'2017-07-07'),
(0,0,1,10,5,'2017-07-08'),
(0,1,1,5,6,'2017-07-09'),
(0,2,3,2,10,'2017-07-10'),
(0,2,10,9,8,'2017-07-11'),
(0,0,9,5,3,'2017-07-12'),
(0,1,4,13,2,'2017-07-13'),
(0,1,1,13,9,'2017-07-14'),
(0,2,2,2,5,'2017-07-15'),
(0,1,5,8,9,'2017-07-16'),
(0,2,4,5,9,'2017-07-17'),
(0,0,6,16,10,'2017-07-18'),
(0,1,8,2,8,'2017-07-19'),
(0,1,10,13,3,'2017-07-20'),
(0,1,6,9,1,'2017-07-21'),
(0,1,1,11,7,'2017-07-22'),
(0,1,10,17,1,'2017-07-23'),
(0,2,8,17,9,'2017-07-24'),
(0,1,9,18,3,'2017-07-25'),
(0,2,3,7,8,'2017-07-26'),
(0,2,8,11,7,'2017-07-27'),
(0,0,5,17,10,'2017-07-28'),
(0,0,10,9,8,'2017-07-29'),
(0,0,2,11,2,'2017-07-30'),
(0,2,5,5,7,'2017-07-31'),
(0,2,3,17,2,'2017-08-01'),
(0,2,4,18,1,'2017-08-02'),
(0,0,8,6,9,'2017-08-03'),
(0,1,4,12,2,'2017-08-04'),
(0,1,1,2,4,'2017-08-05'),
(0,2,2,9,8,'2017-08-06'),
(0,2,6,3,9,'2017-08-07'),
(0,2,5,3,5,'2017-08-08'),
(0,2,8,14,9,'2017-08-09'),
(0,2,6,17,1,'2017-08-10'),
(0,1,9,17,8,'2017-08-11'),
(0,2,3,15,3,'2017-08-12'),
(0,2,10,1,10,'2017-08-13'),
(0,0,1,12,10,'2017-08-14'),
(0,2,7,12,6,'2017-08-15'),
(0,2,4,14,2,'2017-08-16'),
(0,2,6,8,8,'2017-08-17'),
(0,2,10,3,6,'2017-08-18'),
(0,0,5,13,6,'2017-08-19'),
(0,0,5,12,6,'2017-08-20'),
(0,0,3,8,10,'2017-08-21'),
(0,0,9,3,1,'2017-08-22'),
(0,0,1,18,2,'2017-08-23'),
(0,1,10,12,5,'2017-08-24'),
(0,0,1,14,10,'2017-08-25'),
(0,0,1,16,4,'2017-08-26'),
(0,1,6,6,5,'2017-08-27'),
(0,2,2,8,4,'2017-08-28'),
(0,2,8,1,4,'2017-08-29'),
(0,2,10,2,8,'2017-08-30'),
(0,1,9,15,4,'2017-08-31'),
(0,1,9,1,4,'2017-09-01'),
(0,2,7,6,7,'2017-09-02'),
(0,1,6,3,5,'2017-09-03'),
(0,2,6,6,2,'2017-09-04'),
(0,1,10,7,5,'2017-09-05'),
(0,2,6,17,10,'2017-09-06'),
(0,2,2,13,7,'2017-09-07'),
(0,2,3,15,5,'2017-09-08'),
(0,0,4,5,6,'2017-09-09'),
(0,0,8,7,4,'2017-09-10'),
(0,2,6,1,2,'2017-09-11'),
(0,2,4,18,3,'2017-09-12'),
(0,1,4,3,10,'2017-09-13'),
(0,1,3,14,10,'2017-09-14'),
(0,0,7,14,9,'2017-09-15'),
(0,0,7,8,8,'2017-09-16'),
(0,0,9,5,5,'2017-09-17'),
(0,1,8,12,4,'2017-09-18'),
(0,2,4,7,10,'2017-09-19'),
(0,0,1,1,10,'2017-09-20'),
(0,0,10,11,4,'2017-09-21'),
(0,2,5,9,10,'2017-09-22'),
(0,2,2,16,1,'2017-09-23'),
(0,0,2,5,9,'2017-09-24'),
(0,0,8,1,8,'2017-09-25'),
(0,1,4,4,3,'2017-09-26'),
(0,2,2,11,4,'2017-09-27'),
(0,0,9,11,9,'2017-09-28'),
(0,0,6,17,7,'2017-09-29'),
(0,0,10,9,6,'2017-09-30'),
(0,1,1,10,2,'2017-10-01'),
(0,0,1,16,3,'2017-10-02'),
(0,2,3,12,8,'2017-10-03'),
(0,0,6,14,3,'2017-10-04'),
(0,2,10,9,1,'2017-10-05'),
(0,1,9,2,6,'2017-10-06'),
(0,1,2,6,5,'2017-10-07'),
(0,2,1,14,1,'2017-10-08'),
(0,1,3,4,10,'2017-10-09'),
(0,2,5,17,4,'2017-10-10'),
(0,1,10,17,6,'2017-10-11'),
(0,0,6,10,3,'2017-10-12'),
(0,0,10,13,4,'2017-10-13'),
(0,0,9,16,10,'2017-10-14'),
(0,2,9,16,3,'2017-10-15'),
(0,0,8,11,6,'2017-10-16'),
(0,1,8,10,4,'2017-10-17'),
(0,2,5,16,4,'2017-10-18'),
(0,0,2,1,5,'2017-10-19'),
(0,0,5,8,8,'2017-10-20'),
(0,0,9,9,8,'2017-10-21'),
(0,0,4,7,10,'2017-10-22'),
(0,1,10,10,4,'2017-10-23'),
(0,2,9,15,6,'2017-10-24'),
(0,1,10,12,6,'2017-10-25'),
(0,1,3,4,8,'2017-10-26'),
(0,1,3,13,6,'2017-10-27'),
(0,0,6,8,1,'2017-10-28'),
(0,2,8,1,3,'2017-10-29'),
(0,0,10,18,1,'2017-10-30'),
(0,1,10,3,9,'2017-10-31'),
(0,2,7,6,5,'2017-11-01'),
(0,2,9,9,4,'2017-11-02'),
(0,2,3,2,10,'2017-11-03'),
(0,2,8,17,4,'2017-11-04'),
(0,0,1,13,4,'2017-11-05'),
(0,1,3,13,5,'2017-11-06'),
(0,0,8,15,2,'2017-11-07'),
(0,0,10,10,8,'2017-11-08'),
(0,0,6,13,4,'2017-11-09'),
(0,0,5,4,5,'2017-11-10'),
(0,2,6,15,8,'2017-11-11'),
(0,0,9,16,6,'2017-11-12'),
(0,2,9,11,7,'2017-11-13'),
(0,2,4,7,8,'2017-11-14'),
(0,2,6,14,3,'2017-11-15'),
(0,1,10,18,10,'2017-11-16'),
(0,0,5,17,4,'2017-11-17'),
(0,0,3,5,6,'2017-11-18'),
(0,0,9,6,6,'2017-11-19'),
(0,2,5,10,10,'2017-11-20'),
(0,1,1,12,4,'2017-11-21'),
(0,1,7,12,10,'2017-11-22'),
(0,2,2,8,7,'2017-11-23'),
(0,0,3,12,8,'2017-11-24'),
(0,0,7,17,8,'2017-11-25'),
(0,2,3,18,8,'2017-11-26'),
(0,0,3,15,8,'2017-11-27'),
(0,2,10,6,2,'2017-11-28'),
(0,1,1,18,5,'2017-11-29'),
(0,1,2,17,4,'2017-11-30'),
(0,1,9,4,7,'2017-12-01'),
(0,2,8,5,9,'2017-12-02'),
(0,1,2,16,1,'2017-12-03'),
(0,2,4,1,7,'2017-12-04'),
(0,0,2,12,6,'2017-12-05');









select *from cases;




INSERT INTO c_d_s(id_c_d_s,id_damage,id_case,id_sector)
VALUES
(0,1,14,2),
(0,2,14,2),
(0,3,14,2),
(0,4,14,2),

(0,8,115,3),
(0,2,115,11),
(0,1,115,11),
(0,1,115,12),
(0,8,115,12),
(0,8,115,12),
(0,8,115,12),
(0,9,72,11),
(0,9,72,11),
(0,16,194,9),
(0,3,10,15),
(0,1,26,14),
(0,10,55,8),
(0,16,3,3),
(0,15,165,12),
(0,10,13,5),
(0,13,30,7),
(0,5,116,8),
(0,16,174,15),
(0,10,146,11),
(0,14,119,3),
(0,9,9,12),
(0,10,53,13),
(0,15,44,4),
(0,4,61,2),
(0,5,141,12),
(0,10,106,12),
(0,5,65,8),
(0,16,66,15),
(0,13,106,3),
(0,7,120,9),
(0,11,196,4),
(0,14,193,11),
(0,7,25,12),
(0,18,37,11),
(0,11,96,15),
(0,11,51,2),
(0,9,51,6),
(0,8,61,4),
(0,14,79,7),
(0,13,85,14),
(0,14,179,6),
(0,4,93,1),
(0,7,69,3),
(0,16,127,3),
(0,5,163,7),
(0,11,41,9),
(0,2,145,3),
(0,10,11,3),
(0,6,76,7),
(0,9,36,14),
(0,2,29,9),
(0,17,2,1),
(0,14,81,9),
(0,15,67,11),
(0,4,90,8),
(0,12,68,14),
(0,1,47,2),
(0,12,44,9),
(0,12,108,9),
(0,5,145,12),
(0,13,189,6),
(0,3,114,1),
(0,11,29,13),
(0,10,62,14),
(0,11,164,6),
(0,10,144,13),
(0,8,182,12),
(0,2,56,5),
(0,18,151,9),
(0,6,91,9),
(0,12,90,10),
(0,8,146,11),
(0,13,192,2),
(0,4,66,7),
(0,18,10,15),
(0,10,187,13),
(0,18,20,6),
(0,4,8,10),
(0,2,118,11),
(0,10,10,8),
(0,11,106,15),
(0,9,13,12),
(0,8,88,15),
(0,16,18,10),
(0,12,87,4),
(0,16,170,5),
(0,3,128,7),
(0,8,152,2),
(0,18,73,13),
(0,11,84,1),
(0,15,161,8),
(0,14,7,12),
(0,4,197,10),
(0,11,171,5),
(0,15,32,2),
(0,12,42,2),
(0,16,134,11),
(0,3,88,7),
(0,1,87,13),
(0,15,58,12),
(0,17,102,3),
(0,13,99,1),
(0,5,10,3),
(0,7,190,13),
(0,11,88,11),
(0,18,31,2),
(0,10,157,14),
(0,7,81,6),
(0,16,23,9),
(0,13,73,11),
(0,2,80,15),
(0,16,113,11),
(0,9,77,2),
(0,17,99,4),
(0,9,69,5),
(0,14,187,11),
(0,8,178,13),
(0,4,108,11),
(0,4,158,9),
(0,12,38,14),
(0,14,123,8),
(0,4,83,5),
(0,12,173,8),
(0,4,152,2),
(0,8,27,2),
(0,9,44,11),
(0,1,178,8),
(0,11,3,2),
(0,17,109,13),
(0,12,74,11),
(0,4,1,9),
(0,5,118,6),
(0,3,178,9),
(0,11,61,13),
(0,7,9,11),
(0,9,59,6),
(0,6,106,2),
(0,14,168,12),
(0,6,37,15),
(0,13,97,4),
(0,4,116,4),
(0,15,162,11),
(0,2,27,10),
(0,2,52,9),
(0,9,173,7),
(0,1,120,12),
(0,2,188,4),
(0,11,134,4),
(0,8,57,6),
(0,3,179,15),
(0,15,86,7),
(0,7,79,5),
(0,13,103,8),
(0,6,143,9),
(0,6,5,14),
(0,1,150,5),
(0,18,151,15),
(0,10,174,15),
(0,6,177,2),
(0,15,194,13),
(0,10,42,4),
(0,3,21,6),
(0,9,181,13),
(0,17,191,15),
(0,8,184,5),
(0,4,142,5),
(0,16,41,2),
(0,4,92,7),
(0,5,52,6),
(0,13,49,13),
(0,10,94,11),
(0,7,39,5),
(0,7,62,12),
(0,9,31,12),
(0,17,190,11),
(0,14,84,3),
(0,6,119,6),
(0,15,151,14),
(0,13,105,15),
(0,8,10,15),
(0,13,185,4),
(0,15,138,1),
(0,13,151,12),
(0,2,173,11),
(0,8,115,3),
(0,3,62,4),
(0,1,68,3),
(0,3,179,1),
(0,6,46,8),
(0,10,23,2),
(0,6,1,13),
(0,12,17,2),
(0,8,174,12),
(0,11,112,6),
(0,2,189,8),
(0,15,78,11),
(0,5,30,10),
(0,2,45,5),
(0,1,63,14),
(0,12,41,6),
(0,5,155,1),
(0,4,138,9),
(0,14,52,10);



SELECT *from c_d_s;

insert INTO dimentions (id_dimention,id_sector,id_case,sector_w_size,sector_h_size, sector_l_size, damage_size)
values
(0,1,14,11,5,6,4),
(0,2,14,11,5,6,5),
(0,3,14,10,2,3,4),
(0,4,14,10,2,3,4),


(0,1,115,11,5,6,14),
(0,2,115,11,5,6,14),
(0,3,115,10,2,3,4),
(0,4,115,10,2,3,4),
(0,5,115,2,10,5,11),
(0,6,115,3,6,15,8),
(0,7,115,4,3,12,4),
(0,8,115,6,13,1,2),
(0,9,115,13,6,3,11),
(0,10,115,2,7,14,7),
(0,11,115,14,12,6,14),
(0,12,115,8,9,8,14),
(0,13,115,13,3,7,7),
(0,14,115,12,3,4,7),
(0,15,115,6,7,9,12),
(0,2,116,7,6,15,14),
(0,1,116,9,7,11,11),
(0,6,116,6,11,13,4),
(0,4,116,15,7,13,8),
(0,5,116,9,6,8,2),
(0,3,116,1,1,10,1),
(0,11,116,13,13,11,3),
(0,8,116,1,14,2,3),
(0,9,116,8,4,7,14),
(0,10,116,15,8,5,9),
(0,7,116,12,1,5,6),
(0,14,116,8,8,13,11),
(0,13,116,5,7,3,8),
(0,12,116,14,9,13,12),
(0,15,116,2,7,2,11),
(0,1,117,13,8,4,11),
(0,2,117,13,9,9,13),
(0,3,117,2,6,8,6),
(0,4,117,3,10,9,8),
(0,5,117,11,6,14,8),
(0,6,117,14,5,13,1),
(0,7,117,10,11,13,15),
(0,8,117,13,11,6,1),
(0,9,117,14,15,10,6),
(0,10,117,1,1,8,10),
(0,11,117,13,15,10,7),
(0,12,117,11,11,7,5),
(0,13,117,8,11,13,1),
(0,14,117,10,9,14,3),
(0,15,117,13,10,12,9),
(0,1,118,10,1,7,13),
(0,2,118,15,15,13,4),
(0,3,118,1,4,6,6),
(0,4,118,6,8,7,11),
(0,5,118,13,12,6,7),
(0,6,118,6,15,11,11),
(0,7,118,4,8,6,5),
(0,8,118,9,3,14,10),
(0,9,118,8,3,9,3),
(0,10,118,5,7,3,15),
(0,11,118,1,5,13,13),
(0,12,118,7,15,12,1),
(0,13,118,8,2,15,3),
(0,14,118,11,12,3,3),
(0,15,118,8,1,9,3),
(0,1,118,4,5,6,5),
(0,2,118,2,14,3,1),
(0,3,118,6,5,1,3),
(0,4,118,15,4,9,13),
(0,5,118,15,8,10,3),
(0,6,118,8,3,2,2),
(0,7,118,13,2,4,4),
(0,8,118,7,13,7,4),
(0,9,118,13,5,6,12),
(0,10,118,15,3,6,9),
(0,11,118,11,11,6,8),
(0,12,118,7,9,11,11),
(0,13,118,6,12,4,6),
(0,14,118,2,11,13,3),
(0,15,118,3,5,7,10),
(0,1,119,3,9,11,13),
(0,2,119,11,9,14,4),
(0,3,119,8,5,2,13),
(0,4,119,12,1,9,4),
(0,5,119,5,2,9,4),
(0,6,119,1,12,10,1),
(0,7,119,10,15,5,3),
(0,8,119,12,14,14,13),
(0,9,119,12,12,1,5),
(0,10,119,5,8,14,12),
(0,11,119,13,5,12,9),
(0,12,119,7,7,9,15),
(0,13,119,13,8,14,2),
(0,14,119,2,14,10,6),
(0,15,119,7,7,6,13),
(0,1,120,12,1,9,1),
(0,2,120,7,1,3,9),
(0,3,120,9,7,12,9),
(0,4,120,13,1,2,4),
(0,5,120,1,3,10,4),
(0,6,120,8,9,1,7),
(0,7,120,15,6,11,7),
(0,8,120,11,7,8,12),
(0,9,120,3,12,1,1),
(0,10,120,15,10,10,9),
(0,11,120,1,6,1,13),
(0,12,120,8,10,8,15),
(0,13,120,13,7,3,10),
(0,14,120,4,13,12,1),
(0,15,120,3,3,2,12),
(0,1,121,15,11,13,9),
(0,2,121,1,12,2,12),
(0,3,121,6,8,8,6),
(0,4,121,3,15,6,14),
(0,5,121,3,7,15,11),
(0,6,121,14,9,6,12),
(0,7,121,3,4,1,5),
(0,8,121,12,3,4,5),
(0,9,121,9,8,3,13),
(0,10,121,5,1,10,14),
(0,11,121,4,2,10,15),
(0,12,121,1,4,3,15),
(0,13,121,15,13,6,9),
(0,14,121,7,5,1,3),
(0,15,121,8,6,12,5),
(0,1,121,9,10,10,5),
(0,2,121,14,13,1,15),
(0,3,121,9,13,7,6),
(0,4,121,14,15,8,13),
(0,5,121,7,3,9,1),
(0,6,121,4,11,12,8),
(0,7,121,14,5,7,10),
(0,8,121,2,13,2,7),
(0,9,121,9,14,15,6),
(0,10,121,2,4,13,11),
(0,11,121,10,12,15,12),
(0,12,121,15,6,5,1),
(0,13,121,8,9,4,3),
(0,14,121,6,12,8,13),
(0,15,121,14,2,7,13),
(0,1,122,3,6,14,12),
(0,2,122,5,13,5,9),
(0,3,122,6,8,7,14),
(0,4,122,7,1,6,2),
(0,5,122,8,3,12,4),
(0,6,122,11,14,2,9),
(0,7,122,2,7,2,4),
(0,8,122,2,13,3,8),
(0,9,122,1,12,13,8),
(0,10,122,4,10,15,5),
(0,11,122,7,2,14,15),
(0,12,122,12,15,9,9),
(0,13,122,9,2,8,5),
(0,14,122,1,6,5,8),
(0,15,122,15,15,4,2),
(0,1,123,11,10,15,8),
(0,2,123,4,7,10,2),
(0,3,123,8,1,14,13),
(0,4,123,10,4,4,3),
(0,5,123,13,5,8,1),
(0,6,123,15,4,7,7),
(0,7,123,9,10,15,13),
(0,8,123,12,5,13,13),
(0,9,123,4,10,2,9),
(0,10,123,2,15,10,7),
(0,11,123,15,9,14,2),
(0,12,123,9,15,2,15),
(0,13,123,12,5,5,2),
(0,14,123,7,7,8,8),
(0,15,123,10,13,11,13),
(0,1,124,10,1,11,12),
(0,2,124,13,7,5,9),
(0,3,124,3,3,9,7),
(0,4,124,14,12,15,1),
(0,5,124,8,15,7,14),
(0,6,124,3,2,12,4),
(0,7,124,1,8,10,9),
(0,8,124,2,3,1,4),
(0,9,124,12,5,7,9),
(0,10,124,2,8,6,15),
(0,11,124,3,1,8,1),
(0,12,124,1,4,13,13),
(0,13,124,4,7,1,4),
(0,14,124,8,4,7,11),
(0,15,124,2,13,5,1),
(0,1,125,7,1,4,5),
(0,2,125,7,13,8,5),
(0,3,125,14,10,4,12),
(0,4,125,5,1,10,14),
(0,5,125,12,12,1,12),
(0,6,125,10,2,7,11),
(0,7,125,11,12,9,15),
(0,8,125,7,13,8,2),
(0,9,125,2,1,2,3),
(0,10,125,1,4,4,5),
(0,11,125,12,9,12,10),
(0,12,125,15,12,11,6),
(0,13,125,7,7,5,10),
(0,14,125,8,13,4,10),
(0,15,125,9,9,2,11),
(0,1,126,6,10,2,3),
(0,2,126,8,13,10,9),
(0,3,126,4,2,2,13),
(0,4,126,10,9,7,3),
(0,5,126,11,3,6,12);

select * from dimentions;


insert INTO d_c_d_s (id_d_c_d_s,id_c_d_s, size)
values
(0,1,32),
(0,2,109),
(0,3,108),
(0,4,148),
(0,5,8),
(0,6,198),
(0,7,169),
(0,8,140),
(0,9,3),
(0,10,149),
(0,11,38),
(0,12,1),
(0,13,125),
(0,14,174),
(0,15,107),
(0,16,78),
(0,17,121),
(0,18,19),
(0,19,130),
(0,20,90),
(0,21,123),
(0,22,48),
(0,23,116),
(0,24,9),
(0,25,184),
(0,26,78),
(0,27,111),
(0,28,36),
(0,29,46),
(0,30,104),
(0,31,158),
(0,32,65),
(0,33,156),
(0,34,126),
(0,35,175),
(0,36,169),
(0,37,12),
(0,38,171),
(0,39,127),
(0,40,90),
(0,41,128),
(0,42,149),
(0,43,95),
(0,44,50),
(0,45,186),
(0,46,151),
(0,47,107),
(0,48,117),
(0,49,72),
(0,50,139),
(0,51,89),
(0,52,125),
(0,53,53),
(0,54,135),
(0,55,157),
(0,56,133),
(0,57,45),
(0,58,183),
(0,59,125),
(0,60,21),
(0,61,33),
(0,62,116),
(0,63,204),
(0,64,139),
(0,65,187),
(0,66,78),
(0,67,69),
(0,68,51),
(0,69,33),
(0,70,28),
(0,71,67),
(0,72,60),
(0,73,164),
(0,74,162),
(0,75,6),
(0,76,15),
(0,77,81),
(0,78,175),
(0,79,167),
(0,80,103),
(0,81,82),
(0,82,33),
(0,83,204),
(0,84,174),
(0,85,112),
(0,86,155),
(0,87,100),
(0,88,19),
(0,89,157),
(0,90,112),
(0,91,30),
(0,92,7),
(0,93,79),
(0,94,184),
(0,95,46),
(0,96,55),
(0,97,153),
(0,98,192),
(0,99,23),
(0,100,198),
(0,101,25),
(0,102,127),
(0,103,185),
(0,104,126),
(0,105,195),
(0,106,170),
(0,107,39),
(0,108,177),
(0,109,49),
(0,110,150),
(0,111,5),
(0,112,151),
(0,113,36),
(0,114,17),
(0,115,28),
(0,116,72),
(0,117,186),
(0,118,19),
(0,119,63),
(0,120,198),
(0,121,123),
(0,122,143),
(0,123,65),
(0,124,36),
(0,125,74),
(0,126,85),
(0,127,91),
(0,128,179),
(0,129,134),
(0,130,121),
(0,131,129),
(0,132,204),
(0,133,170),
(0,134,70),
(0,135,203),
(0,136,103),
(0,137,119),
(0,138,22),
(0,139,192),
(0,140,167),
(0,141,189),
(0,142,139),
(0,143,92),
(0,144,101),
(0,145,9),
(0,146,94),
(0,147,3),
(0,148,71),
(0,149,61),
(0,150,61),
(0,151,168),
(0,152,164),
(0,153,202),
(0,154,170),
(0,155,178),
(0,156,101),
(0,157,130),
(0,158,164),
(0,159,123),
(0,160,72),
(0,161,184),
(0,162,146),
(0,163,124),
(0,164,124),
(0,165,28),
(0,166,137),
(0,167,29),
(0,168,96),
(0,169,203),
(0,170,144),
(0,171,135),
(0,172,129),
(0,173,117),
(0,174,161),
(0,175,195),
(0,176,138),
(0,177,130),
(0,178,125),
(0,179,80),
(0,180,138),
(0,181,31),
(0,182,205),
(0,183,168),
(0,184,106),
(0,185,35),
(0,186,39),
(0,187,128),
(0,188,156),
(0,189,29),
(0,190,169),
(0,191,193),
(0,192,103),
(0,193,67),
(0,194,16),
(0,195,58),
(0,196,52),
(0,197,25),
(0,198,97),
(0,199,60),
(0,200,39),
(0,201,190),
(0,202,99),
(0,203,77),
(0,204,137),
(0,205,14);
select *from d_c_d_s;
