#!/bin/sh 

# following line will get the certificate information from a site and converts the output to a image by using the convert command of imagemagick
## install the imagemgick
## $ sudo apt install imagemagick -y
## update the imagamagick policy to avoid the security policy errors while conversions
## $ sudo vi /etc/ImageMagick-6/policy.xml
## comment out or remove the line <policy domain="path" rights="none" pattern="@*"/> and save. This is for education purpose only. Ref: https://ostechnix.com/save-linux-command-output-image-file/
## execute the following command to generate the jpg image.
curl --insecure -vvI https://google.com 2>&1 | awk 'BEGIN { cert=0 } /^\* SSL connection/{ cert=1 } /^\*/ { if (cert) print }' | convert label:@- test.JPG


