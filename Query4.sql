-- 4. Посчитать на каждом проекте, какое в среднем количество задач приходится на каждого сотрудника

select sub.ProjectName, avg(cast(sub.NumOfTaskPerEmpInProject as float)) as 'AvgOfTaskPerEmpInProject' from  
 (
	 select pr.ProjectName, pp.PositionName, count (ta.TaskId) as 'NumOfTaskPerEmpInProject'
	 from Project pr
		 inner join Task ta on ta.ProjectId = pr.ProjectId
		 inner join PositionEmployee pe on ta.PositionEmployeeId = pe.PositionEmployeeId
		 inner join Position pp on pp.PositionId = pe.PositionId
	 group by ta.PositionEmployeeId, pr.ProjectName, pp.PositionName
 )sub
 group by sub.ProjectName
 
