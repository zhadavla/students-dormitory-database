-- smazání všech záznamů z tabulek

CREATE or replace FUNCTION clean_tables() RETURNS void AS $$
declare
  l_stmt text;
begin
  select 'truncate ' || string_agg(format('%I.%I', schemaname, tablename) , ',')
    into l_stmt
  from pg_tables
  where schemaname in ('public');

  execute l_stmt || ' cascade';
end;
$$ LANGUAGE plpgsql;
select clean_tables();

-- reset sekvenci

CREATE or replace FUNCTION restart_sequences() RETURNS void AS $$
DECLARE
i TEXT;
BEGIN
 FOR i IN (SELECT column_default FROM information_schema.columns WHERE column_default SIMILAR TO 'nextval%')
  LOOP
         EXECUTE 'ALTER SEQUENCE'||' ' || substring(substring(i from '''[a-z_]*')from '[a-z_]+') || ' '||' RESTART 1;';
  END LOOP;
END $$ LANGUAGE plpgsql;
select restart_sequences();
-- konec resetu

-- konec mazání
-- mohli bchom použít i jednotlivé příkazy truncate na každo tabulku


insert into student (id_student, email, first_name, last_name, phone_number) values (1, 'dbrasted0@cnn.com', 'Derwin', 'Brasted', '960-261-7546');
insert into student (id_student, email, first_name, last_name, phone_number) values (2, 'abrough1@geocities.com', 'Annelise', 'Brough', '144-684-3065');
insert into student (id_student, email, first_name, last_name, phone_number) values (3, 'gcaplen2@shinystat.com', 'Gloriane', 'Caplen', '294-342-5311');
insert into student (id_student, email, first_name, last_name, phone_number) values (4, 'cmacchaell3@imgur.com', 'Chelsae', 'MacChaell', '493-962-5331');
insert into student (id_student, email, first_name, last_name, phone_number) values (5, 'ltresise4@columbia.edu', 'Louis', 'Tresise', '756-859-7594');
insert into student (id_student, email, first_name, last_name, phone_number) values (6, 'kfrondt5@amazonaws.com', 'King', 'Frondt', '361-965-2968');
insert into student (id_student, email, first_name, last_name, phone_number) values (7, 'mlark6@dell.com', 'Mag', 'Lark', '419-267-5789');
insert into student (id_student, email, first_name, last_name, phone_number) values (8, 'atoop7@huffingtonpost.com', 'Alair', 'Toop', '405-456-2654');
insert into student (id_student, email, first_name, last_name, phone_number) values (9, 'cheppner8@baidu.com', 'Chelsie', 'Heppner', '425-751-8698');
insert into student (id_student, email, first_name, last_name, phone_number) values (10, 'wgumery9@wisc.edu', 'Worth', 'Gumery', '352-148-8668');
insert into student (id_student, email, first_name, last_name, phone_number) values (11, 'sshearsa@a8.net', 'Stella', 'Shears', '380-508-2788');
insert into student (id_student, email, first_name, last_name, phone_number) values (12, 'givachyovb@pagesperso-orange.fr', 'Granville', 'Ivachyov', '853-198-6442');
insert into student (id_student, email, first_name, last_name, phone_number) values (13, 'mpruec@vkontakte.ru', 'Magdalena', 'Prue', '189-667-7767');
insert into student (id_student, email, first_name, last_name, phone_number) values (14, 'ebiglandd@printfriendly.com', 'Eve', 'Bigland', '537-362-0690');
insert into student (id_student, email, first_name, last_name, phone_number) values (15, 'efrankline@sourceforge.net', 'Emmalee', 'Franklin', '317-885-4874');
insert into student (id_student, email, first_name, last_name, phone_number) values (16, 'fblatchfordf@mozilla.com', 'Franz', 'Blatchford', '219-114-9062');
insert into student (id_student, email, first_name, last_name, phone_number) values (17, 'kmcganng@hud.gov', 'Kelly', 'McGann', '362-246-8527');
insert into student (id_student, email, first_name, last_name, phone_number) values (18, 'aatterh@cpanel.net', 'Annabell', 'Atter', '581-582-2115');
insert into student (id_student, email, first_name, last_name, phone_number) values (19, 'sgolbyi@live.com', 'Stefano', 'Golby', '401-639-1033');
insert into student (id_student, email, first_name, last_name, phone_number) values (20, 'ccastagnetoj@pcworld.com', 'Catriona', 'Castagneto', '585-473-9055');
insert into student (id_student, email, first_name, last_name, phone_number) values (21, 'gridgek@wordpress.com', 'Gertrudis', 'Ridge', '859-660-8105');
insert into student (id_student, email, first_name, last_name, phone_number) values (22, 'ewarykl@alexa.com', 'Elliott', 'Waryk', '991-608-1835');
insert into student (id_student, email, first_name, last_name, phone_number) values (23, 'gbradmorem@psu.edu', 'Garvy', 'Bradmore', '992-245-9337');
insert into student (id_student, email, first_name, last_name, phone_number) values (24, 'cbonin@cnn.com', 'Cornelius', 'Boni', '607-921-9131');
insert into student (id_student, email, first_name, last_name, phone_number) values (25, 'ascaiceo@plala.or.jp', 'Aristotle', 'Scaice', '711-998-2241');
insert into student (id_student, email, first_name, last_name, phone_number) values (26, 'bsabbertonp@toplist.cz', 'Boote', 'Sabberton', '703-644-4639');
insert into student (id_student, email, first_name, last_name, phone_number) values (27, 'jleathardq@github.io', 'Jocelyne', 'Leathard', '638-842-7335');
insert into student (id_student, email, first_name, last_name, phone_number) values (28, 'sbaumr@seesaa.net', 'Sylas', 'Baum', '423-814-0333');
insert into student (id_student, email, first_name, last_name, phone_number) values (29, 'bbeddalls@gov.uk', 'Bebe', 'Beddall', '974-669-3843');
insert into student (id_student, email, first_name, last_name, phone_number) values (30, 'bmacnultyt@apple.com', 'Birk', 'MacNulty', '264-868-4945');
insert into student (id_student, email, first_name, last_name, phone_number) values (31, 'gabotsonu@archive.org', 'Georgia', 'Abotson', '596-230-0368');
insert into student (id_student, email, first_name, last_name, phone_number) values (32, 'ymanuelliv@google.com.au', 'Yoshiko', 'Manuelli', '190-416-4920');
insert into student (id_student, email, first_name, last_name, phone_number) values (33, 'spanasw@livejournal.com', 'Sheryl', 'Panas', '650-389-5466');
insert into student (id_student, email, first_name, last_name, phone_number) values (34, 'mtarttx@over-blog.com', 'Molli', 'Tartt', '842-801-4742');
insert into student (id_student, email, first_name, last_name, phone_number) values (35, 'rulyaty@imgur.com', 'Robena', 'Ulyat', '922-353-0222');
insert into student (id_student, email, first_name, last_name, phone_number) values (36, 'rsnelz@walmart.com', 'Rosella', 'Snel', '938-346-2963');
insert into student (id_student, email, first_name, last_name, phone_number) values (37, 'rdurning10@senate.gov', 'Rice', 'Durning', '216-995-8307');
insert into student (id_student, email, first_name, last_name, phone_number) values (38, 'bmulliner11@unblog.fr', 'Beverlie', 'Mulliner', '484-791-2318');
insert into student (id_student, email, first_name, last_name, phone_number) values (39, 'mwinslade12@wikispaces.com', 'Marchall', 'Winslade', '716-818-5306');
insert into student (id_student, email, first_name, last_name, phone_number) values (40, 'jrandalson13@tripod.com', 'Jordanna', 'Randalson', '714-355-3117');
insert into student (id_student, email, first_name, last_name, phone_number) values (41, 'btantum14@wikimedia.org', 'Brocky', 'Tantum', '821-462-4641');
insert into student (id_student, email, first_name, last_name, phone_number) values (42, 'ndesantos15@jugem.jp', 'Nance', 'De Santos', '944-919-6213');
insert into student (id_student, email, first_name, last_name, phone_number) values (43, 'dblundel16@stumbleupon.com', 'Danny', 'Blundel', '998-268-6663');
insert into student (id_student, email, first_name, last_name, phone_number) values (44, 'ccurnokk17@springer.com', 'Crista', 'Curnokk', '610-208-0384');
insert into student (id_student, email, first_name, last_name, phone_number) values (45, 'ashillitoe18@tuttocitta.it', 'Alissa', 'Shillitoe', '172-973-2699');
insert into student (id_student, email, first_name, last_name, phone_number) values (46, 'mandreacci19@deviantart.com', 'Molly', 'Andreacci', '397-904-4997');
insert into student (id_student, email, first_name, last_name, phone_number) values (47, 'mheineking1a@netscape.com', 'Moe', 'Heineking', '638-470-8538');
insert into student (id_student, email, first_name, last_name, phone_number) values (48, 'lmcsweeney1b@gizmodo.com', 'Lodovico', 'McSweeney', '316-583-0612');
insert into student (id_student, email, first_name, last_name, phone_number) values (49, 'dvasyutkin1c@altervista.org', 'Dorita', 'Vasyutkin', '121-522-7895');
insert into student (id_student, email, first_name, last_name, phone_number) values (50, 'glathwell1d@wufoo.com', 'Griswold', 'Lathwell', '745-427-0138');
select setval(pg_get_serial_sequence('student','id_student'),50);

insert into staff_type (id_type, type_name) values (1, 'Head of block');
insert into staff_type (id_type, type_name) values (2, 'Porter');
insert into staff_type (id_type, type_name) values (3, 'Cleaning lady');
insert into staff_type (id_type, type_name) values (4, 'Handyman');
select setval(pg_get_serial_sequence('staff_type','id_type'),4);


insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (1, 1, 'Cindelyn', 'Feehely', '650-172-5351', 138);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (2, 1, 'Georgena', 'Dellow', '780-629-5569', 134);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (3, 1, 'Leeanne', 'Giacoppo', '910-655-6037', 106);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (4, 1, 'Maure', 'Pugh', '352-476-5004', 112);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (5, 1, 'Florrie', 'Side', '823-262-0157', 119);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (6, 1, 'Joshuah', 'Littrik', '352-584-5718', 117);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (7, 1, 'Nicolette', 'Flips', '146-281-8610', 123);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (8, 1, 'Cletus', 'Chable', '901-195-3711', 101);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (9, 1, 'Haleigh', 'Rodenburgh', '922-984-9976', 144);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (10, 1, 'Brucie', 'Drewes', '832-989-5714', 102);

insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (11, 2, 'Krista', 'Ianni', '804-230-8265', 123);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (12, 2, 'Forster', 'Toffoletto', '890-165-3670', 117);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (13, 2, 'Ferne', 'Gallimore', '780-814-8899', 141);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (14, 2, 'Davy', 'Forri', '356-925-8516', 140);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (15, 2, 'Madge', 'Winchcomb', '764-554-6021', 144);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (16, 2, 'Corrinne', 'Kayne', '466-898-1328', 148);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (17, 2, 'Suellen', 'Kean', '772-779-9741', 142);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (18, 2, 'Klarrisa', 'Brafield', '315-509-0490', 129);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (19, 2, 'Nichole', 'McGrath', '524-567-6661', 134);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (20, 2, 'Jerrie', 'Siaspinski', '529-993-9163', 146);

insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (21, 3, 'Hagen', 'Wreford', '962-709-5407', 125);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (22, 3, 'Holmes', 'Blesing', '683-563-9674', 138);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (23, 3, 'Charlotte', 'Dorrance', '483-988-2956', 114);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (24, 3, 'Silas', 'Sawdon', '498-397-5404', 145);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (25, 3, 'Pamela', 'Noblett', '411-126-4906', 145);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (26, 3, 'Gillie', 'McDool', '511-847-5823', 134);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (27, 3, 'Siegfried', 'Camerati', '510-940-4406', 113);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (28, 3, 'Barnebas', 'Gofford', '987-431-1048', 119);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (29, 3, 'Lois', 'Shenfisch', '925-147-0741', 133);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (30, 3, 'Dene', 'Shipway', '198-329-9866', 113);

insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (31, 4, 'Dacey', 'Kneeshaw', '361-653-0833', 137);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (32, 4, 'Allison', 'Tinto', '726-144-1157', 146);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (33, 4, 'Bil', 'Czadla', '582-641-3403', 138);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (34, 4, 'Llewellyn', 'Emm', '172-400-5264', 140);
insert into staff_member (id_staff, id_type, first_name, last_name, phone_number, hourly_wage) values (35, 4, 'Anitra', 'Donnan', '882-853-3542', 115);

select setval(pg_get_serial_sequence('staff_member','id_staff'),35);

insert into head_of_block (id_staff, email, block_number, photo_url) values (1, 'abier0@last.fm', 9, 'http://dummyimage.com/180x100.png/5fa2dd/ffffff');
insert into head_of_block (id_staff, email, block_number, photo_url) values (2, 'kteers1@reddit.com', 1, 'http://dummyimage.com/138x100.png/5fa2dd/ffffff');
insert into head_of_block (id_staff, email, block_number, photo_url) values (3, 'lsenescall2@com.com', 7, null);
insert into head_of_block (id_staff, email, block_number, photo_url) values (4, 'rmacgebenay3@auda.org.au', 7, null);
insert into head_of_block (id_staff, email, block_number, photo_url) values (5, 'mlago4@360.cn', 9, null);
insert into head_of_block (id_staff, email, block_number, photo_url) values (6, 'pjunifer5@over-blog.com', 5, 'http://dummyimage.com/152x100.png/5fa2dd/ffffff');
insert into head_of_block (id_staff, email, block_number, photo_url) values (7, 'kdana6@drupal.org', 7, 'http://dummyimage.com/177x100.png/ff4444/ffffff');
insert into head_of_block (id_staff, email, block_number, photo_url) values (8, 'fkeaton7@360.cn', 1, 'http://dummyimage.com/100x100.png/5fa2dd/ffffff');
insert into head_of_block (id_staff, email, block_number, photo_url) values (9, 'fvanderstraaten8@stumbleupon.com', 7, 'http://dummyimage.com/125x100.png/cc0000/ffffff');
insert into head_of_block (id_staff, email, block_number, photo_url) values (10, 'ldanihelka9@friendfeed.com', 9, 'http://dummyimage.com/229x100.png/cc0000/ffffff');

insert into porter (id_staff, is_a_student) values (11, false);
insert into porter (id_staff, is_a_student) values (12, true);
insert into porter (id_staff, is_a_student) values (13, false);
insert into porter (id_staff, is_a_student) values (14, false);
insert into porter (id_staff, is_a_student) values (15, false);
insert into porter (id_staff, is_a_student) values (16, false);
insert into porter (id_staff, is_a_student) values (17, false);
insert into porter (id_staff, is_a_student) values (18, true);
insert into porter (id_staff, is_a_student) values (19, true);
insert into porter (id_staff, is_a_student) values (20, false);


insert into handyman (id_staff, role, certification) values (31, 'Carpenter', 'Associate Degree');
insert into handyman (id_staff, role, certification) values (32, 'Painter', 'High School');
insert into handyman (id_staff, role, certification) values (33, 'Plumber', 'High School');
insert into handyman (id_staff, role, certification) values (34, 'Electrician', 'Technical College');
insert into handyman (id_staff, role, certification) values (35, 'Painter', 'High School');

insert into service (id_service, id_porter, id_handyman, id_student, date, service_name, service_description) values (1, 19, NULl, 20, '2019-07-24', 'big kitchen', 'hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque');
insert into service (id_service, id_porter, id_handyman, id_student, date, service_name, service_description) values (2, NULL, 32, 3, '2022-10-27', 'toilet fix', 'penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis');
insert into service (id_service, id_porter, id_handyman, id_student, date, service_name, service_description) values (3, NULL, 33, 30, '2018-06-16', 'room service', 'diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non');
insert into service (id_service, id_porter, id_handyman, id_student, date, service_name, service_description) values (4, 14, NULL, 16, '2021-10-13', 'laundry', 'ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat');
insert into service (id_service, id_porter, id_handyman, id_student, date, service_name, service_description) values (42, 14, NULL, 18, '2022-10-13', 'laundry', 'ornare');
insert into service (id_service, id_porter, id_handyman, id_student, date, service_name, service_description) values (43, 14, NULL, 18, '2022-01-12', 'laundry', 'ornare');
insert into service (id_service, id_porter, id_handyman, id_student, date, service_name, service_description) values (5, 11, NULL, 20, '2021-02-06', 'gym', 'et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut');
insert into service (id_service, id_porter, id_handyman, id_student, date, service_name, service_description) values (6, NULL, 35, 49, '2019-07-12', 'room service', 'consequat in consequat ut nulla sed accumsan felis ut at dolor quis');
insert into service (id_service, id_porter, id_handyman, id_student, date, service_name, service_description) values (7, 11, NULL, 41, '2022-10-27', 'study room', 'nunc donec quis orci eget orci vehicula condimentum curabitur in');
insert into service (id_service, id_porter, id_handyman, id_student, date, service_name, service_description) values (8, 15, NULL, 38, '2017-04-03', 'common room', 'dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum');



insert into room (room_number, block_number, contain_bed_bugs) values (241, 3, true);
insert into room (room_number, block_number, contain_bed_bugs) values (40, 7, true);
insert into room (room_number, block_number, contain_bed_bugs) values (358, 3, false);
insert into room (room_number, block_number, contain_bed_bugs) values (428, 8, true);
insert into room (room_number, block_number, contain_bed_bugs) values (13, 2, true);
insert into room (room_number, block_number, contain_bed_bugs) values (204, 4, true);
insert into room (room_number, block_number, contain_bed_bugs) values (455, 4, true);
insert into room (room_number, block_number, contain_bed_bugs) values (496, 8, true);
insert into room (room_number, block_number, contain_bed_bugs) values (386, 10, false);
insert into room (room_number, block_number, contain_bed_bugs) values (210, 2, true);
insert into room (room_number, block_number, contain_bed_bugs) values (31, 7, false);
insert into room (room_number, block_number, contain_bed_bugs) values (290, 8, false);
insert into room (room_number, block_number, contain_bed_bugs) values (14, 10, true);
insert into room (room_number, block_number, contain_bed_bugs) values (450, 10, true);
insert into room (room_number, block_number, contain_bed_bugs) values (256, 6, true);
insert into room (room_number, block_number, contain_bed_bugs) values (352, 1, false);
insert into room (room_number, block_number, contain_bed_bugs) values (426, 8, true);


insert into mass_disinfection (id_disinfection, price, date) values (1, 1379854556, '2010-01-16');
insert into mass_disinfection (id_disinfection, price, date) values (2, 146188612, '2007-07-28');
insert into mass_disinfection (id_disinfection, price, date) values (3, 889617091, '2007-07-31');
insert into mass_disinfection (id_disinfection, price, date) values (4, 1352255449, '2013-04-21');
insert into mass_disinfection (id_disinfection, price, date) values (5, 302021745, '2018-09-06');
insert into mass_disinfection (id_disinfection, price, date) values (6, 1075984023, '2014-04-20');
insert into mass_disinfection (id_disinfection, price, date) values (7, 191957011, '2018-12-13');
insert into mass_disinfection (id_disinfection, price, date) values (8, 895430871, '2020-08-26');
insert into mass_disinfection (id_disinfection, price, date) values (9, 294860816, '2008-06-09');
insert into mass_disinfection (id_disinfection, price, date) values (10, 1526797370, '2000-11-30');
select setval(pg_get_serial_sequence('mass_disinfection','id_disinfection'),10);


insert into silicon_hill_club_membership (id_membership, id_student, membership_type, start_date, end_date) values (1, 9, 'Regular', '8/15/2008', '11/16/2013');
insert into silicon_hill_club_membership (id_membership, id_student, membership_type, start_date, end_date) values (2, 22, 'Regular', '7/2/2022', '3/27/2023');
insert into silicon_hill_club_membership (id_membership, id_student, membership_type, start_date, end_date) values (3, 42, 'VIP', '9/10/2020', '5/24/2022');
insert into silicon_hill_club_membership (id_membership, id_student, membership_type, start_date, end_date) values (4, 27, 'Premium', '5/23/2022', '6/21/2023');
insert into silicon_hill_club_membership (id_membership, id_student, membership_type, start_date, end_date) values (5, 7, 'VIP', '9/13/2020', '6/9/2022');
insert into silicon_hill_club_membership (id_membership, id_student, membership_type, start_date, end_date) values (6, 35, 'VIP', '10/1/2021', '3/20/2022');
insert into silicon_hill_club_membership (id_membership, id_student, membership_type, start_date, end_date) values (7, 46, 'Regular', '5/9/2020', '12/8/2021');
insert into silicon_hill_club_membership (id_membership, id_student, membership_type, start_date, end_date) values (8, 43, 'Premium', '1/31/2020', '2/27/2023');
insert into silicon_hill_club_membership (id_membership, id_student, membership_type, start_date, end_date) values (9, 28, 'VIP', '6/19/2020', '7/15/2023');
insert into silicon_hill_club_membership (id_membership, id_student, membership_type, start_date, end_date) values (10, 36, 'VIP', '7/11/2018', '10/11/2021');
insert into silicon_hill_club_membership (id_membership, id_student, membership_type, start_date, end_date) values (11, 12, 'Premium', '8/6/2022', '7/31/2025');
insert into silicon_hill_club_membership (id_membership, id_student, membership_type, start_date, end_date) values (12, 43, 'VIP', '8/29/2022', '6/13/2023');
insert into silicon_hill_club_membership (id_membership, id_student, membership_type, start_date, end_date) values (13, 40, 'Regular', '3/12/2021', '7/12/2023');
insert into silicon_hill_club_membership (id_membership, id_student, membership_type, start_date, end_date) values (14, 23, 'Admin', '3/12/2019', '7/12/2023');
insert into silicon_hill_club_membership (id_membership, id_student, membership_type, start_date, end_date) values (15, 26, 'Admin', '3/12/2020', '7/12/2022');
select setval(pg_get_serial_sequence('silicon_hill_club_membership','id_membership'),15);



INSERT INTO rent_agreement (id_agreement, id_staff, room_number, block_number, id_student, start_date, rent_amount, end_date) 
VALUES (2, 1, 40, 7, 24, '8/15/2018', 3097, '8/15/2023'), 
       (4, 3, 358, 3, 20, '3/12/2020', 3282, '2038-05-15'), 
       (15, 3, 358, 3, 23, '3/12/2010', 3282, '2038-05-15'), 
       (5, 3, 13, 2, 38, '2013-03-06', 4968, '2015-02-15'), 
       (6, 2, 290, 8, 19, '2018-09-01', 2958, '2019-02-02'), 
       (7, 2, 14, 10, 49, '2019-01-17', 4314, '2020-11-06'), 
       (8, 7, 450, 10, 47, '2022-03-20', 3009, '2023-06-25'), 
       (9, 9, 256, 6, 40, '2020-07-27', 4893, '2025-06-08'), 
       (10, 9, 352, 1, 39, '2019-06-18', 4717, '2020-04-19'), 
       (11, 1, 426, 8, 19, '2021-06-30', 4359, '2022-11-04'),
        (31, 1, 40, 7, 24, '8/15/2018', 3097, '8/15/2023'), 
        (32, 2, 40, 7, 24, '8/15/2018', 3097, '8/15/2023'), 
        (33, 3, 40, 7, 24, '8/15/2018', 3097, '8/15/2023'), 
        (34, 4, 40, 7, 24, '8/15/2018', 3097, '8/15/2023'), 
        (35, 5, 40, 7, 24, '8/15/2018', 3097, '8/15/2023'), 
        (36, 6, 40, 7, 24, '8/15/2018', 3097, '8/15/2023'), 
        (37, 7, 40, 7, 24, '8/15/2018', 3097, '8/15/2023'), 
        (38, 8, 40, 7, 24, '8/15/2018', 3097, '8/15/2023'), 
        (39, 9, 40, 7, 24, '8/15/2018', 3097, '8/15/2023'), 
        (40, 10, 40, 7, 24, '8/15/2018', 3097, '8/15/2023');
select setval(pg_get_serial_sequence('rent_agreement','id_agreement'),40);


       
insert into room_mass_disinfection (id_disinfection, room_number, block_number) values (1, 241, 3);
insert into room_mass_disinfection (id_disinfection, room_number, block_number) values (2, 40, 7);
insert into room_mass_disinfection (id_disinfection, room_number, block_number) values (3, 386, 10);
insert into room_mass_disinfection (id_disinfection, room_number, block_number) values (4, 14, 10);
insert into room_mass_disinfection (id_disinfection, room_number, block_number) values (5, 450, 10);
insert into room_mass_disinfection (id_disinfection, room_number, block_number) values (8, 256, 6);



