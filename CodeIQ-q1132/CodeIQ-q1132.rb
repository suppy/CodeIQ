# @nkawagashira  川頭 信之さんからの関数型言語の問題
# 再帰関数で逆順並べ替え
# https://codeiq.jp/ace/kawagashira_nobuyuki/q1132


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# 先頭の項目を返す関数
def car( x )
  return x[0]
end

# 先頭項目を除いたリストを返す関数
def cdr( x )
  return x[1..-1]
end

# 項目xをリストyの最初に付け足したリストを返す関数
def cons( x, y )
  return [x] + y
end


# true <- nullp([]) となり、
#　それ以外の時（アトムあるいは有限要素数のリストの場合）はfalseを返す
def nullp( x )
  return true if x.length == 0
  return false
end

p car(['A', 'B', 'C']) #=> 'A'
p cdr(['A', 'B', 'C']) #=> ['B', 'C']
p cons('X', ['A', 'B', 'C']) #=> ['X', 'A', 'B', 'C']
p nullp([])
p nullp(['A'])

# リストxを逆順にして、リストyはそのままで連結する関数
def reverse_aux(x, y)
  return y if nullp(x)
  reverse_aux( cdr(x), cons( car( x ), y ) )
end

# リストの項目を逆順にする関数
def reverse2(x)
  return reverse_aux( x, [] )
end

p reverse_aux( ['A', 'B', 'C', 'D'], ['E', 'F', 'G'] ) #=> ['D', 'C', 'B', 'A', 'E', 'F', 'G']

p reverse2( ['A','B','C','D'] ) #=> ['D','C','B','A']

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
