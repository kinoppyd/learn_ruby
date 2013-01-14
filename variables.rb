#!/usr/bin/ruby

# 変数は、オブジェクトへのポインタ
val1 = "new object"	# 変数val1に、Stringオブジェクトの参照を代入
p val1			# オブジェクトをダンプ
val2 = val1		# val1に入っている参照を、val2にコピー。2つの変数は同じオブジェクトを指す
p val2			# 当然、"new object"がダンプされる
val2[1] = ?o		# val2で指しているStringオブジェクトの2文字目を"o"で置換
p val2			# "now object"がダンプされる
p val1			# 同一のオブジェクトを指しているので、val1のダンプも変更されている

# 引数の文字列の先頭をbに変更するサブルーチンを定義
def string_change(string_line)
	string_line[0] = ?b;
end

# サブルーチンに渡されるのは参照のため、サブルーチン内での変更は元の変数が指し示すオブジェクトに影響する
string_change(val1)
p val1
p val2			# このように、元のオブジェクトが変更される

# このような副作用を避けるためには、仮引数で渡されたオブジェクトの参照をコピーして変更を行う
# 引数の文字列のコピーを取り、先頭の文字をlに変更するサブルーチンを定義
def string_change_safe(string_line)
	string_line = string_line.dup	# オブジェクトのdupメソッドを使いコピーする
	string_line[0] = ?l;
	p string_line
end

string_change_safe(val1)	# これを呼び出しても、変更されるのはコピーなので元の変数に影響は無い
p val1				# "bow object"がダンプされる

# 変数には様々な種類がある。先頭文字でその種類を区別する
# 先頭文字			種類			デフォルト値			名前の例
# 小文字またはアンダースコア	ローカル変数		参照する前に代入が必要		local_variable
# @				インスタンス変数	nil				@instance_variable
# @@				クラス変数		参照する前に代入が必要		@@class_variable
# $				グローバル変数		nil				$global_variable
# 大文字			定数			参照する前に代入が必要		CONSTANT_VALUE

# ローカル変数のスコープは、defやclassで分離される
def increment(num)
	num += 1
	return num
end
def declement(num)
	num -= 1
	return num
end

# numという名前の変数は各defのスコープで分離されているので、更に上のスコープで参照することはできない
p increment(1)
p increment(1)
p declement(2)
p increment( declement(3) )
# p num  この呼び出しは、例外を発生する。このスコープでnumという変数が定義されていないので

# $で始まる変数はグローバル変数（perlだと変数名の頭に$つくから、混同しないようにせんと）
def print_hoge
	$hoge_string = "hoge\n"		# これはグローバル変数
	print $hoge_string
end

p $hoge_string		# $hoge_stringはグローバル変数なので、defのスコープ外でも参照可能.(ただしここではまだ初期化されていないのでnil)
print_hoge		# ここではじめて$hoge_stringが初期化される
p $hoge_string		# 初期化された値にアクセスできる

# 大文字で始まる変数は、定数
CONST_HUGA_STRING = "huga\n"

print CONST_HUGA_STRING
CONST_HUGA_STRING = "boo\n"	# 実は変更できるんだけど、変更するとrubyの処理系から警告が出る
print CONST_HUGA_STRING		# 変更されてる

# 擬似変数と呼ばれるものは、以下の7つ
# nil		値がない、という状態を示すオブジェクト,nullと違い、オブジェクトが無いということを示すオブジェクト
# true		真値。Rubyでは、nilと下記のfalse以外はすべて真として評価されるが、これはその代表
# false		偽値。nilとfalseのみが、評価式の偽値として扱われる
# self		「現在の」オブジェクトを表す値。Java,C#のthisと似た働き。OOにおける、メッセージのレシーバ。
# __FILE__	呼び出された場所のソースファイル名を表す。変更不可の値
# __LINE__	呼び出された場所の行番号を表す。Integerオブジェクトの参照
# __ENCODING__	Ruby1.9以降で採用。呼び出された場所のソースコードのエンコーディングを表す
p self		# => main
p __FILE__	# => "variable.rb"
p __LINE__	# => 85


# 変数宣言において、大文字小文字は区別される
# したがって、big_endianとbig_Endianという変数は別物として扱われる
# また、慣習として変数名にはスネークケースを用いることが推奨されている。ただし、クラス名のみはパスカルケースが推奨される

# Rubyの予約語
# BEGIN	class	ensure	nil	self	when
# END	def	false	not	super	while
# alias	defined?	for	or	then	yield
# and	do	if	redo	true
# begin	else	in	rescue	undef
# break	elsif	module	retry	unless
# case	end	next	return	untill
