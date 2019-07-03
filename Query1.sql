--1. Получить список всех должностей компании с количеством сотрудников на каждой из них

select 
   pp.PositionName,
   count (pe.EmployeeId) as 'NumOfEmployee'
from Position pp
 inner join PositionEmployee pe on pp.PositionId = pe.PositionId
 group by pp.PositionName



