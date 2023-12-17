#------------------------------------
# NOTE !!! DO NOT install with brew
#------------------------------------

# Step 1) go to the website download binary file
# https://jmeter.apache.org/download_jmeter.cgi
# https://www.jianshu.com/p/f8849783423f
# https://stackoverflow.com/questions/73358441/is-it-possible-to-install-jmeter-in-m1-chip-mac-book-pro

# Step 2) unzip the file, and put to your workspace (e.g. /Users/yennanliu)

# Step 3) run the app


export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home

echo $JAVA_HOME


cd apache-jmeter-5.6.2
bash bin/jmeter
