proc Bernstein*(i, n: int, u: float): float =    
  var temp: seq[float] = newSeq[float](n + 1)    
  for j in 0..n:        
    temp[j] = 0.0    
  temp[n-i] = 1.0
  var u1: float =1-u   
  for k in 1..n:
    echo k,"\n"     
    for j in k..n:            
      temp[n-j] = u1*temp[n-j] + u*temp[n-j-1]
      echo "j= ", k,"\t",temp[j], "\n"

  #return temp[n]
  var B: float = temp[n] 
  echo "B = "
