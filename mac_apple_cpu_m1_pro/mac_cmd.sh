# 1) kill process use port xxx
# https://stackoverflow.com/questions/3855127/find-and-kill-process-locking-port-3000-on-mac
lsof -i tcp:8888

# 2) kill all java processes
# mac -> Launchedpad -> activity monitor -> filter by "java" -> force quit processes
