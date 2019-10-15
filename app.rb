require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# On crée player1 et player2 
player1 = Player.new("Josiane")
player2 = Player.new("José")

puts 
puts "Voici l'état de chaque joueur :"
puts 
puts "#{player1.show_state}"
puts "#{player2.show_state}"
puts "---------------------------"
puts 
puts "Passons à la phase d'attaque :"
puts 
while player1.life_points > 0 && player2.life_points > 0 # Tant que un des joueurs a ses points de vie > 0 alors il y a COMBAT
puts "#{player1.attacks(player2)}"
break if player2.life_points <= 0 # Si la vie du player 2 descend en dessous de 0 la boucle s'arrête 
puts "#{player2.attacks(player1)}"
gets.chomp
end