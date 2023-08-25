for(i in 1:100){
  if(i%%3==0){
    cat(i,"\tFizz\n")
  }  
  else if(i%%5==0){
    cat(i,"\tBuzz\n")
  }
  else if(i%%3==0 && i%%5==0){
    cat(i,"\tFizzBuzz\n")
  }
}