# Description:
#   デスマコロシアム未挑戦言語出力
#
#   第n回デスマコロシアムで挑戦者０名の言語を指定数分ランダムに出力します
#
# Commands:
#   deathma n count - 第 n 回で挑戦者０名の言語を count 個ランダムに出力する
#
# Author:
#   suppy193
module.exports = (robot) ->
  robot.respond /deathma (\d+) (\d+)$/i, (msg) ->
    n = msg.match[1]
    count = msg.match[2]
    total_url = []
    # 『第n回デスマコロシアム』問題 集計報告 のトップページ
    total_url[8] = "http://d.hatena.ne.jp/tbpg/20141129/1417276802"
    total_url[7] = "http://d.hatena.ne.jp/tbpg/20140906/1410014268"
    total_url[6] = "http://d.hatena.ne.jp/tbpg/20140726/1406388500"
    total_url[5] = "http://d.hatena.ne.jp/tbpg/20140615/1402853082"
    total_url[4] = "http://d.hatena.ne.jp/tbpg/20140525/1401011965"
    total_url[3] = "http://d.hatena.ne.jp/tbpg/20140429/1398790099"
    total_url[2] = "http://d.hatena.ne.jp/tbpg/20140405/1396714344"
    total_url[1] = "http://d.hatena.ne.jp/tbpg/20140318/1395147131"
    msg.send 'CodeIQ名物'
    msg.send '第' + n.toString() + '回デスマコロシアム'
    if n >= total_url.length
      msg.send 'まだ開催されていません'
    else
      # 『第n回デスマコロシアム』問題 集計報告 のトップページを取得します
      robot.http(total_url[n])
      .get() (err, res, body) ->
        msg.send '今日挑戦するプログラム言語は'
        lang_list = body.split(/\n*<\/*pre>\n*/)[1].split("\n")
        challenge_lang = []
        if count > lang_list.length
          count = lang_list.length
        for i in [1..count]
          index = msg.random([0..lang_list.length-1])
          challenge_lang.push(lang_list[index])
          lang_list.splice(index, 1)
        msg.send challenge_lang.join('と')
        msg.send 'にしましょう！'
# Examples:
#Hubot> hubot deathma 8 3
#Hubot> CodeIQ名物
#Hubot> 第8回デスマコロシアム
#Hubot> 今日挑戦するプログラム言語は
#Hubot> UnlambdaとObjective-CとAda
#Hubot> にしましょう！
#Hubot> hubot deathma 8 9
#Hubot> CodeIQ名物
#Hubot> 第8回デスマコロシアム
#Hubot> 今日挑戦するプログラム言語は
#Hubot> ScalaとFalconとVB.NETとSQLとAdaとProlog (swi)とTclとUnlambdaとOz
#Hubot> にしましょう！
#Hubot> hubot deathma 1 3
#Hubot> CodeIQ名物
#Hubot> 第1回デスマコロシアム
#Hubot> 今日挑戦するプログラム言語は
#Hubot> bcとCLIPS
#Hubot> にしましょう！
#Hubot> hubot deathma 9 3
#Hubot> CodeIQ名物
#Hubot> 第9回デスマコロシアム
#Hubot> まだ開催されていません

