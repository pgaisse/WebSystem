INSERT INTO clients (id_client, client_name, client_lastname, client_rut, client_birthday, client_address, client_phone,client_email)
VALUES              (0,'Ana','Ramos Sánchez','15.152.156-5','1982-02-20','OUTER HEBRIDES','(306) 906-7975','parkes@hotmail.com'),
                    (0,'Alfredo','Perez Reina','15.192.156-2','1991-02-19','82 Windsor Road','(452) 597-0784','sjava@yahoo.ca'),
                    (0,'Moncho','Pereira Reinaldo','15.142.156-2','1992-02-19','14-16 Oconnor ','(452) 037-0784','sjeewqava@yahoo.ca'),
                    (0,'Sergio','Garrido Arrizabalaga','15.192.156-3','1981-02-20','PH82 4OY','(363) 441-6561','jipsen@outlook.com');

SELECT * FROM clients;

INSERT INTO advisers(id_adviser, adviser_username, adviser_password, adviser_role, adviser_name, adviser_lastname, adviser_rut, adviser_email, adviser_birthday, adviser_phone)
VALUES  (0, 'adv1', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'admin', 'John', 'Doe', '123456789', 'john.doe@example.com', '1980-05-15','7792014'),
        (0, 'adv2', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'worker', 'Alice', 'Smith', '987654321', 'alice.smith@example.com', '1985-08-20','7722014'),
        (0, 'adv3', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'admin', 'John', 'Doe', '123456789', 'john.doe@example.com', '1980-05-15','7792014'),
        (0, 'adv4', '$2a$10$wygKItjiy322HSWqEaSATeKBi3bljtVIRE6UtMY7iHhHpuHEte/uG', 'worker', 'Alice', 'Smith', '987654321', 'alice.smith@example.com', '1985-08-20','7722014');



  INSERT INTO status(id_status, status_name)
VALUES  (1,'No iniciado'),
        (2,'En proceso'),
        (3,'completado');
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
            (0, 'AK422', '2022-02-12', 'Brote de incendios forestales en el bosque B');

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
(0,1,1,1,1,'2015-05-22'),
(0,2,1,2,2,'2015-05-23'),
(0,3,3,3,3,'2015-05-24'),
(0,1,4,4,4,'2015-05-25');

select *from cases;




INSERT INTO c_d_s(id_c_d_s,id_damage,id_case,id_sector)
VALUES
(0,1,1,1),
(0,2,1,2),
(0,3,1,2),
(0,4,1,2),
(0,5,1,2),
(0,6,1,3),
(0,7,1,4),
(0,8,1,4),
(0,9,1,4),
(0,10,2,5),
(0,11,2,5),
(0,12,2,5),
(0,5,2,5),
(0,5,2,5),
(0,6,2,6),
(0,7,2,7),
(0,8,2,7);
SELECT *from c_d_s;

insert INTO dimentions (id_dimention,id_sector,id_case,sector_w_size,sector_h_size, sector_l_size, damage_size)
values
(0,1,1,11,35,26,4),
(0,2,1,14,25,16,5),
(0,3,1,11,21,13,4),
(0,4,1,10,21,1,12),
(0,5,2,15,5,6,11),
(0,6,2,19,2,6,2),
(0,7,2,2,1,6,34),
(0,8,2,7,51,7,42);


select * from dimentions;


insert INTO d_c_d_s (id_d_c_d_s,id_c_d_s, size)
values
(0,1,32),
(0,2,109),
(0,3,108),
(0,4,148),
(0,5,32),
(0,6,139),
(0,7,118),
(0,8,107),
(0,9,32),
(0,10,109),
(0,11,108),
(0,12,148),
(0,13,32),
(0,14,139),
(0,15,118),
(0,16,107),
(0,17,32);
select *from d_c_d_s;

insert INTO damage_images(id_damage_images,id_d_c_d_s, image1, image2, image3)
values
(0,1,'img11','img12','img1wd'),
(0,2,'img21','img23','img2dw'),
(0,3,'img31','img34','img3dw'),
(0,4,'img41','img45','imgfr4'),
(0,5,'img51','img5w','imggt5'),
(0,6,'img61','imge6','imghy6'),
(0,7,'img71','imgw7','img457'),
(0,8,'img81','imge8','img3218'),
(0,9,'img91','imgw9','img3r9'),
(0,10,'img101','img1r0','img1rre0'),
(0,11,'img111','img1r1','img1eqw1'),
(0,12,'img121','img1r2','img12ewq'),
(0,13,'img131','img1e3','img13e3'),
(0,14,'img141','img1w4','img14ewq'),
(0,15,'img151','img1q5','img15ewq'),
(0,16,'img161','img1w6','img16eqw'),
(0,17,'img171','img1e7','img17ewq');
select *from d_c_d_s;