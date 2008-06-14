#The CopyPirate
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

#You can contact the author at wikipediankiba@gmail.com
class ItemTracker
    attr_accessor :items
    def initialize engine , control
	@engine = engine
	@control = control
	@items = []
	@sprites = @control.itemsprites
	datacompute()
    end
    def datacompute
	rows = 0
	columns = 0
	@engine.obj.items.each do |d|
	    a = columns * 80 + @engine.move
	    b = rows * 60 + @engine.height
	    x = a
	    y = b
	    if d == 1:
		@items. << Item.new()
		@items[-1].sets(x,y)
		@sprites.<< @items[-1]
	    end
	    columns = columns + 1
	    if columns == 30:
		rows = rows + 1
		columns = 0
	    end
	    if rows == 30:
		return
	    end
	end
    end
end