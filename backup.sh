#!/bin/bash

cd ~/backups
for OUTPUT in $(docker ps --format '{{.ID}}')
do 
	current_date=$(date +%Y-%m-%dT%H-%M-%S)
	backup_file_name="${OUTPUT}_dump-${current_date}.json"
	docker exec -d  $OUTPUT  sh -c "python manage.py dumpdata > $backup_file_name"

	
	echo $OUTPUT
done
