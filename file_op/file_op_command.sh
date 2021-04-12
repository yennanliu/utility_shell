# 1) remove file name with special characters
# https://stackoverflow.com/questions/55590877/how-to-remove-files-with-special-characters
# rm -v -- #file
# rm -v -- "#file"
rm -v --  mapred.reduce.tasks=2
rm -v --  -Dmapred.job.reduce.memory.mb=8192
