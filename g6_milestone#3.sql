DROP DATABASE zeh4tv_legendscreen;
CREATE DATABASE zeh4tv_Legendscreen;
USE zeh4tv_Legendscreen;

CREATE TABLE Actor (
ActorID INT NOT NULL,
ActorFName VARCHAR(45) NOT NULL,
ActorLName VARCHAR(45) NOT NULL,
ActorGender VARCHAR(15),
ActorBirthDate DATE NOT NULL,
Nationality VARCHAR(20) NOT NULL,
ExperienceLevel VARCHAR(20) NOT NULL,
PRIMARY KEY (ActorID));

CREATE TABLE Director (
DirectorID INT NOT NULL,
DirectorFName VARCHAR(45) NOT NULL,
DirectorLName VARCHAR(45) NOT NULL,
PRIMARY KEY (DirectorID));

CREATE TABLE Composer (
CompID INT NOT NULL,
CompFName VARCHAR(45) NOT NULL,
CompLName VARCHAR(45) NOT NULL,
PRIMARY KEY (CompID));

CREATE TABLE ProductionStudio (
StudioID INT NOT NULL,
StudioName VARCHAR(45) NOT NULL,
Headquarters VARCHAR(45) NOT NULL,
YearFounded DATE NOT NULL,
PRIMARY KEY (StudioID));

CREATE TABLE VFXStudio (
VFXID INT NOT NULL,
VFXoName VARCHAR(45) NOT NULL,
Headquarters VARCHAR(45) NOT NULL,
YearFounded DATE NOT NULL,
PRIMARY KEY (VFXID));

CREATE TABLE Movie (
MovieID INT NOT NULL,
MovieName VARCHAR(100) NOT NULL,
ReleaseDate DATE NOT NULL,
RunTime INT NOT NULL,
OriginCountry VARCHAR(3), # Alpha code
IMDBScore FLOAT(2,1) NOT NULL,
RottenTomScore INT NOT NULL,
VFXBudget INT NOT NULL,
ProdBudget INT NOT NULL,
ComposerBudget INT NOT NULL,
DirectorSalary INT NOT NULL,
BoxOffice INT NOT NULL,
Revenue INT NOT NULL,
NetEarnings INT NOT NULL,
MiscCosts INT NOT NULL,
MerchRevenue INT NOT NULL,
BookAdaptation BOOLEAN NOT NULL,
Likes INT NOT NULL,
Shares INT NOT NULL,
Comments INT NOT NULL,
PRIMARY KEY (MovieID));

CREATE TABLE Award (
AwardID INT NOT NULL,
AwardName VARCHAR(45) NOT NULL,
Category VARCHAR(45) NOT NULL,
AwardYear DATE NOT NULL,
MovieID INT,
ActorID INT,
DirectorID INT,
CompID INT,
PRIMARY KEY (AwardID),
FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
FOREIGN KEY (ActorID) REFERENCES Actor(ActorID),
FOREIGN KEY (DirectorID) REFERENCES Director(DirectorID),
FOREIGN KEY (CompID) REFERENCES Composer(CompID)
);

CREATE TABLE Directs (
DirectorID INT NOT NULL,
MovieID INT NOT NULL,
PRIMARY KEY (DirectorID, MovieID),
FOREIGN KEY (DirectorID) REFERENCES Director(DirectorID),
FOREIGN KEY (MovieID) REFERENCES Movie(MovieID));

CREATE TABLE Composes (
CompID INT NOT NULL,
MovieID INT NOT NULL,
PRIMARY KEY (CompID, MovieID),
FOREIGN KEY (CompID) REFERENCES Composer(CompID),
FOREIGN KEY (MovieID) REFERENCES Movie(MovieID));

CREATE TABLE Produces (
StudioID INT NOT NULL,
MovieID INT NOT NULL,
PRIMARY KEY (StudioID, MovieID),
FOREIGN KEY (StudioID) REFERENCES ProductionStudio(StudioID),
FOREIGN KEY (MovieID) REFERENCES Movie(MovieID));

CREATE TABLE Edits (
VFXID INT NOT NULL,
MovieID INT NOT NULL,
PRIMARY KEY (VFXID, MovieID),
FOREIGN KEY (VFXID) REFERENCES VFXStudio(VFXID),
FOREIGN KEY (MovieID) REFERENCES Movie(MovieID));

CREATE TABLE MovieLanguage(
MovieID INT NOT NULL,
`Language` VARCHAR(3) NOT NULL, #Alpha 3 Code
PRIMARY KEY (MovieID, `Language`),
FOREIGN KEY (MovieID) REFERENCES Movie(MovieID));

CREATE TABLE Platform (
PlatformID INT NOT NULL,
PlatformName VARCHAR(45),
PRIMARY KEY (PlatformID));

CREATE TABLE LicensedTo (
MovieID INT NOT NULL,
PlatformID INT NOT NULL,
DateStart DATE NOT NULL,
DateEnd DATE,
PRIMARY KEY (MovieID, PlatformID),
FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
FOREIGN KEY (PlatformID) REFERENCES Platform(PlatformID));

CREATE TABLE `Character` (
CharacterID INT NOT NULL,
CharacterName VARCHAR(45) NOT NULL,
CharacterAge INT,
PRIMARY KEY (CharacterID)
);

CREATE TABLE Plays (
CharacterID INT NOT NULL,
ActorID INT NOT NULL,
DateStart DATE NOT NULL,
DateEnd DATE,
PRIMARY KEY (CharacterID, ActorID),
FOREIGN KEY (CharacterID) REFERENCES `Character`(CharacterID),
FOREIGN KEY (ActorID) REFERENCES Actor(ActorID));

