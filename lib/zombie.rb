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


class Zombie
  include Rubygame::Sprites::Sprite
  attr_accessor :action, :state, :retainer, :health

  def initialize
    super
    @image = Rubygame::Surface.load("data/zombie.png")
    @rect = Rubygame::Rect.new(0,0,*@image.size)
    @state = 0
    @move = ZombieMovement.new(self)
    @retainer = [@rect.x,@rect.y]
    @health = 3
  end

  # NOTE: This same method has existed in other objects.  Should be a module, or more likely a class they all inherit from.
  def sets x , y , control
    @rect.x = x
    @rect.y = y
    @move.set(control)
  end

  def act
    @move.move()
  end

  def update move , dir
    if dir == 0
	    @rect.x += move
	    @move.x += move
    elsif dir == 1
	    @rect.y += move
	    @move.y += move
    end
  end
end
