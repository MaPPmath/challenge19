# # 3d6 go first fair
# # [1, 5, 10, 11, 13, 17]
# # [3, 4, 7,  12, 15, 16]
# # [2, 6, 8,  9,  14, 18]
# go_first_fair = %i{ a c b b a c b c c a a b a c b b a c }

# %i{ d e f g h i j }.each do |sym|
#   6.times { go_first_fair.insert Random.rand(go_first_fair.length), sym }
# end

# print go_first_fair


# dice represented by symbols :a..:j
dice = %i{ A B C D E F G H I J }
dice_distribution = [:A, :B, :C, :D, :E, :F, :G, :H, :I, :B, :I, :C, :J, :H, :E, :I, :H, :F, :G, :E, :F, :H, :J, :C, :E, :F, :A, :D, :J, :D, :G, :F, :E, :C, :I, :C, :J, :A, :E, :H, :A, :I, :A, :D, :B, :A, :I, :J, :G, :C, :G, :J, :G, :D, :F, :B, :B, :D, :B, :H]
dice_combinations = dice.combination(3).to_a

def combination_distribution combination, dice_distribution
  dice_distribution.select { |die| combination.include? die }
end

def die_sides die, dice_distribution
  dice_distribution.each_index.select{|i| dice_distribution[i] == die}.map{|i| i+1}
end

def combination_unfairness combination, dice_distribution
  dice_sides = combination.map {|v| die_sides(v, dice_distribution) }
  dice_unfairness = [0,0,0]
  3.times do |index|
    dice_sides[index].each do |side|
      dice_unfairness[index] +=
        dice_sides[(index+1)%3].select{|other_side| other_side<side}.length *
        dice_sides[(index+2)%3].select{|other_side| other_side<side}.length
    end
  end
  dice_unfairness
end


dice.each do |die|
  puts "#{die} has sides #{die_sides die, dice_distribution}"
end

dice_combinations.each do |combination|
  puts "#{combination} has max advantage #{combination_unfairness(combination, dice_distribution).max}"
end



