use ART_GALLERY
go

	delete from Tables
	delete from Views

	insert into dbo.Tables values ( 'ArtistsExhibitions')
	insert into dbo.Tables values ( 'Exhibitions')
	insert into dbo.Tables values ( 'Artists')
	insert into dbo.Views values ( 'View_1')
	insert into dbo.Views values ( 'View_2')
	insert into dbo.Views values ( 'View_3')

alter procedure mainTest

	@nb_of_rows varchar(30)

as 
begin

	set NOCOUNT on;

	declare @all_start datetime
	set @all_start=GETDATE();

	declare @artists_delete_start datetime
	set @artists_delete_start = GETDATE()
	execute delete_rows @nb_of_rows, 'Artists'
	declare @artists_delete_end datetime
	set @artists_delete_end = GETDATE()

	declare @exhibitions_delete_start datetime
	set @exhibitions_delete_start = GETDATE()
	execute delete_rows @nb_of_rows, 'exhibitions'
	declare @exhibitions_delete_end datetime
	set @exhibitions_delete_end = GETDATE()

	declare @ae_delete_start datetime
	set @ae_delete_start = GETDATE()
	execute delete_rows @nb_of_rows, 'ArtistsExhibitions'
	declare @ae_delete_end datetime
	set @ae_delete_end = GETDATE()


	declare @ae_insert_start datetime
	set @ae_insert_start = GETDATE()
	execute insert_rows @nb_of_rows, 'AE'
	declare @ae_insert_end datetime
	set @ae_insert_end = GETDATE()

	declare @exhibitions_insert_start datetime
	set @exhibitions_insert_start = GETDATE()
	execute insert_rows @nb_of_rows, 'exhibitions'
	declare @exhibitions_insert_end datetime
	set @exhibitions_insert_end = GETDATE()

	declare @artists_insert_start datetime
	set @artists_insert_start = GETDATE()
	execute insert_rows @nb_of_rows, 'Artists'
	declare @artists_insert_end datetime
	set @artists_insert_end = GETDATE()

	declare @view_1_start datetime
	set @view_1_start = GETDATE()
	execute select_view 'View_1'
	declare @view_1_end datetime
	set @view_1_end = GETDATE()

	declare @view_2_start datetime
	set @view_2_start = GETDATE()
	execute select_view 'View_2'
	declare @view_2_end datetime
	set @view_2_end = GETDATE()

	declare @view_3_start datetime
	set @view_3_start = GETDATE()
	execute select_view 'View_3'
	declare @view_3_end datetime
	set @view_3_end = GETDATE()

	declare @all_stop datetime 
	set @all_stop = getdate() 

	declare @description varchar(100)
	set @description = 'TestRun' + convert(varchar(7), (select max(TestRunID) from TestRuns)) + 'delete, insert' + @nb_of_rows + 'rows, select all views'

	
	--insert into dbo.Tables values ( 'ArtistsExhibitions')
	--insert into dbo.Tables values ( 'Exhibitions')
	--insert into dbo.Tables values ( 'Artists')
	--insert into dbo.Views values ( 'View_1')
	--insert into dbo.Views values ( 'View_2')
	--insert into dbo.Views values ( 'View_3')


	insert into TestRuns(Description, StartAt, EndAt)
	values(@description, @all_start, @all_stop);

	declare @lastTestRunID int; 
	set @lastTestRunID = (select max(TestRunID) from TestRuns);

	insert into TestRunTables
	values(@lastTestRunID, 7, @exhibitions_delete_start, @exhibitions_insert_end)

	insert into TestRunTables
	values(@lastTestRunID, 8, @artists_delete_start, @artists_insert_end)

	insert into TestRunTables
	values(@lastTestRunID, 9, @ae_delete_start, @ae_insert_end)

	insert into TestRunViews
	values(@lastTestRunID, 7, @view_1_start, @view_1_end)
	
	insert into TestRunViews
	values(@lastTestRunID, 8, @view_2_start, @view_2_end)

	insert into TestRunViews
	values(@lastTestRunID,9, @view_3_start, @view_3_end)



end

exec mainTest '150'

Select*
from TestRuns

Select*
from TestRunTables

Select*
from TestRunViews