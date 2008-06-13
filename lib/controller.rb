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

class Controller
    def initialize data
	@data = data
	@data.clear()
	@background = Rubygame::Surface.load("data/pine.jpeg")
	undraw()
	@q = Rubygame::EventQueue.new()
    end
    def undraw
	@background.blit(@data.display.screen,[0,0])
    end
    def mode
	loop do
	    @q.each do |ev|
		case ev
		when Rubygame::QuitEvent
		    Rubygame.quit()
		    exit
		when Rubygame::KeyDownEvent
		    case ev.key
		    when Rubygame::K_ESCAPE
			Rubygame.quit()
			exit
		    end
		end
	    end
	end
    end
end
