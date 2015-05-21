---
title: "README"
author: "Xiaoyun Yang"
date: "Thursday, May 21, 2015"
output: html_document
---

Step 1:**Reading**

*read.table* is used to read the *.txt* file as *R* objects

Step 2:**Merging**

I used the *rbind* command to merge the data since there are no repetitive subjects between *train* and *test* data sets and this will save some processing time also.

Step 3:**Extraction**

*grep* function is used to select the columns with variables which contain "mean" or "std";

Step 4:**Rename**

Rename the variable with descriptive name given in *feature.txt*; convert the activity code into activity labels

Step 5:**Attach**

Attach the subject and activity column to the data set

Step 6:**Average**

Average each variable grouped by subject and activity

Step 7:**Remove**

Remove extra columns introduced by *aggregate* function

step 8:**Write**

Write the data set to *.txt* file