CREATE TABLE AppearsIn (
CharacterID INT NOT NULL,
MovieID INT NOT NULL,
ScreenTime INT NOT NULL,
`Role` VARCHAR(45),
Salary INT NOT NULL,
PRIMARY KEY (CharacterID, MovieID),
FOREIGN KEY (CharacterID) REFERENCES `Character`(CharacterID),
FOREIGN KEY (MovieID) REFERENCES Movie(MovieID));

# Insert Statements


INSERT INTO Movie (MovieID, MovieName, ReleaseDate, RunTime, OriginCountry, IMDBScore, RottenTomScore, VFXBudget, ProdBudget, ComposerBudget, DirectorSalary, BoxOffice, Revenue, NetEarnings, MiscCosts, MerchRevenue, BookAdaptation, Likes, Shares, Comments)
VALUES
(1, 'The Shawshank Redemption', '1994-09-23', 142, 'USA', 9.3, 91, 20000000, 25000000, 4000000, 7000000, 278000000, 300000000, 120000000, 20000000, 15000000, False, 180000, 140000, 90000),
(2, 'The Godfather', '1972-03-24', 175, 'USA', 9.2, 99, 6000000, 6000000, 3000000, 10000000, 245000000, 270000000, 150000000, 25000000, 30000000, False, 170000, 130000, 80000),
(3, 'Batman: The Dark Knight', '2008-07-18', 152, 'USA', 9.0, 94, 150000000, 180000000, 8000000, 20000000, 534000000, 620000000, 300000000, 86000000, 40000000, False, 160000, 120000, 70000),
(4, 'The Lord of the Rings: The Return of the King', '2003-12-17', 201, 'NZ', 8.9, 94, 200000000, 200000000, 12000000, 25000000, 1118000000, 1200000000, 500000000, 82000000, 60000000, True, 190000, 150000, 100000),
(5, 'Raiders of the Lost Ark', '1981-06-12', 115, 'USA', 8.6, 94, 10000000, 20000000, 5000000, 10000000, 380000000, 475000000, 225000000, 50000000, 25000000, False, 100000, 80000, 50000),
(6, 'Indiana Jones and the Temple of Doom', '1984-05-23', 112, 'USA', 8.4, 84, 12000000, 28000000, 6000000, 12000000, 300000000, 380000000, 180000000, 60000000, 30000000, False, 80000, 60000, 40000),
(7, 'The Mummy (1999)', '1999-06-01', 126, 'USA', 7.8, 61, 8000000, 75000000, 7000000, 8000000, 415000000, 450000000, 230000000, 35000000, 40000000, False, 90000, 70000, 35000),
(8, 'Jurassic Park', '1993-06-11', 127, 'USA', 8.1, 92, 50000000, 60000000, 10000000, 15000000, 1002000000, 1100000000, 500000000, 100000000, 50000000, False, 120000, 90000, 60000),
(9, 'Pirates of the Caribbean: The Curse of the Black Pearl', '2003-07-09', 143, 'USA', 8.0, 83, 150000000, 140000000, 12000000, 20000000, 650000000, 800000000, 350000000, 150000000, 60000000, False, 110000, 80000, 55000),
(10, 'The Lord of the Rings: The Fellowship of the Ring', '2001-12-19', 178, 'NZ', 8.8, 91, 70000000, 90000000, 10000000, 20000000, 891000000, 1000000000, 400000000, 110000000, 100000000, True, 150000, 120000, 80000),
(11, 'Terminator 2: Judgment Day', '1991-07-03', 123, 'USA', 8.5, 93, 100000000, 94000000, 11000000, 10000000, 520000000, 570000000, 250000000, 50000000, 100000000, False, 140000, 100000, 70000),
(12, 'Mad Max: Fury Road', '2015-05-15', 120, 'USA', 8.3, 97, 100000000, 150000000, 8000000, 18000000, 378000000, 400000000, 200000000, 220000000, 25000000, False, 130000, 90000, 60000),
(13, 'Inception', '2010-07-16', 148, 'USA', 8.8, 86, 160000000, 200000000, 14000000, 20000000, 825000000, 880000000, 400000000, 95000000, 40000000, False, 170000, 130000, 90000),
(14, 'Kill Bill: Vol. 1', '2003-10-10', 111, 'USA', 8.1, 85, 60000000, 100000000, 7000000, 10000000, 150000000, 170000000, 70000000, 40000000, 25000000, False, 120000, 90000, 65000),
(15, 'The Matrix', '1999-03-31', 136, 'USA', 8.7, 88, 60000000, 60000000, 8000000, 10000000, 460000000, 540000000, 240000000, 80000000, 100000000, False, 160000, 120000, 80000),
(16, 'The Princess Bride', '1987-09-25', 98, 'USA', 8.1, 97, 15000000, 30000000, 4000000, 5000000, 98000000, 130000000, 60000000, 32000000, 10000000, True, 180000, 140000, 100000),
(17, 'Crouching Tiger, Hidden Dragon: Sword of Destiny', '2016-08-26', 126, 'CN', 6.5, 40, 80000000, 110000000, 10000000, 15000000, 181000000, 200000000, 50000000, 50000000, 25000000, True, 90000, 70000, 40000),
(18, 'The Raid 2', '2014-03-28', 150, 'IDN', 8.6, 96, 4000000, 40000000, 3000000, 2000000, 120000000, 130000000, 60000000, 20000000, 15000000, False, 110000, 80000, 50000),
(19, 'Kingsman: The Secret Service', '2014-01-29', 104, 'UK', 7.7, 91, 80000000, 81000000, 8000000, 12000000, 414000000, 468000000, 230000000, 54000000, 80000000, False, 150000, 110000, 80000),
(20, 'Mission: Impossible - Fallout', '2018-07-17', 147, 'USA', 7.7, 97, 178000000, 175000000, 14000000, 20000000, 791000000, 821000000, 350000000, 71000000, 100000000, False, 140000, 100000, 75000),
(21, 'Dune', '2021-10-21', 155, 'USA', 8.1, 83, 160000000, 185000000, 40000000, 20000000, 401700000, 424000000, 180000000, 64000000, 40000000, False, 170000, 130000, 100000),
(22, 'The Power of the Dog', '2021-11-17', 128, 'NZ', 8.1, 94, 35000000, 35000000, 8000000, 10000000, 177000000, 189000000, 70000000, 39000000, 20000000, False, 180000, 140000, 110000),
(23, 'The Batman', '2022-03-04', 176, 'USA', 7.7, 85, 100000000, 185000000, 15000000, 20000000, 770836823, 806000000, 320000000, 96000000, 40000000, False, 190000, 150000, 120000),
(24, 'Elvis', '2022-06-24', 159, 'USA', 7.6, 77, 50000000, 85000000, 8000000, 12000000, 191000000, 204000000, 80000000, 44000000, 30000000, False, 150000, 110000, 80000),
(25, 'Top Gun: Maverick', '2022-05-27', 130, 'USA', 8.6, 96, 150000000, 170000000, 8000000, 20000000, 712000000, 770000000, 350000000, 80000000, 50000000, False, 180000, 140000, 110000),
(26, 'James Bond: Casino Royale', '2006-11-17', 166, 'UK', 8.0, 94, 60000000, 130000000, 6000000, 10000000, 594200000, 669000000, 220000000, 149000000, 40000000, True, 200000, 160000, 130000),
(27, 'James Bond: Quantum of Solace', '2008-11-14', 106, 'UK', 6.6, 66, 200000000, 200000000, 80000000, 15000000, 168600000, 200000000, 50000000, 80000000, 30000000, True, 180000, 140000, 110000),
(28, 'James Bond: Skyfall', '2012-10-26', 143, 'UK', 8.1, 92, 200000000, 200000000, 80000000, 20000000, 1108561007, 1300000000, 500000000, 80000000, 50000000, True, 190000, 150000, 120000),
(29, 'James Bond: Spectre', '2015-11-06', 148, 'UK', 6.3, 66, 245000000, 250000000, 80000000, 20000000, 880674609, 950000000, 370000000, 112000000, 40000000, True, 170000, 130000, 100000),
(30, 'James Bond: No Time to Die', '2021-09-30', 163, 'USA', 7.8, 83, 250000000, 250000000, 80000000, 20000000, 774190007, 820000000, 270000000, 110000000, 40000000, True, 180000, 140000, 110000),
(31, 'Batman: Batman Begins', '2005-06-15', 140, 'USA', 8.4, 84, 100000000, 135000000, 8000000, 15000000, 374893142, 401000000, 140000000, 81000000, 40000000, False, 210000, 170000, 140000),
(32, 'Batman: The Dark Knight Rises', '2012-07-20', 165, 'USA', 8.4, 81, 250000000, 250000000, 80000000, 25000000, 448139099, 1004934233, 400000000, 800000000, 50000000, False, 200000, 160000, 130000),
(33, 'Mission: Impossible', '1996-05-22', 110, 'USA', 7.7, 86, 81000000, 80000000, 0, 7000000, 180156451, 207000000, 110000000, 47000000, 30000000, False, 250000, 190000, 140000),
(34, 'Mission: Impossible 2', '2000-05-24', 123, 'USA', 6.1, 57, 125000000, 120000000, 0, 10000000, 215404289, 257000000, 90000000, 67000000, 40000000, False, 200000, 150000, 110000),
(35, 'Mission: Impossible III', '2006-06-05', 105, 'USA', 6.3, 70, 150000000, 180000000, 0, 12000000, 138079103, 163000000, 40000000, 63000000, 30000000, False, 180000, 140000, 100000),
(36, 'Mission: Impossible – Ghost Protocol', '2011-12-16', 138, 'USA', 6.5, 86, 160000000, 145000000, 0, 15000000, 694786440, 810000000, 320000000, 490000000, 40000000, False, 220000, 170000, 120000),
(37, 'Mission: Impossible – Rogue Nation', '2015-07-31', 147, 'USA', 7.4, 90, 170000000, 157000000, 0, 20000000, 682337080, 791100000, 320000000, 470000000, 40000000, False, 230000, 180000, 130000)
;

