#!/bin/sh

now="$(date): update site: jekyll setup"

git add -A

git commit -m "$now"
git push origin master

jekyll build --destination ../dgyrt.github.io

cd ../dgyrt.github.io/

site_now="$(date): update site: site update"

git add -A

git commit -m "$site_now"

git push origin master
