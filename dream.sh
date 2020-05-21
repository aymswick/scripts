#!/bin/bash
inputPhoto=$1
filename="${inputPhoto%.*}"

echo "Uploading ${inputPhoto} for deepdream interpretation...";

response_url=$(curl -F "image=@${inputPhoto}" -H \
	'api-key:c921abb1-e882-4a78-bcca-8ccb7b0a3a29' \
	https://api.deepai.org/api/deepdream | jq -r .output_url)
	
echo "Response from deepai.org: ${response_url}"
echo "${response_url}" | xclip -sel clip

responseImage=$(curl -o ${filename}-deepdream.jpeg ${response_url})
echo "Image deeply dreamed at ${response_url}, but we also saved it here: \n"
echo "${filename}-deepdream.jpeg"
xdg-open ${filename}-deepdream.jpeg 
