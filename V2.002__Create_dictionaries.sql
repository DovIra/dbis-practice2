insert into enrollee_type(type)
SELECT distinct regtypename
FROM zno_results;

insert into class_profile(profile_name)
SELECT distinct Classprofilename
FROM zno_results
where Classprofilename is not null;

insert into class_language(language)
SELECT distinct ClassLangName
FROM zno_results
where ClassLangName is not null;

insert into education_organization_parent(EOParent)
SELECT distinct EOParent
FROM zno_results
where EOParent is not null;

insert into education_organization(EONAME,EOTYPENAME,EORegName,EOAreaName,EOTerName,EOParent_ID)
SELECT distinct EONAME,
       EOTYPENAME,
       EORegName,
       EOAreaName,
       EOTerName
       ,eop.id
FROM zno_results
join education_organization_parent eop on eop.eoparent = zno_results.EOParent
where EONAME is not null;

insert into zno_enrollee_registration (outid, "year", birth, sextypename, regname, areaname, tername, tertypename, enrollee_type_ID,class_profile_id,class_lang_ID,
       t_EONAME,t_EOTYPENAME,t_EORegName,t_EOAreaName,t_EOTerName)
select 
       OUTID,
       year,
       Birth,
       SEXTYPENAME,
       REGNAME,
       AREANAME,
       TERNAME,
       TerTypeName
       , et.id as REGTYPENAME_ID       
       ,cp.id as class_profile_id
       ,cl.id as class_lang_ID
       ,EONAME,EOTYPENAME,EORegName,EOAreaName,EOTerName
from zno_results
join enrollee_type et on et.TYPE = zno_results.REGTYPENAME
left join class_profile cp on cp.profile_name = zno_results.classprofilename
left join class_language cl on cl.LANGUAGE = zno_results.classlangname
;

CREATE UNIQUE INDEX IF NOT EXISTS OUTID_Index01 ON zno_enrollee_registration (OUTID) WITH (fillfactor = 70); 
CREATE INDEX IF NOT EXISTS eo_Index01 ON zno_enrollee_registration (t_EONAME,t_EOTYPENAME,t_EORegName,t_EOAreaName,t_EOTerName) WITH (fillfactor = 70); 
CREATE INDEX IF NOT EXISTS eo_Index02 ON zno_results (EONAME,EOTYPENAME,EORegName,EOAreaName,EOTerName) WITH (fillfactor = 70); 

update zno_enrollee_registration
set educ_org_id = education_organization.id
from education_organization
where 
t_EONAME = EONAME and
t_EOTYPENAME = EOTYPENAME and 
t_EORegName = EORegName and 
t_EOAreaName = EOAreaName and 
t_EOTerName = EOTerName
;

ALTER TABLE zno_enrollee_registration DROP COLUMN t_EONAME;

ALTER TABLE zno_enrollee_registration DROP COLUMN t_EOTYPENAME;

ALTER TABLE zno_enrollee_registration DROP COLUMN t_EORegName;

ALTER TABLE zno_enrollee_registration DROP COLUMN t_EOAreaName;

ALTER TABLE zno_enrollee_registration DROP COLUMN t_EOTerName;


INSERT INTO zno_enrollee_result
    (registration_id, 
	code_exam, 
	test, 
	teststatus, 
	ball100, 
	ball12, 
	ball, 
	adaptscale, 
	ptname, 
	ptregname, 
	ptareaname, 
	pttername
	)
select 
	zer.id,
	'ukr',
	UkrTest,
	UkrTestStatus,
	UkrBall100,
	UkrBall12,
	UkrBall,
	UkrAdaptScale,
	UkrPTName,
	UkrPTRegName,
	UkrPTAreaName,
	UkrPTTerName
from zno_results zr
join zno_enrollee_registration zer on zr.OUTID = zer.OUTID
where zr.UkrTest is not null
;

INSERT INTO zno_enrollee_result
    (registration_id, 
	code_exam, 
	test, 
	lang, 
	teststatus, 
	ball100, 
	ball12, 
	ball, 
	ptname, 
	ptregname, 
	ptareaname, 
	pttername
	)
select 
	zer.id,
	'hist',
	histTest,
	HistLang,
	histTestStatus,
	histBall100,
	histBall12,
	histBall,
	histPTName,
	histPTRegName,
	histPTAreaName,
	histPTTerName

from zno_results zr
join zno_enrollee_registration zer on zr.OUTID = zer.OUTID
where zr.histTest is not null
;

INSERT INTO zno_enrollee_result
    (registration_id, 
	code_exam, 
	test, 
	lang, 
	teststatus, 
	ball100, 
	ball12, 
	ball, 
	ptname, 
	ptregname, 
	ptareaname, 
	pttername
	)
select 
	zer.id,
	'math',
	mathTest,
	mathLang,
	mathTestStatus,
	mathBall100,
	mathBall12,
	mathBall,
	mathPTName,
	mathPTRegName,
	mathPTAreaName,
	mathPTTerName
from zno_results zr
join zno_enrollee_registration zer on zr.OUTID = zer.OUTID
where zr.mathTest is not null
;

INSERT INTO zno_enrollee_result
    (registration_id, 
	code_exam, 
	test, 
	lang, 
	teststatus, 
	ball100, 
	ball12, 
	ball, 
	ptname, 
	ptregname, 
	ptareaname, 
	pttername
	)