INSERT INTO Director (DirectorID, DirectorFName, DirectorLName) VALUES
(1, 'Frank', 'Darabont'),
(2, 'Francis Ford', 'Coppola'),
(3, 'Christopher', 'Nolan'),
(4, 'Peter', 'Jackson'),
(5, 'Steven', 'Spielberg'),
(6, 'Stephen', 'Sommers'),
(7, 'Gore', 'Verbinski'),
(8, 'James', 'Cameron'),
(9, 'George', 'Miller'),
(10, 'Quentin', 'Tarantino'),
(11, 'Rob', 'Reiner'),
(12, 'Yuen', 'Woo-ping'),
(13, 'Gareth', 'Evans'),
(14, 'Matthew', 'Vaughn'),
(15, 'Christopher', 'McQuarrie'),
(16, 'Denis', 'Villeneuve'),
(17, 'Jane', 'Campion'),
(18, 'Matt', 'Reeves'),
(19, 'Baz', 'Luhrmann'),
(20, 'Joseph', 'Kosinski'),
(21, 'Martin', 'Campbell'),
(22, 'Marc', 'Forster'),
(23, 'Cary Joji', 'Fukunaga'),
(24, 'Lana', 'Warchowski'),
(25, 'Lilly', 'Warchowski'),
(26, 'Brian', 'De Palma'),
(27, 'John', 'Woo'),
(28, 'J. J.', 'Abrams'),
(29, 'Brad', 'Bird')
;

