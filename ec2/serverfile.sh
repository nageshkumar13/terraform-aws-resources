#!/bin/bash

# Create custom HTML file with server IP address
echo "<h1>Hello, this is Headintheclouds!</h1>" > /var/www/html/index.html
echo "<p>The IP address of this server is: $(hostname -f) </p>" >> /var/www/html/index.html
