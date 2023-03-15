use VOICE_CONTROLLED_PARKINGFACILITY;
delete from TRANSACTIE_GESCHIEDENIS
delete from [CHECK-IN_OUT];
delete from [PARKEERLOCATIE]
delete from [AUTO];
delete from BESTUURDER;
delete from UURPRIJS;

insert into bestuurder (naam) values ('Clementine');
insert into bestuurder (naam) values ('Pasquale');
insert into bestuurder (naam) values ('Judye');
insert into bestuurder (naam) values ('Olwen');
insert into bestuurder (naam) values ('Teressa');
insert into bestuurder (naam) values ('Ahmad');
insert into bestuurder (naam) values ('Clayson');
insert into bestuurder (naam) values ('Shirlee');
insert into bestuurder (naam) values ('Freedman');
insert into bestuurder (naam) values ('Emmalynne');
insert into bestuurder (naam) values ('Jamima');
insert into bestuurder (naam) values ('Reinald');
insert into bestuurder (naam) values ('Mady');
insert into bestuurder (naam) values ('Jose');
insert into bestuurder (naam) values ('Kippy');
insert into bestuurder (naam) values ('Emlyn');
insert into bestuurder (naam) values ('Kalila');
insert into bestuurder (naam) values ('Helaine');
insert into bestuurder (naam) values ('Chanda');
insert into bestuurder (naam) values ('Mason');
insert into bestuurder (naam) values ('Jacquette');
insert into bestuurder (naam) values ('Ely');
insert into bestuurder (naam) values ('Bettye');
insert into bestuurder (naam) values ('Rae');
insert into bestuurder (naam) values ('Dulce');
insert into bestuurder (naam) values ('Denny');
insert into bestuurder (naam) values ('Adelaida');
insert into bestuurder (naam) values ('Sig');
insert into bestuurder (naam) values ('Isabelita');
insert into bestuurder (naam) values ('Hans');
insert into bestuurder (naam) values ('Farly');
insert into bestuurder (naam) values ('Melodie');
insert into bestuurder (naam) values ('Sonny');
insert into bestuurder (naam) values ('Moira');
insert into bestuurder (naam) values ('Collette');
insert into bestuurder (naam) values ('Bernie');
insert into bestuurder (naam) values ('Alonso');
insert into bestuurder (naam) values ('Garrik');
insert into bestuurder (naam) values ('Dewey');
insert into bestuurder (naam) values ('Chalmers');
insert into bestuurder (naam) values ('Talyah');
insert into bestuurder (naam) values ('Stillmann');
insert into bestuurder (naam) values ('Benni');
insert into bestuurder (naam) values ('Tierney');
insert into bestuurder (naam) values ('Muire');
insert into bestuurder (naam) values ('Carilyn');
insert into bestuurder (naam) values ('Paulo');
insert into bestuurder (naam) values ('Tirrell');
insert into bestuurder (naam) values ('Gaspar');
insert into bestuurder (naam) values ('Beckie');

create table temp_licenceplate
(
	id int identity,
	plate varchar(4)
);

