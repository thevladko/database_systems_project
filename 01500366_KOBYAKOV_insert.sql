-- company office is filled out with java data generator

-- insert into vehicle
INSERT INTO vehicle VALUES ('Vehicle1', 'ID1', 'YES', 90.5, 'BMW', 4, 'automatic');
INSERT INTO vehicle VALUES ('Vehicle2', 'ID2', 'NO', 80.5, 'MERCEDES', 4, 'manual');
INSERT INTO vehicle VALUES ('Vehicle3', 'ID3', 'YES', 30.0, 'Audi', 4, 'automatic');
INSERT INTO vehicle VALUES ('Vehicle4', 'ID4', 'YES', 100.0, 'Infiniti', 4, 'manual');
INSERT INTO vehicle VALUES ('Vehicle5', 'ID5', 'NO', 120.0, 'Bently', 4, 'automatic');
INSERT INTO vehicle VALUES ('Vehicle6', 'ID6', 'NO', 40.0, 'Porsche', 4, 'manual');
INSERT INTO vehicle VALUES ('Vehicle7', 'ID7', 'YES', 100.0, 'BMW', 4, 'manual');
INSERT INTO vehicle VALUES ('Vehicle8', 'ID8', 'YES', 90.5, 'MERCEDES', 4, 'automatic');
INSERT INTO vehicle VALUES ('Vehicle9', 'ID9', 'NO', 100.0, 'BMW', 4, 'manual');
INSERT INTO vehicle VALUES ('Vehicle10', 'ID10', 'NO', 40.0, 'Porsche', 4, 'manual');
INSERT INTO vehicle VALUES ('Vehicle11', 'ID11', 'NO', 90.5, 'BMW', 4, 'automatic');
INSERT INTO vehicle VALUES ('Vehicle12', 'ID11', 'NO', 100.0, 'Porsche', 4, 'manual');
INSERT INTO vehicle VALUES ('Vehicle13', 'ID11', 'YES', 40.0, 'BMW', 4, 'automatic');
INSERT INTO vehicle VALUES ('Vehicle14', 'ID7', 'NO', 90.5, 'Infiniti', 4, 'manual');
INSERT INTO vehicle VALUES ('Vehicle15', 'ID8', 'YES', 100.0, 'Infiniti', 4, 'manual');
INSERT INTO vehicle VALUES ('Vehicle16', 'ID6', 'YES', 90.5, 'MERCEDES', 4, 'automatic');

-- insert into economy_class_car
INSERT INTO economy_class_car (vehicle_id_reference) VALUES ('Vehicle2');
INSERT INTO economy_class_car (vehicle_id_reference) VALUES ('Vehicle4');
INSERT INTO economy_class_car (vehicle_id_reference) VALUES ('Vehicle1');
INSERT INTO economy_class_car (vehicle_id_reference) VALUES ('Vehicle13');
INSERT INTO economy_class_car (vehicle_id_reference) VALUES ('Vehicle14');
INSERT INTO economy_class_car (vehicle_id_reference) VALUES ('Vehicle10');
INSERT INTO economy_class_car (vehicle_id_reference) VALUES ('Vehicle8');

-- insert into family_class_car
INSERT INTO family_class_car (vehicle_id_reference) VALUES ('Vehicle7');
INSERT INTO family_class_car (vehicle_id_reference) VALUES ('Vehicle6');
INSERT INTO family_class_car (vehicle_id_reference) VALUES ('Vehicle5');
INSERT INTO family_class_car (vehicle_id_reference) VALUES ('Vehicle3');
INSERT INTO family_class_car (vehicle_id_reference) VALUES ('Vehicle16');
INSERT INTO family_class_car (vehicle_id_reference) VALUES ('Vehicle15');
INSERT INTO family_class_car (vehicle_id_reference) VALUES ('Vehicle12');

-- insert into driving_license_category
INSERT INTO driving_license_category VALUES ('type1');
INSERT INTO driving_license_category VALUES ('type2');
INSERT INTO driving_license_category VALUES ('type3');
INSERT INTO driving_license_category VALUES ('type4');


-- USE JAVA GENERATOR FROM HERE







