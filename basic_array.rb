#!/usr/local/bin/ruby

# 配列関連の勉強

# 定義
ar = [ 1, 2, 3, "str" ]
p ar

# 配列の中に入るのは、全てオブジェクトへの参照
num1 = 1
num2 = 2
str1 = "str2"

# 配列を定義してダンプ
ar2 = [ num1, num2, str1, num1, num2, str1 ]
p ar2

# num1の値を変更
p num1
num1 = 4
p num1

# 配列をダンプ
p ar2	# でもar[0]とar[3]の値は変わらない。オブジェクトのコピー？
# オブジェクトIDで確認してみる
p num1.object_id
p ar2[0].object_id
p ar2[3].object_id
# ar2[0]とar[3]のIDが一緒だけど、num1が違う
num1 = 5
p num1.object_id # 数値を代入し直すと、オブジェクトIDが変わる
# なるほど、num1 = 4 とかやると、num1に新しいオブジェクトを割り当ててるのか
ar2[0] += 1	# こうやっても、ar2[0]にar2[0] + 1 の新しいオブジェクトが割り当てられるだけなので、ar[3]は変わらない
p ar2

# str1の値を変更
p str1
str1[3] = "3" # これは直接オブジェクトを操作しているから、ar[2]とar[5]が両方変わる
p str1

# 配列をダンプ
p ar2	# こうすると、ar｢2｣とar[5]の値が変わる

# 配列の配列
ar2[7] = ar	# 配列の範囲外に代入すると、自動的に埋まるらしい.ar2[6]はnilが代入される
p ar2

