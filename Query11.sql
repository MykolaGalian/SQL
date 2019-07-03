--11. Выяснить по всем проектам, какие сотрудники на проекте не имеют незакрытые задачи

select sub1.EmployeeName from

(select em.EmployeeName, count(ts.TaskStatusVariant) as 'CoutTask'
	     from Project pr
		 inner join Task ta on ta.ProjectId = pr.ProjectId
		 inner join PositionEmployee pe on ta.PositionEmployeeId = pe.PositionEmployeeId
		 inner join Position pp on pp.PositionId = pe.PositionId
		 inner join TaskStatus ts on ts.TaskStatusId = ta.TaskStatusId
		 inner join Employee em on em.EmployeeId = pe.EmployeeId		 
		 group by em.EmployeeName) sub1,


(select em.EmployeeName, count(ts.TaskStatusVariant) as 'CountClosedTask'
	     from Project pr
		 inner join Task ta on ta.ProjectId = pr.ProjectId
		 inner join PositionEmployee pe on ta.PositionEmployeeId = pe.PositionEmployeeId
		 inner join Position pp on pp.PositionId = pe.PositionId
		 inner join TaskStatus ts on ts.TaskStatusId = ta.TaskStatusId
		 inner join Employee em on em.EmployeeId = pe.EmployeeId		 
		 group by em.EmployeeName, ts.TaskStatusVariant
		 having  ts.TaskStatusVariant like 'Closed')sub2
 where sub1.CoutTask = sub2.CountClosedTask





