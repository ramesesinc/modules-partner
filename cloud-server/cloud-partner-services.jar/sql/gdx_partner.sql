[getList]
select p.*, 
	c.objid as group_objid, 
	c.title as group_title,
	c.name as group_name, 
	(case when o.id is null then 0 else 1 end) as isonline
from partner p 
	inner join partner_cluster c on c.objid = p.clusterid 
	left join partner_online o on o.id = p.id 
order by c.name, length(p.id), p.id 