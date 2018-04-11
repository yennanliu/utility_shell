#!/bin/sh



# ref 
# https://stackoverflow.com/questions/38679346/get-public-ip-address-on-current-ec2-instance


# get ec2 private IP address
curl http://169.254.169.254/latest/meta-data/local-ipv4

# get ec2 public IP address is available via:
curl http://169.254.169.254/latest/meta-data/public-ipv4

