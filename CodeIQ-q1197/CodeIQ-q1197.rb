# @tbpgr  tbpgr（バッジ付与問題）さんからのgithubの問題
# GitHub素数Userは何人
# https://codeiq.jp/ace/tbpgr_badge/q1197


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

require 'prime'

users = ["naoya", "dhh", "mitchellh", "KentBeck",
          "martinfowler", "matz", "twada", "gvanrossum",
          "pragdave", "jeresig"]

count = 0
users.each do |user|
  get_profile = "|curl https://api.github.com/users/" + user
  result = open(get_profile)
  while !result.eof
    line = result.gets
    if line.include?("\"id\"")
      id = line.split(":")[1].to_i
      #print "#{user}:#{id}\n"
      count += 1 if Prime.prime?(id)
      break
    end
  end
  result.close
end
p count

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
