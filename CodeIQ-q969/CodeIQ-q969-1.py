s=""
i=1
while i<51:
 if i%15<1:
  s+="FIZZBUZZ"
 elif i%3<1:
  s+="fizz"
 elif i%5<1:
  s+="buzz"
 else:
  s+=str(i)
 i=i+1
print s