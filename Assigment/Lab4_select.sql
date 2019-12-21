USE ART_GALLERY
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE select_view
	@view_name varchar(30)
AS
BEGIN

	SET NOCOUNT ON;

 
	if @view_name = 'View_1'
	begin
		select * from View_1
	end

	if @view_name = 'View_2'
	begin
		select * from View_2
	end

	if @view_name = 'View_3'
	begin
		select * from View_3
	end
END

exec select_view 'View_2'