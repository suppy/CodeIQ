# @tbpgr  tbpgr コロシアム管理人さんからの言語指定の問題
# 第2回デスマコロシアム
# https://codeiq.jp/ace/tbpgr_colosseum_manager/q835

# 解答例
# ideone.com の Ruby は ruby-1.9.3

#coding:utf-8
a=*'`@ぁァァぁ@`'.chars
26.times{$><<a.map(&:succ!).join}

# 個々の処理の確認
print "\n"
# puts `@ぁァァぁ@`
p '`@ぁァァぁ@`'
p '`@ぁァァぁ@`'.chars # 1.9.3 では、Enumeratorオブジェクトを返す
					# 2.0.0 では、文字列の各文字を文字列の配列で返す
p *'`@ぁァァぁ@`'.chars
a = *'`@ぁァァぁ@`'.chars
p a
p a.map(&:succ!)
p a.map(&:succ!).join
$> << a.map(&:succ!).join # $> は標準出力
26.times{$><<a.map(&:succ!).join}

