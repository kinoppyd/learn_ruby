#!/usr/bin/ruby

# ハッシュの定義
test_hash = { "hoge" => "huga", 108 => "波動球" };
# とりあえずダンプしてみる
p test_hash;
# 個別にアクセス
p test_hash["hoge"];
p test_hash[108];
# なんか、数字をキーにした場合って、配列と見た目あんま区別つかない気がするんだけど……
