setwd("UCI HAR Dataset")
testsub<-read.table("test/subject_test.txt")
testy<-read.table("test/y_test.txt")
testx<-read.table("test/x_test.txt")
testdata<-cbind(testy,testsub,testx)
trainsub<-read.table("train/subject_train.txt")
trainy<-read.table("train/y_train.txt")
trainx<-read.table("train/x_train.txt")
traindata<-cbind(trainy,trainsub,trainx)
data<-rbind(testdata,traindata)
tidy1<-cbind(data[,1:8],data[,43:48],data[,83:88],data[,123:128],data[,163:168],data[,203:204],data[,216:217],data[,229:230],data[,242:243],data[,255:256],data[,268:273],data[,347:352],data[,426:431],data[,505:506],data[,531:532],data[,544:545])
activity<-read.table("activity_labels.txt")
actlist<-data.frame()
for(i in 1:nrow(tidy1)){
  actlist[i,1]<-activity[tidy1[i,1],2]
}
tidy1<-cbind(actlist,tidy1[,2:ncol(tidy1)])
feature<-read.table("features.txt")
feature<-rbind(feature[1:6,],feature[41:46,],feature[81:86,],feature[121:126,],feature[161:166,],feature[201:202,],feature[214:215,],feature[227:228,],feature[240:241,],feature[253:254,],feature[266:271,],feature[345:350,],feature[424:429,],feature[503:504,],feature[529:530,],feature[542:543,])
label<-c()
label[1]<-"Activity"
label[2]<-"Subject"
x<-nrow(feature)+2
label[3:x]<-as.character(feature[,2])
names(tidy1)<-label
tidy2<-data.frame()
for(i in 1:6)
{
  actdata<-data.frame()
  actdata<-tidy1[(tidy1$Activity==as.character(activity[i,2])),]
  for(j in 1:30)
  {
    actdata2<-data.frame()
    actdata2<-actdata[(actdata$Subject==j),]
    tempdata<-data.frame()
    tempdata[1,1]<-actdata2[1,1]
    tempdata[1,2]<-actdata2[1,2]
    x<-ncol(actdata2)
    tempdata[,3:x]<-colMeans(actdata2[3:x])
    tidy2<-rbind(tidy2,tempdata)
  }  
}
names(tidy2)<-label