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
#
#You can contact the author at wikipediankiba@gmail.com

class Starter
    def initialize
	@data = UiData.new("data/setup.yml")
	@q = Rubygame::EventQueue.new()
	@background = Rubygame::Surface.load("data/titlescreen.jpeg")
	@background.blit(@data.display.screen,[0,0])
    end
    def ui
	@data.declare(:menu)
	@data.imageui.add("play.png",300,400)
	@data.imageui.active() {
	    Controller.new(@data)
	}
	@data.imageui.add("quit.png",450,400)
	@data.imageui.active() {
	    Rubygame.quit()
	    exit
	}
    end
    def play
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
		when Rubygame::MouseDownEvent
		    @data.collide.check()
		end
		@data.mouse.tell(ev)
	    end
	    @data.mouse.update()
	    @data.display.screen.flip()
	end
    end
end