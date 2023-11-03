# AthenaFC-Database
# MIST 4610 (Data Management and Analytics) - Project 1

## Project Description 
This project involves a collaborative effort by the students of MIST 4610 class at the University of Georgia to construct a robust relational database for a simulated client scenario, facilitated through the ChatGPT interface at chat.openai.com. 

## Team Members
Tyson Colette https://github.com/TysonColette

## Data Model Construction
In collaboration with the chosen client scenario via ChatGPT:

1. Identify crucial entities, attributes, and relationships specific to the client's business.
2. Document the data model using an Entity Relationship Diagram.
3. Create the database in MySQL and populate it with artifical data.
4. Craft SQL queries that give managerial insight into the clients business.

## 1. Conversation with ChatGPT
### Prompt:
Pretend you are the owner/operator of a soccer club needing to build a relational database. You hired some students from the MIST 4610 class [Data Management and Analytics] at the University of Georgia to create the database for you. They need to know more about
your organization to identify which entities, attributes, and relationships are important for
you. Start by describing your business as a real client.

### Reponse:
**Client Description:**

Hello students! I'm Alex Morgan, the owner and operator of "Athena FC", a professional soccer club based right here in Athens, Georgia. Our club competes in the Southeastern Soccer League, and we have both a men's and women's team. As we continue to grow and compete at higher levels, it's essential that we have a robust data management system to track various facets of our operations.

**Entities we believe are essential for our business:**

1. Players: They are the core of our club. Information about their playing statistics, personal details, contract specifics, and health is vital.

2. Staff: This includes coaches, medical staff, scouts, and administrative personnel.

3., Matches: Every match has a date, location, opponent, result, and statistics associated with it.

4. Training Sessions: These are conducted frequently, and data about their duration, intensity, players who attended, and performance metrics are tracked.

5. Fans: Our fan base is crucial for revenue and engagement. We have a membership system and track ticket sales, merchandise purchases, and attendance.

6. Facilities: We own a stadium and training grounds. Maintenance schedules, usage schedules, and other associated details are important.

7. Finances: This includes player salaries, revenue from ticket sales, sponsorships, merchandise sales, and expenses.

8. Sponsors: Companies that sponsor our club, the details of the deal, duration, and value.

9. Youth Academy: Young players who are being groomed for the future. Their development metrics, personal details, and performances are tracked.

**Attributes (examples for a few entities):**

1. Players: Name, Date of Birth, Nationality, Position, Jersey Number, Contract Start Date, Contract End Date, Salary, Injury History, Goals Scored, Assists, Appearances.

2. Matches: Date, Venue, Opponent, Goals Scored, Goals Conceded, Attendance, Ticket Revenue.

3. Fans: Name, Membership Type, Date of Birth, Date Joined, Total Matches Attended, Merchandise Purchased.

**Relationships (examples):**

1. Players-Staff: Players interact with various staff members. A player might have a primary coach, physiotherapist, or even a nutritionist.

2. Players-Matches: Which players played in which matches, their performance metrics for that match (e.g., goals scored, minutes played).

3. Fans-Matches: Which fans attended which matches, the type of tickets they purchased.

4. Facilities-Training Sessions: Which facility was used for which training session, any maintenance required post-session.

## 2. Creation of Entity Relationship diagram
After consulting with ChatGPT, the following database was drawn up, taking insight from what ChatGPT determined were valuable entities and attributes to model:
![Screenshot](DB-ER_FINAL.png)

## 3. Populating the Database with Artificial Data 
### Player
The majority of the data was designed to be as realistic as possible.
For **Player** the aim was to design ficitonal players from all over the world and assign them a name that was suitable.
These ficional players were created by ChatGPT using GPT-4.
Here is a sample of the **Player** data input:
```MySQL
Insert into Player 
(PlayerID, Name, Date_of_Birth, Nationality, Position, Jersey_Number, Contract_Start_Date, Contract_End_Date, Salary, Injury_History, Goals_Scored, Assists, Appearances, Previous_Team)
Values

-- Player 1 - U.S. Goalkeeper
(1, 'John Smith', '1995-02-15', 'United States', 'Goalkeeper (GK)', 1, '2022-03-20', '2025-03-20', 300000, 'ACL, Ankle Sprain', 0, 0, 28, 'Albany Alphas'),  

-- Player 2 - Brazilian Striker
(2, 'Luiz Alves', '1997-08-10', 'Brazil', 'Striker', 9, '2023-01-12', '2026-01-12', 4500000, 'Broken Leg, Concussion', 25, 15, 30, 'Denver Peaks'), 

-- Player 3 - English Central Midfielder
(3, 'James O''Connell', '1994-05-20', 'England', 'Central Midfielder (CM)', 8, '2022-10-15', '2025-10-15', 2500000, 'MCL, Broken Arm', 5, 8, 26, 'Juneau Waves'),   

-- Player 4 - U.S. Center-Back 
(4, 'Robert Anderson', '1993-04-28', 'United States', 'Center-Back (CB)', 4, '2022-09-10', '2025-09-10', 700000, 'Ankle Sprain, Hip Dislocation', 0, 0, 27, NULL),
```