select 
	zer.id,
	'phys',
	physTest ,
	physLang ,
	physTestStatus ,
	physBall100 ,
	physBall12 ,
	physBall ,
	physPTName ,
	physPTRegName ,
	physPTAreaName ,
	physPTTerName 

from zno_results zr
join zno_enrollee_registration zer on zr.OUTID = zer.OUTID
where zr.physTest is not null
;

INSERT INTO zno_enrollee_result
    (registration_id, 
	code_exam, 
	test, 
	lang, 
	teststatus, 
	ball100, 
	ball12, 
	ball, 
	ptname, 
	ptregname, 
	ptareaname, 
	pttername
	)
select 
	zer.id,
	'chem',
	chemTest ,
	chemLang ,
	chemTestStatus ,
	chemBall100 ,
	chemBall12 ,
	chemBall ,
	chemPTName ,
	chemPTRegName ,
	chemPTAreaName ,
	chemPTTerName 
from zno_results zr
join zno_enrollee_registration zer on zr.OUTID = zer.OUTID
where zr.chemTest is not null
;

INSERT INTO zno_enrollee_result
    (registration_id, 
	code_exam, 
	test, 
	lang, 
	teststatus, 
	ball100, 
	ball12, 
	ball, 
	ptname, 
	ptregname, 
	ptareaname, 
	pttername
	)
select 
	zer.id,
	'bio',
	bioTest ,
	bioLang ,
	bioTestStatus ,
	bioBall100 ,
	bioBall12 ,
	bioBall ,
	bioPTName ,
	bioPTRegName ,
	bioPTAreaName ,
	bioPTTerName 
from zno_results zr
join zno_enrollee_registration zer on zr.OUTID = zer.OUTID
where zr.bioTest is not null
;

INSERT INTO zno_enrollee_result
    (registration_id, 
	code_exam, 
	test, 
	lang, 
	teststatus, 
	ball100, 
	ball12, 
	ball, 
	ptname, 
	ptregname, 
	ptareaname, 
	pttername
	)
select 
	zer.id,
	'geo',
	geoTest ,
	geoLang ,
	geoTestStatus ,
	geoBall100 ,
	geoBall12 ,
	geoBall ,
	geoPTName ,
	geoPTRegName ,
	geoPTAreaName ,
	geoPTTerName 
from zno_results zr
join zno_enrollee_registration zer on zr.OUTID = zer.OUTID
where zr.geoTest is not null
;


INSERT INTO zno_enrollee_result
    (registration_id, 
	code_exam, 
	test, 
	teststatus, 
	ball100, 
	ball12, 
	ball, 
	ptname, 
	ptregname, 
	ptareaname, 
	pttername, 
	dpalevel)
select 
	zer.id,
	'eng',
	engTest ,
	engTestStatus ,
	engBall100 ,
	engBall12 ,
	engBall ,
	engPTName ,
	engPTRegName ,
	engPTAreaName ,
	engPTTerName ,
	engDPALevel 
from zno_results zr
join zno_enrollee_registration zer on zr.OUTID = zer.OUTID
where zr.engTest is not null
;
INSERT INTO zno_enrollee_result
    (registration_id, 
	code_exam, 
	test, 
	teststatus, 
	ball100, 
	ball12, 
	ball, 
	ptname, 
	ptregname, 
	ptareaname, 
	pttername, 
	dpalevel)
select 
	zer.id,
	'fra',
	fraTest ,
	fraTestStatus ,
	fraBall100 ,
	fraBall12 ,
	fraBall ,
	fraPTName ,
	fraPTRegName ,
	fraPTAreaName ,
	fraPTTerName ,
	fraDPALevel 
from zno_results zr
join zno_enrollee_registration zer on zr.OUTID = zer.OUTID
where zr.fraTest is not null
;
INSERT INTO zno_enrollee_result
    (registration_id, 
	code_exam, 
	test, 
	teststatus, 
	ball100, 
	ball12, 
	ball, 
	ptname, 
	ptregname, 
	ptareaname, 
	pttername, 
	dpalevel)
select 
	zer.id,
	'deu',
	deuTest ,
	deuTestStatus ,
	deuBall100 ,
	deuBall12 ,
	deuBall ,
	deuPTName ,
	deuPTRegName ,
	deuPTAreaName ,
	deuPTTerName ,
	deuDPALevel 
from zno_results zr
join zno_enrollee_registration zer on zr.OUTID = zer.OUTID
where zr.deuTest is not null
;

INSERT INTO zno_enrollee_result
    (registration_id, 
	code_exam, 
	test, 
	teststatus, 
	ball100, 
	ball12, 
	ball, 
	ptname, 
	ptregname, 
	ptareaname, 
	pttername, 
	dpalevel)
select 
	zer.id,
	'spa',
	spaTest ,
	spaTestStatus ,
	spaBall100 ,
	spaBall12 ,
	spaBall ,
	spaPTName ,
	spaPTRegName ,
	spaPTAreaName ,
	spaPTTerName 
	spaDPALevel 
from zno_results zr
join zno_enrollee_registration zer on zr.OUTID = zer.OUTID
where zr.spaTest is not null
;

