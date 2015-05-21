## Read data, subjects and activites into table   
   
  tr_x<-read.table("./UCI HAR Dataset/train/X_train.txt")
  tr_y<-read.table("./UCI HAR Dataset/train/y_train.txt")
  tr_s<-read.table("./UCI HAR Dataset/train/subject_train.txt")
   
  te_x<-read.table("./UCI HAR Dataset/test/X_test.txt")
  te_y<-read.table("./UCI HAR Dataset/test/y_test.txt")
  te_s<-read.table("./UCI HAR Dataset/test/subject_test.txt")
  
## Merge the training and test sets
  t_x<-rbind(tr_x,te_x)
  t_y<-rbind(tr_y,te_y)
  t_s<-rbind(tr_s,te_s)

## Extract mean and standard deviation
  feature<-read.table("./UCI HAR Dataset/features.txt")
  Index<-grep("std|mean",as.vector(feature[,2]))
  t_x<-t_x[,Index]
  VarName<-as.vector(feature[Index,2])
  
  ## Label with descriptive variable names
  names(t_x)=VarName
  
  names(t_y)="Activities"
  
  names(t_s)="Subject"
  

## Convert labels into descriptive activity name
  DesActName<-c("WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
              "SITTING","STANDING","LAYING")
  t_y<-within(t_y, Activities <- 
                    factor(as.factor(t_y$Activities), labels = DesActName))



## Attach subjects and activities
  mergeData<-cbind(t_s,t_y,t_x)

## Average by subject and activities
  AVG<-aggregate(mergeData,by=list(as.factor(mergeData$Subject),mergeData$Activities),FUN="mean")

## Remove the extra columns introduced by aggregate and rename the new columns
  AVG<-AVG[,-c(3,4)]
  names(AVG)[1]="Subject"
  names(AVG)[2]="Activities"
  
## write to txt file  
  SamTidy<-write.table(AVG,file="SamTidy.txt",row.name=FALSE)

  
  