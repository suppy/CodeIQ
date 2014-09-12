# @tbpgr  tbpgr（バッジ付与問題）さんからのLTSVの問題
# LTSVをparseしよう
# https://codeiq.jp/ace/tbpgr_badge/q1024


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

ltsv_array = []
File.open("ltsv_labels.ltsv", "r") do |file|
	ltsv = file.read
	ltsv_array = ltsv.split("\n").map { |line|Hash[line.split("\t").map{ |column| column.split(":", 2)}] }
end
#p ltsv_array

count = 0
ltsv_array.each do |ltsv|
	count += 1 if ltsv["recommended_label"].match(/^r/)
end
p count

count = 0
ltsv_array.each do |ltsv|
	count += 1 if ltsv["description"].match(/of/)
end
p count

count = 0
ltsv_array.each do |ltsv|
	count += 1 if ltsv["apache_format"].match(/[A-Z]/)
end
p count

count = 0
ltsv_array.each do |ltsv|
	count += 1 if ltsv["nginx_format"].match(/time/)
end
p count

count = 0
ltsv_array.each do |ltsv|
	count += 1 if ltsv["recommended_label"].match(/[siowa]/) && ltsv["description"].match(/[ta]/)
end
p count

=begin
count = 0
ltsvs.each do |ltsv|
	count += 1 if ltsv.strip.split("\t")[0].index("recommended_label:r") 
end
p count

count = 0
ltsvs.each do |ltsv|
	count += 1 if ltsv.strip.split("\t")[0].index("recommended_label:r") 
end
p count
=end

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
