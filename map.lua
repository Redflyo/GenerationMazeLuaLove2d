
	-- Dev Ulysse.B

function createMaze( sizex,sizey )

	map = {}
	for x=1,sizex + 1 do
		map [x] = {}
		for y=1,sizey + 1 do
			map[x][y] = false -- false = not already use
		end
	end

	for num =1,#map do
		map[num][#map] = true -- already use
		map[#map][num] = true 
	end

	bar = createAllBarrier(map) -- if u put barrier to false it's the left or the up who be false

	

	bar,map = depthFirst(map,bar,sizex,sizey)
	

	return bar,map
end


function depthFirst( map,bar,sizex,sizey )
	
	local head = {}
	
	head.x = love.math.random(sizex)
	head.y = love.math.random(sizey)

	
	
	head.history = {}
	head.history[1] = createMemori(head.x,head.y)
	map[head.x][head.y] = true
	while(true) do
		


		local up = head.y - 1
		local down = head.y + 1
		local right = head.x + 1
		local left = head.x - 1	

		local S = false -- Be true if there is a solution

		local n = love.math.random( 4 ) - 1 -- define action random choose
		
		for i=1,4 do
			
			n = n + 1

			if(n == 1)then
				if(alreadyUse(head.x,up,map) == false) then
						
					S = true
					break
				end
			end
			if(n == 2)then
				if(alreadyUse(head.x,down,map) == false) then
						
					S = true
					break
				end
			end
			if(n == 3)then
				if(alreadyUse(left,head.y,map) == false) then
						
					S = true
					break
				end
			end
			if(n == 4)then
				if(alreadyUse(right,head.y,map) == false) then						
					S = true
					break
				end
			
			end

			if(S == false) then
				if(n == 4) then
					n = 0
				end
			else
				i = 4 -- for finish the loop
			end
				

		
		end


	

		if(S == false) then
			
			
			-- Reviens en arrière
			
			if(#head.history == 0) then

			 return bar,map end -- it's finnish
			
			head.x = head.history[#head.history].x
			head.y = head.history[#head.history].y


			table.remove(head.history,#head.history)

			
			 -- remove last event
			

		
		else
		
			-- fais son chemin

	if(n == 1) then
		bar.hor[head.x][head.y] = false
		head.y = up
	else
		if(n == 2) then
			bar.hor[head.x][down] = false
			head.y = down
		else
			if(n == 3) then
				bar.ver[head.x][head.y] = false
				head.x = left
			else
				if(n == 4) then
					bar.ver[right][head.y] = false
					head.x = right
				else
					
				end
			end
		end
	end


		
			local index = #head.history + 1
			head.history[index] = createMemori(head.x,head.y)
			map[head.x][head.y] = true


		end




	end
end

function createMemori( x,y )
	local mem = {}
	mem.x = x
	mem.y = y
	return mem
end

function alreadyUse( x,y,map )
	
	if(x == nil or y == nil) then
		return true
	end

	if(x<1) then
		return true
	end
	if(y<1) then
		return true
	end

	return map[x][y]


end


function createAllBarrier( map )
	local barrier = {}
	barrier.hor = {}
	barrier.ver = {}
	for x=1,#map do
		barrier.ver[x] = {}
		barrier.hor[x] = {}
		for y=1,#map[1]  do
			barrier.ver[x][y] = {}
			barrier.hor[x][y] = {}
			for i=1,2 do
				
				if(i == 1) then
					barrier.ver[x][y] = true
				else
					barrier.hor[x][y] = true
				end

				-------Remove end of maze 

				if(y == #map[1]) then
					barrier.ver[x][y] =false					
				end
				if(x == #map) then
					barrier.hor[x][y] =false					
				end
			
			end


		end
	end



	return barrier
end
function createBarrier( x,y,direction ) -- direction 1 down and direction 2 right
	
	if(direction == 1) then
		local ny = y + 1  
		return true
	
	else
		local nx = x + 1 
		return true
	end
	
	
	

end