BEGIN; -- every instructions that make changes to db needs to start with it
COMMIT; -- every instruction that make changes to db needs to end with it

CREATE SCHEMA <schema_name>;			-- creates new schema
SET search_path TO <schema_name>;	-- set default search path

-- creating table
CREATE TABLE <schema_name>.<table_name> (
	-- fields... example types
	<field_name> varchar(<max_length>) PRIMARY KEY, 		-- text, set to primary key of table

	<field_name> varchar(<max_length>) CHECK(<condition>), 	-- requires condition to be true, 
														  	-- for ex. length(<field_name>) > 5

	<field_name> varchar(<max_length>) NOT NULL, 			-- value cannot be null

	PRIMARY KEY(<fields>)									-- primary key that consist of multiple fields

);

-- all kinds of restrictions that can be attatched to field
NOT NULL 			-- NULL cannot be assigned to field
UNIQUE				-- value must be unique in table range
DEFAULT <value> 	-- if value is not provided <value> will be assigned automatically
CHECK (<condition>) -- as above
REFERENCES <schema_name>.<table_name>(<field_name>) -- sets foreign key

-- other types of fields
boolean									-- true / false
integer 								-- standard integer
serial									-- integer, auto increment
numeric(<digits>, <num>)				-- float, overall length of <digits> and <num> digits after dec point
char(<max_length>)  					-- text, <max_lenght> must be constant
text									-- text, unlimited lenght
date  									-- date format only
time									-- time format only
timestamp								-- date and time
timestampz								-- date and time + timezone
array									-- array type


-- if we want to modify anything in the table schema
ALTER TABLE <schema_name>.<table_name>

-- adding column
ALTER TABLE <schema_name>.<table_name>
	ADD COLUMN <column_name> <field_type> <restrictions>;

-- deleting column
ALTER TABLE <schema_name>.<table_name>
	DROP COLUMN <column_name> CASCADE;

-- renaming column
ALTER TABLE <schema_name>.<table_name>
	RENAME COLUMN <previous_name> TO <new_name>;

-- renaming table
ALTER TABLE <schema_name>.<table_name> 
	RENAME TO <new_name>;

-- adding additional restrictions
ALTER TABLE <schema_name>.<table_name>
	ADD CHECK (<condition>);

ALTER TABLE <schema_name>.<table_name>
	ALTER COLUMN <column_name> SET NOT NULL; -- for example :)

ALTER TABLE <schema_name>.<table_name>
	ALTER COLUMN <column_name>
	SET DEFAULT <default_value>; -- (DROP DEFAULT)

-- deleting restrictions
ALTER TABLE <schema_name>.<table_name>
	DROP CONSTRAINT <constraint_name> [CASCADE];

-- adding foregin key reference
ALTER TABLE <schema_name>.<table_name>
	ADD CONSTRAINT <constraint_name>
	FOREIGN KEY <field_name> REFERENCES <schema_name>.<other_table_name>(<field_name>);

-- changing type of column
ALTER TABLE <schema_name>.<table_name> 
	ALTER COLUMN <column_name>
	TYPE <new_type>


-- copying data to table
COPY <schema_name>.<table_name>(<fields>) FROM <stream> WITH (delimiter <sign>, NULL <null_value>);
	<data_in_csv_format>
	...
	</data_in_csv_format>
-- typically stream would be "stdin", but it also could be filepath
-- we're also able to determine to which fields we want to copy data by pasing tuple of <fields>,
-- it is needed especially when we copy to table where one field is of type serial, then we don't
-- want to copy to all fields, because serial field will be incremented by itself
-- <sign> is char that determines delimiter, <null_value> is value that defines null values XD
-- if we want to copy from stdin we need to determine end of sequence which is "\."

