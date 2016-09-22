#!/usr/bin/python2.6

# what is the tatal number of sales and the total sales value from all the stores??

import sys

total = 0
num = 0 
oldKey = None

for line in sys.stdin:
	data = line.strip().split("\t")

	if len(data)!= 2:
	    continue  ## continue statement continues with the next iteration of the loop:

	thisKey, thisSale = data
	    
	oldKey = thisKey
	num += 1
	total += float(thisSale)


	#if oldKey != None:
	#    print oldKey, "\t", salesTota

print num
print total


