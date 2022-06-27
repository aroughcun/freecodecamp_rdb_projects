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

**Galaxy Group Table**

 | Column | Data Type | Description |
 | --- | --- | --- |
 | galaxy_group_id | SERIAL | Autoincrementing Primary Key |
 | name | VARCHAR(50) | Group name |
 | distance_mly | NUMERIC | Distance away in million light years (Mly) |
 | constellation | TEXT | Night sky location of galaxy group |

**Galaxy Table**

 | Column | Data Type | Description |
 | --- | --- | --- |
 | galaxy_id | SERIAL | Autoincrementing Primary Key |
 | name | VARCHAR(50) | Galaxy name |
 | type | VARCHAR(50) | Primary Hubble-de Vaucouleurs Classification |
 | distance_mly | NUMERIC | Distance away in million light years (Mly) |
 | diameter_ly |  INT | Galaxy diameter in light years (ly) |
 | galaxy_group_id | INT | Foreign Key - Galaxy Group |

**Star Table**

 | Column | Data Type | Description |
 | --- | --- | --- |
 | star_id | SERIAL | Autoincrementing Primary Key |
 | name | VARCHAR(50) | Star name |
 | spectral_class | VARCHAR(1) | Spectral classification |
 | life_stage | VARCHAR(50) | Life stage of star |
 | distance_ly | NUMERIC | Distance away in light years (ly) |
 | galaxy_id | INT | Foreign Key - Galaxy |

**Planet Table**

 | Column | Data Type | Description | 
 | --- | --- | --- |
 | planet_id | SERIAL | Autoincrementing Primary Key |
 | name | VARCHAR(50) | Planet name |
 | mass_earths | NUMERIC | Planet mass relative to Earth |
 | discovered | INT | Year first observed with telescope |
 | habital_zone | BOOLEAN | Exists in the habital zone of resident star |
 | has_life | BOOLEAN | Life present on planet |
 | star_id | INT | Foreign Key - Star |

**Moon Table**

 | Column | Data Type | Description |
 | --- | --- | --- |
 | moon_id | SERIAL | Autoincrementing Primary Key |
 | name | VARCHAR(50) | Moon name |
 | discovered | INT | Year first observed with telescope |
 | orbital speed_kms | NUMERIC | Average orbital speed (km/s) |
 | planet_id | INT | Foreign Key - Planet |
