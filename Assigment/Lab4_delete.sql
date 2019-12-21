use ART_GALLERY
go

set ANSI_NULLS on
go
set QUOTED_IDENTIFIER on
go


create procedure delete_rows

	@nb_of_rows varchar(30),
	@table_name varchar(30)

as 
begin
	
	set NOCOUNT ON;

	--if ISNUMERIC(@nb_of_rows) !=1
	--begin 
	--	print("Not a number")
	--	return 1
	--end 

	set @nb_of_rows=cast(@nb_of_rows as INT)

	declare @last_row int 
	if @table_name = 'Exhibitions' 
		begin 
			set @last_row =(select MAX(Eid) from Exhibitions) - @nb_of_rows

			delete from Exhibitions
			where Eid>@last_row
		end

		if @table_name ='Artists'
		begin 
			set @last_row=(select MAX(Aid) from Artists) - @nb_of_rows
			delete from ArtistsExhibitions
			delete from Paintings
			delete from Artists
			where Aid>@last_row
		end 

		if @table_name = 'ArtistsExhibitions'
		begin 
			delete from ArtistsExhibitions
		end 
end 

exec delete_rows '3','Artists'
go
