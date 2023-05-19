-- odeberu pokud existuje funkce na oodebrání tabulek a sekvencí
DROP FUNCTION IF EXISTS remove_all();

-- vytvořím funkci která odebere tabulky a sekvence
-- chcete také umět psát PLSQL? Zapište si předmět BI-SQL ;-)
CREATE or replace FUNCTION remove_all() RETURNS void AS $$
DECLARE
    rec RECORD;
    cmd text;
BEGIN
    cmd := '';

    FOR rec IN SELECT
            'DROP SEQUENCE ' || quote_ident(n.nspname) || '.'
                || quote_ident(c.relname) || ' CASCADE;' AS name
        FROM
            pg_catalog.pg_class AS c
        LEFT JOIN
            pg_catalog.pg_namespace AS n
        ON
            n.oid = c.relnamespace
        WHERE
            relkind = 'S' AND
            n.nspname NOT IN ('pg_catalog', 'pg_toast') AND
            pg_catalog.pg_table_is_visible(c.oid)
    LOOP
        cmd := cmd || rec.name;
    END LOOP;

    FOR rec IN SELECT
            'DROP TABLE ' || quote_ident(n.nspname) || '.'
                || quote_ident(c.relname) || ' CASCADE;' AS name
        FROM
            pg_catalog.pg_class AS c
        LEFT JOIN
            pg_catalog.pg_namespace AS n
        ON
            n.oid = c.relnamespace WHERE relkind = 'r' AND
            n.nspname NOT IN ('pg_catalog', 'pg_toast') AND
            pg_catalog.pg_table_is_visible(c.oid)
    LOOP
        cmd := cmd || rec.name;
    END LOOP;

    EXECUTE cmd;
    RETURN;
END;
$$ LANGUAGE plpgsql;
-- zavolám funkci co odebere tabulky a sekvence - Mohl bych dropnout celé schéma a znovu jej vytvořit, použíjeme však PLSQL
select remove_all();



CREATE TABLE handyman (
    id_staff INTEGER NOT NULL,
    role VARCHAR(20) NOT NULL,
    certification VARCHAR(20) NOT NULL
);
ALTER TABLE handyman ADD CONSTRAINT pk_handyman PRIMARY KEY (id_staff);

CREATE TABLE head_of_block (
    id_staff INTEGER NOT NULL,
    email VARCHAR(64) NOT NULL,
    block_number INTEGER NOT NULL,
    photo_url VARCHAR(256)
);
ALTER TABLE head_of_block ADD CONSTRAINT pk_head_of_block PRIMARY KEY (id_staff);

CREATE TABLE mass_disinfection (
    id_disinfection SERIAL NOT NULL,
    price INTEGER NOT NULL,
    date DATE NOT NULL
);
ALTER TABLE mass_disinfection ADD CONSTRAINT pk_mass_desinfection PRIMARY KEY (id_disinfection);

CREATE TABLE porter (
    id_staff INTEGER NOT NULL,
    is_a_student BOOLEAN NOT NULL
);
ALTER TABLE porter ADD CONSTRAINT pk_porter PRIMARY KEY (id_staff);

CREATE TABLE rent_agreement (
    id_agreement SERIAL NOT NULL,
    id_staff INTEGER NOT NULL,
    room_number INTEGER NOT NULL,
    block_number INTEGER NOT NULL,
    id_student INTEGER NOT NULL,
    start_date DATE NOT NULL,
    rent_amount INTEGER NOT NULL,
    end_date DATE NOT NULL
);
ALTER TABLE rent_agreement ADD CONSTRAINT pk_rent_agreement PRIMARY KEY (id_agreement);
-- ALTER TABLE rent_agreement ADD CONSTRAINT u_fk_rent_agreement_head_of_blo UNIQUE (id_staff);

CREATE TABLE room (
    room_number SERIAL NOT NULL,
    block_number SERIAL NOT NULL,
    contain_bed_bugs BOOLEAN NOT NULL
);
ALTER TABLE room ADD CONSTRAINT pk_room PRIMARY KEY (room_number, block_number);

CREATE TABLE service (
    id_service SERIAL NOT NULL,
    id_porter INTEGER,
    id_handyman INTEGER,
    id_student INTEGER NOT NULL,
    date DATE NOT NULL,
    service_name VARCHAR(20) NOT NULL,
    service_description VARCHAR(256)
);
ALTER TABLE service ADD CONSTRAINT pk_service PRIMARY KEY (id_service);

