DROP TABLE album IF EXISTS;

CREATE TABLE album(
    album_id VARCHAR(10) NOT NULL,
    title VARCHAR(120),
    artist_id VARCHAR(30)
);

DROP TABLE album2 IF EXISTS;

CREATE TABLE album2(
    album_id VARCHAR(10) NOT NULL,
    title VARCHAR(120),
    artist_id VARCHAR(30)
);

DROP TABLE artist IF EXISTS;

CREATE TABLE artist(
    artist_id VARCHAR(30) NOT NULL,
    name VARCHAR(120),
);

DROP TABLE customer IF EXISTS;

CREATE TABLE customer(
    customer_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    company VARCHAR(120),
    address VARCHAR(120),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    postal_code VARCHAR(50),
    phone VARCHAR(50),
    fax VARCHAR(50),
    email VARCHAR(50),
    support_rep_id INT
);

DROP TABLE employee IF EXISTS;

CREATE TABLE employee(
    employee_id VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    first_name VARCHAR(50),
    title VARCHAR(50),
    reports_to VARCHAR(30),
    levels VARCHAR(10),
    birthdate TIMESTAMP WITHOUT TIME ZONE,
    hire_date TIMESTAMP WITHOUT TIME ZONE,
    address VARCHAR(120),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(30),
    postal_code VARCHAR(30),
    phone VARCHAR(30),
    fax VARCHAR(30),
    email VARCHAR(30)
);

DROP TABLE genre IF EXISTS;

CREATE TABLE genre(
    genre_id VARCHAR(50) NOT NULL,
    name VARCHAR(120)
);

DROP TABLE invoice_line IF EXISTS;

CREATE TABLE invoice_line(
    invoice_line_id VARCHAR(50) NOT NULL,
    invoice_id INT,
    track_id INT,
    unit_price DOUBLE PRECISION,
    quantity DOUBLE PRECISION
);

DROP TABLE invoice IF EXISTS;

CREATE TABLE invoice(
    invoice_id INT NOT NULL,
    customer_id INT,
    invoice_date TIMESTAMP WITHOUT TIME ZONE,
    billing_address VARCHAR(120),
    billing_city VARCHAR(30),
    billing_state VARCHAR(30),
    billing_country VARCHAR(30),
    billing_postal VARCHAR(30),
    total DOUBLE PRECISION
);

DROP TABLE media_type IF EXISTS;

CREATE TABLE media_type(
    media_type_id VARCHAR(50) NOT NULL,
    name VARCHAR(120)
);

DROP TABLE playlist_track IF EXISTS;

CREATE TABLE playlist_track(
    playlist_id VARCHAR(50),
    track_id INT
);

DROP TABLE playlist IF EXISTS;

CREATE TABLE playlist(
    playlist_id VARCHAR(50) NOT NULL,
    name VARCHAR(120)
);

DROP TABLE track IF EXISTS;

CREATE TABLE track(
    track_id INT NOT NULL,
    name VARCHAR(150),
    album_id VARCHAR(50),
    media_type_id VARCHAR(50),
    genre_id VARCHAR(50),
    composer VARCHAR(190),
    milliseconds INT,
    bytes INT,
    unit_price DOUBLE PRECISION
);
