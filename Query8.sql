--8. ѕродлить дедлайн незакрытых задач на 2 дней

update Task
set DeadlineDate = DATEADD(day, 2, DeadlineDate) 
where TaskId in
(
select  ta.TaskId
	     from Project pr
		 inner join Task ta on ta.ProjectId = pr.ProjectId		 
		 inner join TaskStatus ts on ts.TaskStatusId = ta.TaskStatusId		 			
		 where  ts.TaskStatusVariant like 'Open' or ts.TaskStatusVariant like 'Rework' 
)


