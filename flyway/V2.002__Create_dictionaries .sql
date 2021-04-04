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
