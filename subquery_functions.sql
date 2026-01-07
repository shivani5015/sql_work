#subquery operators
#in operator  we use in subquery fr more then 1 row.
#=any same as in
#>any and <any and >all
# get all the payemnt info where the month of payment should be same as of paymentid 2 and 3
#get all the payment info whose amount is largeser then among all the amount of pid 2 to 8
select * from  payment where month(payment_date) in ( select month(payment_date) from payment where (payment_id=2 or payment_id=3));
select * from payment where amount >all (select amount from payment where (payment_id=2 or payment_id=8));
