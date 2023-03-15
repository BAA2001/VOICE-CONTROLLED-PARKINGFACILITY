use VOICE_CONTROLLED_PARKINGFACILITY;

delete from [SterkeWW];
delete from [ZwakkeWW];

insert into SterkeWW values
	('verlaten', 'verlaat', 'verlaat', 'verlaten', 'verliet', 'heeft', 'verlaten')
,	('gaan', 'ga', 'gaat', 'gegaan', 'ging', 'is uit', 'verlaten')
,	('aankomen', 'aankom', 'aankomt', 'aangekomen', 'aankwam', 'is', 'parkeren');

insert into ZwakkeWW values
	('parkeren', 'parkeer', 'heeft', 'parkeren')
,	('stallen', 'stal', 'heeft', 'parkeren');