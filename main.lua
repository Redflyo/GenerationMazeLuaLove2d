
require('map')


-- Dev Ulysse.B




bar ={}
map ={}
cel_sizex = 25
cel_sizey = 25
tx = 25
ty = 25
barrierSize = 1

function love.load(  )
	love.window.setMode(1366,768)
	--success = love.window.setFullscreen( true )
	love.graphics.setLineWidth( barrierSize )
	bar = createMaze(tx,ty)
end

function love.update( dt )
	
end

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end
   if(key == "space") then

   		bar,map = createMaze(tx,ty)
   		
   end
end

function love.draw(  )
	
	for xi=1,#bar.hor do
		for yi=1,#bar.hor[xi] do
			if(bar.hor[xi][yi]) then

				local x1 = (cel_sizex + barrierSize) * (xi)
				local y1 = (cel_sizey + barrierSize) * (yi)
				local x2 = x1 + cel_sizex
				

				love.graphics.line(x1,y1,x2,y1)

			end
		end
	end
	for xj=1,#bar.ver do
		for yj=1,#bar.ver[xj] do
			if(bar.ver[xj][yj]) then

				local x1 = (cel_sizex + barrierSize) * (xj)
				local y1 = (cel_sizey + barrierSize) * (yj)
				local y2 = y1 + cel_sizey + barrierSize
				

				love.graphics.line(x1,y1,x1,y2)

			end
		end	
	end
end