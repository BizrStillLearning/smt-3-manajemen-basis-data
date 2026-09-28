create database rental;

use rental;

create table country (
    country_id int,
    country varchar(50),
    last_update datetime,

    primary key (country_id)
);


create table language (
    language_id int,
    name varchar(20),
    last_update datetime,

    primary key (language_id)
);


create table category (
    category_id int,
    name varchar(25),
    last_update datetime,

    primary key (category_id)
);

create table actor (
    actor_id int,
    first_name varchar(45),
    last_name varchar(45),
    last_update datetime,

    primary key (actor_id)
);

create table city (
    city_id int,
    city varchar(50),
    country_id int,
    last_update datetime,

    primary key (city_id),

    foreign key (country_id)
        references country(country_id)
);

create table address (
    address_id int,
    address varchar(50),
    address2 varchar(50),
    district varchar(20),
    city_id int,
    postal_code varchar(10),
    phone varchar(20),
    last_update datetime,

    primary key (address_id),

    foreign key (city_id)
        references city(city_id)
);

create table store (
    store_id int,
    manager_staff_id int,
    address_id int,
    last_update datetime,

    primary key (store_id),

    foreign key (address_id)
        references address(address_id)
);

create table film (
    film_id int,
    title varchar(128),
    description text,
    release_year int,
    language_id int,
    rental_duration int,
    rental_rate decimal(5,2),
    length int,
    replacement_cost decimal(5,2),
    rating varchar(10),
    special_features varchar(255),
    last_update datetime,

    primary key (film_id),

    foreign key (language_id)
        references language(language_id)
);

create table customer (
    customer_id int,
    store_id int,
    first_name varchar(45),
    last_name varchar(45),
    email varchar(50),
    address_id int,
    active boolean,
    create_date datetime,
    last_update datetime,

    primary key (customer_id),

    foreign key (store_id)
        references store(store_id),

    foreign key (address_id)
        references address(address_id)
);

create table staff (
    staff_id int,
    first_name varchar(45),
    last_name varchar(45),
    address_id int,
    picture varchar(255),
    email varchar(50),
    store_id int,
    active boolean,
    username varchar(50),
    password varchar(100),
    last_update datetime,

    primary key (staff_id),

    foreign key (address_id)
        references address(address_id),

    foreign key (store_id)
        references store(store_id)
);

alter table store
add foreign key (manager_staff_id)
references staff(staff_id);

create table film_category (
    film_id int,
    category_id int,
    last_update datetime,

    primary key (film_id, category_id),

    foreign key (film_id)
        references film(film_id),

    foreign key (category_id)
        references category(category_id)
);

create table film_actor (
    actor_id int,
    film_id int,
    last_update datetime,

    primary key (actor_id, film_id),

    foreign key (actor_id)
        references actor(actor_id),

    foreign key (film_id)
        references film(film_id)
);

create table inventory (
    inventory_id int,
    film_id int,
    store_id int,
    last_update datetime,

    primary key (inventory_id),

    foreign key (film_id)
        references film(film_id),

    foreign key (store_id)
        references store(store_id)
);

create table rental (
    rental_id int,
    rental_date datetime,
    inventory_id int,
    customer_id int,
    return_date datetime,
    staff_id int,
    last_update datetime,

    primary key (rental_id),

    foreign key (inventory_id)
        references inventory(inventory_id),

    foreign key (customer_id)
        references customer(customer_id),

    foreign key (staff_id)
        references staff(staff_id)
);

create table payment (
    payment_id int,
    customer_id int,
    staff_id int,
    rental_id int,
    amount decimal(10,2),
    payment_date datetime,

    primary key (payment_id),

    foreign key (customer_id)
        references customer(customer_id),

    foreign key (staff_id)
        references staff(staff_id),

    foreign key (rental_id)
        references rental(rental_id)
);


-- melihat seluruh tabel

show tables;
