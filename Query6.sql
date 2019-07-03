-- 6. Определить сотрудников с минимальным количеством незакрытых задач

select sub1.EmployeeName, count(sub1.EmployeeName) as 'OpenTask' 
   from	 
		 (select em.EmployeeName, ts.TaskStatusVariant
	     from Project pr
		 inner join Task ta on ta.ProjectId = pr.ProjectId
		 inner join PositionEmployee pe on ta.PositionEmployeeId = pe.PositionEmployeeId
		 inner join Position pp on pp.PositionId = pe.PositionId
		 inner join TaskStatus ts on ts.TaskStatusId = ta.TaskStatusId
		 inner join Employee em on em.EmployeeId = pe.EmployeeId			
		 where ts.TaskStatusVariant like 'Open' or ts.TaskStatusVariant like 'Rework'
		 )sub1
group by sub1.EmployeeName
order by 'OpenTask'

