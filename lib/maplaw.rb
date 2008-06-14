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
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.

#You can contact the author at wikipediankiba@gmail.com

class MapLaw
    def initialize engine , controller
	@engine = engine
	@m = @engine.mapobj
	@control = controller
	@p = @control.player
	@e = @control.enemytrack.target
    end
    def mapcollide t
	@m.each do |m|
	    if m.property == true
		if m.rect.collide_rect?(t):
		    return 1
		end
	    end
	end
	return 2
    end
    def compute
	revert()
    end
    def revert
	s = mapcollide(@p)
	if s == 1:
	    @p.rect.x = @p.retainer[0]
	    @p.rect.y = @p.retainer[1]
	end
    end
end