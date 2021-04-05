CREATE TABLE IF NOT EXISTS enrollee_type (
       id SERIAL PRIMARY KEY,
       type VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS class_profile (
       id SERIAL PRIMARY KEY,
       profile_name VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS class_language (
       id SERIAL PRIMARY KEY,
       language VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS education_organization_parent (
       id SERIAL PRIMARY KEY,
       EOParent VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS education_organization (
       id SERIAL PRIMARY KEY,
       EONAME VARCHAR(255) NOT NULL,
       EOTYPENAME VARCHAR(255) NOT NULL,
       EORegName VARCHAR(255) NOT NULL,
       EOAreaName VARCHAR(255) NOT NULL,
       EOTerName VARCHAR(255) NOT NULL,
       EOParent_ID INTEGER NOT NULL
	   , CONSTRAINT FK_parent_organization FOREIGN KEY (EOParent_ID)
        REFERENCES education_organization_parent (id)
);

CREATE TABLE IF NOT EXISTS ZNO_enrollee_registration (
	id SERIAL PRIMARY KEY,
	OUTID VARCHAR(255) NOT NULL,
	YEAR INT NOT NULL,
	Birth NUMERIC NOT NULL,
	SEXTYPENAME VARCHAR(255) NOT NULL,
	REGNAME VARCHAR(255) NOT NULL,
	AREANAME VARCHAR(255) NOT NULL,
	TERNAME VARCHAR(255) NOT NULL,
	TerTypeName VARCHAR(255) NOT NULL,
	enrollee_type_ID INTEGER NOT NULL,
	class_profile_id INTEGER DEFAULT NULL,
	class_lang_id INTEGER DEFAULT NULL,
	t_EONAME VARCHAR(255) DEFAULT NULL,
	t_EOTYPENAME VARCHAR(255) DEFAULT NULL,
	t_EORegName VARCHAR(255) DEFAULT NULL,
	t_EOAreaName VARCHAR(255) DEFAULT NULL,
	t_EOTerName VARCHAR(255) DEFAULT NULL,
	educ_org_id INTEGER DEFAULT NULL
	, CONSTRAINT FK_enrollee_type FOREIGN KEY (enrollee_type_ID)
        REFERENCES enrollee_type (id)
	, CONSTRAINT FK_class_profile FOREIGN KEY (class_profile_id)
        REFERENCES class_profile (id)
	, CONSTRAINT FK_class_lang FOREIGN KEY (class_lang_id)
        REFERENCES class_language (id)
	, CONSTRAINT FK_educ_organization FOREIGN KEY (educ_org_id)
        REFERENCES education_organization (id)
);

CREATE TYPE exam_codes AS ENUM ('ukr', 'hist', 'math', 'phys', 'chem', 'bio', 'geo', 'eng', 'fra', 'deu', 'spa');

CREATE TABLE IF NOT EXISTS ZNO_enrollee_result (
	id SERIAL PRIMARY KEY,
	registration_id INTEGER NOT NULL,
	code_exam exam_codes NOT NULL,
	Test VARCHAR(255)DEFAULT NULL,
	Lang VARCHAR(255) DEFAULT NULL,
	TestStatus VARCHAR(255) DEFAULT NULL,
	Ball100 NUMERIC DEFAULT NULL,
	Ball12 NUMERIC DEFAULT NULL,
	Ball NUMERIC DEFAULT NULL,
	AdaptScale NUMERIC DEFAULT NULL,
	PTName VARCHAR(255) DEFAULT NULL,
	PTRegName VARCHAR(255) DEFAULT NULL,
	PTAreaName VARCHAR(255) DEFAULT NULL,
	PTTerName VARCHAR(255) DEFAULT NULL,
	DPALevel VARCHAR(255) DEFAULT NULL
	, CONSTRAINT FK_enrollee_registration FOREIGN KEY (registration_id)
        REFERENCES ZNO_enrollee_registration (id)
);


