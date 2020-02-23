
#!/bin/sh


for x in `ps -ef | grep "httpd" | cut -c8-15`
#for x in `ps -ef | grep "httpd" `

	do 
		echo $x 
	done 