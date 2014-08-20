s="";i=0;while(i++<50)s+=["FIZZBUZZ",,,"fizz",,"buzz"][parseInt((i*i*i*i%15+1)/2)]||i;print(s);
s="";i=0;while(i++<50)s+=["FIZZBUZZ",,,"fizz",,"buzz"][(i*i*i*i%15+1)/2|0]||i;print(s);
s="";i=0;while(i++<50)s+=["FIZZBUZZ",,,"fizz",,"buzz"][(Math.pow(i,4)%15+1)/2|0]||i;print(s);
s="";for(i=1;i<51;i++)s+=["FIZZBUZZ",,,"fizz",,"buzz"][(i*i*i*i%15+1)/2|0]||i;print(s);
s="";for(i=1;i<51;i++)s+=["FIZZBUZZ",,,,,,"fizz",,,,"buzz"][i*i*i*i%15]||i;print(s);
//s="";for(i=1;i<51;i++)s+=i%3<1?(i%5<1?'FizzBuzz':'fizz'):(i%5<1?'buzz':i);print(s);
