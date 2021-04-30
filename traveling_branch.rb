# 旅行プランのデータをハッシュに格納する
plans = [
  {destination: "沖縄旅行", price: 10000},
  {destination: "北海道旅行", price: 20000},
  {destination: "九州旅行", price: 15000}
]

# 旅行プランをeachメソッドを使って表示する
puts "旅行プランを選択して下さい。"
puts ""
plans.each.with_index(1) do |plan, i|
  puts "#{i}. #{plan[:destination]}(#{plan[:price]}円)"
end
puts ""

# プランの番号を選択する。この際、1〜3以外の数字を入力した際には
# 「プランの番号である1〜3を入力して下さい。」と表示して再入力するように促す
while true
  print "プランの番号を選択 > "
  select_plan_num = gets.to_i
  break if (1..3).include?(select_plan_num)
  puts "プランの番号である1〜3を入力して下さい。"
end
chosen_plan = plans[select_plan_num - 1]

# プランの確認を行い、何名で予約するかを入力する。この際、1未満の数字を
# 入力した際には「1人以上の数で入力して下さい。」と表示して再入力を促す
puts <<~TXT
#{chosen_plan[:destination]}ですね。
何名で予約されますか？
TXT
while true
  print "人数を入力 > "
  number_of_people = gets.to_i
  break if number_of_people >= 1
  puts "1人以上の数で入力して下さい。"
end
puts "#{number_of_people}名ですね。"

# 料金の計算を行い、出力する。この時に5人以上の場合は10％割引にする
total_price = chosen_plan[:price] * number_of_people
if number_of_people >= 5
  puts "5名以上ですので10%割引となります。"
  total_price *= 0.9
end
puts "合計料金は#{total_price.floor}円になります。"
