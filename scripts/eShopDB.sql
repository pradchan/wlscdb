select * from products;

SELECT a.product_document from products a;

select p.product_document.pid,p.product_document.category,p.product_document.title,p.product_document.details,p.product_document.price,p.product_document.picture from products p;

select JSON_OBJECT(
    'name' value  p.product_document.title
   )from products p;
   
   
select json_arrayagg(p.product_document.pid)
   from products p where rownum <10;