# output:
# A has sides [1, 27, 38, 41, 43, 46]
# B has sides [2, 10, 45, 56, 57, 59]
# C has sides [3, 12, 24, 34, 36, 50]
# D has sides [4, 28, 30, 44, 54, 58]
# E has sides [5, 15, 20, 25, 33, 39]
# F has sides [6, 18, 21, 26, 32, 55]
# G has sides [7, 19, 31, 49, 51, 53]
# H has sides [8, 14, 17, 22, 40, 60]
# I has sides [9, 11, 16, 35, 42, 47]
# J has sides [13, 23, 29, 37, 48, 52]
# [:A, :B, :C] has max advantage 134
# [:A, :B, :D] has max advantage 117
# [:A, :B, :E] has max advantage 139
# [:A, :B, :F] has max advantage 134
# [:A, :B, :G] has max advantage 124
# [:A, :B, :H] has max advantage 116
# [:A, :B, :I] has max advantage 134
# [:A, :B, :J] has max advantage 128
# [:A, :C, :D] has max advantage 110
# [:A, :C, :E] has max advantage 127
# [:A, :C, :F] has max advantage 112
# [:A, :C, :G] has max advantage 111
# [:A, :C, :H] has max advantage 107
# [:A, :C, :I] has max advantage 99
# [:A, :C, :J] has max advantage 86
# [:A, :D, :E] has max advantage 118
# [:A, :D, :F] has max advantage 107
# [:A, :D, :G] has max advantage 95
# [:A, :D, :H] has max advantage 101
# [:A, :D, :I] has max advantage 109
# [:A, :D, :J] has max advantage 102
# [:A, :E, :F] has max advantage 131
# [:A, :E, :G] has max advantage 119
# [:A, :E, :H] has max advantage 126
# [:A, :E, :I] has max advantage 116
# [:A, :E, :J] has max advantage 100
# [:A, :F, :G] has max advantage 101
# [:A, :F, :H] has max advantage 111
# [:A, :F, :I] has max advantage 102
# [:A, :F, :J] has max advantage 88
# [:A, :G, :H] has max advantage 101
# [:A, :G, :I] has max advantage 117
# [:A, :G, :J] has max advantage 103
# [:A, :H, :I] has max advantage 98
# [:A, :H, :J] has max advantage 84
# [:A, :I, :J] has max advantage 91
# [:B, :C, :D] has max advantage 117
# [:B, :C, :E] has max advantage 139
# [:B, :C, :F] has max advantage 134
# [:B, :C, :G] has max advantage 124
# [:B, :C, :H] has max advantage 116
# [:B, :C, :I] has max advantage 134
# [:B, :C, :J] has max advantage 128
# [:B, :D, :E] has max advantage 121
# [:B, :D, :F] has max advantage 117
# [:B, :D, :G] has max advantage 109
# [:B, :D, :H] has max advantage 101
# [:B, :D, :I] has max advantage 117
# [:B, :D, :J] has max advantage 112
# [:B, :E, :F] has max advantage 139
# [:B, :E, :G] has max advantage 127
# [:B, :E, :H] has max advantage 121
# [:B, :E, :I] has max advantage 139
# [:B, :E, :J] has max advantage 132
# [:B, :F, :G] has max advantage 124
# [:B, :F, :H] has max advantage 116
# [:B, :F, :I] has max advantage 134
# [:B, :F, :J] has max advantage 128
# [:B, :G, :H] has max advantage 106
# [:B, :G, :I] has max advantage 124
# [:B, :G, :J] has max advantage 120
# [:B, :H, :I] has max advantage 116
# [:B, :H, :J] has max advantage 110
# [:B, :I, :J] has max advantage 128
# [:C, :D, :E] has max advantage 126
# [:C, :D, :F] has max advantage 115
# [:C, :D, :G] has max advantage 99
# [:C, :D, :H] has max advantage 109
# [:C, :D, :I] has max advantage 115
# [:C, :D, :J] has max advantage 107
# [:C, :E, :F] has max advantage 90
# [:C, :E, :G] has max advantage 119
# [:C, :E, :H] has max advantage 83
# [:C, :E, :I] has max advantage 86
# [:C, :E, :J] has max advantage 111
# [:C, :F, :G] has max advantage 102
# [:C, :F, :H] has max advantage 78
# [:C, :F, :I] has max advantage 76
# [:C, :F, :J] has max advantage 100
# [:C, :G, :H] has max advantage 103
# [:C, :G, :I] has max advantage 117
# [:C, :G, :J] has max advantage 102
# [:C, :H, :I] has max advantage 72
# [:C, :H, :J] has max advantage 97
# [:C, :I, :J] has max advantage 105
# [:D, :E, :F] has max advantage 128
# [:D, :E, :G] has max advantage 106
# [:D, :E, :H] has max advantage 122
# [:D, :E, :I] has max advantage 126
# [:D, :E, :J] has max advantage 116
# [:D, :F, :G] has max advantage 97
# [:D, :F, :H] has max advantage 112
# [:D, :F, :I] has max advantage 115
# [:D, :F, :J] has max advantage 106
# [:D, :G, :H] has max advantage 91
# [:D, :G, :I] has max advantage 99
# [:D, :G, :J] has max advantage 94
# [:D, :H, :I] has max advantage 109
# [:D, :H, :J] has max advantage 100
# [:D, :I, :J] has max advantage 107
# [:E, :F, :G] has max advantage 111
# [:E, :F, :H] has max advantage 79
# [:E, :F, :I] has max advantage 89
# [:E, :F, :J] has max advantage 111
# [:E, :G, :H] has max advantage 112
# [:E, :G, :I] has max advantage 126
# [:E, :G, :J] has max advantage 110
# [:E, :H, :I] has max advantage 86
# [:E, :H, :J] has max advantage 109
# [:E, :I, :J] has max advantage 115
# [:F, :G, :H] has max advantage 97
# [:F, :G, :I] has max advantage 108
# [:F, :G, :J] has max advantage 94
# [:F, :H, :I] has max advantage 74
# [:F, :H, :J] has max advantage 99
# [:F, :I, :J] has max advantage 103
# [:G, :H, :I] has max advantage 111
# [:G, :H, :J] has max advantage 95
# [:G, :I, :J] has max advantage 108
# [:H, :I, :J] has max advantage 102
