integer i
do i=1, 50
if(mod(i,15)<1)then
write (*,'(a)',advance='no')"FIZZBUZZ"
else if(mod(i,3)<1)then
write (*,'(a)',advance='no')"fizz"
else if(mod(i,5)<1)then
write (*,'(a)',advance='no')"buzz"
else
write(*,'(i0)',advance='no')i
end if
end do