INSERT INTO Directs (DirectorID, MovieID) VALUES
(1, 1),  /* Frank Darabont - The Shawshank Redemption */
(2, 2),  /* Francis Ford Coppola - The Godfather */
(3, 3),  /* Christopher Nolan - The Dark Knight */
(4, 4),  /* Peter Jackson - The Lord of the Rings: The Return of the King */
(5, 5),  /* Steven Spielberg - Raiders of the Lost Ark */
(5, 6),  /* Steven Spielberg - Indiana Jones and the Temple of Doom */
(6, 7),  /* Stephen Sommers - The Mummy (1999) */
(5, 8),  /* Steven Spielberg - Jurassic Park */
(7, 9),  /* Gore Verbinski - Pirates of the Caribbean: The Curse of the Black Pearl */
(4, 10), /* Peter Jackson - The Lord of the Rings: The Fellowship of the Ring */
(8, 11),  -- James Cameron - Terminator 2: Judgment Day
(9, 12),  -- George Miller - Mad Max: Fury Road
(3, 13), # Christopher Nolan - Inception
(10, 14),  -- Quentin Tarantino - Kill Bill: Vol. 1
(24, 15), # Lana Warchowski - Matrix
(25, 15), # Lilly Warchowski - Matrix
(11, 16),  -- Rob Reiner - The Princess Bride
(12, 17),  -- Yuen Woo-ping - Crouching Tiger, Hidden Dragon: Sword of Destiny
(13, 18),  -- Gareth Evans - The Raid 2
(14, 19),  -- Matthew Vaughn - Kingsman: The Secret Service
(15, 20),  -- Christopher McQuarrie - Mission: Impossible - Fallout
(16, 21),  -- Denis Villeneuve - Dune
(17, 22),  -- Jane Campion - The Power of the Dog
(18, 23),  -- Matt Reeves - The Batman
(19, 24),  -- Baz Luhrmann - Elvis
(20, 25),  -- Joseph Kosinski - Top Gun: Maverick
(21, 26),  -- Cary Joji Fukunaga - James Bond: No Time to Die
(22, 27), # Marc Foster - James Bond: Quantum of Solace
(23, 28),  -- Cary Joji Fukunaga (assuming) - James Bond: Skyfall  -- Assuming he directed both Casino Royale & Skyfall
(23, 29),  -- Cary Joji Fukunaga (assuming) - James Bond: Spectre   -- Assuming he directed both Casino Royale & Spectre
(9, 30),  -- George Miller (assuming) - James Bond: Casino Royale  -- Assuming another director for Casino Royale 
(3, 31), # Christopher Nolan - Batman
(3, 32), # Christopher Nolan - Batman
(26, 33), # Brian De Palma - Mission: Impossible
(27, 34), # John Woo - Mission: Impossible 2 
(28, 35), # JJ Abrams - Mission: Impossible 3
(29, 36), # Brad Bird - Mission: Impossible - Ghost Protocol
(15, 37) -- Christopher McQuarrie - Mission: Impossible - Rogue Nation
;

INSERT INTO Composer (CompID, CompFName, CompLName) VALUES
(1, 'Thomas', 'Newman'),
(2, 'Nino', 'Rota'),
(3, 'Hans', 'Zimmer'),
(4, 'James', 'Howard'),
(5, 'Howard', 'Shore'),
(6, 'John', 'Williams'),
(7, 'Jerry', 'Goldsmith'),
(8, 'Klaus', 'Badelt'),
(9, 'Brad', 'Fiedel'),
(10, 'Junkie', 'XL'),
(11, 'Don', 'Davis'),
(12, 'Mark', 'Knopfler'),
(13, 'RZA', 'RZA'),
(14, 'Fauzi', 'Fauzulrahman'),
(15, 'Henry', 'Jackman'),
(16, 'Lorne', 'Balfe'),
(17, 'Michael', 'Giacchino'),
(18, 'Harold', 'Faltermeyer'),
(19, 'David', 'Arnold'),
(20, 'Danny', 'Elfman'),
(21, 'Christophe', 'Beck'),
(22, 'Michael', 'Giacchino'),
(23, 'Joe', 'Kraemer');

