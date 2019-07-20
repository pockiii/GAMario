--http://tasvideos.org/LuaScripting/Macros.html
--Snes9x: R, L, X, A, right, left, down, up, start, select, Y, B

--valid inputs
local smw = require "src.smw-snes9x"
local INI_CONFIG_FILENAME = "snes9x-config.ini"  -- relative to the folder of the script
local draw = require "snes9x.draw"
local self = {}

local Filter_opacity, Filter_color = 0, "#000000ff"  -- Snes9x specifc / unlisted color
  if Filter_opacity ~= 0 then
		gui.opacity(Filter_opacity/10)
		gui.box(0, 0, draw.Buffer_width, draw.Buffer_height, Filter_color)
		gui.opacity(1.0)
	  end
	  
local floor_mapping = {}
local rightWall_mapping = {} --add left?
local ledge_mapping = {}
	  
local function coords(xcoord, ycoord, _type) 
	local self = { }
	mario_x_abs, mario_y_abs = smw.get_mario_pos_abs()
	local x = xcoord
	local y = ycoord
	local v = _type
	function self.getx()
		return x
	end
	function self.gety()
		return y
	end
	function self.map()
		local x_screenp, y_screenp = smw.screen_coordinates(x, y, camera_x, camera_y)
		if v == "rightWall" then
			--draw.rectangle(x_screenp + 14, y_screenp + 15, 10, 10, 0x800000FF, 0x800000FF)
			--gui.line(mario_x_abs, mario_y_abs + 15, x_screenp + 14, y_screenp + 15, white)
		elseif v == "ledge" then
			--draw.rectangle(x_screenp + 0, y_screenp + 20, 10, 10, 0x7FFFFFFF, 0x7FFFFFFF)
			--gui.line(mario_x_abs, mario_y_abs + 15, x_screenp + 0, y_screenp + 20, white)
		else
			--draw.rectangle(x_screenp, y_screenp + 31, 1, 1, 0x800000FF, 0x800000FF) --draws ground
		end
	end
	function self.compare(x2, y2)
		if x == x2 and y == y2 then return true end --return true if same
		return false
	end     
	return self
end

local function add_ledge_mapping(x, y)
	table.insert(ledge_mapping, coords(x, y, "ledge"))
end

local function remove_ledge(mx) --remove ledge boxes made during death animation
	for i=1,#ledge_mapping do
        if ledge_mapping[i].getx() == nil and ledge_mapping[i].getx() == mx then
                ledge_mapping[i]=nil
        end
	end
end

local function display()

	mario_x, mario_y = smw.get_mario_pos()
	mario_x_abs, mario_y_abs = smw.get_mario_pos_abs()
	mario_left, mario_right, mario_down = smw.get_mario_state()
	
	if mario_left == 1 then
		draw.rectangle(mario_x_abs - 15, mario_y_abs + 15, 15, 15, white, black) --draws box if mario collision left
	end
	if mario_right == 1 then
		draw.rectangle(mario_x_abs + 15, mario_y_abs + 15, 15, 15, white, black)
	end	
	
	if mario_down == 1 then
		draw.rectangle(mario_x_abs, mario_y_abs + 31, 15, 15, white, black)		
	end
	
	gui.pixel(mario_x_abs / 10, (mario_y_abs /10) + 51, 0x7FFFFFFF)
	draw.text(mario_x_abs / 10, (mario_y_abs /10) + 61, "" .. (mario_x_abs / 10).. " " .. (mario_y_abs / 10), black, white)	
end

local function mapping()

	mario_x, mario_y = smw.get_mario_pos()
	mario_x_abs, mario_y_abs = smw.get_mario_pos_abs()
	mario_left, mario_right, mario_down = smw.get_mario_state()
	
	if mario_left == 1 then
	end
	if mario_right == 1 then
		table.insert(rightWall_mapping, coords(mario_x, mario_y, "rightWall"))  

	end	
	
	if mario_down == 1 then
		local a = true 
		--compare new coords to existing coords in array
		for _, x in ipairs(floor_mapping) do
			if x.compare(mario_x, mario_y) then a = false 
			else break end
		end
		--if a then table.insert(floor_mapping, coords(mario_x, mario_y)) end --TODO: remove trail after death
		
		
	end

	for _, x in ipairs(floor_mapping) do
		x.map()
	end
	
	for _, x in ipairs(rightWall_mapping) do
		x.map()
	end
	
	for _, x in ipairs(ledge_mapping) do
		x.map()
	end
	
end

self.remove_ledge = remove_ledge
self.add_ledge_mapping = add_ledge_mapping
self.display = display
self.mapping = mapping
return self