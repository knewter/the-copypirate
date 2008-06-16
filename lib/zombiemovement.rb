#CopyPirate
#Copyright (C) 2008  Han Dao
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#You can contact the author at wikipediankiba@gmail.com


class ZombieMovement
  attr_accessor :x , :y

  def initialize zombie
    @zombie = zombie
    @rect = @zombie.rect
    @x = 0
    @y = 0
    @new = Timer.new(5) { random() }
    @new.start()
  end

  def set control
    @player = control.player
  end

  def move
    if @zombie.state == 0
	    roam()
    elsif @zombie.state == 1
	    attack()
    end
  end

  def roam
    @new.check()
    if @x == 0 && @y == 0
	    random()
    end
    if @zombie.rect.x == @x && @zombie.rect.y == @y
	    random()
    end
    walk()
  end

  def random
    choice = rand(2)
    if choice == 0
	    @x = @zombie.rect.x + rand(101)
	    @y = @zombie.rect.y + rand(101)
    elsif choice == 1
	    @x = @zombie.rect.x - rand(101)
	    @y = @zombie.rect.y - rand(101)
    end
  end

  def attack
    @x = @player.rect.x
    @y = @player.rect.y
    walk()
  end

  # NOTE: There has to be a better way than all these nested ifs
  def walk
    if @rect.y < @y
	    @rect.y += 3
    elsif @rect.y > @y
	    @rect.y -= 3
    end
    if @rect.x < @x
      @rect.x += 3
    elsif @rect.x > @x
	    @rect.x -= 3
    end
    if @rect.y - @y <= 3
	    if @rect.y - @y >= -3
        @rect.y = @y
	    end
    end
    if @rect.x - @x <= 3
	    if @rect.x - @x >= -3
        @rect.x = @x
	    end
    end
    @zombie.rect = @rect
  end
end
