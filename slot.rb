remaining_coins = 100
remaining_points = 0

puts "残りコイン数:#{remaining_coins}"
puts "ポイント:#{remaining_points}"

loop do

  remaining_coins = remaining_coins
  remaining_points = remaining_points

  puts "何コイン入れますか？"
  puts "0(10コイン) 1(30コイン) 2(50コイン) 3(辞める)"
  puts "----------"

  coins_choices = [10, 30, 50]
  player_choice = gets.to_i
  use_coins = coins_choices[player_choice]

  if use_coins == 3
    exit
  else

    puts "エンターを3回押しましょう！"

    number = [9, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1]

    player = gets
    puts "----------------------"

    # １列目
    first_number = rand(9)
    first_before_number = first_number - 1
    first_after_number = first_number + 1

    puts "|#{number[first_before_number]}|||"
    puts "|#{number[first_number]}|||"
    puts "|#{number[first_after_number]}|||"

    player = gets
    puts "----------------------"

    # 2列目
    second_number = rand(1..9)
    second_before_number = second_number - 1
    second_after_number = second_number + 1

    puts "|#{number[first_before_number]}|#{number[second_before_number]}||"
    puts "|#{number[first_number]}|#{number[second_number]}||"
    puts "|#{number[first_after_number]}|#{number[second_after_number]}||"

    player = gets
    puts "----------------------"

    # 3列目
    third_number = rand(1..9)
    third_before_number = third_number - 1
    third_after_number = third_number + 1

    puts "|#{number[first_before_number]}|#{number[second_before_number]}|#{number[third_before_number]}|"
    puts "|#{number[first_number]}|#{number[second_number]}|#{number[third_number]}|"
    puts "|#{number[first_after_number]}|#{number[second_after_number]}|#{number[third_after_number]}|"
    puts "----------------------"

    # コインの計算
    remaining_coins = remaining_coins - use_coins

    # ポイントの計算
    if number[first_number] == 7 && number[second_number] == 7 && number[third_number] == 7
      puts "ラッキーセブン！！"
      get_points = use_coins * 1000
      puts "#{get_points}ポイント獲得！"
      remaining_points = remaining_points + get_points

    elsif (number[first_number] == number[second_number]) && (number[second_number] == number[third_number])
      puts "真ん中が揃いました！"
      get_points = use_coins * 10
      puts "#{get_points}ポイント獲得！"
      remaining_points = remaining_points + get_points

    elsif ((number[first_before_number] == number[second_number]) && (number[second_number] == number[third_after_number])) ||
          ((number[first_after_number] == number[second_number]) && (number[second_number] == number[third_before_number]))
          puts "斜めが揃いました！"
          get_points = use_coins * 5
          puts "#{get_points}ポイント獲得！"
          remaining_points = remaining_points + get_points
    else
      puts "残念！"
    end

    puts "残りコイン数:#{remaining_coins}"
    puts "ポイント:#{remaining_points}"

    # 残コインが0の場合は強制終了
    if remaining_coins == 0
      puts "ゲームは終了しました"
      exit
    end
  end
end
