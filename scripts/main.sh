#!/bin/bash

set -x

curl -s -L -O https://github.com/ruanyf/weekly/archive/refs/heads/master.zip
unzip -o master.zip
rm master.zip*
node scripts/weekly.js > scripts/weekly.json
cp -n ./weekly-master/docs/issue*.md ./docs/weekly/
cd ./docs/weekly/ 
# add pv to markdown / replace link
files=`ls . | grep issue`
for file in ${files[@]}
do 
    sed -i 's/\(http\|https\):\/\/www.ruanyifeng.com\/blog\/.*issue-\([0-9]\+\)\.html/.\/issue-\2/' ${file}
done