INSERT INTO Composes (CompID, MovieID) VALUES
(1, 1),  /* Thomas Newman - The Shawshank Redemption */
(2, 2),  /* Nino Rota - The Godfather */
(3, 3),  /* Hans Zimmer - The Dark Knight */
(4, 3),  /* James Newton Howard - The Dark Knight */  
(5, 4),  /* Howard Shore - The Lord of the Rings: The Return of the King */
(6, 5),  /* John Williams - Raiders of the Lost Ark */
(6, 6),  /* John Williams - Indiana Jones and the Temple of Doom */
(7, 7),  /* Jerry Goldsmith - The Mummy (1999) */
(6, 8),  /* John Williams - Jurassic Park */
(8, 9),  /* Klaus Badelt - Pirates of the Caribbean: The Curse of the Black Pearl */
(5, 10), /* Howard Shore - The Lord of the Rings: The Fellowship of the Ring */
(9, 11),  -- Brad Fiedel - Terminator 2: Judgment Day
(10, 12), -- Junkie XL - Mad Max: Fury Road
(11, 15), -- Don Davis - The Matrix
(12, 16), -- Mark Knopfler - The Princess Bride
(13, 14), -- RZA - Kill Bill: Vol. 1
(14, 18), -- Fauzi Fauzulrahman - The Raid 2
(15, 19), -- Henry Jackman - Kingsman: The Secret Service
(16, 20), -- Lorne Balfe - Mission: Impossible - Fallout
(17, 23), -- Michael Giacchino - The Batman
(18, 25), -- Harold Faltermeyer - Top Gun: Maverick
(3, 25),  -- Hans Zimmer - Top Gun: Maverick (already exists in Composer table)
(19, 26), -- David Arnold - James Bond: Casino Royale
(19, 27), -- David Arnold - James Bond: Quantum of Solace
(19, 28), -- David Arnold - James Bond: Skyfall
(19, 29), -- David Arnold - James Bond: Spectre
(19, 30), -- David Arnold - James Bond: No Time to Die
(3, 31), -- Hans Zimmer - Batman Begins
(4, 31), -- James Newton- Batman Begins
(3, 32), -- Hans Zimmer - Batman Darknight Rises
(20, 33),
(3, 34),
(21, 35),
(22, 36),
(23,37);

INSERT INTO productionstudio (StudioID, StudioName, Headquarters, YearFounded) VALUES
(1, 'Castle Rock Entertainment', 'California, USA', '1987-01-01'),
(2, 'Paramount Pictures', 'California, USA', '1912-01-01'),
(3, 'Warner Bros. Pictures', 'California, USA', '1923-01-01'),
(4, 'New Line Cinema', 'California, USA', '1967-01-01'),
(5, 'Lucasfilm Ltd.', 'California, USA', '1971-01-01'),
(6, 'Universal Pictures', 'California, USA', '1912-01-01'),
(7, 'Walt Disney Pictures', 'California, USA', '1923-01-01'),
(8, 'Carolco Pictures', 'California, USA', '1976-01-01'),
(9, 'Village Roadshow Pictures', 'Victoria, Australia', '1986-01-01'),
(10, 'Miramax Films', 'California, USA', '1979-01-01'),
(11, 'Act III Communications', 'California, USA', '1986-01-01'),
(12, 'China Film Group Corporation', 'Beijing, China', '1949-01-01'),
(13, 'XYZ Films', 'California, USA', '2008-01-01'),
(14, '20th Century Fox', 'California, USA', '1935-01-01'),
(15, 'Metro-Goldwyn-Mayer', 'California, USA', '1924-01-01'),
(16, 'Netflix', 'California, USA', '1997-01-01'),
(17, 'DC Films', 'California, USA', '2009-01-01'),
(18, 'Bazmark Films', 'New South Wales, Australia', '2002-01-01'),
(19, 'Skydance Media', 'California, USA', '2010-01-01'),
(20, 'Eon Productions', 'London, England', '1961-01-01'),
(21, 'Pacific Western Productions', 'California, USA', '1975-01-01'),
(22, 'Lightstorm Entertainment', 'California, USA', '1990-01-01'),
(23, 'Le Studio Canal+', 'Paris, France', '1987-01-01'),
(24, 'Kennedy Miller Mitchell', 'New South Wales, Australia', '1978-01-01'),
(25, 'RatPac-Dune Entertainment', 'California, USA', '2013-01-01'),
(26, 'Legendary Pictures', 'California, USA', '2000-01-01'),
(27, 'A Band Apart', 'California, USA', '1991-01-01'),
(28, 'Marv Films', 'London, England', '2004-01-01'),
(29, 'Pt. Merantau Films', 'Jakarta, Indonesia', '2003-01-01'),
(30, 'Pegasus Taihe Entertainment', 'Beijing, China', '2009-01-01');

