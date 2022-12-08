/* Database schema to keep the structure of entire database. */

-- Create animals table
CREATE TABLE animals(id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(50), date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL);

-- Add species column to animals table
ALTER TABLE animals ADD species text;