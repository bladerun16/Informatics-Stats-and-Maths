rm(list = ls())
# Load the dataset
df <- read.csv("data/online_retail_II.csv", stringsAsFactors = FALSE)

frac = .01

df <- df[sample.int(nrow(df), as.integer(nrow(df)*frac), replace = F ),]

# Convert InvoiceDate to Date (try parsing time if needed)
df$InvoiceDate <- as.Date(df$InvoiceDate)

# Compute line total: Quantity × Price
df$LineTotal <- df$Quantity * df$Price

# Get unique Invoice rows
unique_invoices <- unique(df$Invoice)

# Initialize result dataframe
result <- data.frame(
  CustomerID = character(),
  InvoiceDate = as.Date(character()),
  InvoiceValue = numeric(),
  stringsAsFactors = FALSE
)

# Loop through each invoice
for (inv in unique_invoices) {
  invoice_rows <- df[df$Invoice == inv, ]
  
  # Skip if Customer ID is missing
  if (all(is.na(invoice_rows$Customer.ID))) next
  
  cust_id <- invoice_rows$Customer.ID[1]
  inv_date <- invoice_rows$InvoiceDate[1]
  inv_value <- sum(invoice_rows$LineTotal, na.rm = TRUE)
  
  # Add to result
  result <- rbind(result, data.frame(
    CustomerID = cust_id,
    InvoiceDate = inv_date,
    InvoiceValue = inv_value,
    stringsAsFactors = FALSE
  ))
}

# View result
print(head(result))

# (Optional) Save to CSV
write.csv(result, "data/aggregated_invoice_data.csv", row.names = FALSE)
