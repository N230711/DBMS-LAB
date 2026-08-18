#PART-A
use gram_panchayath_db;
show tables;
select *from Citizen;
select *from Certificate_type;
select *from Panchayat_office;
select *from Certificate_Application;
#PART-B
#LEVEL-1
#1
select count(application_id) as total_applications from Certificate_Application;
#2
select count(citizen_id) as total_citizens from Citizen;
#3
select count(distinct certificate_name) as distinct_certificate_types from Certificate_type;
#4
select min(application_date) as earliest_application_date from Certificate_Application;
#5
select max(application_date) as latest_application_date from Certificate_Application;
#LEVEL-2
#1
select application_status,count(*) as application_count from Certificate_Application group by application_status;
#2
select certificate_id,count(*) as application_count from certificate_application group by certificate_id;
#3
select office_id, count(*) as application_count from certificate_application group by office_id;
#4
select village_name , count(*) as citizens_count from citizen group by village_name;
#5
select application_date , count(*) as total_applications from certificate_application group by application_date;
#6
select certificate_id , office_id , count(*) as total_applications from certificate_application group by certificate_id, office_id;
#7
select ct.certificate_name , count(*) as total_applications from certificate_application ca join certificate_type ct on ca.certificate_id=ct.certificate_type_id group by ct.certificate_name;
#8
select po.office_name , count(*) as total_applications from certificate_application ca  join panchayat_office po on ca.office_id=po.office_id group by po.office_name;
#level_3
#1
select certificate_id, count(*) as total_applications from certificate_application group by certificate_id having count(*)>2;
#2
select office_id , count(*) as total_applications from certificate_application group by office_id having count(*)>2;
#3
select certificate_id , count(*) as total_applications from certificate_application group by certificate_id order by count(*) desc;
#4
select office_id, count(*) as total_application from certificate_application group by office_id order by count(*) asc;
#5
select certificate_id, count(*) as total_applications from certificate_application group by certificate_id having count(*)>2 order by count(*) desc;
#6
select certificate_id , office_id , count(*) as total_applications from certificate_application group by certificate_id,office_id order by count(*) desc limit 1;
#7
select application_status, count(*) as total_applications from certificate_application group by application_status order by count(*) desc limit 1;
#8
select application_status, count(*) as total_applications from certificate_application group by application_status order by count(*) asc limit 1;
#optional
#1
select ct.certificate_name , count(*) as total_applications from certificate_application ca join certificate_type ct on ca.certificate_id=ct.certificate_type_id group by ct.certificate_name order by count(*) desc limit 1;
#2
select po.office_name , count(*) as total_applications from certificate_application ca  join panchayat_office po on ca.office_id=po.office_id group by po.office_name order by count(*) desc limit 1;
#3
select application_status, count(*) as total_applications from certificate_application group by application_status order by count(*) desc limit 1;
#4
select ct.certificate_type_id, count(*) as total_applications from certificate_application ca join certificate_type ct on ca.certificate_id=ct.certificate_type_id group by ct.certificate_name having count(*)>2;
#5
select po.office_name, count(*) as total_applications from certificate_application ca join panchayat_office po on ca.office_id=po.office_id group by po.office_name having count(*)>2;
#6
select ct.certificate_name ,count(*) as total_applications ,min(ca.application_date) as earliest_application_date, max(ca.application_date) as latest_application_date from certificate_application ca join certificate_type ct on ca.certificate_id=ct.certificate_type_id group by ct.certificate_name;
#7
select po.office_name, count(*) as total_applications, count(distinct ca.certificate_id) as diiferent_certificate_types from certificate_application ca join panchayat_office po on ca.office_id=po.office_id group by po.office_name;

