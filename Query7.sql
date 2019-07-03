--7. Определить сотрудников с максимальным количеством незакрытых задач, дедлайн которых уже истек


select sub1.EmployeeName, sub1.DeadlineDate, sub1.TaskId
   from	 
	(
		 select em.EmployeeName, ts.TaskStatusVariant, ta.TaskId,ta.DeadlineDate
	     from Project pr
		 inner join Task ta on ta.ProjectId = pr.ProjectId
		 inner join PositionEmployee pe on ta.PositionEmployeeId = pe.PositionEmployeeId
		 inner join Position pp on pp.PositionId = pe.PositionId
		 inner join TaskStatus ts on ts.TaskStatusId = ta.TaskStatusId
		 inner join Employee em on em.EmployeeId = pe.EmployeeId			
		 where  ts.TaskStatusVariant like 'Open' or ts.TaskStatusVariant like 'Rework' 
	)sub1		 
    group by sub1.EmployeeName, sub1.DeadlineDate,sub1.TaskId
    having sub1.DeadlineDate < GETDATE()
    order by sub1.EmployeeName 
	 