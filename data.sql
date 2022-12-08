/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  VALUES ('Agumon', '2020-02-3', 0, true, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  VALUES ('Gabumon', '2018-11-15', 2, true, 8.0);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  VALUES ('Devimon', '2017-05-12', 5, true, 11.0);

-- Insert data after species column creation
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  VALUES ('Charmander', '2020-02-08', 0, false, -11.0),('Plantmon', '2021-11-15', 2, true, -5.7), ('Squirtle', '1993-04-02', 3, false, -12.13), ('Angemon', '2005-06-12', 1, true, -45.0), ('Boarmon', '2005-06-07', 7, true, 20.4),('Blossom', '1998-10-13', 3, true, 17.0),('Ditto', '2022-05-14', 4, true, 22.0);

-- insert data in owners table
INSERT INTO owners (full_name , age) VALUES ('Sam Smith', 34),('Jennifer Orwell', 19), ('Bob', 45),('Melody Pond', 77),('Dean Winchester', 14),('Jodie Whittaker', 38);

-- insert data in species table
INSERT INTO species (full_name ) VALUES ('Pokemon'),('Digimon');

-- modify your inserted animals so it includes the species_id value, ff the name ends in "mon" it will be Digimon.
UPDATE animals SET species_id=2 WHERE name LIKE '%mon%';

-- modify your inserted animals so it includes the species_id value, all other animals are Pokemon
UPDATE animals SET species_id=1 WHERE name NOT LIKE '%mon%';

-- modify inserted animal,Sam Smith owns Agumon.
UPDATE animals SET owner_id = (select id from owners where full_name = 'Sam Smith') WHERE name = 'Agumon';

-- modify inserted animal, Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals SET owner_id = (select id from owners where full_name = 'Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu';

-- modify inserted animal, Bob owns Devimon and Plantmon.
UPDATE animals SET owner_id = (select id from owners where full_name = 'Bob') WHERE name = 'Devimon' OR name = 'Plantmon';

-- modify inserted animal, Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owner_id = (select id from owners where full_name = 'Melody Pond') WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

-- modify inserted animal,Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owner_id = (select id from owners where full_name = 'Dean Winchester') WHERE name = 'Angemon' OR name = 'Boarmon';