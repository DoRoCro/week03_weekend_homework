DROP TABLE IF EXISTS screenings ;
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers ( 
  id SERIAL PRIMARY KEY,
  funds DECIMAL(8,2),
  name VARCHAR(255)
);

CREATE TABLE films (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  duration_mins INT
);

CREATE TABLE screenings (
  id SERIAL PRIMARY KEY,
  film_id INT REFERENCES films(id) ON DELETE CASCADE,
  showtime TIMESTAMP,
  screen INT2,
  price DECIMAL(8,2)
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  screening_id INT REFERENCES screenings(id) ON DELETE CASCADE,
  paid DECIMAL(8,2)
);

INSERT INTO customers ( name, funds ) VALUES ('testing_A Smith', 123.45);
INSERT INTO customers ( name, funds ) VALUES ('testing_B Jones', 1023.45);
INSERT INTO customers ( name, funds ) VALUES ('testing_C Evans', 12300.45);

INSERT INTO films ( title, duration_mins) VALUES ('testing_Star Wars', 150);
INSERT INTO films ( title, duration_mins) VALUES ('testing_Dr Strangelove, or: How I learned to stop worrying and love the bomb', 130);
INSERT INTO films ( title, duration_mins) VALUES ('testing_The Lego Batman Movie', 92 );

INSERT INTO screenings (film_id, showtime, screen, price) VALUES (1, '2017-02-21 18:00:00', 2, 6.50 );
INSERT INTO screenings (film_id, showtime, screen, price) VALUES (2, '2017-02-21 18:00:00', 3, 6.50 );
INSERT INTO screenings (film_id, showtime, screen, price) VALUES (3, '2017-02-21 18:00:00', 1, 6.50 );

INSERT INTO tickets (screening_id, customer_id, paid) VALUES (1, 1, 6.50 );
INSERT INTO tickets (screening_id, customer_id, paid) VALUES (1, 1, 6.50 );
INSERT INTO tickets (screening_id, customer_id, paid) VALUES (1, 1, 6.50 );
INSERT INTO tickets (screening_id, customer_id, paid) VALUES (2, 2, 6.50 );
INSERT INTO tickets (screening_id, customer_id, paid) VALUES (2, 2, 6.50 );
INSERT INTO tickets (screening_id, customer_id, paid) VALUES (3, 3, 6.50 );
INSERT INTO tickets (screening_id, customer_id, paid) VALUES (3, 3, 6.50 );
INSERT INTO tickets (screening_id, customer_id, paid) VALUES (3, 3, 6.50 );
INSERT INTO tickets (screening_id, customer_id, paid) VALUES (3, 3, 6.50 );
INSERT INTO tickets (screening_id, customer_id, paid) VALUES (3, 3, 6.50 );
INSERT INTO tickets (screening_id, customer_id, paid) VALUES (3, 3, 6.50 );
INSERT INTO tickets (screening_id, customer_id, paid) VALUES (3, 3, 6.50 );