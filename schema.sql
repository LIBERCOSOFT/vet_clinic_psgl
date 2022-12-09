/* Database schema to keep the structure of entire database. */

-- Create animals table
CREATE TABLE animals(id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(50), date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL);

-- Add species column to animals table
ALTER TABLE animals ADD species text;

-- create owners table
CREATE TABLE owners(id INT GENERATED ALWAYS AS IDENTITY, full_name VARCHAR(50), age INT);

-- create species table
CREATE TABLE species(id INT GENERATED ALWAYS AS IDENTITY, full_name VARCHAR(50));

-- modify table to auto increment id
ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD id SERIAL PRIMARY KEY;

-- remove species column from animal's table
ALTER TABLE animals DROP COLUMN species;

-- add column species_id referencing species table in the animal table
ALTER TABLE species DROP COLUMN id;
ALTER TABLE species ADD id SERIAL PRIMARY KEY;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT species_id FOREIGN KEY(species_id) REFERENCES species(id);

-- add column owner_id referencing owners table in animal table
ALTER TABLE owners DROP COLUMN id;
ALTER TABLE owners ADD id SERIAL PRIMARY KEY;
ALTER TABLE animals ADD owner_id INT, ADD CONSTRAINT owner_id FOREIGN KEY(owner_id) REFERENCES owners(id);

-- Create a table named vets
CREATE TABLE vets(id SERIAL PRIMARY KEY, name VARCHAR(50), age INT, date_of_graduation DATE);

-- Create a "join table" called specializations to handle this relationship.
CREATE TABLE specializations(species INT REFERENCES species(id), vets INT REFERENCES vets(id));

-- Create a "join table" called visits to handle this relationship, it should also keep track of the date of the visit.
CREATE TABLE visits (animals INT REFERENCES animals(id), vets INT REFERENCES vets(id), date_of_visit DATE);