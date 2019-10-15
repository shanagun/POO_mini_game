class Player
attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage)
    @life_points = @life_points - damage
    if @life_points <= 0
      puts "le joueur #{@name} a été tué !"
    end
  end

  def attacks(player)
  puts "#{@name} attaque le joueur #{player.name}"
  damage = compute_damage
  puts "#{@name} inflige #{damage} points de dégâts à #{player.name}"
  player.gets_damage(damage)
  end 

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1

    super(name)
    @life_points = 100
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand (1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > @weapon_level then
      @weapon_level = new_weapon
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    elsif new_weapon < @weapon_level
      puts "M@#*#... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    new_life = rand(1..6)

    if new_life == 1 
      puts "Tu n'as rien trouvé..."
    elsif new_life >= 2 && new_life <= 5
      @life_points += 50 
      puts "Bravo, tu as trouvé un pack de 50 points de vie."
    else new_life == 6
      @life_points += 80
      puts "Waow, tu as trouvé un pack de 80 points de vie !"
    end

    if @life_points > 100
      @life_points = 100
      puts "Ta santé est remplie au max."
    end
  end
end