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

%w{
  rubygems
  rubygame
  rbgooey
  yaml
  lib/starter.rb
  lib/controller.rb
  lib/player.rb
  lib/mapengine.rb
  lib/mapdata.rb
  lib/mapobj.rb
  lib/maptile.rb
  lib/camera.rb
  lib/enemytracker.rb
  lib/zombie.rb
  lib/zombiemovement.rb
  lib/timer.rb
  lib/maplaw.rb
  lib/itemtracker.rb
  lib/item.rb
  lib/gameover.rb
  lib/hud.rb
}.each{|lib| require lib}
include Rubygame
TTF.setup

game = Starter.new
game.ui()
game.play()
