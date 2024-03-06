CREATE database PRIMEIR_LEAGUE;
USE PRIMEIR_LEAGUE;
-- Table to store Premier League teams
CREATE TABLE Teams (
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL
);
DESC TEAMS;

-- Table to store match information
CREATE TABLE Matches (
    match_id INT AUTO_INCREMENT PRIMARY KEY,
    home_team_id INT,
    away_team_id INT,
    match_date DATE,
    FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams(team_id)
);
DESC MATCHES;
-- Table to store match results (win, draw, lose)
CREATE TABLE Results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    match_id INT,
    home_team_score INT,
    away_team_score INT,
    FOREIGN KEY (match_id) REFERENCES Matches(match_id)
);
DESC RESULTS;
-- Table to store calculated standings
CREATE TABLE Standings (
    standing_id INT AUTO_INCREMENT PRIMARY KEY,
    team_id INT,
    matches_played INT,
    wins INT,
    draws INT,
    losses INT,
    points INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);
DESC STANDINGS;

-- Table to store points accumulated by each team
CREATE TABLE Points (
    points_id INT AUTO_INCREMENT PRIMARY KEY,
    team_id INT,
    points INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);
DESC POINTS;
-- INSERTING VALUES IN  TEAMS TABLE
INSERT INTO Teams VALUES
(1, 'Arsenal'),
(2, 'Aston Villa'),
(3, 'Brentford'),
(4, 'Brighton & Hove Albion'),
(5, 'Burnley'),
(6, 'Chelsea'),
(7, 'Crystal Palace'),
(8, 'Everton'),
(9, 'Leeds United'),
(10, 'Leicester City'),
(11, 'Liverpool'),
(12, 'Manchester City'),
(13, 'Manchester United'),
(14, 'Newcastle United'),
(15, 'Norwich City'),
(16, 'Southampton'),
(17, 'Tottenham Hotspur'),
(18, 'Watford'),
(19, 'West Ham United'),
(20, 'Wolverhampton Wanderers');

SELECT * FROM TEAMS;

-- INSERTING VALUES IN MATCHES TABLE
INSERT INTO Matches VALUES
(1, 1, 2, '2024-01-01'),
(2, 3, 4, '2024-01-02'),
(3, 5, 6, '2024-01-03'),
(4, 7, 8, '2024-01-04'),
(5, 9, 10, '2024-01-05'),
(6, 11, 12, '2024-01-06'),
(7, 13, 14, '2024-01-07'),
(8, 15, 16, '2024-01-08'),
(9, 17, 18, '2024-01-09'),
(10, 19, 20, '2024-01-10'),
(11, 2, 1, '2024-01-11'),
(12, 4, 3, '2024-01-12'),
(13, 6, 5, '2024-01-13'),
(14, 8, 7, '2024-01-14'),
(15, 10, 9, '2024-01-15'),
(16, 12, 11, '2024-01-16'),
(17, 14, 13, '2024-01-17'),
(18, 16, 15, '2024-01-18'),
(19, 18, 17, '2024-01-19'),
(20, 20, 19, '2024-01-20');

SELECT * FROM MATCHES;

-- INSERTING VALUES IN RESULTS TABLE
INSERT INTO Results VALUES
(1, 1, 2, 1),
(2, 2, 3, 2),
(3, 3, 1, 0),
(4, 4, 2, 2),
(5, 5, 0, 1),
(6, 6, 1, 3),
(7, 7, 2, 1),
(8, 8, 0, 0),
(9, 9, 3, 1),
(10, 10, 2, 0),
(11, 11, 1, 1),
(12, 12, 2, 1),
(13, 13, 0, 2),
(14, 14, 1, 0),
(15, 15, 1, 1),
(16, 16, 0, 1),
(17, 17, 2, 0),
(18, 18, 1, 1),
(19, 19, 2, 1),
(20, 20, 3, 2);

SELECT * FROM RESULTS;

