USE CompanyIT;
GO
CREATE PROCEDURE GetNumOfTaskPerProject AS
BEGIN
    select   pr.ProjectId, count(ts.TaskStatusVariant) as 'CoutTask'
	     from Project pr
		 inner join Task ta on ta.ProjectId = pr.ProjectId		 
		 inner join TaskStatus ts on ts.TaskStatusId = ta.TaskStatusId		 
		 group by pr.ProjectId
END;

GO
CREATE PROCEDURE GetNumOfTaskPerProjectClosed AS
BEGIN
	select   pr.ProjectId,  count(ts.TaskStatusVariant) as 'CountClosedTask'
			 from Project pr
			 inner join Task ta on ta.ProjectId = pr.ProjectId		 
			 inner join TaskStatus ts on ts.TaskStatusId = ta.TaskStatusId		 
			 group by pr.ProjectId, ts.TaskStatusVariant
			 having  ts.TaskStatusVariant like 'Closed'  
END;