drop database car_booking_system;

create database car_booking_system;
use car_booking_system;

create table locations(
location_id int auto_increment primary key,
location_name varchar(255) not null
);


CREATE TABLE customers(
  customer_id int auto_increment primary key,
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  phone varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  address varchar(255) NOT NULL,
  location_id int NOT NULL,
  foreign key (location_id)references locations(location_id)
  );


CREATE TABLE managers(
  manager_id int auto_increment primary key,
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  phone varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  picture varchar(255) NOT NULL,
  status varchar(255) NOT NULL DEFAULT 'Deactivated',
  location_id int NOT NULL,
  foreign key (location_id)references locations(location_id)
  );

CREATE TABLE cars (
  card_id int auto_increment primary key,
  car_name varchar(255) NOT NULL,
  car_model varchar(255) NOT NULL,
  car_number varchar(255) NOT NULL,
  car_type varchar(255) NOT NULL,
  price_per_day varchar(255) NOT NULL,
  car_mileage varchar(255) NOT NULL,
  seating_capacity varchar(255) NOT NULL,
  availability_status varchar(255) NOT NULL,
  car_picture varchar(255) NOT NULL,
  price_per_mile varchar(255) NOT NULL,
  current_miles varchar(255) NOT NULL,
  miles_travelled varchar(255),
  total_price varchar(255),
  manager_id int NOT NULL,
  foreign key (manager_id)references managers(manager_id)
  );
  
  
  CREATE TABLE car_bookings(
  car_booking_id int auto_increment primary key,
  to_date varchar(255) NOT NULL,
  from_date varchar(255) NOT NULL,
  booking_type varchar(255) NOT NULL,
  pickup_location varchar(255) NOT NULL,
  booking_date varchar(255) NOT NULL,
  status varchar(255) NOT NULL,
  total_price varchar(255) NOT NULL,
  return_date varchar(255),
  extra_charge varchar(255),
  return_summary varchar(255),
  car_id int NOT NULL,
  customer_id int NOT NULL,
  foreign key (car_id)references cars(car_id),
  foreign key (customer_id)references customers(customer_id)
  );
  

CREATE TABLE complaints(
  complaint_id int auto_increment primary key,
  complaint varchar(255) NOT NULL,
  complaint_by varchar(255) not null,
  service_provider_id int NOT NULL,
  customer_id int NOT NULL,
  status varchar(255) not null,
  action varchar(255),
  foreign key (service_provider_id)references service_providers(service_provider_id),
  foreign key (customer_id)references customers(customer_id)
  );

CREATE TABLE reviews(
  review_id int auto_increment primary key,
  review varchar(255) NOT NULL,
  rating varchar(255) NOT NULL,
  service_request_id int NOT NULL,
  foreign key (service_request_id)references service_request(service_request_id)
  );