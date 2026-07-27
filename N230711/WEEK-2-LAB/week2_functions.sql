show databases;
use gram_panchayath_db;
show tables;
select *from citizen;
select *from certificate_type;
select *from certificate_application;
select *from panchayat_office;
select upper(full_name) as UPPER_CASE from citizen ;
select lower(village_name) as lower_case from citizen;
UPDATE `gram_panchayath_db`.`certificate_type` SET `certificate_name` = 'No-Dues Certificate' WHERE (`certificate_type_id` = '6');
UPDATE `gram_panchayath_db`.`certificate_application` SET `certificate_name` = 'Birth Record Request' WHERE (`application_id` = '1006');
select length(full_name) as Length from citizen;
select substring(reference_number,1,4) as reference_number from certificate_application;
select concat(full_name,' - ',village_name) as full_name__village_name from citizen;
select replace(certificate_name,'Certificate','Cert .') from certificate_type;
select trim(certificate_name) as removing_spaces from certificate_type;
select left(full_name,instr(full_name,' ')) as first_name from citizen;
select concat('Citizen :',full_name ,"\n", 'Village :',village_name ) as details from citizen;
select *from certificate_application where left(reference_number,6)='GP2026' ;
select round(application_fees) as fees from certificate_type;
select abs(processing_days-10) as dispaly from certificate_type;
select sqrt(processing_days) as square_root from certificate_type;
select mod(processing_days,3) as diplay from certificate_type;
select round(application_fees,1) as dispaly from certificate_type;
select ceil(application_fees) as dispaly_ceiling ,floor(application_fees) as display_floor from certificate_type;
select rand()*100 as random_number;
select power(processing_days,2) as square from certificate_type;
select processing_days*2 as 2_multiple from certificate_type;
select curdate() as todays_date;
select current_date(),current_time()as date_time;
select year(application_date) as application_year from certificate_application;
select month(application_date) as application_month from certificate_application;
select day(application_date) as application_day from certificate_application;
/*SELECT 
    ca.appliction_id,
    ca.citizen_id,
    ca.certificate_name,
    ca.application_date,
    ct.processing_days,
    DATE_ADD(ca.application_date, INTERVAL ct.processing_days DAY) AS expected_issue_date
FROM 
    certificate_application ca
JOIN 
    certificate_type ct 
ON 
    ca.certificate_name = ct.certificate_name;*/
SELECT application_id, application_date, processing_days, DATE_ADD(application_date, INTERVAL processing_days DAY) AS expected_issue_date FROM certificate_application a,certificate_type c where a.certificate_name = c.certificate_name;
/*SELECT 
   a.application_id,
    a.certificate_name,
    a.application_date,
    (
        SELECT c.processing_days 
        FROM certificate_type c 
        WHERE c.certificate_name = a.certificate_name
    ) AS processing_days,
    DATE_ADD(
        a.application_date, 
        INTERVAL (
            SELECT c.processing_days 
            FROM certificate_type c 
            WHERE c.certificate_name = a.certificate_name
        ) DAY
    ) AS expected_issue_date
FROM certificate_application a;*/
select application_id , application_date , date_add(application_date ,interval 30 day) as adding_30days from certificate_application;
select application_id , application_date , date_add(application_date ,interval -7 day) as subtracting_7days from certificate_application;
select application_id, application_date, datediff(current_date(),application_date) as no_of_days from certificate_application;
UPDATE `gram_panchayath_db`.`certificate_application` SET `application_date` = '2026-07-04' WHERE (`application_id` = '1004');
select *from certificate_application where year(application_date)= year(current_date());
select convert(application_fees , signed ) as converted_int from certificate_type;
select cast(processing_days as char) as converted_char from certificate_type;
select convert(application_date,datetime) as converted_datetime from certificate_application;
select cast(processing_days as decimal) as converted_decimal from certificate_type;
select cast(application_fees as char)as converted_char from certificate_type;
select cast('12.3' as decimal)+23.6 as addition;