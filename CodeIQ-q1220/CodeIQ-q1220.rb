j=66;(0..24).each{|i|puts"A"*i+j.chr+"A"*(24-i);j+=1}
j=66;25.times{|i|puts"A"*i+j.chr+"A"*(24-i);j+=1}
j=66;25.times{|i|$><<?A*i+j.chr+?A*(24-i);puts"";j+=1}
25.times{|i|$><<?A*i+(66+i).chr+?A*(24-i);puts""}
A="A"*25;25.times{|i|b=A.dup;b[i]=(i+66).chr;puts b}
25.times{|i|A="A"*25;A[i]=(i+66).chr;puts A}
25.times{|i|puts ?A*i+(66+i).chr+?A*(24-i)}
A="A"*24;25.times{|i|puts A[0,i]+(66+i).chr+A[0,24-i]}

