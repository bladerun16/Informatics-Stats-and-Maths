rm(list = ls())
# Compute Customer Lifetime Value (CLV) for each customer in the dataset
# Input:
# - a dataset containing 
#   Invoice,
#   StockCode,
#   Description,
#   Quantity,
#   PurchaseDate,
#   Price,
#   CustomerID,
#   Country
# Load data
# - Inspect visually the dataset
# - Load the dataset
# - generate and store the vector of unique CustomerID in
#   the variable customers
# - initialize the output structure as a dataframe containing
#     CustomerId = customers,
#     totalRevenue = numeric(length(customers)),
#     numPurchases = numeric(length(customers)),
#     firstPurchase = as.Date(rep(NA, length(customers))),
#     lastPurchase = as.Date(rep(NA, length(customers))),
#     avgOrderValue = numeric(length(customers)),
#     customerLifespan = numeric(length(customers)),
#     purchaseFrequency = numeric(length(customers)),
#     CLV = numeric(length(customers))
# - repeat for all the elements of customers
#   - filter the dataset for the current customer
#   - for the current subset:
#     compute the total revenues as sum of purchase value
#     compute the number of purchases counting the rows
#     compute first date and last date with min and max
#     compute lifespan years
#     compute purchase frequency
#     compute CLV
#   - store the results in the output structure
# show/store the results

df <- read.csv("data/aggregated_invoice_data.csv"
               , stringsAsFactors = FALSE)

# Convert PurchaseDate to Date
df$PurchaseDate <- as.Date(df$PurchaseDate)

# Unique customers
customers <- unique(df$CustomerID)

# Initialize result matrix
results <- data.frame(
  CustomerId = customers,
  totalRevenue = numeric(length(customers)),
  numPurchases = numeric(length(customers)),
  firstPurchase = as.Date(rep(NA, length(customers))),
  lastPurchase = as.Date(rep(NA, length(customers))),
  avgOrderValue = numeric(length(customers)),
  customerLifespan = numeric(length(customers)),
  purchaseFrequency = numeric(length(customers)),
  CLV = numeric(length(customers))
)

for (i in seq_along(customers)) {
  cust_id <- customers[i]
  
  # Subset for current customer
  cust_data <- df[df$CustomerID == cust_id, ]
  
  # Compute values
  total_rev <- sum(cust_data$PurchaseValue)
  num_pur <- nrow(cust_data)
  first_date <- min(cust_data$PurchaseDate)
  last_date <- max(cust_data$PurchaseDate)
  avg_order <- mean(cust_data$PurchaseValue)
  
  # Lifespan in years (avoid division by zero)
  lifespan_days <- as.numeric(difftime(last_date, first_date, units = "days"))
  lifespan_years <- ifelse(lifespan_days == 0, 1/365, lifespan_days / 365)
  
  # Purchase frequency
  purchase_freq <- num_pur / lifespan_years
  
  # CLV computation
  clv <- avg_order * purchase_freq * lifespan_years  # Simplifies to total_rev
  
  # Store in results
  results[i, ] <- list(
    cust_id, total_rev, num_pur,
    first_date, last_date, avg_order,
    lifespan_years, purchase_freq, clv
  )
}

print(results)
# write.csv(results, "clv_baseR.csv", row.names = FALSE)
