# coding: utf-8
a=["aAあア","bBぃィ","cCいイ","dDぅゥ","eEうウ","fFぇェ","gGえエ","hHぉォ","iIおオ","jJかカ","kKがガ","lLきキ","mMぎギ","nNくク","oOぐグ","pPけケ","qQげゲ","rRこコ","sSごゴ","tTさサ","uUざザ","vVしシ","wWじジ","xXすス","yYずズ","zZせセ"]
c=""
a.each{|b|c+=b+b.reverse}
puts c