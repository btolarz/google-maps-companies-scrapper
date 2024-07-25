# Web Scraper for Contact Details

This repository contains a web scraper built using Python and Selenium. The scraper extracts contact details such as name, address, website, phone number, category, and email from a specified URL. It is designed to work with Firefox (Geckodriver) and can be easily deployed using Docker.

# Features

- Scrapes contact details from the specified URL.
- Supports both general websites and Facebook pages.
- Outputs the scraped data into an Excel file (data.xlsx).
- Configured to work with Polish language settings.
- Logs the scraping process for easy debugging.

# Requirements

- Docker
- Python 3.12

# Setup

## Clone the Repository

```
git clone https://github.com/btolarz/google-maps-companies-scrapper
cd google-maps-companies-scrapper
```
## With docker
### Build Docker Image

```
docker build -t scraper-image .
```

## Without docker

```
pip install --no-cache-dir -r requirements.txt
```

# Usage

## Running the Scraper

### With docker
To run the scraper with a specific URL, use the following command:

```
docker run -v $(pwd):/app scraper-image "https://www.google.com/maps/search/warsztat/@53.1347098,23.1325697,13z/data=!3m1!4b1?entry=ttu"
```

This command mounts the current directory to the /app directory in the Docker container and runs the scraper with the specified URL. The output will be saved to data.xlsx in the current directory.

### Without docker
```
python scraper.py "https://www.google.com/maps/search/warsztat/@53.1347098,23.1325697,13z"
```

Then

# Logging

The scraper logs the process to the console, providing real-time feedback. The logging level is set to INFO.

# Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

# License

This project is licensed under the MIT License. See the LICENSE file for more details.

# Acknowledgements

This project uses the following open-source libraries:

- Selenium
- BeautifulSoup
- Openpyxl
- Requests
