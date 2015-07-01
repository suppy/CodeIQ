n = 10 ** 3
#n = 32
primes = [3, 5, 7, 11, 13, 17, 19, 23, 29, 31]
sum_primes = 0
require 'prime'
3.step(n, 2) do |i|
  #primes << i if i.prime?
  if i.prime?
    j = 1
    while i * j <= n
      sum_primes += i * j
      j *= 2
    end
  end
end
p sum_primes

sum_2 = 0
i = 0
while 2 ** i <= n
  print 2 ** i
  sum_2 += 2 ** i
  i += 1
end
p sum_2

sum_p = 0
primes.each do |p|
  i = 1
  while p * i <= n
    p p * i
    sum_p += p * i
    i *= 2
  end
end

sum = n * (n + 1) / 2
p sum
p sum - sum_primes - sum_2 + sum_p

__END__
3.step(n, 2) do |i|
  is_prime = true
  primes.each do |p|
    if i % p == 0
      is_prime = false
      break
    end
  end
  if is_prime
    primes << i
  end
end
p primes.length