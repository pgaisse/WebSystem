
INSERT INTO damages (id_damage, damage_name, damage_description) 
VALUES              (0,'fisura en muro','desc 1'),
                    (0,'fisura en sello de marco de puerta','desc 2'),
                    (0,'fisura en sello de marco de ventana','desc 3'),
                    (0,'fisura en cielo','desc 4'),
                    (0,'fisura dintel','desc 5'),
                    (0,'fisura antepecho','desc 6'),
                    (0,'fisura encuentro de muros','desc 7'),
                    (0,'fisura encuentro tabique y cielo','desc 8'),
                    (0,'fisura sello cornisa','desc 10'),
                    (0,'fijaciones a la vista en tabiques','desc 11'),
                    (0,'fijaciones a la vista en cielo','desc 12'),
                    (0,'cerámicas muro fisuradas','desc 13'),
                    (0,'cerámicas piso fisuradas','desc 14'),
                    (0,'fisura de emboquillado','desc 15'),
                    (0,'placas fisuradas','desc 16'),
                    (0,'pilares fisurados','desc 17'),
                    (0,'bardas fisurados','desc 18'),
                    (0,'pintura muro','desc 19');

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


INSERT INTO budgets(id_budget) 
VALUES        (	0	)	,
              (	0	)	,
              (	0	)	,
              (	0	)	,
              (	0	)	,
              (	0	)	,
              (	0	)	,
              (	0	)	,
              (	0	)	,
              (	0	)	,
              (	0	)	,
              (	0	)	,
              (	0	)	,
              (	0	)	,
              (	0	)	,
              (	0	)	,
              (	0	)	,
              (	0	)	;



SELECT * FROM budgets;

INSERT INTO cases(id_case,case_date) 
VALUES        (	0,'2022-05-15')	,
              (	0,'2022-05-25')	,
              (	0,'2022-05-15')	,
              (	0,'2022-05-11')	,
              (	0,'2022-05-13')	,
              (	0,'2022-05-12')	,
              (	0,'2022-05-11')	,
              (	0,'2022-01-15')	,
              (	0,'2022-02-15')	,
              (	0,'2023-05-15')	,
              (	0,'2023-02-15')	,
              (	0,'2024-01-15')	,
              (	0,'2022-01-15')	,
              (	0,'2023-01-15')	,
              (	0,'2022-02-15')	,
              (	0,'2022-05-15')	,
              (	0,'2023-05-11')	,
              (	0,'2023-02-12')	;



SELECT * FROM budgets;







INSERT INTO budgets_damages_sectors(id_budget_damage_sector,id_case,id_budget,id_sector,id_incident,sector_w_size,sector_h_size, sector_l_size, damage_size ) 
VALUES      (0,2,7,7,10,1,1,8,98),
(0,18,18,11,5,2,6,4,11),
(0,8,12,10,2,3,7,5,97),
(0,16,10,7,2,4,1,10,83),
(0,9,15,5,7,5,6,2,13),
(0,12,18,6,5,6,10,5,72),
(0,9,9,10,10,7,2,4,13),
(0,18,18,3,5,8,7,1,710),
(0,14,9,6,5,9,9,2,56),
(0,5,6,6,5,10,5,7,54),
(0,5,16,10,8,1,5,9,95),
(0,6,17,11,2,2,1,8,210),
(0,5,8,5,6,3,2,6,910),
(0,6,6,3,5,4,9,5,49),
(0,5,8,1,10,5,10,7,72),
(0,1,4,14,4,7,3,6,23),
(0,12,6,8,7,8,3,8,18),
(0,10,9,6,4,9,4,2,18),
(0,14,9,4,7,1,8,3,78),
(0,6,11,1,9,2,8,2,22),
(0,14,14,9,4,3,1,8,87),
(0,15,7,8,9,4,2,3,33),
(0,8,3,11,5,5,3,5,63),
(0,12,18,8,10,6,6,2,104),
(0,16,1,8,4,7,3,1,23),
(0,10,1,7,7,8,5,8,74),
(0,6,6,15,5,9,2,4,61),
(0,11,15,5,1,10,10,5,26),
(0,7,10,4,3,1,9,1,510),
(0,6,12,6,6,2,9,2,910),
(0,8,9,15,6,3,5,10,102),
(0,18,12,8,1,4,4,3,32),
(0,14,10,3,7,5,6,8,13),
(0,8,16,9,7,7,8,9,13),
(0,9,7,9,2,8,2,8,11),
(0,16,2,4,1,9,4,9,95),
(0,4,16,2,8,1,9,2,1010),
(0,15,14,3,3,2,6,6,410),
(0,13,16,9,5,3,8,1,108),
(0,3,13,10,2,4,10,8,42),
(0,7,9,8,1,5,10,7,13),
(0,16,1,14,5,6,4,7,96),
(0,12,1,8,10,7,8,2,106),
(0,2,9,1,3,8,9,2,88),
(0,13,10,6,2,9,9,5,18),
(0,11,11,15,3,10,6,6,71),
(0,10,7,9,4,1,8,8,32),
(0,14,15,8,7,2,2,1,46),
(0,8,12,12,2,3,4,8,108),
(0,4,11,7,7,4,3,4,41),
(0,8,13,11,6,5,10,1,31),
(0,11,18,6,5,7,7,8,21),
(0,13,3,10,7,8,8,8,63),
(0,2,5,11,4,9,7,8,88),
(0,16,13,4,5,1,10,1,45),
(0,2,9,2,1,2,4,1,81),
(0,13,11,6,2,3,3,1,12),
(0,8,18,12,7,4,3,10,15),
(0,14,11,11,4,5,8,1,85),
(0,12,13,8,9,6,3,9,107),
(0,10,13,10,1,7,3,1,49),
(0,7,18,13,5,8,8,8,710),
(0,11,10,13,7,9,2,10,68),
(0,15,18,14,4,10,10,6,49),
(0,10,4,13,3,1,9,4,410),
(0,6,9,4,2,2,5,8,810),
(0,3,13,12,2,3,7,3,47),
(0,7,13,6,5,4,10,3,67),
(0,1,15,13,3,5,4,4,91),
(0,13,18,2,4,7,10,5,26),
(0,1,14,13,9,8,5,2,97),
(0,8,16,10,10,9,10,4,13),
(0,15,2,14,2,1,4,9,28),
(0,1,6,10,4,2,8,1,59),
(0,11,12,4,7,3,2,10,68),
(0,11,11,3,5,4,9,1,12),
(0,6,18,12,5,5,10,2,24),
(0,15,5,13,8,6,7,8,57),
(0,14,14,7,10,7,7,3,54),
(0,17,10,4,2,8,8,2,15),
(0,10,6,2,5,9,7,8,85),
(0,17,10,7,10,10,7,6,88),
(0,16,15,3,9,1,7,1,41),
(0,2,12,7,10,2,8,3,73),
(0,9,8,13,6,3,1,6,32),
(0,14,12,4,8,4,3,2,103),
(0,5,17,6,8,5,5,5,106),
(0,10,6,8,10,7,7,2,98),
(0,16,17,2,3,8,7,3,62),
(0,12,15,8,2,9,4,7,63),
(0,3,12,11,6,1,5,5,34),
(0,12,16,3,4,2,6,2,65),
(0,5,10,6,4,3,4,7,69),
(0,17,18,3,10,4,10,6,810),
(0,11,17,8,10,5,7,7,310),
(0,18,16,3,5,6,5,5,99);




