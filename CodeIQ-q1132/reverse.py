# 先頭の項目を返す関数
def car(x):
	return x[0]

print car(['A', 'B', 'C']) #=> 'A'

# 先頭項目を除いたリストを返す関数
def cdr( x ):
	return x[1:]

print cdr(['A', 'B', 'C']) #=> ['B', 'C']

# 項目xをリストyの最初に付け足したリストを返す関数
def cons( x, y ):
	return [x] + y

print cons('X', ['A', 'B', 'C']) #=> ['X', 'A', 'B', 'C']

# true <- nullp([]) となり、
#　それ以外の時（アトムあるいは有限要素数のリストの場合）はfalseを返す
def nullp( x ):
	if len(x) == 0:
		return True
	else:
		return False

print nullp([])
print nullp(['A'])

# リストxを逆順にして、リストyはそのままで連結する関数
def reverse_aux(x, y):
	if nullp(x):
		return y
	else:
		return reverse_aux( cdr(x), cons( car( x ), y ) )

# リストの項目を逆順にする関数
def reverse2(x):
	return reverse_aux( x, [] )

print reverse_aux( ['A', 'B', 'C', 'D'], ['E', 'F', 'G'] ) #=> ['D', 'C', 'B', 'A', 'E', 'F', 'G']
print reverse2( ['A','B','C','D'] ) #=> ['D','C','B','A']
