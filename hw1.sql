-- 1.a)
CREATE TABLE Constructors
(
    constructor     varchar(20) not null,
    country         varchar(15),
    engine          varchar(10),
    races_entered   int,
    height          int,
    width           int,
    PRIMARY KEY(constructor)
);
describe Constructors;
-- 1.b)
CREATE TABLE Drivers
(
    driver          varchar(15) not null,
    birthday        date,
    country         varchar(10),
    constructor     varchar(20),
    PRIMARY KEY(driver),
    FOREIGN KEY (constructor) REFERENCES Constructors(constructor)
);

describe Drivers;
-- 1.c)
CREATE TABLE Races
(
    Name            varchar(30) not null,
    beginDate       date,
    area            varchar(20),
    PRIMARY KEY(Name)
);
describe Races;
-- 1.d)
CREATE TABLE Results
(
    race            varchar(30) not null,
    driver          varchar(15) not null,
    race_rank       varchar(15),
    PRIMARY KEY(race, driver),
    FOREIGN KEY (race) REFERENCES Races(Name),
    FOREIGN KEY (driver) REFERENCES Drivers(driver)
);
describe Results;

