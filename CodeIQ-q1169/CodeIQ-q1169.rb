# @cielavenir  cielさんからの言語不問の問題
# Restricted Base32
# https://codeiq.jp/ace/cielavenir/q1169


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

encode = %!ABCDEFGHIJKLMNOPQRSTUVWXYZ234567!
p encode

base32_data = %!
JeQgy33wmuqe
G33emvEVCIi=
!.strip.upcase
p base32_data

base32_data = String.new
mode = %!r!
File.open(%!sample.in!, mode) do |f|
  while line = f.gets
    base32_data += line.strip.upcase
  end
end
p base32_data

binary_string = String.new
base32_data.each_char do |chr|
  #p chr
  break if !encode.index(chr)
  binary_string += (48.chr * 4 + encode.index(chr).to_s(2))[-5..-1]
end 
p binary_string
p binary_string.length
if binary_string.length % 8 != 0
  binary_string += 48.chr * (8 - binary_string.length % 8)
end
p binary_string
p binary_string.length

p "data error" if binary_string.length % 8 != 0

0.step(binary_string.length-8, 8) do |i|
  #p binary_string[i, 8]
  print binary_string[i, 8].to_i(2).chr
end

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