-- INSERTING VALUES IN STANDINGS TABLE
INSERT INTO Standings (standing_id, team_id, matches_played, wins, draws, losses, points) VALUES
(1, 1, 2, 1, 0, 1, 3),
(2, 2, 2, 1, 0, 1, 3),
(3, 3, 2, 1, 0, 1, 3),
(4, 4, 2, 1, 0, 1, 3),
(5, 5, 2, 1, 0, 1, 3),
(6, 6, 2, 1, 0, 1, 3),
(7, 7, 2, 1, 0, 1, 3),
(8, 8, 2, 1, 0, 1, 3),
(9, 9, 2, 1, 0, 1, 3),
(10, 10, 2, 1, 0, 1, 3),
(11, 11, 2, 1, 0, 1, 3),
(12, 12, 2, 1, 0, 1, 3),
(13, 13, 2, 1, 0, 1, 3),
(14, 14, 2, 1, 0, 1, 3),
(15, 15, 2, 1, 0, 1, 3),
(16, 16, 2, 1, 0, 1, 3),
(17, 17, 2, 1, 0, 1, 3),
(18, 18, 2, 1, 0, 1, 3),
(19, 19, 2, 1, 0, 1, 3),
(20, 20, 2, 1, 0, 1, 3);

SELECT * FROM STANDINGS;

-- INSERTING VALUES IN POINTS TABLE
INSERT INTO Points (points_id, team_id, points) VALUES
(1, 1, 3),
(2, 2, 3),
(3, 3, 3),
(4, 4, 3),
(5, 5, 3),
(6, 6, 3),
(7, 7, 3),
(8, 8, 3),
(9, 9, 3),
(10, 10, 3),
(11, 11, 3),
(12, 12, 3),
(13, 13, 3),
(14, 14, 3),
(15, 15, 3),
(16, 16, 3),
(17, 17, 3),
(18, 18, 3),
(19, 19, 3),
(20, 20, 3);

SELECT * FROM POINTS;

-- Calculate the goal difference for each match:
SELECT match_id, home_team_score - away_team_score AS goal_difference
FROM Results;

-- Calculate the total goals scored by each team:
SELECT team_id, 
       (SELECT SUM(home_team_score) FROM Results WHERE home_team_id = Teams.team_id) +
       (SELECT SUM(away_team_score) FROM Results WHERE away_team_id = Teams.team_id) AS total_goals
FROM Teams;

-- Top Teams by Points
SELECT t.team_name, p.points
FROM Teams t
INNER JOIN Points p ON t.team_id = p.team_id
ORDER BY p.points DESC;

-- Matches Played by Each Team
SELECT t.team_name, COUNT(m.match_id) AS matches_played
FROM Teams t
LEFT JOIN Matches m ON t.team_id = m.home_team_id OR t.team_id = m.away_team_id
GROUP BY t.team_name;

-- Total Goals Scored by Each Team
SELECT t.team_name, 
       SUM(CASE WHEN m.home_team_id = t.team_id THEN r.home_team_score ELSE r.away_team_score END) AS total_goals
FROM Teams t
JOIN Matches m ON t.team_id = m.home_team_id OR t.team_id = m.away_team_id
JOIN Results r ON m.match_id = r.match_id
GROUP BY t.team_name;

-- Teams with Most Wins

SELECT t.team_name, s.wins
FROM Teams t
JOIN Standings s ON t.team_id = s.team_id
ORDER BY s.wins DESC;

-- Matches with Draw Results:

SELECT m.match_id, t1.team_name AS home_team, t2.team_name AS away_team, r.home_team_score, r.away_team_score
FROM Matches m
JOIN Teams t1 ON m.home_team_id = t1.team_id
JOIN Teams t2 ON m.away_team_id = t2.team_id
JOIN Results r ON m.match_id = r.match_id
WHERE r.home_team_score = r.away_team_score;

