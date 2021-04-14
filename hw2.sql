-- 2_a)
INSERT INTO Constructors VALUES('McLaren','British','Mercedes','884','95','180');
INSERT INTO Constructors VALUES('BMW', 'Sauber,' 'German','BMW','70','95','180');
INSERT INTO Constructors VALUES('Renault','French','Renault','660','91','175');
INSERT INTO Constructors VALUES('Ferrari','Italian','Ferrari','1010', '93', '180');
INSERT INTO Constructors VALUES('Toyota', 'Japanese','Toyota','1140', '91','175');
INSERT INTO Constructors VALUES('Red Bull', 'Austrian', 'Honda', '304', '91', '175');
INSERT INTO Constructors VALUES('Honda', 'Japanese', 'Honda', '88', '91', '175');
INSERT INTO Constructors VALUES('Toro Rosso', 'Italian', 'Ferrari', '268', '93', '180');
INSERT INTO Constructors VALUES('Jaguar', 'British', 'Cosworth', '85', '93', '178');
SELECT * FROM Constructors;

-- 2-b)
INSERT INTO Drivers VALUES('hamilton', '07/01/1985', 'British', 'McLaren');
INSERT INTO Drivers VALUES('heidfeld', '10/05/1977', 'German', 'BMW', 'Sauber');
INSERT INTO Drivers VALUES('alonso', '29/07/1981', 'Spanish', 'Renault');
INSERT INTO Drivers VALUES('raikkonen', '17/10/1979', 'Finnish', 'Ferrari',);
INSERT INTO Drivers VALUES('kubica', '07/12/1984', 'Polish', 'BMW', 'Sauber');
INSERT INTO Drivers VALUES('massa', '25/04/1981', 'Brazilian', 'Ferrari');
INSERT INTO Drivers VALUES('trulli', '13/07/1974', 'Italian', 'Toyota');
INSERT INTO Drivers VALUES('webber', '27/08/1976', 'Australian', 'Red', 'Bull');
INSERT INTO Drivers VALUES('button', '19/01/1980', 'British', 'Honda');
INSERT INTO Drivers VALUES('vettel', '03/07/1987', 'German', 'Toro', 'Rosso');
INSERT INTO Drivers VALUES('barrichello', '23/05/1972', 'Brazilian', 'Honda');
INSERT INTO Drivers VALUES('Irvine', '10/11/', '1965', 'British', 'Jaguar');
INSERT INTO Drivers VALUES('Schmacher', '03/01/1969', 'German', 'Ferrari');
SELECT * FROM Drivers;

-- 2-c)
INSERT INTO Races VALUES('Australian Grand Prix', '2009-03 29', 'Australia');
INSERT INTO Races VALUES('British Grand Prix','2009-06-21','Europe');
INSERT INTO Races VALUES('German Grand Prix','2009-07-12', 'Europe');
INSERT INTO Races VALUES('European Grand Prix','2009-08-23' 'Europe');
INSERT INTO Races VALUES('Abu Dhabi Grand Prix','2009-11-01', 'Middle East');
INSERT INTO Races VALUES('Malaysian Grand Prix','2008-03-23', 'Asia');
INSERT INTO Races VALUES('Spanish Grand Prix','2008-04-27', 'Europe');
SELECT * FROM Races;

-- 2-d)
INSERT INTO Results VALUES('Australian Grand Prix', 'trulli', 'first place')
INSERT INTO Results VALUES('Australian Grand Prix', 'barrichello', 'second place')
INSERT INTO Results VALUES('Australian Grand Prix', 'button', 'third place')
INSERT INTO Results VALUES('British Grand Prix', 'button', 'first place')
INSERT INTO Results VALUES('British Grand Prix', 'barrichello', 'second place')
INSERT INTO Results VALUES('British Grand Prix', 'vettel', 'third place')
INSERT INTO Results VALUES('German Grand Prix', 'button', 'first place')
INSERT INTO Results VALUES('German Grand Prix', 'vettel', 'second place')
INSERT INTO Results VALUES('German Grand Prix', 'webber', 'third place')
INSERT INTO Results VALUES('European Grand Prix', 'button', 'first place') 
INSERT INTO Results VALUES('European Grand Prix', 'barrichello', 'second place')
INSERT INTO Results VALUES('European Grand Prix', 'webber', 'third place')
INSERT INTO Results VALUES('Abu Dhabi Grand Prix', 'button', 'first place')
INSERT INTO Results VALUES('Abu Dhabi Grand Prix', 'vettel', 'second place')
INSERT INTO Results VALUES('Abu Dhabi Grand Prix', 'barrichello', 'third place')
INSERT INTO Results VALUES('Malaysian Grand Prix', 'hamilton', 'first place')
INSERT INTO Results VALUES('Malaysian Grand Prix', 'heidfeld', 'second place')
INSERT INTO Results VALUES('Malaysian Grand Prix', 'raikkonen', 'third place')
INSERT INTO Results VALUES('Spanish Grand Prix', 'hamilton', 'second place')
INSERT INTO Results VALUES('Singapore Grand Prix', 'hamilton', 'first place')
INSERT INTO Results VALUES('Singapore Grand Prix', 'massa', 'second place')
INSERT INTO Results VALUES('Singapore Grand Prix', 'kubica', 'third place')
INSERT INTO Results VALUES('Brazilian Grand Prix', 'hamilton', 'first place')
INSERT INTO Results VALUES('Brazilian Grand Prix', 'massa', 'second place')
INSERT INTO Results VALUES('Monaco Grand Prix', 'alonso', 'first place')
INSERT INTO Results VALUES('Monaco Grand Prix', 'hamilton', 'second place')
INSERT INTO Results VALUES('Monaco Grand Prix', 'massa', 'third place')
INSERT INTO Results VALUES('Canadian Grand Prix', 'hamilton', 'first place')
INSERT INTO Results VALUES('Canadian Grand Prix', 'alonso', 'second place')
INSERT INTO Results VALUES('Canadian Grand Prix', 'massa', 'third place')
INSERT INTO Results VALUES('United States Grand Prix', 'hamilton', 'first place')
INSERT INTO Results VALUES('United States Grand Prix', 'alonso', 'second place')
INSERT INTO Results VALUES('United States Grand Prix', 'massa', 'third place')
INSERT INTO Results VALUES('French Grand Prix', 'hamilton', 'first place')
INSERT INTO Results VALUES('French Grand Prix', 'alonso', 'second place')
INSERT INTO Results VALUES('French Grand Prix', 'massa', 'third place')
INSERT INTO Results VALUES('Italian Grand Prix', 'hamilton', 'first place')
INSERT INTO Results VALUES('Italian Grand Prix', 'alonso', 'second place')
INSERT INTO Results VALUES('San Marino Grand Prix', 'Schmacher', 'first place')
INSERT INTO Results VALUES('San Marino Grand Prix', 'barrichello', 'second place')
SELECT * FROM Results;
