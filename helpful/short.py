# List of URLs
urls = [

]

# Function to sort URLs by length and alphabetically
def sort_urls(urls):
    return sorted(urls, key=lambda x: (len(x), x))

# Sorting the URLs
sorted_urls = sort_urls(urls)

# Printing the sorted URLs
for url in sorted_urls:
    print(url)
