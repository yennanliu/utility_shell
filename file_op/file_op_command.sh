# 1) remove file name with special characters
# https://stackoverflow.com/questions/55590877/how-to-remove-files-with-special-characters
# rm -v -- #file
# rm -v -- "#file"
rm -v --  mapred.reduce.tasks=2
rm -v --  -Dmapred.job.reduce.memory.mb=8192

# 2) grep a file, but show several surrounding lines
# https://stackoverflow.com/questions/9081/grep-a-file-but-show-several-surrounding-lines
# grep -B 3 -A 2 foo README.txt
cat my_job.log | grep Failed -B 3 -A 2

# 3) get unique output from cat file
# https://stackoverflow.com/questions/618378/select-unique-or-distinct-values-from-a-list-in-unix-shell-script
cat test.txt | sort | uniq

# 3-1)' get unique output and count it from cat file
# https://stackoverflow.com/questions/380817/best-way-to-simulate-group-by-from-bash
cat test.txt | sort | uniq -c
