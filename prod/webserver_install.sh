#!/bin/bash
set -e

# Update package list and install NGINX if not already installed
sudo apt-get update
sudo apt-get install -y nginx

# Enable NGINX to start on boot and start the service immediately
sudo systemctl enable nginx
sudo systemctl start nginx

# Set permissions on the web root so files are readable/executable
sudo chmod -R 755 /var/www/html

# Create a directory for the app1 site
sudo mkdir -p /var/www/html/app1

# Define variables for hostname and IP address
HOSTNAME=$(hostname)
IPADDRESS=$(hostname -I | awk '{print $1}')

# Define the welcome page content as a variable
HTML_CONTENT=$(cat <<EOF
<html>
  <head>
    <title>Welcome to ${HOSTNAME}</title>
  </head>
  <body>
    <h1>NGINX is up and running!</h1>
    <p>Hostname: ${HOSTNAME}</p>
    <p>IP Address: ${IPADDRESS}</p>
  </body>
</html>
EOF
)

# Write the welcome page to both directories using sudo tee
echo "$HTML_CONTENT" | sudo tee /var/www/html/index.html > /dev/null
echo "$HTML_CONTENT" | sudo tee /var/www/html/app1/index.html > /dev/null

# Echo one of the created pages
echo "NGINX installation and configuration complete."
echo "Welcome page created in:"
echo "  /var/www/html/index.html"
echo "  /var/www/html/app1/index.html"
echo "Content of /var/www/html/index.html:"
sudo cat /var/www/html/index.html
