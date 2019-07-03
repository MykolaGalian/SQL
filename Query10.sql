--10. Перевести проекты в состояние закрыт, для которых все задачи закрыты и
-- задать время закрытия временем закрытия задачи проекта, принятой последней


update Project
set  ProjectFinishDate =ProjectDate.maxDate, ProjectStatus = 'Closed'
from
(SELECT sub2.ProjectId,sub3.maxDate FROM
	(select   pr.ProjectId, count(ts.TaskStatusVariant) as 'CoutTask'
			 from Project pr
			 inner join Task ta on ta.ProjectId = pr.ProjectId		 
			 inner join TaskStatus ts on ts.TaskStatusId = ta.TaskStatusId		 
			 group by pr.ProjectId)sub1,

	(select   pr.ProjectId,  count(ts.TaskStatusVariant) as 'CountClosedTask'
				 from Project pr
				 inner join Task ta on ta.ProjectId = pr.ProjectId		 
				 inner join TaskStatus ts on ts.TaskStatusId = ta.TaskStatusId		 
				 group by pr.ProjectId, ts.TaskStatusVariant
				 having  ts.TaskStatusVariant like 'Closed' )sub2,

	(select   pr.ProjectId, max(ts.StatusChangeDate) as 'maxDate'
				 from Project pr
				 inner join Task ta on ta.ProjectId = pr.ProjectId		 
				 inner join TaskStatus ts on ts.TaskStatusId = ta.TaskStatusId
				 group by pr.ProjectId)sub3

	where sub1.ProjectId = sub2.ProjectId  and sub1.CoutTask = sub2.CountClosedTask and sub2.ProjectId = sub3.ProjectId) as ProjectDate
where Project.ProjectId = ProjectDate.ProjectId 
	









