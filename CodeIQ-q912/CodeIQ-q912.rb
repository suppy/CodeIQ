# 株式会社エニグモ  サービスエンジニアさんからのウチに来ない？の問題
# 言語指定：カナをローマ字変換しよう！
# https://codeiq.jp/ace/service_engineer/q912

kana2romaji = {
	"ア" => "a",
	"イ" => "i",
	"ウ" => "u",
	"エ" => "e",
	"オ" => "o",
	"カ" => "ka",
	"キ" => "ki",
	"ク" => "ku",
	"ケ" => "ke",
	"コ" => "ko",
	"サ" => "sa",
	"シ" => "shi",
	"ス" => "su",
	"セ" => "se",
	"ソ" => "so",
	"タ" => "ta",
	"チ" => "chi",
	"ツ" => "tsu",
	"テ" => "te",
	"ト" => "to",
	"ナ" => "na",
	"ニ" => "ni",
	"ヌ" => "nu",
	"ネ" => "ne",
	"ノ" => "no",
	"ハ" => "ha",
	"ヒ" => "hi",
	"フ" => "fu",
	"ヘ" => "he",
	"ホ" => "ho",
	"マ" => "ma",
	"ミ" => "mi",
	"ム" => "mu",
	"メ" => "me",
	"モ" => "mo",
	"ヤ" => "ya",
	"ユ" => "yu",
	"ヨ" => "yo",
	"ラ" => "ra",
	"リ" => "ri",
	"ル" => "ru",
	"レ" => "re",
	"ロ" => "ro",
	"ワ" => "wa",
	"ヲ" => "wo",
	"ン" => "n",
	#ガギグゲゴザジズゼゾダ
	"キャ" => "kya",
	"キュ" => "kyu",
	"キョ" => "kyo",
	"ッ" => "",
}

input = "アカカッキャットタロヤン"
print "#{input}\n"
(0...input.length).each do |i|
	# print input[i]
	if input[i] == "ッ"
		print kana2romaji[input[i+1]][0].upcase
	
	elsif kana2romaji[input[i, 2]] == nil
		print kana2romaji[input[i]]
	else
		print kana2romaji[input[i, 2]].upcase
	end
end
