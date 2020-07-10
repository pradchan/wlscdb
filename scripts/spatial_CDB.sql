create table city_points(
        city_id number primary key,
        city_name varchar2(25),
        latitude number,
        longitude number
   );

INSERT INTO city_points (city_id, city_name, latitude, longitude)
  VALUES (1, 'Boston', 42.207905, -71.015625);
INSERT INTO city_points (city_id, city_name, latitude, longitude)
  VALUES (2, 'Raleigh', 35.634679, -78.618164);
INSERT INTO city_points (city_id, city_name, latitude, longitude)
  VALUES (3, 'San Francisco', 37.661791, -122.453613);
INSERT INTO city_points (city_id, city_name, latitude, longitude)
  VALUES (4, 'Memphis', 35.097140, -90.065918);
  
  
ALTER TABLE city_points ADD (shape SDO_GEOMETRY);


UPDATE city_points SET shape = 
  SDO_GEOMETRY(
    2001,
    8307,
    SDO_POINT_TYPE(LONGITUDE, LATITUDE, NULL),
    NULL,
    NULL
   );

select * from city_points;

select SDO_GEOM.SDO_DISTANCE(c_b.shape, c_d.shape, 0.005)
   FROM city_points c_b, city_points c_d
   WHERE c_b.city_name = 'Raleigh' AND c_d.city_name = 'Memphis';

select * from Customers;


