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

class MapEngine
    attr_accessor :c , :obj, :sprites, :mapobj , :camera , :poscompute , :move , :height , :items
    def initialize(sprites, controller)
	@sprites = sprites
	@m = []
	@c = []
	@mapobj = []
	@obj = MapObj.new()
	@move = 0
	@height = 0
	@poscompute = false
	@items = ItemTracker.new(self,controller)
	@mapdata = MapData.new(self)
	@camera = Camera.new(self,controller)
	@maplaw = MapLaw.new(self,controller)
    end
    def set
	@poscompute = true
	@camera.set()
    end
    def compute
	@maplaw.compute()
	@camera.compute()
    end
end