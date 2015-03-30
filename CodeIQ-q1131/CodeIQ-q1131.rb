# 惑星オルフェウス  プロフェッサー シミズさんからの言語不問の問題
# ブラックホールからの脱出
# https://codeiq.jp/ace/shimizu/q1131


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

h = {}
# 天体の名称　天体の質量[kg]　脱出速度[km/s]
h["FSX123098"] = [2e31, 0.424e5]
h["FSM092834"] = [2e32, 1.34e5]
h["FSG189048"] = [4e32, 1.90e5]
h["FSK809849"] = [5e32, 2.12e5]
h["FSB320498"] = [6e32, 2.32e5]
h["FSN102932"] = [8e32, 2.68e5]

p h

# m, v
# v = a*sqrt(m) + b



# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
