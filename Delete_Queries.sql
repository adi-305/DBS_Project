/* Delete bill info if purchase was made 5 months ago */

/*Deleting Child Records */
DELETE FROM prod_bill
WHERE EXISTS 
(SELECT 1 from bill 
 WHERE bill_no = prod_bill.bill_no
 AND 
 bdate < add_months(SYSDATE,-5)
)
/*Deleting Parent Record */
DELETE FROM bill
WHERE bdate < add_months(SYSDATE,-5);

/* Remove Seller Info If no purchase has been made from him in last 5 months */
DELETE FROM seller S WHERE NOT EXISTS
(SELECT max(sdate) FROM seller_bill WHERE seller_id = S.seller_id AND sdate > add_months(SYSDATE,-5)
GROUP BY seller_id);
