# The CopyPirate
# Copyright (C) 2008  Han Dao
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# You can contact the author at wikipediankiba@gmail.com

class Player
  include Rubygame::Sprites::Sprite
  attr_accessor :actionx, :actiony, :state, :retainer, :rect, :items, :health
  IMAGE_PATH = 'data/player.png'

  def initialize
    super
    @image    = Rubygame::Surface.load(IMAGE_PATH)
    @rect     = Rubygame::Rect.new(350, 550, *@image.size)
    @actionx  = 0
    @actiony  = 0
    @retainer = [@rect.x,@rect.y]
    @health   = 30
    @items    = 0
  end

  def pos
    @rect.x += @x
    @rect.y += @y
  end

  def act
    @x = @actionx
    @y = @actiony
    pos()
  end
end
