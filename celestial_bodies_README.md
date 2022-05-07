# freeCodeCamp: Relational Database Certificate Project \#1
## Build a Celestial Bodies Database
This is one of the required projects to earn certification. For this project, a database of celestial bodies will be built using PostgreSQL.

## Instructions
### Step 1: Complete the project
> The project runs in a virtual machine, complete the user stories described in there and get all the tests to pass to finish step 1.

Important: After you pass all the project tests, save a dump of your database into a `universe.sql` file so you can complete step 2. There will be instructions how to do that within the virtual machine.

### Step 2: Submit your code
> When you have completed the project, save all the required files into a public repository and submit the URL to it below.

Related files: `universe.sql`

# Codebook:

**Galaxy Table**

 | Column | Data Type | Description |
 | --- | --- | --- |
 | galaxy_id | SERIAL | Autoincrementing Primary Key |
 | name | VARCHAR(50) | Galaxy name |

**Star Table**

 | Column | Data Type | Description |
 | --- | --- | --- |
 | star_id | SERIAL | Autoincrementing Primary Key |
 | name | VARCHAR(50) | Star name |

**Planet Table**

 | Column | Data Type | Description | 
 | --- | --- | --- |
 | planet_id | SERIAL | Autoincrementing Primary Key |
 | name | VARCHAR(50) | Planet name |

**Moon Table**

 | Column | Data Type | Description |
 | --- | --- | --- |
 | moon_id | SERIAL | Autoincrementing Primary Key |
 | name | VARCHAR(50) | Moon name |

**Telescope Table**

 | Column | Data Type | Description |
 | --- | --- | --- |
 | telescope_id | SERIAL | Autoincrementing Primary Key |
 | name | VARCHAR(50) | Telescope name |
