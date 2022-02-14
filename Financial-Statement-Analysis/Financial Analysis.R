revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#solution
 #profit for each month
 profit <- revenue - expenses

 
 #profit after tax for each month(tax rate is 30%)
 tax <- profit * 0.3
 round(tax, digits=2) 

 profit.after.tax <- profit - tax
 profit.after.tax 

 #profit margin for each month - equals to profit after tax divided by revenue
 
 profit.margin <- round(profit.after.tax/revenue, 2)*100
 profit.margin 

 #good months - where the profit after tax was greater than the mean for the year
 mean_pat <-mean(profit.after.tax)
 mean_pat 
 
 good_months <- profit.after.tax > mean_pat 
 good_months 

 
 #bad months
 bad_months <- !good_months
 bad_months 
 
 #best month
 max_pat <-max(profit.after.tax)
 max_pat
 best.month <- profit.after.tax == max_pat 
 best.month 
 
 #worst month
 
 worst.month <- profit.after.tax == min(profit.after.tax)
 worst.month 
 
 
 #units of thousands
 revenue.1000 <- round(revenue/1000, 0)
 revenue.1000 
 
 expenses.1000 <- round(expenses/1000)
 expenses.1000
 
 profit.1000 <- round(profit/1000)
 profit.1000 
 
 profit.after.tax.1000 <- round(profit.after.tax/1000) 
 profit.after.tax.1000 
 
 
 
 #output
 revenue.1000
 expenses.1000
 profit.1000 
 profit.after.tax.1000 
 profit.margin
 good_months
 bad_months
 best.month
 worst.month
 
 
 #matrices
 m <- rbind(
   revenue.1000,
   expenses.1000,
   profit.1000,
   profit.after.tax.1000, 
   profit.margin,
   good_months,
   bad_months,
   best.month,
   worst.month 
 )
 m
 