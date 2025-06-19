# 📚 Web Scraping in R: Books Data Extraction

> A comprehensive guide and implementation for web scraping book data using R

[![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)](https://www.r-project.org/)
[![RStudio](https://img.shields.io/badge/RStudio-75AADB?style=for-the-badge&logo=rstudio&logoColor=white)](https://rstudio.com/)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

## 🎯 Overview

This project demonstrates professional web scraping techniques using R to extract book information from [books.toscrape.com](https://books.toscrape.com). The implementation showcases automated data collection, cleaning, and organization of book metadata including titles, prices, availability, and ratings across 50 pages.

## ✨ Features

- **Automated Data Collection**: Scrapes 1000+ books across 50 pages
- **Data Cleaning**: Converts ratings and prices to numeric formats
- **Smart Sorting**: Organizes books by rating (descending) and price (ascending)
- **CSV Export**: Saves processed data for further analysis
- **Ethical Scraping**: Implements responsible scraping practices

## 🛠️ Technologies Used

- **R** - Primary programming language
- **rvest** - Web scraping and HTML parsing
- **tidyverse** - Data manipulation and transformation
- **xml2** - XML/HTML document processing
- **rstudioapi** - Dynamic file path management

## 📋 Prerequisites

Before running this project, ensure you have:

- R (version 4.0 or higher)
- RStudio (recommended)
- Internet connection for package installation and web scraping

## 🚀 Getting Started

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/web-scraping-r-books.git
   cd web-scraping-r-books
   ```

2. **Install required packages**
   ```r
   install.packages(c("rvest", "tidyverse", "xml2", "rstudioapi"))
   ```

3. **Load libraries**
   ```r
   library(rvest)
   library(tidyverse)
   library(xml2)
   library(rstudioapi)
   ```

### Usage

1. **Run the scraper**
   ```r
   source("Part_A.R")
   ```

2. **View results**
   ```r
   head(books_df)
   ```

3. **Find output**
   - Console output displays first few rows
   - CSV file saved as `sorted_books_data.csv`

## 📊 Data Structure

The scraper extracts the following information for each book:

| Field | Type | Description |
|-------|------|-------------|
| `Title` | Character | Book title |
| `Price` | Numeric | Price in GBP (£) |
| `Availability` | Character | Stock status |
| `Rating` | Numeric | Star rating (1-5) |

## 🔍 How It Works

### 1. **Page Iteration**
```r
for (i in 1:50) {
  url <- paste0("https://books.toscrape.com/catalogue/page-", i, ".html")
  page <- read_html(url)
  # Extract data...
}
```

### 2. **Data Extraction**
- **Titles**: CSS selector `.product_pod h3 a`
- **Prices**: CSS selector `.price_color`
- **Availability**: CSS selector `.instock.availability`
- **Ratings**: CSS selector `.star-rating`

### 3. **Data Processing**
- Convert text ratings ("One", "Two", etc.) to numeric (1, 2, etc.)
- Remove currency symbols from prices
- Create structured data frame

### 4. **Smart Sorting**
Books are sorted to recommend the best value:
1. Highest rated books first
2. Among same ratings, lowest price first

## 📈 Sample Output

```
                                    Title Price   Availability Rating
1              A Light in the Attic      51.77    In stock         5
2              Tipping the Velvet     53.74    In stock         5
3              Soumission            50.10    In stock         5
```

## 🎯 Use Cases

This web scraping implementation can be adapted for:

- **E-commerce Analysis**: Price monitoring and comparison
- **Market Research**: Product availability tracking
- **Data Science Projects**: Gathering datasets for analysis
- **Academic Research**: Collecting structured web data
- **Business Intelligence**: Competitive analysis

## ⚖️ Ethical Considerations

This project follows responsible scraping practices:

- ✅ Uses a practice website designed for scraping
- ✅ Implements reasonable request timing
- ✅ Respects website structure and load
- ✅ Does not collect personal/sensitive data
- ✅ Follows robots.txt guidelines

## 📁 Project Structure

```
web-scraping-r-books/
├── Part_A.R                    # Main scraping script
├── README.md                   # Project documentation
├── sorted_books_data.csv       # Output data file
└── assets/                     # Images and screenshots
```

## 📚 Learning Resources

- [rvest Documentation](https://rvest.tidyverse.org/)
- [HTML and XPath Basics](https://www.w3schools.com/xml/xpath_intro.asp)
- [CSS Selectors Guide](https://www.w3schools.com/cssref/css_selectors.asp)
- [R for Data Science](https://r4ds.had.co.nz/)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Yash Patel**
- GitHub: [@yAsh-081](https://github.com/yAsh-081)


## 🙏 Acknowledgments

- **books.toscrape.com** - For providing a safe environment for scraping practice
- **R Community** - For excellent documentation and packages

---

⭐ **If you found this project helpful, please give it a star!** ⭐
