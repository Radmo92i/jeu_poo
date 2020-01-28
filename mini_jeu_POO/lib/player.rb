require "pry"
class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        if @life_points <= 0
            puts "#{name} est mort"
        else
        puts "#{name} a #{life_points} points de vie"
        end
    end

    def gets_damage(dmg)
         @life_points = @life_points - dmg
        if @life_points <= 0
            puts "#{self.name} a été tué!"
        end
    end

    def attacks(player)
        dmgs = compute_damage

        puts "#{self.name} attacks #{player.name}"
        puts "#{self.name} take #{dmgs} life points to #{player.name}"

        player.gets_damage(dmgs)
    end    

    def compute_damage
        rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level
    
    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end
    def show_state
        if @life_points <= 0
            puts "#{name} est mort"
        else
        puts "#{name} a #{life_points} points de vie et un arme de niveau #{@weapon_level}"
        end
    end

    def compute_damage
         rand(1..6)*@weapon_level
    end

    def search_weapon
        new_weapon = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon}"
        puts "Nouvelle arme de niveau #{new_weapon}. L'ancienne est de niveau #{@weapon_level}" 
        if new_weapon > @weapon_level
            puts "Elle est meilleure que ton ancienne"
            @weapon_level = new_weapon
        elsif new_weapon < @weapon_level
            puts  "Elle est moins bonne que ton ancienne"
            new_weapon = @weapon_level
        elsif new_weapon == @weapon_level
            puts "Elle est du meme lvl"
        end
    end

    def search_health_pack
        pack_of_life rand(1..6)
end

     

binding.pry