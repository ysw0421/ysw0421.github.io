#1번 문제
setwd("C:/Users/ysw/Desktop")
bob = scan("bob.txt",what="",sep="\n")
length(bob)
str(bob)
bob.split=strsplit(bob,split=" ")
bob.length = sapply(bob.split,length)
barplot(bob.length,names.arg=1:length(bob.length),cex.names =0.6)

#[2번 문제]
#6회 이상 출현한 단어들을 빈도가 큰 것부터 작아지는 순서로 제시하여라
setwd("C:/Users/ysw/Desktop")
bob = scan("bob.txt",what="",sep="\n")
bob = gsub("\\.","",bob)
bob = gsub("\\,","",bob)
bob = gsub("\\?","",bob)
bob.split=strsplit(bob,split=" ")
a = unlist(bob.split)
bob.sort = sort(table(a),decreasing = T)
bob.sort[bob.sort>=6]

#[3번문제]
setwd("C:/Users/ysw/Desktop")
bob = scan("bob.txt",what="",sep="\n")
bob = gsub("\\.","",bob)
bob = gsub("\\,","",bob)
bob = gsub("\\?","",bob)
bob.split=strsplit(bob,split=" ")
a = unlist(bob.split)
#apostrophe는 몇번 나오는가
length(grep("\\'",a))
bob.word = grep("\\'",unique(a))
#apostrophe가 나타난 단어들
for(i in 1:length(grep("\\'",unique(a)))){
    print(unique(a)[bob.word[i]])
}