CREATE TABLE Highscore (
	username varchar(30) UNIQUE NOT NULL,
	highscore int NOT NULL
);
-- DROP TABLE Highscore;

INSERT INTO Highscore(username, highscore) VALUE('test_user', 200);

-- UPDATE Highscore SET username = 'new_user', highscore = 100;

-- SELECT * FROM Highscore;