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

-- Insert the following data for vets
INSERT INTO vets (name, age, date_of_graduation) VALUES('William Tatcher', 45, '2000-04-23'), ('Maisy Smith', 26, '2019-01-17'),('Stephanie Mendez', 64, '1981-05-04'),('Jack Harkness', 38, '2008-06-08');

-- Insert the following data for specialties
INSERT INTO specializations(species, vets) VALUES ((SELECT id FROM species WHERE full_name = 'Pokemon'),(SELECT id FROM vets WHERE name='William Tatcher'));
INSERT INTO specializations(species, vets) VALUES ((SELECT id FROM species WHERE full_name = 'Digimon'),(SELECT id FROM vets WHERE name='Stephanie Mendez')), ((SELECT id FROM species WHERE full_name='Pokemon'),(SELECT id FROM vets WHERE name='Stephanie Mendez'));
INSERT INTO specializations(species, vets) VALUES ((SELECT id FROM species WHERE full_name = 'Digimon'),(SELECT id FROM vets WHERE name='Jack Harkness'));

-- Insert the following data for visits
INSERT INTO visits (animals, vets, date_of_visit) VALUES ((SELECT id from animals WHERE name='Agumon'), (SELECT id FROM vets WHERE name='William Tatcher'), '2020-05-24'), ((SELECT id from animals WHERE name='Agumon'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), '2020-07-22'),((SELECT id from animals WHERE name='Gabumon'), (SELECT id FROM vets WHERE name='Jack Harkness'), '2021-02-02'),((SELECT id from animals WHERE name='Pikachu'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2020-01-05'),((SELECT id from animals WHERE name='Pikachu'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2020-03-08'),((SELECT id from animals WHERE name='Pikachu'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2020-05-14'),((SELECT id from animals WHERE name='Devimon'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), '2021-05-04'),((SELECT id from animals WHERE name='Charmander'), (SELECT id FROM vets WHERE name='Jack Harkness'), '2021-02-24'),((SELECT id from animals WHERE name='Plantmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2019-12-21'),((SELECT id from animals WHERE name='Plantmon'), (SELECT id FROM vets WHERE name='William Tatcher'), '2020-08-10'),((SELECT id from animals WHERE name='Plantmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2021-04-07'),((SELECT id from animals WHERE name='Squirtle'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), '2019-09-29'),((SELECT id from animals WHERE name='Angemon'), (SELECT id FROM vets WHERE name='Jack Harkness'), '2020-10-03'),((SELECT id from animals WHERE name='Angemon'), (SELECT id FROM vets WHERE name='Jack Harkness'), '2020-11-04'),((SELECT id from animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2019-01-24'),((SELECT id from animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2019-05-15'),((SELECT id from animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2020-02-27'),((SELECT id from animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2020-08-03'),((SELECT id from animals WHERE name='Blossom'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), '2020-05-24'),((SELECT id from animals WHERE name='Blossom'), (SELECT id FROM vets WHERE name='William Tatcher'), '2021-01-11');