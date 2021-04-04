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

