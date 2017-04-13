#!/usr/bin/python
#sudo pip install boto
from boto.s3.connection import S3Connection
import os

aws_access_key= ""
aws_secret_key= ""
bucket = ''
conn = S3Connection(aws_access_key,aws_secret_key)
bucket = conn.get_bucket(bucket)

for key in bucket.list():
	print key.name
	if key.name.endswith('/'):
		if not os.path.exists('./'+key.name):
			os.makedirs('./'+key.name)
	else:
		res = key.get_contents_to_filename('./'+key.name)