INSERT INTO produces (MovieID, StudioID) VALUES
(1, 1), -- The Shawshank Redemption - Castle Rock Entertainment
(2, 2), -- The Godfather - Paramount Pictures
(3, 3), -- The Dark Knight - Warner Bros. Pictures
(4, 4), -- The Lord of the Rings: The Return of the King - New Line Cinema
(5, 5), -- Raiders of the Lost Ark - Lucasfilm Ltd.
(6, 5), -- Indiana Jones and the Temple of Doom - Lucasfilm Ltd.
(7, 6), -- The Mummy (1999) - Universal Pictures
(8, 6), -- Jurassic Park - Universal Pictures
(9, 7), -- Pirates of the Caribbean: The Curse of the Black Pearl - Walt Disney Pictures
(10, 4), -- The Lord of the Rings: The Fellowship of the Ring - New Line Cinema
(11, 8), -- Terminator 2: Judgment Day - Carolco Pictures
(12, 9), -- Mad Max: Fury Road - Village Roadshow Pictures
(13, 3), -- Inception - Warner Bros. Pictures
(14, 10), -- Kill Bill: Vol. 1 - Miramax Films
(15, 3), -- The Matrix - Warner Bros. Pictures
(16, 11), -- The Princess Bride - Act III Communications
(17, 12), -- Crouching Tiger, Hidden Dragon: Sword of Destiny - China Film Group Corporation
(18, 13), -- The Raid 2 - XYZ Films
(19, 14), -- Kingsman: The Secret Service - 20th Century Fox
(20, 2), -- Mission: Impossible - Fallout - Paramount Pictures
(21, 3), -- Dune - Warner Bros. Pictures
(22, 15), -- The Power of the Dog - Netflix
(23, 3), -- The Batman - Warner Bros. Pictures
(24, 3), -- Elvis - Warner Bros. Pictures
(25, 2), -- Top Gun: Maverick - Paramount Pictures
(26, 16), -- James Bond: No Time to Die - Metro-Goldwyn-Mayer
(27, 17), -- James Bond: Quantum of Solace - Metro-Goldwyn-Mayer
(28, 17), -- James Bond: Skyfall - Metro-Goldwyn-Mayer
(29, 17), -- James Bond: Spectre - Metro-Goldwyn-Mayer
(30, 17), -- James Bond: Casino Royale - Metro-Goldwyn-Mayer
(31, 3), -- Batman: The Dark Knight Rises - Double Negative
(32, 25), -- Mission: Impossible III - BUF Compagnie
(33, 23), -- Mission: Impossible – Ghost Protocol - The Third Floor
(34, 24), -- Mission: Impossible – Rogue Nation - Hydraulx
(35, 25), -- Batman: Batman Begins - BUF Compagnie
(36, 25), -- Batman: The Dark Knight Rises - BUF Compagnie
(37, 25) -- Mission: Impossible III - BUF Compagnie
;
INSERT INTO vfxstudio (VFXID, VFXoName, Headquarters, YearFounded) VALUES
(1, 'Pacific Title and Art Studio', 'California, USA', '1919-01-01'),
(2, 'Industrial Light & Magic', 'California, USA', '1975-01-01'),
(3, 'Double Negative', 'London, England', '1998-01-01'),
(4, 'Weta Digital', 'Wellington, New Zealand', '1993-01-01'),
(5, 'Iloura', 'Melbourne, Australia', '1990-01-01'),
(6, 'Cinesite', 'London, England', '1994-01-01'),
(7, 'Manex Visual Effects', 'California, USA', '1990-01-01'),
(8, 'R/Greenberg Associates', 'California, USA', '1977-01-01'),
(9, 'Base FX', 'Beijing, China', '2006-01-01'),
(10, 'XYZ Films', 'California, USA', '2008-01-01'),
(11, 'Framestore', 'London, England', '1986-01-01'),
(12, 'Method Studios', 'California, USA', '1999-01-01'),
(13, 'Blue Sky Studios', 'Connecticut, USA', '1987-01-01'),
(14, 'Pixar Animation Studios', 'California, USA', '1986-01-01'),
(15, 'Digital Domain', 'California, USA', '1993-01-01'),
(16, 'Framestore', 'London, England', '1986-01-01'),
(17, 'MPC Film', 'London, England', '1998-01-01'),
(18, 'Scanline VFX', 'Munich, Germany', '1989-01-01'),
(19, 'Zoic Studios', 'California, USA', '2002-01-01'),
(20, 'Luma Pictures', 'California, USA', '2002-01-01'),
(21, 'Atomic Fiction', 'California, USA', '2010-01-01'),
(22, 'Digital Domain 3.0', 'California, USA', '2012-01-01'),
(23, 'The Third Floor', 'California, USA', '2004-01-01'),
(24, 'Hydraulx', 'California, USA', '2002-01-01'),
(25, 'BUF Compagnie', 'Paris, France', '1984-01-01'),
(26, 'Mikros Image', 'Paris, France', '1985-01-01'),
(27, 'Framestore', 'Montreal, Canada', '2013-01-01'),
(28, 'Rising Sun Pictures', 'Adelaide, Australia', '1995-01-01');

INSERT INTO edits (MovieID, VFXID) VALUES
(1, 1), -- The Shawshank Redemption - Pacific Title and Art Studio
(2, 2), -- The Godfather - Industrial Light & Magic
(3, 3), -- The Dark Knight - Double Negative
(4, 4), -- The Lord of the Rings: The Return of the King - Weta Digital
(5, 5), -- Raiders of the Lost Ark - Industrial Light & Magic
(6, 5), -- Indiana Jones and the Temple of Doom - Industrial Light & Magic
(7, 6), -- The Mummy (1999) - Industrial Light & Magic
(8, 6), -- Jurassic Park - Industrial Light & Magic
(9, 7), -- Pirates of the Caribbean: The Curse of the Black Pearl - Industrial Light & Magic
(10, 4), -- The Lord of the Rings: The Fellowship of the Ring - Weta Digital
(11, 8), -- Terminator 2: Judgment Day - Industrial Light & Magic
(12, 9), -- Mad Max: Fury Road - Iloura
(13, 3), -- Inception - Double Negative
(14, 10), -- Kill Bill: Vol. 1 - Cinesite
(15, 11), -- The Matrix - Manex Visual Effects
(16, 16), -- The Princess Bride - R/Greenberg Associates
(17, 17), -- Crouching Tiger, Hidden Dragon: Sword of Destiny - Base FX
(18, 18), -- The Raid 2 - XYZ Films
(19, 19), -- Kingsman: The Secret Service - Framestore
(20, 2), -- Mission: Impossible - Fallout - Industrial Light & Magic
(21, 3), -- Dune - Double Negative
(22, 20), -- The Power of the Dog - Method Studios
(23, 21), -- The Batman - Double Negative
(24, 22), -- Elvis - Double Negative
(25, 23), -- Top Gun: Maverick - The Third Floor
(26, 24), -- James Bond: No Time to Die - Hydraulx
(27, 25), -- James Bond: Quantum of Solace - BUF Compagnie
(28, 26), -- James Bond: Skyfall - Mikros Image
(29, 27),
(30, 28), -- Batman: Batman Begins - R/Greenberg Associates
(31, 3), -- Batman: The Dark Knight Rises - Double Negative
(32, 25), -- Mission: Impossible III - BUF Compagnie
(33, 23), -- Mission: Impossible – Ghost Protocol - The Third Floor
(34, 24), -- Mission: Impossible – Rogue Nation - Hydraulx
(35, 25), -- Batman: Batman Begins - BUF Compagnie
(36, 25), -- Batman: The Dark Knight Rises - BUF Compagnie
(37, 25) -- Mission: Impossible III - BUF Compagnie
;

