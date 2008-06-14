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
	if @x == 0 && @y == 0
	    @x = @zombie.rect.x + rand(51)
	    @y = @zombie.rect.y + rand(51)
	end
	walk()
    end
    def attack
	@x = @player.rect.x
	@y = @player.rect.y
	walk()
    end
    def walk
	if @rect.centery < @y
	    @rect.centery += 3
	elsif @rect.centery > @y
	    @rect.centery -= 3
	end
	if @rect.centerx < @x
	    @rect.centerx += 3
	elsif @rect.centerx > @x
	    @rect.centerx -= 3
	end
	if @rect.centery - @y <= 3
	    if @rect.centery - @y >= -3
		@rect.centery = @y
	    end
	end
	if @rect.centerx - @x <= 3
	    if @rect.centerx - @x >= -3
		@rect.centerx = @x
	    end
	end
	@zombie.rect = @rect
    end
end