CREATE TABLE silicon_hill_club_membership (
    id_membership SERIAL NOT NULL,
    id_student INTEGER NOT NULL,
    membership_type VARCHAR(20) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);
ALTER TABLE silicon_hill_club_membership ADD CONSTRAINT pk_silicon_hill_club_membership PRIMARY KEY (id_membership);

CREATE TABLE staff_member (
    id_staff SERIAL NOT NULL,
    id_type INTEGER NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    hourly_wage INTEGER NOT NULL
);
ALTER TABLE staff_member ADD CONSTRAINT pk_staff_member PRIMARY KEY (id_staff);

CREATE TABLE student (
    id_student SERIAL NOT NULL,
    email VARCHAR(64) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);
ALTER TABLE student ADD CONSTRAINT pk_student PRIMARY KEY (id_student);
ALTER TABLE student ADD CONSTRAINT uc_student_email UNIQUE (email);

CREATE TABLE staff_type (
    id_type SERIAL NOT NULL,
    type_name VARCHAR(256) NOT NULL
);
ALTER TABLE staff_type ADD CONSTRAINT pk_type PRIMARY KEY (id_type);
ALTER TABLE staff_type ADD CONSTRAINT uc_type_type_name UNIQUE (type_name);

CREATE TABLE room_mass_disinfection (
    room_number INTEGER NOT NULL,
    block_number INTEGER NOT NULL,
    id_disinfection INTEGER NOT NULL
);
ALTER TABLE room_mass_disinfection ADD CONSTRAINT pk_room_mass_disinfection PRIMARY KEY (room_number, block_number, id_disinfection);

ALTER TABLE handyman ADD CONSTRAINT fk_handyman_staff_member FOREIGN KEY (id_staff) REFERENCES staff_member (id_staff) ON DELETE CASCADE;

ALTER TABLE head_of_block ADD CONSTRAINT fk_head_of_block_staff_member FOREIGN KEY (id_staff) REFERENCES staff_member (id_staff) ON DELETE CASCADE;

ALTER TABLE porter ADD CONSTRAINT fk_porter_staff_member FOREIGN KEY (id_staff) REFERENCES staff_member (id_staff) ON DELETE CASCADE;

ALTER TABLE rent_agreement ADD CONSTRAINT fk_rent_agreement_head_of_block FOREIGN KEY (id_staff) REFERENCES head_of_block (id_staff) ON DELETE CASCADE;
ALTER TABLE rent_agreement ADD CONSTRAINT fk_rent_agreement_room FOREIGN KEY (room_number, block_number) REFERENCES room (room_number, block_number) ON DELETE CASCADE;
ALTER TABLE rent_agreement ADD CONSTRAINT fk_rent_agreement_student FOREIGN KEY (id_student) REFERENCES student (id_student) ON DELETE CASCADE;

ALTER TABLE service ADD CONSTRAINT fk_service_porter FOREIGN KEY (id_porter) REFERENCES porter (id_staff) ON DELETE CASCADE;
ALTER TABLE service ADD CONSTRAINT fk_service_handyman FOREIGN KEY (id_handyman) REFERENCES handyman (id_staff) ON DELETE CASCADE;
ALTER TABLE service ADD CONSTRAINT fk_service_student FOREIGN KEY (id_student) REFERENCES student (id_student) ON DELETE CASCADE;

ALTER TABLE silicon_hill_club_membership ADD CONSTRAINT fk_silicon_hill_club_membership FOREIGN KEY (id_student) REFERENCES student (id_student) ON DELETE CASCADE;

ALTER TABLE staff_member ADD CONSTRAINT fk_staff_member_type FOREIGN KEY (id_type) REFERENCES staff_type (id_type) ON DELETE CASCADE;

ALTER TABLE room_mass_disinfection ADD CONSTRAINT fk_room_mass_disinfection_room FOREIGN KEY (room_number, block_number) REFERENCES room (room_number, block_number) ON DELETE CASCADE;
ALTER TABLE room_mass_disinfection ADD CONSTRAINT fk_room_mass_disinfection_mass_ FOREIGN KEY (id_disinfection) REFERENCES mass_disinfection (id_disinfection) ON DELETE CASCADE;

ALTER TABLE service
ADD CONSTRAINT check_porter_handyman_null
CHECK ((id_porter IS NULL AND id_handyman IS NOT NULL) OR (id_porter IS NOT NULL AND id_handyman IS NULL));


