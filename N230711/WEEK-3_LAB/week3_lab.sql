#part_a
use gram_panchayath_db;
show tables;
select *from citizen;
select *from certificate_type;
select *from certificate_application;
select *from panchayat_office;
#part_b
#1
alter table certificate_application drop certificate_name;
#2
alter table certificate_application add certificate_id int , add office_id int ;
#3
update certificate_application ca , certificate_type ct set ca.certificate_id = ct.certificate_type_id where ca.certificate_name = ct.certificate_name;
update certificate_application ca , panchayat_office po , citizen c set ca.office_id = po.office_id where c.village_name = po.village_name and ca.citizen_id=c.citizen_id;
#4
alter table certificate_application add constraint fk_citizen foreign key(citizen_id) references citizen(citizen_id), add constraint fk_certificate foreign key(certificate_id) references certificate_type(certificate_type_id), add constraint fk_office foreign key(office_id) references panchayat_office(office_id);
#5
describe certificate_application;
#6
insert into certificate_application(application_id, citizen_id, application_date, purpose,application_status, fee_paid, reference_number,certificate_id, office_id) values (2001, 999, '2026-08-03', 'Test','Pending', 30, 'GP20269999',1, 1);
insert into certificate_application(application_id, citizen_id, application_date, purpose,application_status, fee_paid, reference_number,certificate_id, office_id) values (2001, 101, '2026-08-03', 'Test','Pending', 30, 'GP20269999',999, 1);
delete from citizen where (citizen_id=101);
delete from certificate_type where (certificate_type_id=1);
#part_c
#level-0
select *from citizen;
select *from certificate_application;
select full_name from citizen order by full_name asc;
select distinct village_name from citizen;
select distinct certificate_name from certificate_type;
select distinct ct.certificate_name from certificate_type ct join certificate_application ca on ct.certificate_type_id=ca.certificate_id;
select distinct office_name from panchayat_office;
select *from certificate_application where (application_status='Pending');
select *from citizen where village_name='Ramapuram';
select *from certificate_application where year(application_date)=2026;
select *from certificate_application order by application_date desc;
select *from certificate_application ca join panchayat_office po on  ca.office_id=po.office_id where po.office_name='Nuzvid Panchayat office';
select c.full_name from citizen c join certificate_application ca on c.citizen_id=ca.citizen_id join certificate_type ct on ca.certificate_id=ct.certificate_type_id where ct.certificate_name='Income Certificate';
#level-1
select c.full_name from citizen c join certificate_application ca on c.citizen_id=ca.citizen_id join certificate_type ct on ca.certificate_id=ct.certificate_type_id where ct.certificate_name='Income Certificate' union select c.full_name from citizen c join certificate_application ca on c.citizen_id=ca.citizen_id join certificate_type ct on ca.certificate_id=ct.certificate_type_id where ct.certificate_name='Residence Certificate';
select *from certificate_application where month(application_date)=1 union select *from certificate_application where month(application_date)=2;
select *from citizen where village_name='Ramapuram' union select *from citizen where village_name='Lakshmipuram';
select c.full_name from citizen c join certificate_application ca on c.citizen_id=ca.citizen_id join certificate_type ct on ca.certificate_id=ct.certificate_type_id where ct.certificate_name='Income Certificate' and c.citizen_id in  (select ca2.citizen_id from certificate_application ca2 join certificate_type ct2 on ca2.certificate_id=ct2.certificate_type_id where ct2.certificate_name='Residence Certifictae');
select distinct citizen_id from certificate_application where year(application_date)=2025 and citizen_id in( select citizen_id from certificate_application where year(application_date)=2026);
select c.full_name from citizen c join certificate_application ca on c.citizen_id=ca.citizen_id join certificate_type ct on ca.certificate_id=ct.certificate_type_id where ct.certificate_name='Income Certifiacte'and c.citizen_id not in (select ca2.citizen_id from certificate_application ca2 join certificate_type ct2 on ca2.certificate_id=ct2.certificate_type_id where ct2.certificate_name='Residence Certificate');
select distinct citizen_id from certificate_application where year(application_date)=2026 and citizen_id not in( select citizen_id from certificate_application where year(application_date)=2025);
insert into certificate_application(application_id, citizen_id, application_date, purpose, application_status, fee_paid, reference_number, issued_date, certificate_id, office_id) values (3001,999,'2026-08-04','testing','submitted',30.00,'GP20263001',null,1,1);
delete from citizen where citizen_id=101;
#level-2
select full_name from citizen where citizen_id in( select citizen_id from certificate_application);
select full_name from citizen where village_name in ( select po.village_name from certificate_application ca join panchayat_office po on ca.office_id=po.office_id join certificate_type ct on ca.certificate_id=ct.certificate_type_id where ct.certificate_name='Income Certificate');
select full_name from citizen where citizen_id not in ( select citizen_id from certificate_application);
select office_name from panchayat_office where office_id not in (select distinct office_id from certificate_application);
select full_name from citizen c where exists ( select *from certificate_application ca where ca.citizen_id=c.citizen_id);
select certificate_name from certificate_type ct where exists (select *from certificate_application ca where ca.certificate_id=ct.certificate_type_id);
select full_name from citizen c where not exists (select *from certificate_application ca where ca.citizen_id=c.citizen_id);
select certificate_name from certificate_type ct where not exists ( select *from certificate_application ca where ca.certificate_id=ct.certificate_type_id);
select full_name from  citizen where timestampdiff(year,date_of_birth,curdate()) > any (select timestampdiff(year , date_of_birth,curdate()) from citizen where village_name='Ramapuram'); 
select ca.application_id , ct.processing_days from certificate_application ca join certificate_type ct on ca.certificate_id=ct.certificate_type_id where ct.processing_days>any(select ct2.processing_days from certificate_application ca2 join certificate_type ct2 on ca2.certificate_id=ct2.certificate_type_id join panchayat_office po on ca2.office_id=po.office_id where po.office_name='Nuzvid Panchayat Office');
#mini_challenge
select c.citizen_id







