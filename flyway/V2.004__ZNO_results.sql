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

