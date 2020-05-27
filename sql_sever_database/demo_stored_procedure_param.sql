-- create
CREATE PROCEDURE yen_test_procedure_param @ID int
AS
SELECT @ID; 

-- execute 
EXEC yen_test_procedure_param 100;  


-- create
CREATE PROCEDURE yen_test_procedure_param2 @ID int , @ID2 int
AS
SELECT @ID, @ID2; 

-- execute 
EXEC yen_test_procedure_param2 100, 9999;  
