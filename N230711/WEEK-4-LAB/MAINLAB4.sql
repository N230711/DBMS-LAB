use gram_panchayat_db;
show tables;
select * from citizen;
select * from certificate_type;
select * from certificate_application;
select * from panchayat_office;

#LEVEL 1
#1
select full_name as Name, ct.certificate_name from citizen c inner join certificate_application ca on c.citizen_id = ca.citizen_id inner join certificate_type ct on ca.certificate_id = ct.certificate_type_id;
#2
select full_name as Name, po.office_name from citizen c inner join certificate_application ca on c.citizen_id = ca.citizen_id inner join panchayat_office po on ca.office_id = po.office_id;
#3
select ca.application_id as 'Application ID' , full_name as Name, ca.application_status as 'Application Status' from citizen c inner join certificate_application ca on c.citizen_id = ca.citizen_id;
#4
select full_name as 'Citizen Name', ct.certificate_name, ca.application_date as 'Application Date' from citizen c inner join certificate_application ca on c.citizen_id = ca.citizen_id inner join certificate_type ct on ca.certificate_id = ct.certificate_type_id;
#5
select full_name as 'Citizen Name', ct.certificate_name, po.office_name as "Panchayat Office", ca.application_status 'Application Status' from citizen c inner join certificate_application ca on c.citizen_id = ca.citizen_id inner join certificate_type ct on ca.certificate_id = ct.certificate_type_id inner join panchayat_office po on ca.office_id = po.office_id;

# Level 2 – Application
#6
select full_name as 'Citizen Name', ct.certificate_name , ca.application_id, po.office_name as "Panchayat Office" from citizen c inner join certificate_application ca on c.citizen_id = ca.citizen_id inner join certificate_type ct on ca.certificate_id = ct.certificate_type_id inner join panchayat_office po on ca.office_id = po.office_id where ct.certificate_name = 'Income certificate' ;
#7
select full_name as 'Citizen Name' , ca.application_id as 'Application ID',ct.certificate_name , po.office_name as "Panchayat Office" from citizen c inner join certificate_application ca on c.citizen_id = ca.citizen_id inner join certificate_type ct on ca.certificate_id = ct.certificate_type_id inner join panchayat_office po on ca.office_id = po.office_id where po.village_name = "Nuzvid";
#8
select ca.application_id as 'Application ID', ca.certificate_name ,ct.description as 'Description', ca.application_status from certificate_application ca join certificate_type ct on ca.certificate_id = ct.certificate_type_id;
#9
select full_name as 'Citizen Name', ct.certificate_name as 'Certificate Type', po.office_name as "Panchayat Office", ca.application_date 'Application Date' from citizen c inner join certificate_application ca on c.citizen_id = ca.citizen_id inner join certificate_type ct on ca.certificate_id = ct.certificate_type_id inner join panchayat_office po on ca.office_id = po.office_id;
#10
select distinct po.office_name as "Panchayat Office", ct.certificate_name as 'Certificate Type', ca.application_date 'Application Date', full_name as 'Citizen Name' , c.village_name as 'Village Name' from citizen c inner join certificate_application ca on c.citizen_id = ca.citizen_id inner join certificate_type ct on ca.certificate_id = ct.certificate_type_id inner join panchayat_office po on ca.office_id = po.office_id;

# LEVEL 3
#11
select full_name as Name, ca.application_id from citizen c left join certificate_application ca on c.citizen_id = ca.citizen_id ;
#12
select full_name as Name,ca.application_id, ct.certificate_name from citizen c right join certificate_application ca on c.citizen_id = ca.citizen_id right join certificate_type ct on ca.certificate_id = ct.certificate_type_id;
#13
select full_name as Name,ca.application_id from citizen c right join certificate_application ca on c.citizen_id = ca.citizen_id union select full_name as Name,ca.application_id from citizen c left join certificate_application ca on c.citizen_id = ca.citizen_id;
#14
select full_name as 'Citizen' , ct.certificate_name as 'Certificate_Type' from citizen join certificate_type ct;
#15
select c1.full_name , c1.village_name from citizen c1 join citizen c2 on c1.citizen_id = c2.citizen_id ;