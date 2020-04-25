DROP TABLE us_state_pop CASCADE;
DROP TABLE daily_covid_stats CASCADE;
DROP TABLE final_covid_stats;

-- Create Three Tables
CREATE TABLE us_state_pop (
  state varchar(2) PRIMARY KEY,
  name varchar,
  pop_2019 INT
);

CREATE TABLE daily_covid_stats (
  date varchar,
  state varchar(2),
  positive_tests INT,
  total_tests INT,
  deaths INT,
  PRIMARY KEY (date, state),
  FOREIGN KEY (state) REFERENCES us_state_pop(state)
);

CREATE TABLE final_covid_stats (
  date varchar,
  state varchar(2),
  name varchar,
  positive_tests INT,
  death INT,
  total_tests INT,
  pop_2019 INT,
  pct_tested FLOAT,
  tested_per_million FLOAT,
  PRIMARY KEY (date, state),
  FOREIGN KEY (state) REFERENCES us_state_pop(state)
);
