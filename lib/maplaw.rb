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
	@items = @engine.items.items
	@damage = Timer.new(1) {
	    @p.health -= 2
	    puts"Ouch!"
	    if @p.health < 0
		puts"you're dead"
	    end
	}
	@damage.start()
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
    def enemycollide t , n
	c = 0
	@e.each do |e|
	    if n != c
		if e.rect.collide_rect?(t)
		    return 1
		end
	    end
	    c += 1
	end
    end
    def compute
	subsitute = revert(@p)
	@p = subsitute
	n = 0
	@e.each do |e|
	    t = revert(e)
	    e = t
	    t = enemyrevert(e,n)
	    e = t
	    n += 1
	end
	itemscheck()
	underattack?()
    end
    def revert t
	s = mapcollide(t)
	if s == 1:
	    change(t)
	end
	return t
    end
    def enemyrevert t , n
	e = enemycollide(t,n)
	if e == 1:
	    change(t)
	end
	return t
    end
    def change t
	t.rect.x = t.retainer[0]
	t.rect.y = t.retainer[1]
	return t
    end
    def itemscollide
	n = 0
	@items.each do |i|
	    if i.rect.collide_rect?(@p)
		@p.items += 1
		return n
	    end
	    n += 1
	end
	n = -1
    end
    def itemscheck
	n = itemscollide()
	if n == -1
	    return
	end
	@control.itemsprites.delete(@items[n])
	@items.delete_at(n)
    end
    def underattack?
	@e.each do |e|
	    if e.rect.collide_rect?(@p)
		@damage.check()
	    end
	end
    end
end