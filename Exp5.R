first=0
second=1
fibo=c()
limit=as.numeric(readline(prompt = "Enter a limit : " ))
print(first,second)
for(i in 0:limit){
  third=first+second
  print(third)
  first=second
  second=third
}
