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

## Conversation with ChatGPT
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

## Creation of Entity Relationship diagram


## Populating the Database with Artificial Data 

## Querying the Data
