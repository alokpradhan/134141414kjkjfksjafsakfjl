# Put your code here to make the tests pass

class Weapon
	attr_reader :name, :damage
	def initialize(name = nil,damage = nil)
		raise Error if name == nil
		@name = name
		@damage = damage
	end
end

class BattleBot
	attr_reader :name, :health, :weapon, :enemies
	@@count = 0

	def initialize(name, weapon = nil)
		@name = name
		@health = 100
		@weapon = weapon
		@@count += 1
		@enemies = []
	end

	def self.count
		@@count
	end

	def dead?
		@@count -= 1
		@health > 0 ? false : true
	end

	def pick_up(weapon)
		@weapon = weapon if @weapon == nil
	end

	def drop_weapon
		@weapon = nil
	end

	def attack(victim)
		raise Exception.new("no weapon!") if self.weapon == nil				#not passed
		raise ArgumentError if victim.class != BattleBot   #not passed
		victim.take_damage(weapon.damage)
		victim.enemies(self)
	end

	# def take_damage(weapon)

	# end

	def take_damage(damage_amount)
		@health -= damage_amount
		dead?
	end

	def enemies(name = nil)
		# enemies = []
		if name == nil
			return @enemies
		else
			@enemies << name unless @enemies.include?(name)
		end
	end
end