INSERT INTO `character` (CharacterID, CharacterName, CharacterAge) VALUES
(1, 'Andy Dufresne', 35),
(2, 'Michael Corleone', 30),
(3, 'Bruce Wayne', 37),
(4, 'Frodo Baggins', 33),
(5, 'Indiana Jones', 38),
(6, 'Indiana Jones', 39),
(7, 'Rick O''Connell', 42),
(8, 'Dr. Alan Grant', 45),
(9, 'Jack Sparrow', 34),
(10, 'Frodo Baggins', 30),
(11, 'Sarah Connor', 32),
(12, 'Max Rockatansky', 43),
(13, 'Dom Cobb', 36),
(14, 'The Bride (Beatrix Kiddo)', 35),
(15, 'Neo', 28),
(16, 'Westley', 27),
(17, 'Yu Shu Lien', 36),
(18, 'Rama', 33),
(19, 'Gary "Eggsy" Unwin', 29),
(20, 'Ethan Hunt', 47),
(21, 'Paul Atreides', 18),
(22, 'Phil Burbank', 41),
(23, 'Bruce Wayne', 36),
(24, 'Elvis Presley', 25),
(25, 'Pete "Maverick" Mitchell', 50),
(26, 'James Bond', 35),
(27, 'James Bond', 37),
(28, 'James Bond', 43),
(29, 'James Bond', 45),
(30, 'James Bond', 47),
(31, 'Bruce Wayne', 32),
(32, 'Bruce Wayne', 35),
(33, 'Ethan Hunt', 43),
(34, 'Ethan Hunt', 45),
(35, 'Ethan Hunt', 48),
(36, 'Ethan Hunt', 50),
(37, 'Ethan Hunt', 52);

INSERT INTO appearsin (CharacterID, MovieID, Screentime, `Role`, Salary) VALUES

(1, 1, 142, 'Main', 500000),
(2, 2, 175, 'Main', 35000),
(3, 3, 152, 'Main', 10000000),
(4, 4, 201, 'Main', 1000000),
(5, 5, 115, 'Main', 5900000),
(6, 6, 112, 'Main', 4500000),
(7, 7, 126, 'Main', 3000000),
(8, 8, 127, 'Main', 6500000),
(9, 9, 143, 'Main', 59000000),
(10, 10, 178, 'Main', 150000),
(11, 11, 123, 'Main', 6200000),
(12, 12, 120, 'Main', 3100000),
(13, 13, 148, 'Main', 50000000),
(14, 14, 111, 'Main', 7000000),
(15, 15, 136, 'Main',10000000),
(16, 16, 98, 'Main', 3200000),
(17, 17, 126, 'Main', 25000),
(18, 18, 150, 'Main', 4200000),
(19, 19, 104, 'Main', 3500000),
(20, 20, 147, 'Main', 4000000),
(21, 21, 155, 'Main', 300000),
(22, 22, 128, 'Main', 19000000),
(23, 23, 176, 'Main', 17000000),
(24, 24, 159, 'Main', 700000),
(25, 25, 130, 'Main', 100000000),
(26, 26, 166, 'Main', 3200000),
(27, 27, 106, 'Main', 7200000),
(28, 28, 143, 'Main', 17000000),
(29, 29, 148, 'Main', 25000000),
(30, 30, 163, 'Main', 25000000),
(31, 31, 140, 'Main', 9000000),
(32, 32, 165, 'Main', 15000000),
(33, 33, 110, 'Main', 70000000),
(34, 34, 123, 'Main', 75000000),
(35, 35, 105, 'Main', 75000000),
(36, 36, 138, 'Main', 80000000),
(37, 37, 147, 'Main', 80000000);

