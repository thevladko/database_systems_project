-- Relation "Customer"

CREATE TABLE customer(
	customer_id integer PRIMARY KEY,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	date_of_birth date NOT NULL,
	age integer NOT NULL CHECK (age>=18 AND age<=100),
	gender varchar(10) NOT NULL,
	email_address varchar(50) NOT NULL UNIQUE CHECK(email_address like '%___@___%'),
	address varchar(50) NOT NULL
);

CREATE SEQUENCE sequence_customer
	START WITH 1
	INCREMENT BY 1
	CACHE 5;

CREATE OR REPLACE TRIGGER trigger_customer
  BEFORE INSERT ON customer
  FOR EACH ROW
BEGIN
  SELECT sequence_customer.nextval
    INTO :new.customer_id
    FROM dual;
END;
/

-- Relation "Driving License"

CREATE TABLE driving_license(
	license_id varchar(20) PRIMARY KEY,
	customer_id_reference integer,
	country varchar(20) NOT NULL,
	FOREIGN KEY(customer_id_reference) REFERENCES customer ON DELETE CASCADE
);

-- Relation "Category"

CREATE TABLE driving_license_category(
	category_type varchar(20) PRIMARY KEY
);

-- Relation "Has categories"

CREATE TABLE has_categories(
	category_type_reference varchar(20),
	license_id_reference varchar(50),
	PRIMARY KEY(category_type_reference, license_id_reference),
	FOREIGN KEY(license_id_reference) REFERENCES driving_license ON DELETE CASCADE,
	FOREIGN KEY(category_type_reference) REFERENCES driving_license_category ON DELETE CASCADE
);

-- Relation "Company Office"

CREATE TABLE company_office(
	company_office_id varchar(10) PRIMARY KEY,
	office_location varchar(50) NOT NULL,
	open_hours varchar(50) NOT NULL,
	available_vehicles varchar(50) NOT NULL
);

-- Relation "Vehicle"

CREATE TABLE vehicle(
	vehicle_id varchar(50) PRIMARY KEY,
	company_office_id_reference varchar(10),
	availability_status varchar(10) DEFAULT 'YES',
	rental_price float(10),
	vehicle_brand varchar(50),
	num_of_doors integer,
	gear_type varchar(10), 
	FOREIGN KEY(company_office_id_reference) REFERENCES company_office ON DELETE SET NULL
);

-- Relation "economy_class_car"

CREATE TABLE economy_class_car(
	vehicle_id_reference varchar(50) PRIMARY KEY,
	num_of_km_per_day integer DEFAULT 1000,
	FOREIGN KEY(vehicle_id_reference) REFERENCES vehicle ON DELETE CASCADE
);

-- Relation "family_class_car"

CREATE TABLE family_class_car(
	vehicle_id_reference varchar(50) PRIMARY KEY,
	additional_truck varchar(10) DEFAULT 'NO',
	navigator varchar(10) DEFAULT 'YES',
	FOREIGN KEY(vehicle_id_reference) REFERENCES vehicle ON DELETE CASCADE
);

-- Relation "Reservation"

CREATE TABLE reservation(
	reservation_id integer PRIMARY KEY,
	customer_id_reference integer NOT NULL UNIQUE,
	vehicle_id_reference varchar(50),
	company_office_id_reference varchar(10) NOT NULL,
	license_id_reference varchar(50) NOT NULL,
	pickup_location varchar(50) DEFAULT 'Vienna',
	pickup_date date NOT NULL,
	pickup_time varchar(20) DEFAULT 'Unknown',
	return_location varchar(50) DEFAULT 'Vienna',
	return_date date NOT NULL,
	return_time varchar(20) DEFAULT 'Unknown',
	FOREIGN KEY(customer_id_reference) REFERENCES customer ON DELETE CASCADE,
	FOREIGN KEY(vehicle_id_reference) REFERENCES vehicle ON DELETE CASCADE,
	FOREIGN KEY(company_office_id_reference) REFERENCES company_office ON DELETE CASCADE, 
	FOREIGN KEY(license_id_reference) REFERENCES driving_license ON DELETE CASCADE
);


CREATE SEQUENCE sequence_reservation
	START WITH 1
	INCREMENT BY 1
	CACHE 5;

CREATE OR REPLACE TRIGGER trigger_reservation
  BEFORE INSERT ON reservation
  FOR EACH ROW
BEGIN
  SELECT sequence_reservation.nextval
    INTO :new.reservation_id
    FROM dual;
END;
/

-- Relation "make"

CREATE TABLE make( 
	customer_id_reference integer,
	reservation_id_reference integer NOT NULL,
	PRIMARY KEY(customer_id_reference, reservation_id_reference),
	FOREIGN KEY(customer_id_reference) REFERENCES customer ON DELETE CASCADE,
	FOREIGN KEY(reservation_id_reference) REFERENCES reservation ON DELETE CASCADE
);

-- Relation "billing_information"


CREATE TABLE billing_information(
	invoice_number integer PRIMARY KEY,
	customer_id_reference integer,
	reservation_id_reference integer,
	reservation_description varchar(800) NOT NULL,
	total_rental_price FLOAT(10) NOT NULL,
	FOREIGN KEY(customer_id_reference) REFERENCES customer ON DELETE CASCADE,
	FOREIGN KEY(reservation_id_reference) REFERENCES reservation ON DELETE CASCADE
);

CREATE SEQUENCE sequence_billing_information
	START WITH 1
	INCREMENT BY 1
	CACHE 5;

CREATE OR REPLACE TRIGGER trigger_billing_information
  BEFORE INSERT ON billing_information
  FOR EACH ROW
BEGIN
  SELECT sequence_billing_information.nextval
    INTO :new.invoice_number
    FROM dual;
END;
/


-- views

create view economy as  
SELECT * FROM vehicle INNER JOIN economy_class_car ON (vehicle.vehicle_id = economy_class_car.vehicle_id_reference);

create view family as  
SELECT * FROM vehicle INNER JOIN family_class_car ON (vehicle.vehicle_id = family_class_car.vehicle_id_reference);



-- Stored Procedure

CREATE OR REPLACE PROCEDURE get_certain_location (city IN VARCHAR, amount OUT NUMBER) IS
	BEGIN
		SELECT COUNT(office_location) INTO amount
		FROM company_office
		WHERE office_location = city;
	END get_certain_location;
/



