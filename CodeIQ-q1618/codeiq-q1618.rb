# SNS株式会社   堀江貴文さんからの問題
# 【3周年特別企画】ホリエモンからの挑戦状
# https://codeiq.jp/q/1618

# start time
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

l = gets.chomp.to_i
n = gets.chomp.to_i
h = Hash.new([0, 0])
bar = []
n.times do |i|
  bar[i] = gets.chomp.to_i
  h[bar[i]] = [1, i]
end
count = 0
(0...n - 2).each do |i|
  (i + 1...n - 1).each do |j|
    next if l - (bar[i] + bar[j]) <= 0
    if h[l - (bar[i] + bar[j])][0] == 1 && h[l - (bar[i] + bar[j])][1] > j
      count += 1
    end
  end
end
puts count

__END__
File.open('testcase2.txt', 'r') do |f|
  l = f.gets.chomp.to_i
  n = f.gets.chomp.to_i
  while (line = f.gets)
    bar = line.chomp.split(' ').map(&:to_i)
  end
  count = 0
  #bar.sort!
  #puts 'sort!'
  h = Hash.new([0, 0])
  (0...n).each do |i|
    h[bar[i]] = [1, i]
  end
  #p bar
  (0...n - 2).each do |i|
    (i + 1...n - 1).each do |j|
      if h[l - (bar[i] + bar[j])][0] == 1 && h[l - (bar[i] + bar[j])][1] > j
        #print "#{bar[i]}, #{bar[j]}, #{l - (bar[i] + bar[j])}\n"
        count += 1
        #break
      end
    end
    #p i
  end
=begin
  bar.sort!
  puts 'sort!'
  bar.combination(3) do |set|
    if set.inject(:+) == l
      count += 1
    end
  end
=end
  p count
end

# end time
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# processing time
puts "処理時間：#{t1 - t0} sec"
