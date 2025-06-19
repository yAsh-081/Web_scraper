# install.packages("rvest")
# install.packages("tidyverse")
# install.packages("xml2")


library(rvest)
library(tidyverse)
library(xml2)


# Initialize empty lists
titles <- c()
prices <- c()
availability <- c()
ratings <- c()

# Loop through the first 50 pages of the website
for (i in 1:50) {
  
  # Construct the URL dynamically for each page.
  # The paste0 function concatenates strings to create the URL of each page.
  # The URL changes by incrementing the page number (i) from 1 to 50.
  # For example, the first iteration will scrape page 1, the second page 2, and so on.
  url <- paste0("https://books.toscrape.com/catalogue/page-", i, ".html")
  
  # Read the HTML content of the current page using the read_html() function.
  # This function fetches the content of the page specified by the 'url'.
  page <- read_html(url)
  
  # Extract the titles of the books.
  # The html_nodes function selects the nodes that match the CSS selector '.product_pod h3 a',
  # which corresponds to the anchor tags (links) within the 'h3' tags for each book.
  # html_attr('title') gets the 'title' attribute from these anchor tags, which holds the book title.
  titles <- c(titles, page %>% html_nodes(".product_pod h3 a") %>% html_attr("title"))
  
  # Extract the prices of the books.
  # The html_nodes function selects the nodes that match the CSS selector '.price_color',
  # which corresponds to the price of each book on the page.
  # html_text(trim = TRUE) extracts the text content from these nodes and removes extra spaces.
  prices <- c(prices, page %>% html_nodes(".price_color") %>% html_text(trim = TRUE))
  
  # Extract the availability information (whether the book is in stock).
  # The html_nodes function selects the nodes that match the CSS selector '.instock.availability',
  # which corresponds to the availability status for each book.
  # html_text(trim = TRUE) extracts the text content and removes extra spaces.
  availability <- c(availability, page %>% html_nodes(".instock.availability") %>% html_text(trim = TRUE))
  
  # Extract the rating of each book.
  # The html_nodes function selects the nodes that match the CSS selector '.star-rating',
  # which corresponds to the rating (in the form of class names such as 'star-rating Five', 'star-rating Four', etc.).
  # html_attr('class') extracts the class attribute from each of these nodes, which contains the rating class.
  rating_classes <- page %>% html_nodes(".star-rating") %>% html_attr("class")
  
  # Extract the numeric rating value by removing the 'star-rating ' part from the class attribute.
  # gsub is used to substitute "star-rating " with an empty string, leaving only the rating (e.g., "One", "Two", "Three", etc.).
  # The result is added to the ratings list.
  ratings <- c(ratings, gsub("star-rating ", "", rating_classes))
}


# Convert ratings to numeric (mapping text to numbers)
rating_map <- c("One" = 1, "Two" = 2, "Three" = 3, "Four" = 4, "Five" = 5)
ratings_numeric <- unname(rating_map[ratings])

# Convert prices to numeric by removing currency symbol (£)
prices_numeric <- as.numeric(gsub("£", "", prices))

# Create a data frame
books_df <- data.frame(
  Title = titles,
  Price = prices_numeric,
  Availability = availability,
  Rating = ratings_numeric
)

# Arrange by Rating (descending) and then by Price (ascending)
books_df <- books_df %>%
  arrange(desc(Rating), Price)

# Print first few rows
head(books_df)

# Save sorted data to CSV
write.csv(books_df, file = file.path(dirname(rstudioapi::getActiveDocumentContext()$path), "sorted_books_data.csv"), row.names = FALSE)
