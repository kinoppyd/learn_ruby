#!/usr/bin/ruby

# ハッシュの定義
test_hash = { "hoge" => "huga", 108 => "波動球" };
# とりあえずダンプしてみる
p test_hash;
# 個別にアクセス
p test_hash["hoge"];
p test_hash[108];
# なんか、数字をキーにした場合って、配列と見た目あんま区別つかない気がするんだけど……
#
# 存在しないキーでアクセスすると、nil
p test_hash["boom"];

# ハッシュに配列を入れて、そこに更にハッシュ入れてみる
test_hash["array"] = [ {"kujo" => "jotaro" } , {"kujo" => "joline"} ];
# ダンプ
p test_hash;
# 個別にアクセスしてみる
p test_hash["array"][0]["kujo"];
p test_hash["array"][1]["kujo"];
# このへんの感覚は、あんまりperlと変わらない感じ
#
# ハッシュの比較が＝＝演算子でできるらしい
hash1 = { "key1" => 'val1', 'key2' => "val2" };
hash2 = { 'key1' => "val1", "key2" => 'val2' };
# やってみる
p hash1 == hash2; # TRUE
# おー、なんかすげえ
# でもこれって、イコールになるってことはオブジェクトのIDを見ているわけじゃなくて、文字列リテラルを比較してるんだよね……
# 厳密に比較したい場合はどうなるの？

# こういう場合って、指してるオブジェクトは別物だけど
str1 = "king";
str2 = 'king';
hash3 = { 'key' => str1 };
hash4 = { 'key' => str2 };
p hash3 == hash4; # まあ、TRUEになるよね
p str1 == str2; # これもTRUEだけど……
p str1.eql?(str2); # こいつもTRUE
p str1.equal?(str2); # こっちだとFALSE
# ってことは……
hash5 = { 'key' => str1 };
p hash3.eql?(hash4); #TRUE あれ……なんか思ってた感じと違う.これFALSEになると思った
p hash3.eql?(hash5); #TRUE  
# まあ、厳密比較は後々調べよう
