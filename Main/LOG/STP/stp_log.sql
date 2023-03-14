use [LOG]
go

create or alter procedure
	stp_log
		@process_name varchar(100),
		@username varchar(20),
		@contents varchar(500)
as
	insert into log_message (process_name, username, contents) values (@process_name, @username, @contents)
go