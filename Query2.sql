-- 2. ���������� ������ ���������� ��������, �� ������� ��� �����������

select pp.PositionName from Position pp
 left join PositionEmployee pe on pp.PositionId = pe.PositionId
 where pe.EmployeeId IS NULL
