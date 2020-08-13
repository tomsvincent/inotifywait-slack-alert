# Description
Monitoring files with `inotifywait` result in unexpected results as the monitoring is inode based. This script is used to monitor a file and push alert to slack channel when an event is triggered.

# Howtos
Replace the file path and web hook URL.

Script need to run in background to continuously watch the file. `nohup` is used to achieve this.

`nohup bash watch_file.sh </dev/null >/dev/null 2>&1 &`
