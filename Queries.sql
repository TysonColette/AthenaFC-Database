use cs_tjc12742;
-- Query 1: For each player determine the cost per each of the 34 games based on their salary
Select
    PlayerID,
    Name,
    concat('$', format((Salary / 34), 2)) as 'Salary per game'
From
    Player;


-- Query 2:How many goals are scored by players from each country
Select
	Nationality,
	sum(Goals_Scored) as 'Total Goals'
From 
	Player
Group by
	Nationality
Order by
	'Total Goals' desc;
    
-- Query 3: Calculate the average attendance and ticket revenue per match venue.
Select
    Venue,
    concat(format(avg(Attendance), 2), '%') as 'Average Attendance',
    concat('$', format(avg(Ticket_Revenue), 2)) as 'Average Ticket Revenue'
From
    Matches
Group by
    Venue
Order by
    Venue;
    
-- Query 4: What is the average sponsorship deal given by each of the sponsoring companies?
Select
	s.Company_Name,
    concat('$', format(Avg(Deal_Value), 2)) as AvgDealValue
From
    Sponsorship ship
Join
    Sponsor s on ship.Sponsor_SponsorID = s.SponsorID
Group by
    s.Company_Name
Order by 
	AvgDealValue desc;   

-- Query 5: Who is the most expensive player for each position?
Select
  p.Name,
  p.Position,
  concat('$', format(p.Salary / p.Goals_Scored, 2)) as 'Cost Per Contribution',
  format((1 / (p.Salary / p.Goals_Scored)) * 10000, 5) as Efficiency 
From 
  Player p
Join (
  Select Position, Min(Salary / Goals_Scored) as MinEfficiency
  From Player
  Where Goals_Scored > 0 or Assists > 0
  Group by Position
) as MinEffs on p.Position = MinEffs.Position
and (p.Salary / p.Goals_Scored) = MinEffs.MinEfficiency
Order by p.Position, Efficiency;

Select
  p.Name,
  p.Position,
  concat('$', format((Salary / (Goals_Scored * (2/3) + Assists * (1/3))), 2)) as 'Cost Per Contribution',
  format((1 / (p.Salary / (p.Goals_Scored * (2/3) + p.Assists * (1/3)))) * 10000, 5) as Efficiency 
From 
  Player p
Join (
  Select Position, Min((Salary / (Goals_Scored * (2/3) + Assists * (1/3)))) as MinEfficiency
  From Player
  Where Goals_Scored > 0 or Assists > 0
  Group by Position
) as MinEffs on p.Position = MinEffs.Position
and (p.Salary / (p.Goals_Scored * (2/3) + p.Assists * (1/3))) = MinEffs.MinEfficiency
Order by p.Position, Efficiency;

-- Query 6: Take all the staff and determine a weighted cost based on their salary and how many players they interact with
Select
    s.StaffID, 
    s.Name, 
    s.Job,
    concat('$', format(s.Salary, 2)),
    count(phs.Staff_StaffID) as Player_Interactions,
	concat('$', format(s.Salary / nullif(count(phs.Staff_StaffID), 0), 2)) as Weighted_Cost
From
    Staff s
Left Join 
    Player_has_Staff phs on s.StaffID = phs.Staff_StaffID
Group by 
    s.StaffID 
Having 
	count(phs.Staff_StaffID) != 0
Order by
	Weighted_Cost desc;

-- Query 7: What Players are not sponsored but have above average Salaries?
Select 
    PlayerID, 
    Name,
    concat('$', format(Salary, 2)) as 'Salary'
From
    Player p
Where 
    Not Exists (
        Select 1 From Sponsorship s Where p.PlayerID = s.Player_PlayerID
    )
And 
    p.Salary > (Select avg(Salary) from Player);    

-- Query 8: What players have the highest goal to assist ratio?
Select
    PlayerID,
    Name,
    concat('$', format(Salary, 2)) as 'Salary',
    Position,
    Goals_Scored,
    Assists,
    format((Goals_Scored / NULLIF(Assists, 0)), 2) as G2A_Ratio
From
    Player 
Where
    Assists > 0
Order by
    G2A_Ratio desc;

-- Query 9: Select the Match data for teams whos team name starts with a Vowel (This does not mean city)
Select 
	Date,
    Opponent, 
    concat('$', format(Ticket_Revenue, 2)) as TicketRevenue
From
	Matches
Where
	Opponent regexp'[[:space:]]+[AEIOUaeiou][a-zA-Z]*$'
Order by
	TicketRevenue desc;
    
-- Query 10: Select data for players that are suitable for a 20% bonus
Select
    p.PlayerID,
    p.Name,
    concat('$', format(SUM(s.Deal_Value), 2)) as 'Total Deal Value',
    p.Goals_Scored,
    concat('$', format((SUM(s.Deal_Value) / p.Goals_Scored), 2)) as ValuePerGoal,
    concat('$', format((SUM(s.Deal_Value) * .20), 2)) as Bonus
From
    Player p
Join
    Sponsorship s on p.PlayerID = s.Player_PlayerID
Group by 
    p.PlayerID
Having
    p.Goals_Scored > 0 and (SUM(s.Deal_Value) / p.Goals_Scored) < 50000
Order by
	ValuePerGoal asc;


    


    










