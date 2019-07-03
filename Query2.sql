-- 2. Определить список должностей компании, на которых нет сотрудников

select pp.PositionName from Position pp
 left join PositionEmployee pe on pp.PositionId = pe.PositionId
 where pe.EmployeeId IS NULL