insert into temp_licenceplate (plate) values ('me43');
insert into temp_licenceplate (plate) values ('ja14');
insert into temp_licenceplate (plate) values ('th97');
insert into temp_licenceplate (plate) values ('dn06');
insert into temp_licenceplate (plate) values ('nc03');
insert into temp_licenceplate (plate) values ('mi31');
insert into temp_licenceplate (plate) values ('aa13');
insert into temp_licenceplate (plate) values ('ws11');
insert into temp_licenceplate (plate) values ('ox93');
insert into temp_licenceplate (plate) values ('hr10');
insert into temp_licenceplate (plate) values ('ud48');
insert into temp_licenceplate (plate) values ('ep31');
insert into temp_licenceplate (plate) values ('kj71');
insert into temp_licenceplate (plate) values ('pr15');
insert into temp_licenceplate (plate) values ('la28');
insert into temp_licenceplate (plate) values ('pe44');
insert into temp_licenceplate (plate) values ('xg74');
insert into temp_licenceplate (plate) values ('ta81');
insert into temp_licenceplate (plate) values ('gj89');
insert into temp_licenceplate (plate) values ('rm08');
insert into temp_licenceplate (plate) values ('kt67');
insert into temp_licenceplate (plate) values ('wh50');
insert into temp_licenceplate (plate) values ('ic67');
insert into temp_licenceplate (plate) values ('ah15');
insert into temp_licenceplate (plate) values ('em80');
insert into temp_licenceplate (plate) values ('xq37');
insert into temp_licenceplate (plate) values ('ks68');
insert into temp_licenceplate (plate) values ('sv57');
insert into temp_licenceplate (plate) values ('ls05');
insert into temp_licenceplate (plate) values ('ro40');
insert into temp_licenceplate (plate) values ('ak78');
insert into temp_licenceplate (plate) values ('ei67');
insert into temp_licenceplate (plate) values ('sm22');
insert into temp_licenceplate (plate) values ('gc98');
insert into temp_licenceplate (plate) values ('ic41');
insert into temp_licenceplate (plate) values ('co85');
insert into temp_licenceplate (plate) values ('nz25');
insert into temp_licenceplate (plate) values ('ks43');
insert into temp_licenceplate (plate) values ('tp91');
insert into temp_licenceplate (plate) values ('sm85');
insert into temp_licenceplate (plate) values ('ky00');
insert into temp_licenceplate (plate) values ('su53');
insert into temp_licenceplate (plate) values ('ck48');
insert into temp_licenceplate (plate) values ('nf41');
insert into temp_licenceplate (plate) values ('qk96');
insert into temp_licenceplate (plate) values ('up29');
insert into temp_licenceplate (plate) values ('dp49');
insert into temp_licenceplate (plate) values ('do28');
insert into temp_licenceplate (plate) values ('lz93');
insert into temp_licenceplate (plate) values ('xn74');
insert into temp_licenceplate (plate) values ('ly09');
insert into temp_licenceplate (plate) values ('ly07');
insert into temp_licenceplate (plate) values ('rv39');
insert into temp_licenceplate (plate) values ('pj36');
insert into temp_licenceplate (plate) values ('ui55');
insert into temp_licenceplate (plate) values ('tj79');
insert into temp_licenceplate (plate) values ('ct41');
insert into temp_licenceplate (plate) values ('im02');
insert into temp_licenceplate (plate) values ('uc51');
insert into temp_licenceplate (plate) values ('yd55');
insert into temp_licenceplate (plate) values ('sh50');
insert into temp_licenceplate (plate) values ('zg56');
insert into temp_licenceplate (plate) values ('zt23');
insert into temp_licenceplate (plate) values ('vt49');
insert into temp_licenceplate (plate) values ('kb92');
insert into temp_licenceplate (plate) values ('va14');
insert into temp_licenceplate (plate) values ('ay88');
insert into temp_licenceplate (plate) values ('ay32');
insert into temp_licenceplate (plate) values ('wa21');
insert into temp_licenceplate (plate) values ('ns42');
insert into temp_licenceplate (plate) values ('qk57');
insert into temp_licenceplate (plate) values ('hd89');
insert into temp_licenceplate (plate) values ('ci37');
insert into temp_licenceplate (plate) values ('le23');
insert into temp_licenceplate (plate) values ('bj42');
insert into temp_licenceplate (plate) values ('wi22');
insert into temp_licenceplate (plate) values ('ic80');
insert into temp_licenceplate (plate) values ('az45');
insert into temp_licenceplate (plate) values ('kl26');
insert into temp_licenceplate (plate) values ('ko16');
insert into temp_licenceplate (plate) values ('gf86');
insert into temp_licenceplate (plate) values ('bu57');
insert into temp_licenceplate (plate) values ('sx74');
insert into temp_licenceplate (plate) values ('ra38');
insert into temp_licenceplate (plate) values ('hp22');
insert into temp_licenceplate (plate) values ('yp55');
insert into temp_licenceplate (plate) values ('ds94');
insert into temp_licenceplate (plate) values ('fw64');
insert into temp_licenceplate (plate) values ('tf79');
insert into temp_licenceplate (plate) values ('xa83');
insert into temp_licenceplate (plate) values ('dw17');
insert into temp_licenceplate (plate) values ('lc05');
insert into temp_licenceplate (plate) values ('vl75');
insert into temp_licenceplate (plate) values ('bs83');
insert into temp_licenceplate (plate) values ('ak89');
insert into temp_licenceplate (plate) values ('jv99');
insert into temp_licenceplate (plate) values ('hw17');
insert into temp_licenceplate (plate) values ('wo47');
insert into temp_licenceplate (plate) values ('uc62');
insert into temp_licenceplate (plate) values ('yo95');

insert into [AUTO]
select t.plate, t2.naam
from (select plate, row_number() over (order by newid()) as seqnum
      from temp_licenceplate
     ) as t join
     (select naam, row_number() over (order by newid()) as seqnum
      from BESTUURDER
     ) as t2
     on (t.seqnum % 50) = t2.seqnum;

drop table temp_licenceplate;

insert into PARKEERLOCATIE (ParkeerSpot, FK_Kenteken)
values	('A1', null), ('A2', null), ('A3', null), ('A4', null), ('A5', null),
		('B1', null), ('B2', null), ('B3', null), ('B4', null), ('B5', null),
		('C1', null), ('C2', null), ('C3', null), ('C4', null), ('C5', null)
;

insert into uurprijs
values (1.50);

set identity_insert [check-in_out] ON;

declare @iteration int = 1
declare @random float

while @iteration <= 100
begin
	exec stp_fill_history @iteration;
	set @iteration = @iteration + 1;
end

set identity_insert [check-in_out] OFF;

select * from [AUTO] order by FK_Naam