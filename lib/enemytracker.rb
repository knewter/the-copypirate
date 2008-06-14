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

#You can contact the author at wikipediankiba@gmail.com

class EnemyTracker
    attr_accessor :target
    def initialize controller
	@control = controller
	@target = []
	@location = []
	generate()
    end
    def datacompute()
	rows = 0
	columns = 0
	loop do
	    a = columns * 80
	    b = rows * 60
	    @location << [a,b]
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
    def generate
	datacompute()
    end
end