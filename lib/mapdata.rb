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

class MapData
    def initialize engine
	@engine = engine
	coordinate()
	datacompute()
    end
    def coordinate
	rows = 0
	columns = 0
	loop do
	    a = columns * 80
	    b = rows * 60
	    @engine.c << [a,b]
	    columns += 1
	    if columns == 30:
		rows += 1
		columns = 0
	    end
	    if rows == 30
		return
	    end
	end
    end
    def datacompute
	n = 0
	@engine.obj.m.each do |m|
	    if m == 0:
		image = Rubygame::Surface.load("data/blank.png")
	    elsif m == 1:
		image = Rubygame::Surface.load("data/wall1.png")
	    elsif m == 2:
		image = Rubygame::Surface.load("data/wall2.png")
	    elsif m == 3:
		image = Rubygame::Surface.load("data/wall3.png")
	    elsif m == 4:
		image = Rubygame::Surface.load("data/wall4.png")
	    elsif m == 5:
		image = Rubygame::Surface.load("data/wall5.png")
	    end
	    obj = MapTile.new()
	    obj.imageload(image)
	    obj.sets(@engine.c[n][0],@engine.c[n][1])
	    if m == 0
		obj.property = false
	    end
	    @engine.mapobj << obj
	    @engine.sprites << obj
	    n = n + 1
	end
    end
end