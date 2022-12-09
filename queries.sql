/*Queries that provide answers to the questions from all projects.*/
-- Find all animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon%';
-- List the name of all animals born between 2016 and 2019.
SELECT * FROM animals WHERE date_of_birth BETWEEN  '2016-01-01' AND  '2019-12-31';
-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT * FROM animals WHERE neutered='true' AND escape_attempts < 3;
-- List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT (date_of_birth) FROM animals WHERE name='Augmon' OR name='Pikachu';
-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT (name, escape_attempts) FROM animals WHERE weight_kg > 10.5;
-- Find all animals that are neutered
SELECT * FROM animals WHERE neutered='true';
-- Find all animals not named Gabumon.
SELECT * FROM animals WHERE name!='Gabumon';
--  Find all animals with a weight between 10.4kg and 17.3kg 
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- update all animals species
UPDATE animals SET species = 'unspecified';

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

--  delete all records in the animals table
DELETE FROM animals;

-- Delete all animals born after Jan 1st, 2022.
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;

-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;

-- How many animals are there?
SELECT COUNT(name) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT name, escape_attempts FROM animals WHERE escape_attempts =(SELECT MAX(escape_attempts) FROM animals);

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- What animals belong to Melody Pond?
SELECT name FROM animals JOIN owners ON animals.owner_id = (SELECT id FROM owners WHERE full_name='Melody Pond') WHERE full_name='Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT name FROM animals JOIN species ON animals.species_id=(select id from species where full_name = 'Pokemon') WHERE species.full_name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name,name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT full_name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id GROUP BY full_name;

-- List all Digimon owned by Jennifer Orwell.
SELECT name, species.full_name AS specie, owners.full_name AS owner FROM animals JOIN species ON species.id = animals.species_id JOIN owners ON owners.id = animals.owner_id WHERE species.full_name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT name, full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT full_name, COUNT(animals.name) FROM animals JOIN owners ON owners.id = animals.owner_id GROUP BY full_name ORDER BY count(animals.name) DESC;