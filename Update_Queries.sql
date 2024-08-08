/*Update prices of product.*/
UPDATE product
SET price= 220.2
WHERE product_id=9;

/*Update dates of the sale*/
UPDATE sale
SET sdate=to_date('02-FEB-2000','DD-MON-YYYY')
WHERE product_id = 2 AND branch_id = 1;

/*Change manager of a branch*/
UPDATE branch
SET manager_name='Nitin Patel'
WHERE branch_id= 1;

/*Update contact details of the seller*/
UPDATE seller 
SET pHno=9893965437
WHERE seller_id=10005;

/* Update Stock Quantity */
UPDATE stock
SET stock_quantity = stock_quantity - (SELECT sum(ibill_quantity) from bill NATURAL JOIN prod_bill 
WHERE branch_id = stock.branch_id AND product_id = stock.product_id 
GROUP BY product_id);
