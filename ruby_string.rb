#!/usr/bin/ruby

# 文字列の勉強
#
# Ruby1.8と1.9の間で、かなり挙動が違う
# 1.9ではマルチバイト文字のサポートが強力になった

# Stringはもちろん文字列なので、newでオブジェクトを作成することも可能
str = String.new
str << 72 << 101 << 108 << 108 << 111 # H e l o を表すASCIIコード
p str # Hello

# 普通に文字リテラルを使うときは、シングルorダブルのクオートで囲む
hello = "Hello"
p hello		# Hello
p 'Hello'	# Hello
# だいたい他の言語と同じで、ダブルクォートは変数展開やバックスラッシュ解釈を行い、シングルクォートは行わない
# シングルクォートが理解するのは、\'と\\のみ

helowo = "Hello\nWorld\n"	
print helowo	# Hello改行World改行
p helowo	# こっちはエスケープが解釈されずに出力される。ダンプだから。

# ダブルクォートの中では、#{}で囲まれた中の式がRubyの式として展開される
# #{}内では、to_sメソッドを使用して文字リテラルとして取り出す
p "Hello World #{ sprintf('%03d',7) }"	# Hello world 007

# to_sメソッドは、まあtoString()
p true.to_s	# true
p 100.to_s	# 100
p nil.to_s	# （空の文字列）

# これもperlとかと同じ感じで、バッククォートで囲むと、囲まれた文字列に対してシステムコールが呼び出されて実行される
p `pwd`		# shellのpwdと同じ結果が返される
find_cmd_str = "find . -depth 1"
p `find_cmd_str`	# これは効かない
p `#{find_cmd_str}`	# これは効く

# パーセント表記。コレは面白い
# %のあとに任意の識別子を指定して囲むと、文字列リテラルとして解釈される。オプションいろいろあり
# エスケープが多い場合に使うと有効
p %q!hogehoge!	# hogehoge
print %@boo"/"boo\n@	# boo"/"boo 

# ヒアドキュメント
heredocument = <<EOS # <<のあとにスペースが入っちゃいけない
SELECT *
FROM hoge
WHERE create_date < '2012-12-16 00:00:00'
EOS
print heredocument
# ヒアドキュメントは、文字列リテラルを突っ込めるところならどこでもいいっぽい(オライリーのサンプルコード参照)
# ヒアドキュメントをはじめるときの文字列を囲むクォートによって、バックスラッシュの挙動が変わるらしい
here1 = <<'EOS'
hoge\nhoge
EOS
p here1 # バックスラッシュが展開されない
here2 = <<"EOS" 
hoge\nhoge
EOS
p here2 # バックスラッシュが展開される.ちなみに、クォートを省略すると、ダブルクォートと同じ挙動になる

# 文字列の基礎はこんなかんじか……
# 残りは正規表現とか、色々と応用系
