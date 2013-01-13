#!/usr/bin/ruby

# 引数は、ARGV変数で受け取る

p ARGV
print "Argment length is ", ARGV.length, "\n"

# ファイルIOを使用して、自分自身を読み取り専用で読み込む
self_filename = "./io.rb"; 
File.open(self_filename, 'r'){|f|

	line = f.gets # 一行取得
	print line# 表示

} # ブロックを抜けると、Rubyが自動的にリソースをcloseしてくれるので、
#　通常はそこまでリソース管理を意識しなくていい

# モード一覧
# r	読み取り専用、ファイルがなければ例外
# w	書き込み専用、常に新規ファイル作成、既存のファイルは上書き
# r+	読み書き両用、ファイルが無ければ例外
# w+	読み書き両用、常に新規ファイル作成、既存のファイルは上書き
# a	追記専用、書き込みはファイルの末尾に追記、なければ新規作成
# a+	読み書き両用、書き込みはファイルの末尾に追記、なければ新規作成
# b	バイナリモード、b+aのように他のモードと組み合わせて追記
# 他にもビット指定で更に細かく制御可能だが、それは本を読め

# currtime.txt というファイルを作って、現在時間を書き込む
curtime_filename = './curtime.txt';
File.open(curtime_filename, 'a'){ |f|
	print "Write file name is #{curtime_filename}, and Current time is #{Time.now}\n"
	f.puts Time.now
}

# イテレータを使って各行ごとにアクセス
File.open(self_filename,'r'){ |f|
	# each_lineメソッドでイテレーション
	f.each_line do |line|
		# Fileっていう文字列が含まれている行をすべて表示してみる
		print line if line.index("File");
	end
}

# ランダムアクセスも可能
File.open(self_filename,'r'){ |f|
	p f.pos		# ファイルポインタの現在位置を取得
	p f.gets	# 一行読んでポインタを進める
	p f.pos		# ポインタの現在位置を確認
	f.pos -= 5	# ポインタを5バイト戻す
	p f.gets	# 戻した場所からまた一行取得
	f.seek(-22,File::SEEK_END)	# ファイルの末尾22バイト前に移動
	# seekメソッドに渡せるのは、SEEK_SET(ファイル先頭）、SEEK_CUR(現在位置）、SEEK_END（ファイル末尾）がある
	p f.pos
	f.seek(0,File::SEEK_END)
	p f.gets	# ファイルの末尾でgetsすると、nilが返る
}

# ブロックを使わずに、普通にオブジェクトとしてFileIOの管理も可能
# ただし、しっかり明示的にcloseの必要あり

f_io = File.open(self_filename, 'r')
$stderr.print f_io.gets	# 標準入出力やエラーは$stdoutや$stderrで定義されているので、そのポインタのprintメソッドを呼び出すことで制御可能?
# 標準入力	変数:$stdin	初期値:STDIN
# 標準出力	変数:$stdout	初期値:STDOUT
# 標準エラー	変数:$stderr	初期値:STDERR
f_io.close	# ブロックで管理されないリソースは、必ず手動でclose


# 他にも、ARGFとかStringIOとかのIO系があるみたいだよ
# 1.9では、ファイル読み込み時に外部エンコーディングと内部エンコーディングの変換が必要だよ
