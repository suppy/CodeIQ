N=280671392065546467397265294532969672241810318954163887187279320454220348884327
a = 
[162425297,
215940091,
358456949,
369941863,
369941863,
479871607,
706170617,
481362815814826159]
p a

for i in 0...a.length-2 do
	for j in i+1...a.length-1 do
		for k in j+1...a.length do
			print i," ",j," ",k," "
			p a[i]*a[j] + a[j]*a[k] + a[k]*a[i]
		end
	end
end


exit
n = 1
a.each {|i|
	n *= i
}
p N
p n
exit

#i=Math.sqrt(n)
p Time.now
for j in 2..Math.sqrt(n) do
	if j % 1000000000000000 == 0 then
		p Time.now
		p j
	end
	if n % j == 0 then
		p j
		exit
	end
end
