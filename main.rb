require 'csv'

def start
  
puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.to_i

  if memo_type == 1 
    puts "新規CSVファイルの名前を入力してください。"
    new_file = gets.chomp
    puts "メモの内容を入力してください\n入力が終わったらCtrl + Dを押してください"
    content = readlines
    test = CSV.open("#{new_file}.csv",'w')
    test.puts [content]
    test.close
  
  elsif memo_type == 2
    puts "編集するファイルの名前を入力してください（拡張子は不要です）"
    edit_file = gets.chomp
    puts "追加編集する内容を入力してください。\n入力が終わったらCtrl + Dを押してください。"
    content = readlines
    CSV.open("#{edit_file}.csv",'a') do |csv|
    csv << ["#{content}"]
    end
  
  else
    puts "1か2を入力してください"
    puts "---------------------"
    start()
  end
end

start()