SELECT * FROM budgets_damages_sectors;



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

INSERT INTO clients_budgets (id_client_budget, id_client, id_budget)
VALUES  (0,1,1),
        (0,2,2),
        (0,3,3),
        (0,4,4),
        (0,5,5),
        (0,18,6),
        (0,7,7),
        (0,8,8),
        (0,9,9),
        (0,10,10),
        (0,11,11),
        (0,12,12),
        (0,13,13),
        (0,14,14),
        (0,15,15),
        (0,16,16),
        (0,17,17),
        (0,18,18);

SELECT * FROM clients_budgets;


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

  INSERT INTO advisers_budgets(id_adviser_budget, id_adviser, id_budget)
VALUES  (0,1,1),
        (0,1,2),
        (0,1,3),
        (0,2,4),
        (0,2,5),
        (0,3,6),
        (0,3,7),
        (0,4,8),
        (0,4,9),
        (0,5,10),
        (0,6,11),
        (0,7,12),
        (0,7,13),
        (0,7,14),
        (0,8,15),
        (0,9,16),
        (0,10,17),
        (0,10,18);
  SELECT * FROM advisers_budgets;


 INSERT INTO status(id_status, status_name)
VALUES  (0,'no iniciado'),
        (1,'En proceso'),
        (2,'completado');
  SELECT * FROM status;

INSERT INTO cases_status(id_case_statu, id_status, id_case)
VALUES  (0,1,1),
        (0,1,2),
        (0,1,3),
        (0,2,4),
        (0,2,5),
        (0,0,6),
        (0,0,7),
        (0,0,8),
        (0,0,9),
        (0,1,10),
        (0,1,11),
        (0,2,12),
        (0,1,13),
        (0,2,14),
        (0,0,15),
        (0,1,16),
        (0,1,17),
        (0,1,18);
  SELECT * FROM cases_status;

 INSERT INTO drs_bdss(id_dr_bds, id_budget_damage_sector, id_damage_repair)
VALUES  (0,8,17),
(0,4,48),
(0,78,16),
(0,67,22),
(0,32,40),
(0,57,3),
(0,16,42),
(0,68,43),
(0,50,29),
(0,55,8),
(0,3,35),
(0,29,10),
(0,10,55),
(0,86,36),
(0,56,28),
(0,53,46),
(0,67,12),
(0,1,5),
(0,50,48),
(0,31,46),
(0,9,35),
(0,24,8),
(0,12,52),
(0,33,9),
(0,43,22),
(0,50,37),
(0,71,13),
(0,2,33),
(0,46,12),
(0,78,39),
(0,47,20),
(0,14,16),
(0,35,42),
(0,81,22),
(0,78,26),
(0,50,20),
(0,24,42),
(0,23,35),
(0,46,8),
(0,39,46),
(0,73,20),
(0,8,52),
(0,56,19),
(0,77,31),
(0,80,23),
(0,8,52),
(0,6,24),
(0,82,34),
(0,25,15),
(0,58,6),
(0,12,39),
(0,25,25),
(0,90,39),
(0,17,38),
(0,32,55);

  SELECT * FROM drs_bdss;

