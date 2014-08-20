for i=1:1:50
if(mod(i,15)==0)
printf"FIZZBUZZ"
elseif(mod(i,3)==0)
printf"fizz"
elseif(mod(i,5)==0)
printf"buzz"
else
printf("%d",i)
endif
end