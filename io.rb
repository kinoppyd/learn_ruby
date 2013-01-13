#!/usr/bin/ruby

# 引数は、ARGV変数で受け取る

p ARGV
print "Argment length is ", ARGV.length, "\n"

# ファイルIOを使用して、自分自身を読み取り専用で読み込む
File.open("./io.rb", 'r'){|f|

	line = f.gets # 一行取得
	print line# 表示

} # ブロックを抜けると、Rubyが自動的にリソースをcloseしてくれるので、
#　通常はそこまでリソース管理を意識しなくていい

# currtime.txt というファイルを作って、現在時間を書き込む
curtime_filename = './curtime.txt';
File.open(curtime_filename, 'a'){ |f|
	print "Write file name is #{curtime_filename}, and Current time is #{Time.now}\n"
	f.puts Time.now
}