-- SUBQuRIES
-- 1.This subquery calculates the goal difference (goals scored minus goals conceded) for each team.
SELECT team_name,
       (SELECT SUM(home_team_score) FROM Results WHERE match_id IN (SELECT match_id FROM Matches WHERE home_team_id = t.team_id)) +
       (SELECT SUM(away_team_score) FROM Results WHERE match_id IN (SELECT match_id FROM Matches WHERE away_team_id = t.team_id)) AS goals_scored,
       (SELECT SUM(away_team_score) FROM Results WHERE match_id IN (SELECT match_id FROM Matches WHERE home_team_id = t.team_id)) +
       (SELECT SUM(home_team_score) FROM Results WHERE match_id IN (SELECT match_id FROM Matches WHERE away_team_id = t.team_id)) AS goals_conceded,
       (SELECT SUM(home_team_score) FROM Results WHERE match_id IN (SELECT match_id FROM Matches WHERE home_team_id = t.team_id)) +
       (SELECT SUM(away_team_score) FROM Results WHERE match_id IN (SELECT match_id FROM Matches WHERE away_team_id = t.team_id)) -
       ((SELECT SUM(away_team_score) FROM Results WHERE match_id IN (SELECT match_id FROM Matches WHERE home_team_id = t.team_id)) +
       (SELECT SUM(home_team_score) FROM Results WHERE match_id IN (SELECT match_id FROM Matches WHERE away_team_id = t.team_id))) AS goal_difference
FROM Teams t;

-- 2.This subquery ranks teams based on their total points earned.

SELECT team_name, 
       (SELECT SUM(points) FROM Points WHERE team_id = t.team_id) AS points,
       (SELECT COUNT(*) FROM Points WHERE points > (SELECT SUM(points) FROM Points WHERE team_id = t.team_id)) + 1 AS position
FROM Teams t
ORDER BY points DESC;


-- Top Scorer in the League:
-- 3.This subquery finds the player with the most goals scored in the league.
SELECT team_name, 
       GREATEST((SELECT MAX(home_team_score) FROM Results WHERE match_id IN (SELECT match_id FROM Matches WHERE home_team_id = t.team_id)),
                (SELECT MAX(away_team_score) FROM Results WHERE match_id IN (SELECT match_id FROM Matches WHERE away_team_id = t.team_id))) AS highest_score
FROM Teams t
ORDER BY highest_score DESC
LIMIT 1;

-- 4. This subquery finds the teams with the highest number of wins.
SELECT team_name, 
       (SELECT COUNT(*) 
        FROM Results 
        WHERE match_id IN (SELECT match_id FROM Matches WHERE home_team_id = t.team_id AND home_team_score > away_team_score)) +
       (SELECT COUNT(*) 
        FROM Results 
        WHERE match_id IN (SELECT match_id FROM Matches WHERE away_team_id = t.team_id AND away_team_score > home_team_score)) AS wins
FROM Teams t
ORDER BY wins DESC;

-- JOINS
-- Inner Join
-- This join will be useful for retrieving records that have matching values in both the Teams and Matches tables.
-- It ensures that only matches involving existing teams are retrieved.

SELECT *
FROM Teams
INNER JOIN Matches ON Teams.team_id = Matches.home_team_id OR Teams.team_id = Matches.away_team_id;

-- Left Join

SELECT *
FROM Teams
LEFT JOIN Standings ON Teams.team_id = Standings.team_id;


SELECT Matches.match_id, Matches.match_date, 
       HomeTeams.team_name AS home_team, Matches.home_team_score,
       AwayTeams.team_name AS away_team, Matches.away_team_score,
       Results.result_id, Results.points
FROM Matches
INNER JOIN Teams AS HomeTeams ON Matches.home_team_id = HomeTeams.team_id
INNER JOIN Teams AS AwayTeams ON Matches.away_team_id = AwayTeams.team_id
LEFT JOIN Results ON Matches.match_id = Results.match_id;












