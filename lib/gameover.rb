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

class GameOver
    def initialize data
	@data = data
	@gameover = Rubygame::Surface.load("data/gameover.png")
	@winner = Rubygame::Surface.load("data/win.png")
	@q = Rubygame::EventQueue.new()
    end
    def lose
	@gameover.blit(@data.display.screen,[0,0])
	run()
    end
    def win
	@winner.blit(@data.display.screen,[0,0])
	run()
    end
    def run
	@gameover.blit(@data.display.screen,[0,0])
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
	    @data.display.screen.flip()
	end
    end
end