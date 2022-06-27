# freeCodeCamp: Relational Database Certificate Project \#1
## Build a Celestial Bodies Database
This is one of the required projects to earn certification. For this project, a database of celestial bodies was built using PostgreSQL. The database can be found in the `universe.sql` file.

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
