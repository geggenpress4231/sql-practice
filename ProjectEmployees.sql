select p.project_id,case when count(e.employee_id is not null)
then round((sum(e.experience_years)/count(e.employee_id)),2)
else 0 end
as average_years from 

Project p left join Employee e
on p.employee_id=e.employee_id
group by p.project_id