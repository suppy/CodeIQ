def A(m, n)
#  print "A(", m, ", ", n, ")\n"
  if m == 0 then
    n + 1
    
  elsif n == 0 then
    A(m - 1, 1)
  else
    A(m - 1, A(m, n - 1))
  end
end

print A(4, 1)
