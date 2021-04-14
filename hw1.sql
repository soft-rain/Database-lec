-- 1.a)
CREATE TABLE Constructors
(
    constructor     varchar(20) not null,
    country         varchar(10),
    engine          varchar(10),
    races_entered   int,
    height          int,
    width           int,
    PRIMARY KEY(constructor)
)
describe Constructors;
-- 1.b)
CREATE TABLE Drivers
(
    name            varchar(15) not null,
    birthday        date,
    country         varchar(10),
    constructor     varchar(20),
    PRIMARY KEY(name),
    FOREIGN KEY (constructor) REFERENCES Constructors);

)
describe Drivers;
-- 1.c)
CREATE TABLE Races
(
    name            varchar(30) not null,
    date            date,
    area            varchar(20)
    PRIMARY KEY(name),
)
describe Races;
-- 1.d)
CREATE TABLE Results
(
    race            varchar(30) not null,
    driver          varchar(15) not null,
    race_rank       varchar(15),
    PRIMARY KEY(race, driver),
    FOREIGN KEY (race) REFERENCES Races,
    FOREIGN KEY (driver) REFERENCES Drivers
)
describe Results;

