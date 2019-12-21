use ART_GALLERY
go

set ANSI_NULLS on
go
set QUOTED_IDENTIFIER on
go

alter procedure insert_rows
	@nr_of_rows int,
	@t varchar(30)
as 
begin
	
	set NOCOUNT ON;

	--insert into Exhibitions(Eid,date_start,date_end) values(6,'2018-10-10','2019-10-10')

	--declare @nr_of_rows int 
	declare @n int 
	--declare @t varchar(30)

	--select top 1 @nr_of_rows = @nr_of_rows from TestTables  
	--set @nr_of_rows=8;
	set @n=1 

	declare @fk int 
	select top 1 @fk=Mid from Movements

	while @n<@nr_of_rows
	begin
		set @t ='Artist' + convert(varchar(10),@n)

		IF @t='Exhibitions'
		begin
			insert into Exhibitions(Eid,date_start,date_end) values (@n,'2018-10-10','2019-10-10')
		end

		if @t='Artists'
		begin
			insert into Artists(Aid,Mid,name,date_of_birth) values (@n, @fk, @t, '1987-10-10')
		end

		if @t='AE'
		begin
			insert into ArtistsExhibitions(Aid,Eid) values (@n,@n+1)
		end

		set @n=@n+1 
	end 

end

exec insert_rows