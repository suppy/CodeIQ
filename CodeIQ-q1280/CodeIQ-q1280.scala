for(i<-0 to 207)if(i%8==0)printf("%c",i%26+65) else printf("%c",i%26+97)
for(i<-0 to 207){printf("%c",i%26+(if(i%8==0)65 else 97))}
for(i<-0 to 207)printf("%c",i%26+(if(i%8==0)65 else 97))
for(i<-0 to 207)print((i%26+(if(i%8==0)65 else 97)).toChar)
