Drop table xml_type;

create table xml_type (doc XMLTYPE);

insert into xml_type values ('<order>
<id>1</id>
<name>nishant</name>
</order>
');

select * from xml_type;
