--3. Получить список проектов с указанием, сколько сотрудников каждой должности работает на проекте



 select pr.ProjectName, pp.PositionName , count (pe.EmployeeId) as 'NumOfEmployee'
 from Project pr
 inner join Task ta on ta.ProjectId = pr.ProjectId
 inner join PositionEmployee pe on ta.PositionEmployeeId = pe.PositionEmployeeId
 inner join Position pp on pp.PositionId = pe.PositionId
 group by pr.ProjectName, pp.PositionName
 order by pr.ProjectName
 
