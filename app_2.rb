require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def home # Menu
  puts "-----------------------------------------------------"
  puts "|     Bienvenue sur 'ILS VEULENT TOUS MA POO' !     |"
  puts "|  Le but du jeu est d'être le dernier survivant !  |"
  puts "-----------------------------------------------------"
end

def init_player # On crée un user_player de la classe HumanPlayer
  print "Quel est ton nom ? "
  player_name = gets.chomp
  puts "Bonjour #{player_name} !"
  user_player = HumanPlayer.new(player_name)
  puts "J'ai crée ton avatar !"
  return user_player 
end

home
# On crée les players 1 et 2 de la classe Player -> José et Josiane
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]
user_player = init_player

while user_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0) # Boucle tant que les points de vie de user_player et player 1, 2 ne sont pas tombés a 0
  puts "#{user_player.show_state}"
  puts "**********************************"
  puts "Quelle action veux-tu effectuer ? "
  puts
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts
  puts "attaquer un joueur en vue :"
  if player1.life_points > 0 # Si player1 a de la vie propose, ça nous propose de l'attaquer en tapant 0
    print "0 - "
    player1.show_state
  end
  if player2.life_points > 0 # Si player2 a de la vie, ça nous propose de l'attaquer en tapant 1
    print "1 - "
    player2.show_state
  end
  puts
  puts "Votre choix ?"
  action = gets.chomp.to_s
  puts "----------------------------------"

  if action == "a"
    user_player.search_weapon
  end
  if action == "s"
    user_player.search_health_pack
  end
  if action == "0" && player1.life_points > 0
    user_player.attacks(player1)
  end
  if action == "1" && player2.life_points > 0
    user_player.attacks(player2)
  end

  puts "----------------------------------"
  
  # Attaque des enemies
  if player2.life_points>0 && player1.life_points> 0 # Si les 2 players ont de la vie, les 2 joueurs nous attaquent
     puts "Les autres joueurs t'attaquent !"
  end
  enemies.each do | player | # Si uniquement 1 player a de la vie, c'est ce player qui va nous attaquer
    if player.life_points>0
      player.attacks(user_player)
    end
  end

end

# -THE END-
puts "**********************************"
puts "****** La partie est finie! ******"
if user_player.life_points > 0
  puts "****** BRAVO!  TU AS GAGNE! ******"
else 
  puts "****** Loser!  TU AS PERDU! ******"
end
puts "**********************************"