After player data was entered it was determined that some players should be without injury history to better simulate a real scenario:

Update Player 
Set Injury_History = NULL 
Where PlayerID in (11, 8, 20, 42, 15, 16, 2, 5, 31, 29, 44, 13, 21, 22, 34, 47);

### Sponsor
Given that soccer teams are typically sponsored 8 companies were entered into the **Sponsor** table using hte following:
```MySQL
Insert into Sponsor (SponsorID, Company_Name, Company_Location)
Values

(1, 'Adidas', 'Herzogenaurach, Germany'),

(2, 'Emirates', 'Dubai, United Arab Emirates'),

(3, 'Chevrolet', 'Detroit, Michigan, USA'),

(4, 'Coca-Cola', 'Atlanta, Georgia, USA'),

(5, 'Mastercard', 'Purchase, New York, USA'),

(6, 'Budweiser', 'St. Louis, Missouri, USA'),

(7, 'Sony', 'Tokyo, Japan'),

(8, 'BP', 'London, United Kingdom');
```

The top players (determined by Salary) were given sponsorships varying from 12 to 24 Months and from $80,000 to $800,000.

### Facilties
The **Facilities** were inserted using the following:
```MySQL
Insert into Facilities
Values 

(1, 'Home Stadium', 'Athens, Georgia', 'Weekly'),

(2, 'Practice Facility', 'Athens, Georgia', 'Biweekly'),

(3, 'Medical Facility', 'Athens, Georgia', 'Weekly'),

(4, 'Corporate Office', 'Atlanta, Georgia', 'Biweekly'),

(5, 'Event Center', 'Athens, Georgia', 'Weekly');
```
### Matches
34 Games (designed to mimic the MLS schedule) were generated using the following rules:
1. All games are played on Thursdays and Saturdays
2. Games alternate between Home and Away
3. Ticket revenue will be determined by the product of attendance in a 62,000 person stadium and an average ticket price of $50
4. No team is to be played more than twice

This following sample was used to populate the **Matches** table:
```MySQL
Insert into Matches (MatchID, Date, Venue, Opponent, Goals_Scored, Goals_Conceded, Attendance, Ticket_Revenue, Facilities_FacilityID)
Values
(1, '2023-10-05', 'Home', 'Albany Alphas', 4, 1, '85%', 50 * 62000 * 0.85, 1),
(2, '2023-10-08', 'Away', 'Boston Beacons', 2, 3, '87%', 50 * 62000 * 0.87, NULL),
(3, '2023-10-12', 'Home', 'Galveston Galleons', 3, 4, '88%', 50 * 62000 * 0.88, 1),
(4, '2023-10-15', 'Away', 'Denver Peaks', 0, 2, '89%', 50 * 62000 * 0.89, NULL),
(5, '2023-10-19', 'Home', 'Juneau Waves', 4, 1, '90%', 50 * 62000 * 0.90, 1),
(6, '2023-10-22', 'Away', 'Fresno Pheonix', 3, 1, '88%', 50 * 62000 * 0.88, NULL),
(7, '2023-10-26', 'Home', 'Galveston Galleons', 4, 2, '92%', 50 * 62000 * 0.92, 1),
(8, '2023-10-29', 'Away', 'Hartford Harbingers', 0, 2, '87%', 50 * 62000 * 0.87, NULL),
(9, '2023-11-02', 'Home', 'Urbana Titans', 5, 0, '93%', 50 * 62000 * 0.93, 1),

```
### Fans
The **Fans** table was populated with the 999 best fans of the team. These 999 people were generated using Mockaroo

### Tickets
The **Tickets** table was then populated using the following statement:

```MySQL
--Insert Data
Insert into Tickets (Type, Price, Match_MatchID, Fan_FanID)
Select 
    -- Randomly assign ticket type, 50/50 Split
    Case 
        When rand() > 0.5 Then 'Upper Level'
        Else 'Lower Level'
    End as Type,
    -- Randomly assign ticket price, 50/50 Split
    Case 
        When rand() > 0.5 Then 30
        Else 60
    End as Price,
    Matches.MatchID as Match_MatchID,
    Fans.FanID as Fan_FanID
From
    Fans,
    (Select MatchID From Matches Where Date <= '2023-11-03' limit 9) as Matches;
```
The aim for this was to assign the 1000 fans tickets to the 9 Games that had already been played.
This was an imperfect method which does not tie the value of the ticket to the level of the seat, but instead generates a random value for each attribute.

### Rest of the Data
The rest of the data was generated using similar methods that tried to maintain accuracy as best as possible


## 4. Querying the Data

