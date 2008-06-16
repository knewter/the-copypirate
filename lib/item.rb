#The CopyPirate
#Copyright (C) 2008 Han Dao
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

#You can contact the author at wikipediankiba@gmail.com

class Item
  include Rubygame::Sprites::Sprite
	attr_accessor :rect
  MUSIC_IMAGE_PATH = "data/music.png"
  def initialize
    super
    @image = Rubygame::Surface.load(MUSIC_IMAGE_PATH)
    @rect  = Rubygame::Rect.new(0,0, *@image.size)
  end
  def sets x, y
    @rect.x = x
    @rect.y = y
  end
end
