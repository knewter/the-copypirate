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

class Camera
    def initialize engine , controller
	@engine = engine
	@controll = controller
	@move = @engine.move
	@mapobj = @engine.mapobj
    end
    def set
	@p = @controll.player
    end
    def compute
	backwardcompute()
	forwardcompute()
    end
    def backwardcompute
	if @p.rect.x < 250
	    move = 250 - @p.rect.x
	    @move += move
	    if leftlimit() == true
		return
	    end
	    xsynchronize(move)
	end
    end
    def forwardcompute
	if @p.rect.x > 350
	    move = @p.rect.x - 350
	    @move -= move
	    if rightlimit() == true
		return
	    end
	    move = -move
	    xsynchronize(move)
	end
    end
    def rightlimit
	if @move < -1600
	    @move = -1600
	    s = @mapobj[0].rect.x + 1600
	    limitactionx(s)
	    return true
	end
	return false
    end
    def leftlimit
	if @move > 0
	    @move = 0
	    s = @mapobj[0].rect.x
	    limitactionx(s)
	    return true
	end
	return false
    end
    def xsynchronize move
	@mapobj.each do |m|
	    m.rect.x += move
	end
	if @engine.poscompute == true
	   @p.rect.x += move
	end
    end
    def limitactionx s
	@mapobj.each do |m|
	    m.rect.x -= s
	end
    end
end