--12.Заданную задачу (по названию) проекта перевести на сотрудника с
--минимальным количеством выполняемых им задач

update Task
set PositionEmployeeId =   -- выбираем Id сотрудник-позиция с минимальным количеством выполняемых задач
(
  select sub1.PositionEmployeeId  from

	(select  pe.PositionEmployeeId, count(ts.TaskStatusVariant) as 'CountOpenTask'
			 from Project pr
			 inner join Task ta on ta.ProjectId = pr.ProjectId
			 inner join PositionEmployee pe on ta.PositionEmployeeId = pe.PositionEmployeeId
			 inner join Position pp on pp.PositionId = pe.PositionId
			 inner join TaskStatus ts on ts.TaskStatusId = ta.TaskStatusId
			 inner join Employee em on em.EmployeeId = pe.EmployeeId		 
			 group by  ts.TaskStatusVariant,pe.PositionEmployeeId
			 having  ts.TaskStatusVariant like 'Open' or ts.TaskStatusVariant like 'Rework')sub1

	where  sub1.CountOpenTask = 

	(
	 select min(sub1.CountOpenTask) from 
		(select  pe.PositionEmployeeId, count(ts.TaskStatusVariant) as 'CountOpenTask'
			 from Project pr
			 inner join Task ta on ta.ProjectId = pr.ProjectId
			 inner join PositionEmployee pe on ta.PositionEmployeeId = pe.PositionEmployeeId
			 inner join Position pp on pp.PositionId = pe.PositionId
			 inner join TaskStatus ts on ts.TaskStatusId = ta.TaskStatusId
			 inner join Employee em on em.EmployeeId = pe.EmployeeId		 
			 group by  ts.TaskStatusVariant,pe.PositionEmployeeId
			 having  ts.TaskStatusVariant like 'Open' or ts.TaskStatusVariant like 'Rework')sub1
  )
)

where Task.TaskId = 22  --Id заданной задачи