INSERT INTO actor (ActorID, ActorFName, ActorLName, ActorGender, ActorBirthDate, Nationality, ExperienceLevel) VALUES
(1, 'Tim', 'Robbins', 'Male', '1958-10-16', 'USA', 'Veteran'),
(2, 'Al', 'Pacino', 'Male', '1940-04-25', 'USA', 'Veteran'),
(3, 'Christian', 'Bale', 'Male', '1974-01-30', 'UK', 'Veteran'),
(4, 'Elijah', 'Wood', 'Male', '1981-01-28', 'USA', 'Veteran'),
(5, 'Harrison', 'Ford', 'Male', '1942-07-13', 'USA', 'Veteran'),
(6, 'Harrison', 'Ford', 'Male', '1942-07-13', 'USA', 'Veteran'),
(7, 'Brendan', 'Fraser', 'Male', '1968-12-03', 'USA', 'Veteran'),
(8, 'Sam', 'Neill', 'Male', '1947-09-14', 'New Zealand', 'Veteran'),
(9, 'Johnny', 'Depp', 'Male', '1963-06-09', 'USA', 'Veteran'),
(10, 'Elijah', 'Wood', 'Male', '1981-01-28', 'USA', 'Veteran'),
(11, 'Linda', 'Hamilton', 'Female', '1956-09-26', 'USA', 'Veteran'),
(12, 'Tom', 'Hardy', 'Male', '1977-09-15', 'UK', 'Veteran'),
(13, 'Leonardo', 'DiCaprio', 'Male', '1974-11-11', 'USA', 'Veteran'),
(14, 'Uma', 'Thurman', 'Female', '1970-04-29', 'USA', 'Veteran'),
(15, 'Keanu', 'Reeves', 'Male', '1964-09-02', 'Canada', 'Veteran'),
(16, 'Cary', 'Elwes', 'Male', '1962-10-26', 'USA', 'Veteran'),
(17, 'Michelle', 'Yeoh', 'Female', '1962-08-06', 'Malaysia', 'Veteran'),
(18, 'Iko', 'Uwais', 'Male', '1983-02-12', 'Indonesia', 'Veteran'),
(19, 'Taron', 'Egerton', 'Male', '1989-11-10', 'UK', 'Intermediate'),
(20, 'Tom', 'Cruise', 'Male', '1962-07-03', 'USA', 'Veteran'),
(21, 'Timothee', 'Chalamet', 'Male', '1995-12-27', 'USA', 'Intermediate'),
(22, 'Benedict', 'Cumberbatch', 'Male', '1976-07-19', 'UK', 'Veteran'),
(23, 'Robert', 'Pattinson', 'Male', '1986-05-13', 'UK', 'Intermediate'),
(24, 'Austin', 'Butler', 'Male', '1991-08-17', 'USA', 'Intermediate'),
(25, 'Tom', 'Cruise', 'Male', '1962-07-03', 'USA', 'Veteran'),
(26, 'Daniel', 'Craig', 'Male', '1968-03-02', 'UK', 'Veteran'),
(27, 'Daniel', 'Craig', 'Male', '1968-03-02', 'UK', 'Veteran'),
(28, 'Daniel', 'Craig', 'Male', '1968-03-02', 'UK', 'Veteran'),
(29, 'Daniel', 'Craig', 'Male', '1968-03-02', 'UK', 'Veteran'),
(30, 'Daniel', 'Craig', 'Male', '1968-03-02', 'UK', 'Veteran'),
(31, 'Christian', 'Bale', 'Male', '1974-01-30', 'UK', 'Veteran'),
(32, 'Christian', 'Bale', 'Male', '1974-01-30', 'UK', 'Veteran'),
(33, 'Tom', 'Cruise', 'Male', '1962-07-03', 'USA', 'Veteran'),
(34, 'Tom', 'Cruise', 'Male', '1962-07-03', 'USA', 'Veteran'),
(35, 'Tom', 'Cruise', 'Male', '1962-07-03', 'USA', 'Veteran'),
(36, 'Tom', 'Cruise', 'Male', '1962-07-03', 'USA', 'Veteran'),
(37, 'Tom', 'Cruise', 'Male', '1962-07-03', 'USA', 'Veteran');

INSERT INTO plays (CharacterID, ActorID, DateStart, DateEnd) VALUES
(1, 1, '1993-09-23', '1994-09-23'),
(2, 2, '1971-03-24', '1972-03-24'),
(3, 3, '2007-07-18', '2008-07-18'),
(4, 4, '2002-12-17', '2003-12-17'),
(5, 5, '1980-06-12', '1981-06-12'),
(6, 6, '1983-05-23', '1984-05-23'),
(7, 7, '1998-06-01', '1999-06-01'),
(8, 8, '1992-06-11', '1993-06-11'),
(9, 9, '2002-07-09', '2003-07-09'),
(10, 10, '2000-12-19', '2001-12-19'),
(11, 11, '1990-07-03', '1991-07-03'),
(12, 12, '2014-05-15', '2015-05-15'),
(13, 13, '2009-07-16', '2010-07-16'),
(14, 14, '2002-10-10', '2003-10-10'),
(15, 15, '1998-03-31', '1999-03-31'),
(16, 16, '1986-09-25', '1987-09-25'),
(17, 17, '2015-08-26', '2016-08-26'),
(18, 18, '2013-03-28', '2014-03-28'),
(19, 19, '2013-01-29', '2014-01-29'),
(20, 20, '2017-07-17', '2018-07-17'),
(21, 21, '2020-10-21', '2021-10-21'),
(22, 22, '2020-11-17', '2021-11-17'),
(23, 23, '2021-03-04', '2022-03-04'),
(24, 24, '2021-06-24', '2022-06-24'),
(25, 25, '2021-05-27', '2022-05-27'),
(26, 26, '2005-11-17', '2006-11-17'),
(27, 27, '2007-11-14', '2008-11-14'),
(28, 28, '2011-10-26', '2012-10-26'),
(29, 29, '2014-11-06', '2015-11-06'),
(30, 30, '2020-09-30', '2021-09-30'),
(31, 31, '2004-06-15', '2005-06-15'),
(32, 32, '2011-07-20', '2012-07-20'),
(33, 33, '1995-05-22', '1996-05-22'),
(34, 34, '1999-05-24', '2000-05-24'),
(35, 35, '2005-06-05', '2006-06-05'),
(36, 36, '2010-12-16', '2011-12-16'),
(37, 37, '2014-07-31', '2015-07-31');

INSERT INTO Platform (PlatformID, PlatformName) VALUES
(1, 'Netflix'),
(2, 'Amazon Prime'),
(3, 'Hulu'),
(4, 'Disney+'),
(5, 'Max'),
(6, 'Paramount'),
(7, 'Peacock'),
(8, 'Apple TV');


