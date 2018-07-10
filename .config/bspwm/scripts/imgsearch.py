#!/run/current-system/sw/bin/env python

import sys
import requests
import subprocess

filePath = sys.argv[-1]

proxyDict = {
    "http" : "http://127.0.0.1:3128",
    "https" : "http://127.0.0.1:3128"
}

searchUrl = 'http://www.google.com/searchbyimage/upload'
multipart = {'encoded_image': (filePath, open(filePath, 'rb')), 'image_content': ''}
response = requests.post(searchUrl, files=multipart, allow_redirects=False, proxies=proxyDict)
fetchUrl = response.headers['Location']

subprocess.call([r'firefox', fetchUrl])

exit(0)
