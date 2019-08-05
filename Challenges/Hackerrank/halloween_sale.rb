=begin

there is a halloween sale on video games

usually all games are sold at the same price, p
the sale next month lets you buy them at a lower price

the first game you buy during the sale will be sold at p value
every subsequent game will be sold at exactly d dollars less than
the previous cost.

this trend continues until the cost is less than or equal to m
after which each game will cost m

p = 20, d = 3, m = 6

20, 17, 14, 11, 8, 6, 6, 6...

you will be given 4 integers

p, d, m, and s (number of dollars in your wallet)

//

print the number of games you can buy with your money

subtract from s each time a purchase is made
if s will be less than zero, break the loop and return
	the purchase number

for each purchase, increment purchase var by 1

once p - d == m, use the m value as purchase cost

if purchase can be made (s - m or p > 0), 
increment purchases by 1 and subtract m or p from s


=end

def howManyGames(pa, d, m, s)
	counter = 0
	purchases = 0

	loop do
		if counter.zero?
			pa
		elsif pa > m && pa - d > m
			pa -= d
		else
			pa = m
		end

		if s - pa >= 0
			s -= pa
			purchases += 1
		else
			break
		end

		p s
		p pa
		counter += 1
	end

	purchases 
end

#p howManyGames(20, 3, 6, 85)
p howManyGames(16, 2, 1, 9981)
# p howManyGames(1, 100, 1, 9777)
# p howManyGames(13, 86, 8, 9027)

