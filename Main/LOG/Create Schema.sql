use [LOG];

if exists( select 1 from INFORMATION_SCHEMA.TABLES where table_name = 'log_message' )
	drop table log_message;

create table log_message
(
	log_id int identity primary key,
	logged_at datetime default current_timestamp,
	process_name varchar(100),
	username varchar(20),
	contents varchar(500)
)