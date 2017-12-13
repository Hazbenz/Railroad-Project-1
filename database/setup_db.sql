DROP DATABASE `F17336Gteam8`;
CREATE DATABASE `F17336Gteam8`;
USE `F17336Gteam8`;

CREATE TABLE station
(
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    name               TEXT NOT NULL,
    accessibility_code TINYINT NOT NULL
);

CREATE TABLE segment
(
    id            INT AUTO_INCREMENT PRIMARY KEY,
    start_station INT NOT NULL,
    end_station   INT NOT NULL,
    distance      INT NOT NULL,
    base_fare     DECIMAL(7, 2) NOT NULL,

    FOREIGN KEY (start_station) REFERENCES station(id),
    FOREIGN KEY (end_station)   REFERENCES station(id)
);

CREATE TABLE train
(

    id            INT AUTO_INCREMENT PRIMARY KEY,
    start_station INT NOT NULL,
    end_station   INT NOT NULL,
    days          MEDIUMINT NOT NULL, /* mtwhfsu, eg: 1001010 -> mon, th, sat*/

    FOREIGN KEY (start_station) REFERENCES station(id),
    FOREIGN KEY (end_station)   REFERENCES station(id)
);

CREATE TABLE seats_free
(
    train_id          INT NOT NULL,
    segment_id        INT NOT NULL,
    of_date           DATE NOT NULL DEFAULT NOW(),
    num_of_free_seats SMALLINT NOT NULL, /* (7 * 64) = 448 */

    PRIMARY KEY(train_id, segment_id, of_date),
    FOREIGN KEY (train_id)   REFERENCES train(id),
    FOREIGN KEY (segment_id) REFERENCES segment(id)
);

CREATE TABLE stops_at
(
    train_id       INT NOT NULL,
    station_id     INT NOT NULL,
    arrival_time   TIME NOT NULL,
    departure_time TIME NOT NULL,

    PRIMARY KEY(train_id, station_id),
    FOREIGN KEY (train_id) REFERENCES train(id),
    FOREIGN KEY (station_id) REFERENCES station(id)
);

CREATE TABLE passenger
(
    id      INT AUTO_INCREMENT PRIMARY KEY,
    name    TEXT NOT NULL,
    address TEXT NOT NULL,
    email   TEXT NOT NULL,
    phone   TEXT NOT NULL
);

CREATE TABLE reservation
(
    id             INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id   INT NOT NULL,
    on_date        DATE NOT NULL,
    total_fare     DECIMAL(7, 2) NOT NULL,
    payment_type   TINYINT NOT NULL,

    FOREIGN KEY (passenger_id) REFERENCES passenger(id)
);

CREATE TABLE trip
(
    id             INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id   INT NOT NULL,
    start_station  INT NOT NULL,
    end_station    INT NOT NULL,
    reservation_id INT NOT NULL,
    train_id       INT NOT NULL,
    on_date        DATE NOT NULL,

    FOREIGN KEY (passenger_id) REFERENCES passenger(id),
    FOREIGN KEY (start_station) REFERENCES station(id),
    FOREIGN KEY (end_station) REFERENCES station(id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(id),
    FOREIGN KEY (train_id) REFERENCES train(id)
);






INSERT INTO station (name, accessibility_code) VALUES ('Boston, MA - South Station', 2);
INSERT INTO station (name, accessibility_code) VALUES ('Boston, MA - Back Bay Station', 7);
INSERT INTO station (name, accessibility_code) VALUES ('Route 128, MA', 9);
INSERT INTO station (name, accessibility_code) VALUES ('Providence, RI', 10);
INSERT INTO station (name, accessibility_code) VALUES ('Kingston, RI', 4);
INSERT INTO station (name, accessibility_code) VALUES ('Westerly,RI', 2);
INSERT INTO station (name, accessibility_code) VALUES ('Mystic, CT', 5);
INSERT INTO station (name, accessibility_code) VALUES ('New London, CT', 8);
INSERT INTO station (name, accessibility_code) VALUES ('Old Saybrook, CT', 5);
INSERT INTO station (name, accessibility_code) VALUES ('New Haven, CT', 6);
INSERT INTO station (name, accessibility_code) VALUES ('Bridgeport, CT', 3);
INSERT INTO station (name, accessibility_code) VALUES ('Stamford, CT', 7);
INSERT INTO station (name, accessibility_code) VALUES ('New Rochelle, NY',1);
INSERT INTO station (name, accessibility_code) VALUES ('New York, NY - Penn Station', 2);
INSERT INTO station (name, accessibility_code) VALUES ('Newark, NJ', 10);
INSERT INTO station (name, accessibility_code) VALUES ('Newark Liberty Intl. Air., NJ', 1);
INSERT INTO station (name, accessibility_code) VALUES ('Metro Park, NJ', 8);
INSERT INTO station (name, accessibility_code) VALUES ('Trenton, NJ', 2);
INSERT INTO station (name, accessibility_code) VALUES ('Philadelphia, PA - 30th Street Station', 3);
INSERT INTO station (name, accessibility_code) VALUES ('Wilmington, DE - J.R. Biden, Jr. Station', 10);
INSERT INTO station (name, accessibility_code) VALUES ('Aberdeen, MD', 3);
INSERT INTO station (name, accessibility_code) VALUES ('Baltimore, MD - Penn Station', 1);
INSERT INTO station (name, accessibility_code) VALUES ('BWI Marshall Airport, MD', 4);
INSERT INTO station (name, accessibility_code) VALUES ('New Carrollton, MD', 3);
INSERT INTO station (name, accessibility_code) VALUES ('Washington, DC - Union Station', 10);




INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (1, 2, 146, 56);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (2, 3, 261, 45);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (3, 4, 440, 58);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (4, 5, 426, 19);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (5, 6, 264, 27);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (6, 7, 41, 20);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (7, 8, 363, 57);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (8, 9, 412, 54);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (9, 10, 240, 13);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (10, 11, 411, 59);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (11, 12, 69, 42);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (12, 13, 480, 31);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (13, 14, 140, 24);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (14, 15, 115, 57);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (15, 16, 51, 18);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (16, 17, 461, 43);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (17, 18, 24, 60);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (18, 19, 255, 14);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (19, 20, 460, 11);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (20, 21, 332, 42);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (21, 22, 416, 55);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (22, 23, 437, 37);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (23, 24, 62, 15);
INSERT INTO segment (start_station, end_station, distance, base_fare)
VALUES (24, 25, 129, 29);
