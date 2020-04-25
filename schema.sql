DROP TABLE US_State_Pop IF EXISTS;
DROP TABLE Daily_COVID_Stats IF EXISTS;
DROP TABLE Final_COVID_Stats IF EXISTS;

-- Create Three Tables
CREATE TABLE US_State_Pop (
  state varchar(2) PRIMARY KEY,
  name varchar,
  2019_pop INT
);

CREATE TABLE Daily_COVID_Stats (
  date varchar PRIMARY KEY,
  state varchar(2) PRIMARY KEY,
  positive_tests INT,
  total_tests INT,
  deaths INT,
  FOREIGN KEY (state) REFERENCES US_State_Pop(state)
);

CREATE TABLE Final_COVID_Stats (
  date varchar PRIMARY KEY,
  state varchar(2) PRIMARY KEY,
  positive_tests INT,
  death INT,
  total_tests INT,
  2019_pop INT,
  pct_tested DOUBLE,
  tested_per_million FLOAT
  FOREIGN KEY (state) REFERENCES US_State_Pop(state)
);