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
  pct_tested FLOAT,
  tested_per_million FLOAT
  FOREIGN KEY (date) REFERENCES Daily_COVID_Stats(date),
  FOREIGN KEY (state) REFERENCES Daily_COVID_Stats(state),
  FOREIGN KEY (positive_tests) REFERENCES Daily_COVID_Stats(positive_tests),
  FOREIGN KEY (total_tests) REFERENCES Daily_COVID_Stats(total_tests),
  FOREIGN KEY (death) REFERENCES Daily_COVID_Stats(death),
  FOREIGN KEY (name) REFERENCES US_State_Pop(name),
  FOREIGN KEY (2019_pop) REFERENCES US_State_Pop(2019_pop)
);