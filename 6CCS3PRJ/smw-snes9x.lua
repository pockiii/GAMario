	---------------------------------------------------------------------------
	--  Super Mario World (U) Utility Script for Snes9x - rr version
	--  https://github.com/snes9x-rr/snes9x
	--
	--  Author: Rodrigo A. do Amaral (Amaraticando)
	--  Git repository: https://github.com/rodamaral/smw-tas
	---------------------------------------------------------------------------

	--#############################################################################
	-- CONFIG:
	local yeet = {}
	local INI_CONFIG_FILENAME = "snes9x-config.ini"  -- relative to the folder of the script

	-- GD images dumps (encoded)
	local GD_IMAGES_DUMPS = {}
	GD_IMAGES_DUMPS.player_blocked_status = {255, 254, 0, 7, 0, 10, 1, 255, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80, 0, 0, 0, 248, 64, 112, 0, 248, 216, 112, 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 176, 40, 96, 0, 176, 40, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 248, 112, 104, 0, 248, 208, 192, 0, 0, 0, 0, 0, 248, 208, 192, 0, 248, 208, 192, 0, 248, 208, 192, 0, 136, 88, 24, 0, 0, 0, 0, 0, 248, 112, 104, 0, 248, 208, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80, 0, 0, 0, 136, 88, 24, 0, 136, 88, 24, 0, 32, 48, 136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 136, 88, 24, 0, 136, 88, 24, 0, 248, 248, 248, 0, 128, 216, 200, 0, 32, 48, 136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 248, 248, 248, 0, 136, 88, 24, 0, 64, 128, 152, 0, 128, 216, 200, 0, 32, 48, 136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 136, 88, 24, 0, 136, 88, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	GD_IMAGES_DUMPS.goal_tape = {255, 254, 0, 18, 0, 6, 1, 255, 255, 255, 255, 107, 153, 153, 153, 38, 75, 75, 75, 0, 63, 63, 63, 0, 63, 63, 63, 0, 63, 63, 63, 0, 63, 63, 63, 0, 63, 63, 63, 0, 63, 63, 63, 0, 63, 63, 63, 0, 63, 63, 63, 0, 63, 63, 63, 0, 63, 63, 63, 0, 63, 63, 63, 0, 63, 63, 63, 0, 63, 63, 63, 0, 63, 63, 63, 0, 63, 63, 63, 0, 63, 63, 63, 32, 84, 84, 84, 0, 186, 186, 186, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 62, 62, 62, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 248, 248, 248, 0, 55, 55, 55, 0, 216, 216, 216, 0, 216, 216, 216, 0, 216, 216, 216, 0, 216, 216, 216, 0, 216, 216, 216, 0, 216, 216, 216, 0, 216, 216, 216, 0, 216, 216, 216, 0, 216, 216, 216, 0, 216, 216, 216, 0, 216, 216, 216, 0, 216, 216, 216, 0, 216, 216, 216, 0, 216, 216, 216, 0, 216, 216, 216, 0, 216, 216, 216, 0, 216, 216, 216, 33, 75, 75, 75, 0, 136, 136, 136, 0, 176, 176, 176, 0, 176, 176, 176, 0, 176, 176, 176, 0, 176, 176, 176, 0, 176, 176, 176, 0, 176, 176, 176, 0, 176, 176, 176, 0, 176, 176, 176, 0, 176, 176, 176, 0, 176, 176, 176, 0, 176, 176, 176, 0, 176, 176, 176, 0, 176, 176, 176, 0, 176, 176, 176, 0, 176, 176, 176, 0, 176, 176, 176, 106, 160, 160, 160, 40, 60, 60, 60, 0, 40, 40, 40, 0, 40, 40, 40, 0, 40, 40, 40, 0, 40, 40, 40, 0, 40, 40, 40, 0, 40, 40, 40, 0, 40, 40, 40, 0, 40, 40, 40, 0, 40, 40, 40, 0, 40, 40, 40, 0, 40, 40, 40, 0, 40, 40, 40, 0, 40, 40, 40, 0, 40, 40, 40, 0, 40, 40, 40, 0, 40, 40, 40}

	-- Input key names
	local INPUT_KEYNAMES = { -- Snes9x
	  xmouse=0, ymouse=0, leftclick=false, rightclick=false, middleclick=false,
	  shift=false, control=false, alt=false, capslock=false, numlock=false, scrolllock=false,
	  ["false"]=false, ["1"]=false, ["2"]=false, ["3"]=false, ["4"]=false, ["5"]=false, ["6"]=false, ["7"]=false, ["8"]=false,["9"]=false,
	  A=false, B=false, C=false, D=false, E=false, F=false, G=false, H=false, I=false, J=false, K=false, L=false, M=false, N=false,
	  O=false, P=false, Q=false, R=false, S=false, T=false, U=false, V=false, W=false, X=false, Y=false, Z=false,
	  F1=false, F2=false, F3=false, F4=false, F5=false, F6=false, F7=false, F8=false, F9=false, F1false=false, F11=false, F12=false,
	  F13=false, F14=false, F15=false, F16=false, F17=false, F18=false, F19=false, F2false=false, F21=false, F22=false, F23=false, F24=false,
	  backspace=false, tab=false, enter=false, pause=false, escape=false, space=false,
	  pageup=false, pagedown=false, ["end"]=false, home=false, insert=false, delete=false,
	  left=false, up=false, right=false, down=false,
	  numpadfalse=false, numpad1=false, numpad2=false, numpad3=false, numpad4=false, numpad5=false, numpad6=false, numpad7=false, numpad8=false, numpad9=false,
	  ["numpad*"]=false, ["numpad+"]=false, ["numpad-"]=false, ["numpad."]=false, ["numpad/"]=false,
	  tilde=false, plus=false, minus=false, leftbracket=false, rightbracket=false,
	  semicolon=false, quote=false, comma=false, period=false, slash=false, backslash=false
	}

	-- END OF CONFIG < < < < < < <
	--#############################################################################
	-- INITIAL STATEMENTS:


	print("Starting script")

	-- Load environment
	package.path = package.path .. ";" .. "src/lib/?.lua"
	local gui, input, joypad, emu, movie, memory = gui, input, joypad, emu, movie, memory
	local unpack = unpack or table.unpack
	local string, math, table, next, ipairs, pairs, io, os, type = string, math, table, next, ipairs, pairs, io, os, type
	local bit = require"bit"

	local luap = require "luap"
	local config = require "config"
	config.filename = "./config/" .. INI_CONFIG_FILENAME
	config.load_options(config.filename)
	config.raw_data = {["SNES9X OPTIONS"] = OPTIONS}

	local smw = require "smw"
	local draw = require "snes9x.draw"

	local OPTIONS = config.OPTIONS
	local COLOUR = config.COLOUR
	local SNES9X_FONT_HEIGHT = config.SNES9X_FONT_HEIGHT
	local SNES9X_FONT_WIDTH = config.SNES9X_FONT_WIDTH
	local LEFT_ARROW = config.LEFT_ARROW
	local RIGHT_ARROW = config.RIGHT_ARROW

	-- Script tries to verify whether the emulator is indeed Snes9x-rr
	if snes9x == nil then
	  error("This script works with Snes9x-rr emulator.")
	end

	local fmt = string.format
	local floor = math.floor

	-- Compatibility of the memory read/write functions
	local u8 =  memory.readbyte
	local s8 =  memory.readbytesigned
	local w8 =  memory.writebyte
	local u16 = memory.readword
	local s16 = memory.readwordsigned
	local w16 = memory.writeword
	local u24 = function(address, value) return 256*u16(address + 1) + u8(address) end
	local s24 = function(address, value) return luap.signed16(256*u16(address + 1) + u8(address), 24) end
	local w24 = function(address, value) w16(address + 1, floor(value/256)) ; w8(address, value%256) end

	-- Images (for gd library)
	local IMAGES = {}
	IMAGES.player_blocked_status = string.char(unpack(GD_IMAGES_DUMPS.player_blocked_status))
	IMAGES.goal_tape = string.char(unpack(GD_IMAGES_DUMPS.goal_tape))

	-- Hotkeys availability
	if INPUT_KEYNAMES[OPTIONS.hotkey_increase_opacity] == nil then
	   print(string.format("Hotkey '%s' is not available, to increase opacity.", OPTIONS.hotkey_increase_opacity))
	else print(string.format("Hotkey '%s' set to increase opacity.", OPTIONS.hotkey_increase_opacity))
	end
	if INPUT_KEYNAMES[OPTIONS.hotkey_decrease_opacity] == nil then
	   print(string.format("Hotkey '%s' is not available, to decrease opacity.", OPTIONS.hotkey_decrease_opacity))
	else print(string.format("Hotkey '%s' set to decrease opacity.", OPTIONS.hotkey_decrease_opacity))
	end


	--#############################################################################
	-- GAME AND SNES SPECIFIC MACROS:


	local NTSC_FRAMERATE = 60.0

	local SMW = smw.constant
	local WRAM = smw.WRAM
	local X_INTERACTION_POINTS = smw.X_INTERACTION_POINTS
	local Y_INTERACTION_POINTS = smw.Y_INTERACTION_POINTS
	local HITBOX_SPRITE = smw.HITBOX_SPRITE
	local OBJ_CLIPPING_SPRITE = smw.OBJ_CLIPPING_SPRITE
	local HITBOX_EXTENDED_SPRITE = smw.HITBOX_EXTENDED_SPRITE
	local HITBOX_CLUSTER_SPRITE = smw.HITBOX_CLUSTER_SPRITE
	local SPRITE_MEMORY_MAX = smw.SPRITE_MEMORY_MAX
	local OSCILLATION_SPRITES = smw.OSCILLATION_SPRITES
	local ABNORMAL_HITBOX_SPRITES = smw.ABNORMAL_HITBOX_SPRITES
	local GOOD_SPRITES_CLIPPING = smw.GOOD_SPRITES_CLIPPING
	local UNINTERESTING_EXTENDED_SPRITES = smw.UNINTERESTING_EXTENDED_SPRITES

	--#############################################################################
	-- GETTERS:
	local g_left = 0
	local g_right = 0
	local g_down = 0
	local nearest_enemy = 0
	
	--#############################################################################
	-- SCRIPT UTILITIES:


	-- Variables used in various functions
	local Cheat = {}  -- family of cheat functions and variables
	local Previous = {}
	local User_input = INPUT_KEYNAMES -- Snes9x
	local Joypad = {}
	local Layer1_tiles = {}
	local Layer2_tiles = {}
	local Is_lagged = nil
	local Options_menu = {show_menu = false, current_tab = "Show/hide options"}
	local Filter_opacity, Filter_color = 0, "#000000ff"  -- Snes9x specifc / unlisted color
	local Mario_boost_indicator = nil
	local Show_player_point_position = false
	local Sprites_info = {}  -- keeps track of useful sprite info that might be used outside the main sprite function
	local Sprite_hitbox = {}  -- keeps track of what sprite slots must display the hitbox

	-- Initialization of some tables
	for i = 0, SMW.sprite_max -1 do
	  Sprites_info[i] = {}
	end
	for key = 0, SMW.sprite_max - 1 do
	  Sprite_hitbox[key] = {}
	  for number = 0, 0xff do
		Sprite_hitbox[key][number] = {["sprite"] = true, ["block"] = GOOD_SPRITES_CLIPPING[number]}
	  end
	end


	function bit.test(value, bitnum)  -- Snes9x
	  return bit.rshift(value, bitnum)%2 == 1
	end


	local function mouse_onregion(x1, y1, x2, y2) 
	  -- Reads external mouse coordinates
	  local mouse_x = User_input.xmouse
	  local mouse_y = User_input.ymouse

	  -- From top-left to bottom-right
	  if x2 < x1 then
		x1, x2 = x2, x1
	  end
	  if y2 < y1 then
		y1, y2 = y2, y1
	  end
	  local xp = s16(WRAM.x)
		local yp = s16(WRAM.y)
		local x_screenp, y_screenp = screen_coordinates(xp, yp, Camera_x, Camera_y) --!important, set coords to absolute\
		
		gui.line( 
		x_screenp + 5, 
		y_screenp + 20, 
		x, 
		y, 
		white)
		
	  if mouse_x >= x1 and mouse_x <= x2 and  mouse_y >= y1 and mouse_y <= y2 then
		return true
	  else
		return false
	  end
	end


	-- Register a function to be executed on key press or release
	-- execution happens in the main loop
	local Keys = {}
	Keys.press = {}
	Keys.release = {}
	Keys.down, Keys.up, Keys.pressed, Keys.released = {}, {}, {}, {}
	function Keys.registerkeypress(key, fn)
	  Keys.press[key] = fn
	end
	function Keys.registerkeyrelease(key, fn)
	  Keys.release[key] = fn
	end


	-- A cross sign with pos and size
	gui.crosshair = gui.crosshair or function(x, y, size, color)
	  gui.line(x - size, y, x + size, y, color)
	  gui.line(x, y-size, x, y+size, color)
	end


	local Movie_active, Readonly, Framecount, Lagcount, Rerecords
	local Lastframe_emulated, Starting_subframe_last_frame, Size_last_frame, Final_subframe_last_frame
	local Nextframe, Starting_subframe_next_frame, Starting_subframe_next_frame, Final_subframe_next_frame
	local function snes9x_status()
	  Movie_active = movie.active()  -- Snes9x
	  Readonly = movie.playing()  -- Snes9x
	  Framecount = movie.length()
	  Lagcount = emu.lagcount() -- Snes9x
	  Rerecords = movie.rerecordcount()

	  -- Last frame info
	  Lastframe_emulated = emu.framecount()

	  -- Next frame info (only relevant in readonly mode)
	  Nextframe = Lastframe_emulated + 1

	end


	-- returns the (x, y) position to start the text and its length:
	-- number, number, number text_position(x, y, text, font_width, font_height[[[[, always_on_client], always_on_game], ref_x], ref_y])
	-- x, y: the coordinates that the refereed point of the text must have
	-- text: a string, don't make it bigger than the buffer area width and don't include escape characters
	-- font_width, font_height: the sizes of the font
	-- always_on_client, always_on_game: boolean
	-- ref_x and ref_y: refer to the relative point of the text that must occupy the origin (x,y), from 0% to 100%
	--            for instance, if you want to display the middle of the text in (x, y), then use 0.5, 0.5
	local function text_position(x, y, text, font_width, font_height, always_on_client, always_on_game, ref_x, ref_y)
	  -- Reads external variables
	  local border_left    = 0
	  local border_right   = 0
	  local border_top    = 0
	  local border_bottom  = 0
	  local buffer_width   = 256
	  local buffer_height  = 224

	  -- text processing
	  local text_length = text and string.len(text)*font_width or font_width  -- considering another objects, like bitmaps

	  -- actual position, relative to game area origin
	  x = (not ref_x and x) or (ref_x == 0 and x) or x - floor(text_length*ref_x)
	  y = (not ref_y and y) or (ref_y == 0 and y) or y - floor(font_height*ref_y)

	  -- adjustment needed if text is supposed to be on screen area
	  local x_end = x + text_length
	  local y_end = y + font_height

	  if always_on_game then
		if x < 0 then x = 0 end
		if y < 0 then y = 0 end

		if x_end > buffer_width  then x = buffer_width  - text_length end
		if y_end > buffer_height then y = buffer_height - font_height end

	  elseif always_on_client then
		if x < -border_left then x = -border_left end
		if y < -border_top  then y = -border_top  end

		if x_end > buffer_width  + border_right  then x = buffer_width  + border_right  - text_length end
		if y_end > buffer_height + border_bottom then y = buffer_height + border_bottom - font_height end
	  end

	  return x, y, text_length
	end


	-- Returns frames-time conversion
	local function frame_time(frame)
	  if not NTSC_FRAMERATE then error("NTSC_FRAMERATE undefined."); return end

	  local total_seconds = frame/NTSC_FRAMERATE
	  local hours = floor(total_seconds/3600)
	  local tmp = total_seconds - 3600*hours
	  local minutes = floor(tmp/60)
	  tmp = tmp - 60*minutes
	  local seconds = floor(tmp)

	  local miliseconds = 1000* (total_seconds%1)
	  if hours == 0 then hours = "" else hours = string.format("%d:", hours) end
	  local str = string.format("%s%.2d:%.2d.%03.0f", hours, minutes, seconds, miliseconds)
	  return str
	end


	-- displays a button everytime in (x,y)
	-- object can be a text or a dbitmap
	-- if user clicks onto it, fn is executed once
	local Script_buttons = {}
	local function create_button(x, y, object, fn, extra_options)
	  local always_on_client, always_on_game, ref_x, ref_y, button_pressed
	  if extra_options then
		always_on_client, always_on_game, ref_x, ref_y, button_pressed = extra_options.always_on_client, extra_options.always_on_game,
										extra_options.ref_x, extra_options.ref_y, extra_options.button_pressed
	  end

	  local width, height
	  local object_type = type(object)

	  if object_type == "string" then
		width, height = SNES9X_FONT_WIDTH, SNES9X_FONT_HEIGHT
		x, y, width = text_position(x, y, object, width, height, always_on_client, always_on_game, ref_x, ref_y)
	  elseif object_type == "boolean" then
		width, height = SNES9X_FONT_WIDTH, SNES9X_FONT_HEIGHT
		x, y = text_position(x, y, nil, width, height, always_on_client, always_on_game, ref_x, ref_y)
	  else error"Type of buttton not supported yet"
	  end

	  -- draw the button
	  if button_pressed then
		draw.rectangle(x, y, width, height, "white", "#d8d8d8ff")  -- unlisted colours
	  else
		draw.rectangle(x, y, width, height, "#606060ff", "#b0b0b0ff")
	  end
	  gui.line(x, y, x + width, y, button_pressed and "#606060ff" or "white")
	  gui.line(x, y, x, y + height, button_pressed and "#606060ff" or "white")

	  if object_type == "string" then
		gui.text(x + 1, y + 1, object, COLOUR.button_text, 0)
	  elseif object_type == "boolean" then
		draw.rectangle(x + 1, y + 1, width - 2, height - 2, "#00ff0080", "#00ff00c0")
	  end

	  -- updates the table of buttons
	  table.insert(Script_buttons, {x = x, y = y, width = width, height = height, object = object, action = fn})
	end



	function Options_menu.display()
	  if not Options_menu.show_menu then return end

	  -- Pauses emulator and draws the background
	  draw.Text_opacity = 1.0
	  draw.rectangle(0, 0, draw.Buffer_width, draw.Buffer_height, COLOUR.mainmenu_outline, COLOUR.mainmenu_bg)

	  -- Font stuff
	  local delta_x = SNES9X_FONT_WIDTH
	  local delta_y = SNES9X_FONT_HEIGHT + 4
	  local x_pos, y_pos = 4, 4
	  local tmp

	  -- Exit menu button
	  gui.box(0, 0, draw.Buffer_width, delta_y, "#ffffff60", "#ffffff60") -- tab's shadow / unlisted color
	  create_button(draw.Buffer_width, 0, " X ", function() Options_menu.show_menu = false end, {always_on_client = true, always_on_game = true})

	  -- Tabs

	  
	  return true
	end


	
	--#############################################################################
	-- SMW FUNCTIONS:

	-- Returns the id of Yoshi; if more than one, the lowest sprite slot
	local function get_yoshi_id()
	  for i = 0, SMW.sprite_max - 1 do
		local id = u8(WRAM.sprite_number + i)
		local status = u8(WRAM.sprite_status + i)
		if id == 0x35 and status ~= 0 then return i end
	  end

	  return nil
	end


	local Real_frame, Previous_real_frame, Effective_frame, Game_mode
	local Level_index, Room_index, Level_flag, Current_level
	local Is_paused, Lock_animation_flag, Player_powerup, Player_animation_trigger
	local Camera_x, Camera_y, Player_x, Player_y
	local function scan_smw()
	  Previous_real_frame = Real_frame or u8(WRAM.real_frame)
	  Real_frame = u8(WRAM.real_frame)
	  Effective_frame = u8(WRAM.effective_frame)
	  Game_mode = u8(WRAM.game_mode)
	  Level_index = u8(WRAM.level_index)
	  Level_flag = u8(WRAM.level_flag_table + Level_index)
	  Is_paused = u8(WRAM.level_paused) == 1
	  Lock_animation_flag = u8(WRAM.lock_animation_flag)
	  Room_index = u24(WRAM.room_index)

	  -- In level frequently used info
	  Player_animation_trigger = u8(WRAM.player_animation_trigger)
	  Player_powerup = u8(WRAM.powerup)
	  Camera_x = s16(WRAM.camera_x)
	  Camera_y = s16(WRAM.camera_y)
	  Yoshi_riding_flag = u8(WRAM.yoshi_riding_flag) ~= 0
	  Player_x = s16(WRAM.x)
	  Player_y = s16(WRAM.y)
	  Yoshi_id = get_yoshi_id()
	end


	-- Converts the in-game (x, y) to SNES-screen coordinates
	local function screen_coordinates(x, y, camera_x, camera_y)

	  -- Sane values
	  camera_x = camera_x or Camera_x or u8(WRAM.camera_x)
	  camera_y = camera_y or Camera_y or u8(WRAM.camera_y)

	  local x_screen = (x - camera_x)
	  local y_screen = (y - camera_y)
		
	  return x_screen, y_screen
	end


	-- Converts Snes9x-screen coordinates to in-game (x, y)
	local function game_coordinates(x_snes9x, y_snes9x, camera_x, camera_y)
	  -- Sane values
	  camera_x = camera_x or Camera_x or u8(WRAM.camera_x)
	  camera_y = camera_y or Camera_y or u8(WRAM.camera_y)

	  local x_game = x_snes9x + camera_x
	  local y_game = y_snes9x + camera_y
	  local function el() return print("hi") end
	  return x_game, y_game
	end


	-- Returns the extreme values that Mario needs to have in order to NOT touch a rectangular object
	local function display_boundaries(x_game, y_game, width, height, camera_x, camera_y)
	  -- Font
	  draw.Text_opacity = 0.5
	  draw.Bg_opacity = 0.4

	  -- Coordinates around the rectangle
	  local left = width*floor(x_game/width)
	  local top = height*floor(y_game/height)
	  left, top = screen_coordinates(left, top, camera_x, camera_y)
	  local right = left + width - 1
	  local bottom = top + height - 1

	  -- Reads WRAM values of the player
	  local is_ducking = u8(WRAM.is_ducking)
	  local powerup = Player_powerup
	  local is_small = is_ducking ~= 0 or powerup == 0

	  -- Left
	  local left_text = string.format("%4d.0", width*floor(x_game/width) - 13)
	  draw.text(draw.AR_x*left, draw.AR_y*(top+bottom)/2, left_text, false, false, 1.0, 0.5)

	  -- Right
	  local right_text = string.format("%d.f", width*floor(x_game/width) + 12)
	  draw.text(draw.AR_x*right, draw.AR_y*(top+bottom)/2, right_text, false, false, 0.0, 0.5)

	  -- Top
	  local value = (Yoshi_riding_flag and y_game - 16) or y_game
	  local top_text = fmt("%d.0", width*floor(value/width) - 32)
	  draw.text(draw.AR_x*(left+right)/2, draw.AR_y*top, top_text, false, false, 0.5, 1.0)

	  -- Bottom
	  value = height*floor(y_game/height)
	  if not is_small and not Yoshi_riding_flag then
		value = value + 0x07
	  elseif is_small and Yoshi_riding_flag then
		value = value - 4
	  else
		value = value - 1  -- the 2 remaining cases are equal
	  end

	  local bottom_text = fmt("%d.f", value)
	  draw.text(draw.AR_x*(left+right)/2, draw.AR_y*bottom, bottom_text, false, false, 0.5, 0.0)

	  return left, top
	end


	local function read_screens()
	  local screens_number = u8(WRAM.screens_number)
	  local vscreen_number = u8(WRAM.vscreen_number)
	  local hscreen_number = u8(WRAM.hscreen_number) - 1
	  local vscreen_current = s8(WRAM.y + 1)
	  local hscreen_current = s8(WRAM.x + 1)
	  local level_mode_settings = u8(WRAM.level_mode_settings)
	  --local b1, b2, b3, b4, b5, b6, b7, b8 = bit.multidiv(level_mode_settings, 128, 64, 32, 16, 8, 4, 2)
	  --draw.text(draw.Buffer_middle_x, draw.Buffer_middle_y, {"%x: %x%x%x%x%x%x%x%x", level_mode_settings, b1, b2, b3, b4, b5, b6, b7, b8}, COLOUR.text, COLOUR.background)

	  local level_type
	  if (level_mode_settings ~= 0) and (level_mode_settings == 0x3 or level_mode_settings == 0x4 or level_mode_settings == 0x7
		or level_mode_settings == 0x8 or level_mode_settings == 0xa or level_mode_settings == 0xd) then
		  level_type = "Vertical"
		;
	  else
		level_type = "Horizontal"
	  end

	  return level_type, screens_number, hscreen_current, hscreen_number, vscreen_current, vscreen_number
	end


	local function get_map16_value(x_game, y_game)
	  local num_x = floor(x_game/16)
	  local num_y = floor(y_game/16)
	  if num_x < 0 or num_y < 0 then return end  -- 1st breakpoint

	  local level_type, screens, _, hscreen_number, _, vscreen_number = read_screens()
	  local max_x, max_y
	  if level_type == "Horizontal" then
		max_x = 16*(hscreen_number + 1)
		max_y = 27
	  else
		max_x = 32
		max_y = 16*(vscreen_number + 1)
	  end

	  if num_x > max_x or num_y > max_y then return end  -- 2nd breakpoint

	  local num_id, kind, address
	  if level_type == "Horizontal" then
		num_id = 16*27*floor(num_x/16) + 16*num_y + num_x%16
	  else
		local nx = floor(num_x/16)
		local ny = floor(num_y/16)
		local n = 2*ny + nx
		num_id = 16*16*n + 16*(num_y%16) + num_x%16
	  end
	  if (num_id >= 0 and num_id <= 0x37ff) then
		address = fmt(" $%4.x", 0xc800 + num_id)
		kind = 256*u8(0x1c800 + num_id) + u8(0xc800 + num_id)
	  end

	  if kind then return  num_x, num_y, kind, address end
	end

	-- if the user clicks in a tile, it will be be drawn
	-- if click is onto drawn region, it'll be erased
	-- there's a max of possible tiles
	-- layer_table[n] is an array {x, y, [draw info?]}
	local function select_tile(x, y, layer_table)
	  if not OPTIONS.draw_tiles_with_click then return end
	  if Game_mode ~= SMW.game_mode_level then return end

	  for number, positions in ipairs(layer_table) do  -- if mouse points a drawn tile, erase it
		if x == positions[1] and y == positions[2] then
		  -- Layer 1
		  if layer_table == Layer1_tiles then
			if layer_table[number][3] == false then
			  layer_table[number][3] = true
			else
			  table.remove(layer_table, number)
			end
		  -- Layer 2
		  elseif layer_table == Layer2_tiles then
			table.remove(layer_table, number)
		  end

		  return
		end
	  end

	  -- otherwise, draw a new tile
	  if #layer_table == OPTIONS.max_tiles_drawn then
		table.remove(layer_table, 1)
		layer_table[OPTIONS.max_tiles_drawn] = {x, y, false}
	  else
		table.insert(layer_table, {x, y, false})
	  end

	end


	-- uses the mouse to select an object
	local function select_object(mouse_x, mouse_y, camera_x, camera_y)
	  -- Font
	  draw.Text_opacity = 1.0
	  draw.Bg_opacity = 0.5

	  local x_game, y_game = game_coordinates(mouse_x, mouse_y, camera_x, camera_y)
	  local obj_id

	  -- Checks if the mouse is over Mario
	  local x_player = s16(WRAM.x)
	  local y_player = s16(WRAM.y)
	  if x_player + 0xe >= x_game and x_player + 0x2 <= x_game and y_player + 0x30 >= y_game and y_player + 0x8 <= y_game then
		obj_id = "Mario" .. x_game .. " " .. y_game
	  end

	  if not obj_id and OPTIONS.display_sprite_info then
		for id = 0, SMW.sprite_max - 1 do
		  local sprite_status = u8(WRAM.sprite_status + id)
		  if sprite_status ~= 0 and Sprites_info[id].x then  -- TODO: see why the script gets here without exporting Sprites_info
			-- Import some values
			local x_sprite, y_sprite = Sprites_info[id].x, Sprites_info[id].y
			local x_screen, y_screen = Sprites_info[id].x_screen, Sprites_info[id].y_screen
			local boxid = Sprites_info[id].boxid
			local xoff, yoff = Sprites_info[id].xoff, Sprites_info[id].yoff
			local width, height = Sprites_info[id].width, Sprites_info[id].height
			
			
			if x_sprite + xoff + width >= x_game and x_sprite + xoff <= x_game and
			y_sprite + yoff + height >= y_game and y_sprite + yoff <= y_game then
			  obj_id = id
			  break
			end
		  end
		end
	  end

	  if not obj_id then return end

	  draw.text(User_input.xmouse, User_input.ymouse - 8, obj_id, true, false, 0.5, 1.0)
	  return obj_id, x_game, y_game
	end

-- This function sees if the mouse if over some object, to change its hitbox mode
-- The order is: 1) player, 2) sprite.
local function right_click()
  local id = select_object(User_input.xmouse, User_input.ymouse, Camera_x, Camera_y)

  if tostring(id) == "Mario" then

    if OPTIONS.display_player_hitbox and OPTIONS.display_interaction_points then
      OPTIONS.display_interaction_points = false
      OPTIONS.display_player_hitbox = false
    elseif OPTIONS.display_player_hitbox then
      OPTIONS.display_interaction_points = true
      OPTIONS.display_player_hitbox = false
    elseif OPTIONS.display_interaction_points then
      OPTIONS.display_player_hitbox = true
    else
      OPTIONS.display_player_hitbox = true
    end

    return
  end

  local spr_id = tonumber(id)
  if spr_id and spr_id >= 0 and spr_id <= SMW.sprite_max - 1 then

    local number = Sprites_info[spr_id].number
    if Sprite_hitbox[spr_id][number].sprite and Sprite_hitbox[spr_id][number].block then
      Sprite_hitbox[spr_id][number].sprite = false
      Sprite_hitbox[spr_id][number].block = false
    elseif Sprite_hitbox[spr_id][number].sprite then
      Sprite_hitbox[spr_id][number].block = true
      Sprite_hitbox[spr_id][number].sprite = false
    elseif Sprite_hitbox[spr_id][number].block then
      Sprite_hitbox[spr_id][number].sprite = true
    else
      Sprite_hitbox[spr_id][number].sprite = true
    end

    return
  end

  -- Select layer 2 tiles
  local layer2x = s16(WRAM.layer2_x_nextframe)
  local layer2y = s16(WRAM.layer2_y_nextframe)
  local x_mouse, y_mouse = User_input.xmouse + layer2x, User_input.ymouse + layer2y
  select_tile(16*floor(x_mouse/16), 16*floor(y_mouse/16), Layer2_tiles)
end

	local function show_movie_info()
	  if not OPTIONS.display_movie_info then return end

	  -- Font
	  draw.Text_opacity = 1.0
	  draw.Bg_opacity = 1.0
	  local y_text = - draw.Border_top
	  local x_text = 0
	  local width = SNES9X_FONT_WIDTH

	  local rec_color = (Readonly or not Movie_active) and COLOUR.text or COLOUR.warning
	  local recording_bg = (Readonly or not Movie_active) and COLOUR.background or COLOUR.warning_bg

	  -- Read-only or read-write?
	  local movie_type = (not Movie_active and "No movie ") or (Readonly and "Movie " or "REC ")
	  --draw.alert_text(x_text, y_text, movie_type, rec_color, recording_bg)

	  -- Frame count
	  x_text = x_text + width*string.len(movie_type)
	  local movie_info
	  if Readonly then
		movie_info = string.format("%d/%d", Lastframe_emulated, Framecount)
	  else
		movie_info = string.format("%d", Lastframe_emulated)
	  end
	  --draw.text(x_text, y_text, movie_info)  -- Shows the latest frame emulated, not the frame being run now
	  x_text = x_text + width*string.len(movie_info)

	  -- Rerecord count
	  local rr_info = string.format(" %d ", Rerecords)
	  --draw.text(x_text, y_text, rr_info, COLOUR.weak)
	  x_text = x_text + width*string.len(rr_info)

	  -- Lag count
	  --draw.text(x_text, y_text, Lagcount, COLOUR.warning)

	  local str = frame_time(Lastframe_emulated)   -- Shows the latest frame emulated, not the frame being run now
	  --draw.alert_text(draw.Buffer_width, draw.Buffer_height, str, COLOUR.text, recording_bg, false, 1.0, 1.0)

	  if Is_lagged then
		--draw.alert_text(draw.Buffer_middle_x - 3*SNES9X_FONT_WIDTH, 2*SNES9X_FONT_HEIGHT, " LAG ", COLOUR.warning, COLOUR.warning_bg)
		--emu.message("Lag detected!") -- Snes9x

	  end

	end


	local function show_misc_info()
	  --[[if not OPTIONS.display_misc_info then return end

	  -- Font
	  draw.Text_opacity = Game_mode == SMW.game_mode_level and 0.5 or 1.0 -- Snes9x
	  draw.Bg_opacity = 1.0

	  -- Display
	  local RNG = u16(WRAM.RNG)
	  local main_info = string.format("Frame(%02x, %02x) RNG(%04x) Mode(%02x)",
					  Real_frame, Effective_frame, RNG, Game_mode)
	  ;

	  draw.text(draw.Buffer_width + draw.Border_right, -draw.Border_top, main_info, true, false)

	  if Game_mode == SMW.game_mode_level then
		-- Time frame counter of the clock
		draw.Text_opacity = 1.0
		local timer_frame_counter = u8(WRAM.timer_frame_counter)
		draw.text(draw.AR_x*161, draw.AR_y*15, fmt("%.2d", timer_frame_counter))

		-- Score: sum of digits, useful for avoiding lag
		draw.Text_opacity = 0.5
		local score = u24(WRAM.mario_score)
		draw.text(draw.AR_x*240, draw.AR_y*24, fmt("=%d", luap.sum_digits(score)), COLOUR.weak)
	  end]]
	end


	-- Shows the controller input as the RAM and SNES registers store it
	local function show_controller_data()
	  if not (OPTIONS.display_miscellaneous_debug_info and OPTIONS.display_debug_controller_data) then return end

	  -- Font
	  draw.Text_opacity = 0.9
	  local height = SNES9X_FONT_HEIGHT
	  local x_pos, y_pos, x, y, _ = 0, 0, 0, SNES9X_FONT_HEIGHT

	  local controller = memory.readword(0x1000000 + 0x4218) -- Snes9x / BUS area
	  x = draw.over_text(x, y, controller, "BYsS^v<>AXLR0123", COLOUR.warning, false, true)
	  _, y = draw.text(x, y, " (Registers)", COLOUR.warning, false, true)

	  x = x_pos
	  x = draw.over_text(x, y, 256*u8(WRAM.ctrl_1_1) + u8(WRAM.ctrl_1_2), "BYsS^v<>AXLR0123", COLOUR.weak)
	  _, y = draw.text(x, y, " (RAM data)", COLOUR.weak, false, true)

	  x = x_pos
	  draw.over_text(x, y, 256*u8(WRAM.firstctrl_1_1) + u8(WRAM.firstctrl_1_2), "BYsS^v<>AXLR0123", 0, "#0xffff", 0) -- Snes9x
	end


	local function level_info()
	  if not OPTIONS.display_level_info then return end

	  -- Font
	  draw.Text_opacity = 0.2 -- Snes9x
	  draw.Bg_opacity = 1.0
	  local x_pos = 134
	  local y_pos = 200
	  local color = COLOUR.text
	  draw.Text_opacity = 1.0
	  draw.Bg_opacity = 1.0

	  local sprite_buoyancy = floor(u8(WRAM.sprite_buoyancy)/64)
	  if sprite_buoyancy == 0 then sprite_buoyancy = "" else
		sprite_buoyancy = fmt(" %.2x", sprite_buoyancy)
		color = COLOUR.warning
	  end

	  -- converts the level number to the Lunar Magic number; should not be used outside here
	  local lm_level_number = Level_index
	  if Level_index > 0x24 then lm_level_number = Level_index + 0xdc end

	  -- Number of screens within the level
	  local level_type, screens_number, hscreen_current, hscreen_number, vscreen_current, vscreen_number = read_screens()

	  draw.text(x_pos, y_pos, fmt("%.1sLevel(%.2x)%s", level_type, lm_level_number, sprite_buoyancy),
			  color, true, false)
	  ;

	  draw.text(x_pos, y_pos + SNES9X_FONT_HEIGHT, fmt("Screens(%d):", screens_number), true)

	  draw.text(x_pos, y_pos + 2*SNES9X_FONT_HEIGHT, fmt("(%d/%d, %d/%d)", hscreen_current, hscreen_number,
			vscreen_current, vscreen_number), true)
	  ;
	end


	function draw_blocked_status(x_text, y_text, player_blocked_status, x_speed, y_speed) --!important
	  local bitmap_width  = 7 -- Snes9x
	  local bitmap_height = 10 -- Snes9x
	  local block_str = " " --"Block:"
	  local str_len = string.len(block_str)
	  local xoffset = x_text + str_len*SNES9X_FONT_WIDTH
	  local yoffset = y_text
	  local color_line = COLOUR.warning

	  --player pos
	  local xp = s16(WRAM.x)
	  local yp = s16(WRAM.y)
	  local x_screenp, y_screenp = screen_coordinates(xp, yp, Camera_x, Camera_y) --!important, set coords to absolute\
	
	  gui.gdoverlay(xoffset, yoffset, IMAGES.player_blocked_status, draw.Background_max_opacity * draw.Bg_opacity) -- Snes9x

	  gui.opacity(draw.Text_max_opacity*draw.Text_opacity) -- Snes9x
	  local blocked_status = {}
	  local was_boosted = false
		
	  if bit.test(player_blocked_status, 1) then  -- Left
		draw.line(xoffset, yoffset, xoffset, yoffset + bitmap_height - 1, 1, color_line)
		if x_speed > 0 then was_boosted = true end
		g_left = 1
	  else g_left = 0
	  end
	  
	  if bit.test(player_blocked_status, 0) then  -- Right
		draw.line(xoffset + bitmap_width - 1, yoffset, xoffset + bitmap_width - 1, yoffset + bitmap_height - 1, 1, color_line)
		if x_speed < 0 then was_boosted = true end
		g_right = 1
	  else g_right = 0
	  end

	  if bit.test(player_blocked_status, 2) then  -- Down
		draw.line(xoffset, yoffset + bitmap_height - 1, xoffset + bitmap_width - 1, yoffset + bitmap_height - 1, 1, color_line)
		--gui.text(x_screenp, y_screenp, "grounded", black, white)
		g_down = 1
	  else g_down = 0
	  end

	  if bit.test(player_blocked_status, 4) then  -- Middle
		gui.crosshair(xoffset + floor(bitmap_width/2), yoffset + floor(bitmap_height/2),
		math.min(bitmap_width/2, bitmap_height/2), color_line)
	  end

	  draw.text(x_text, y_text, block_str, COLOUR.text, was_boosted and COLOUR.warning_bg or nil)

	end


	-- displays player's hitbox
	local function player_hitbox(x, y, is_ducking, powerup, transparency_level)
	  local x_screen, y_screen = screen_coordinates(x, y, Camera_x, Camera_y)
	  local is_small = is_ducking ~= 0 or powerup == 0
	  local hitbox_type = 2*(Yoshi_riding_flag and 1 or 0) + (is_small and 0 or 1) + 1

	  -- Interaction points, offsets and dimensions
	  local y_points_offsets = Y_INTERACTION_POINTS[hitbox_type]
	  local left_side = X_INTERACTION_POINTS.left_side
	  local right_side = X_INTERACTION_POINTS.right_side
	  local left_foot = X_INTERACTION_POINTS.left_foot
	  local right_foot = X_INTERACTION_POINTS.right_foot
	  local x_center = X_INTERACTION_POINTS.center
	  local head = y_points_offsets.head
	  local foot = y_points_offsets.foot
	  local y_center = y_points_offsets.center
	  local shoulder = y_points_offsets.shoulder
	  local side =  y_points_offsets.side

	  local hitbox_offsets = smw.PLAYER_HITBOX[hitbox_type]
	  local xoff = hitbox_offsets.xoff
	  local yoff = hitbox_offsets.yoff
	  local width = hitbox_offsets.width
	  local height = hitbox_offsets.height

	-- background for block interaction
	  draw.box(x_screen + left_side, y_screen + head, x_screen + right_side, y_screen + foot,
		  COLOUR.interaction_bg, COLOUR.interaction_bg)

	  -- Collision with sprites
	  if OPTIONS.display_player_hitbox then
		local mario_bg = (not Yoshi_riding_flag and COLOUR.mario_bg) or COLOUR.mario_mounted_bg
		draw.rectangle(x_screen + xoff, y_screen + yoff, width, height, COLOUR.mario, mario_bg)
	  end

	  -- interaction points (collision with blocks)
	  if OPTIONS.display_interaction_points then

		local color = COLOUR.interaction

		if not OPTIONS.display_player_hitbox then
		  draw.box(x_screen + left_side , y_screen + head,
			x_screen + right_side, y_screen + foot, COLOUR.interaction_nohitbox, COLOUR.interaction_nohitbox_bg)
		end

		gui.line(x_screen + left_side, y_screen + side, x_screen + left_foot, y_screen + side, color)  -- left side
		gui.line(x_screen + right_side, y_screen + side, x_screen + right_foot, y_screen + side, color)  -- right side
		gui.line(x_screen + left_foot, y_screen + foot - 2, x_screen + left_foot, y_screen + foot, color)  -- left foot bottom
		gui.line(x_screen + right_foot, y_screen + foot - 2, x_screen + right_foot, y_screen + foot, color)  -- right foot bottom
		gui.line(x_screen + left_side, y_screen + shoulder, x_screen + left_side + 2, y_screen + shoulder, color)  -- head left point
		gui.line(x_screen + right_side - 2, y_screen + shoulder, x_screen + right_side, y_screen + shoulder, color)  -- head right point
		gui.line(x_screen + x_center, y_screen + head, x_screen + x_center, y_screen + head + 2, color)  -- head point
		gui.line(x_screen + x_center - 1, y_screen + y_center, x_screen + x_center + 1, y_screen + y_center, color)  -- center point
		gui.line(x_screen + x_center, y_screen + y_center - 1, x_screen + x_center, y_screen + y_center + 1, color)  -- center point
	  end

	  -- That's the pixel that appears when Mario dies in the pit
	  Show_player_point_position = Show_player_point_position or y_screen >= 200 or
		(OPTIONS.display_miscellaneous_debug_info and OPTIONS.display_debug_player_extra)
	  if Show_player_point_position then
		draw.pixel(x_screen, y_screen, COLOUR.text, COLOUR.interaction_bg)
		Show_player_point_position = false
	  end

	  return x_points, y_points
	end


	-- displays the hitbox of the cape while spinning
	local function cape_hitbox(spin_direction)
	  local cape_interaction = u8(WRAM.cape_interaction)
	  if cape_interaction == 0 then return end

	  local cape_x = u16(WRAM.cape_x)
	  local cape_y = u16(WRAM.cape_y)

	  local cape_x_screen, cape_y_screen = screen_coordinates(cape_x, cape_y, Camera_x, Camera_y)
	  local cape_left = -2
	  local cape_right = 0x12
	  local cape_up = 0x01
	  local cape_down = 0x11
	  local cape_middle = 0x08
	  local block_interaction_cape = (spin_direction < 0 and cape_left + 4) or cape_right - 4
	  local active_frame_sprites = Real_frame%2 == 1  -- active iff the cape can hit a sprite
	  local active_frame_blocks  = Real_frame%2 == (spin_direction < 0 and 0 or 1)  -- active iff the cape can hit a block

	  if active_frame_sprites then bg_color = COLOUR.cape_bg else bg_color = 0 end
	  draw.box(cape_x_screen + cape_left, cape_y_screen + cape_up, cape_x_screen + cape_right, cape_y_screen + cape_down, COLOUR.cape, bg_color)

	  if active_frame_blocks then
		draw.pixel(cape_x_screen + block_interaction_cape, cape_y_screen + cape_middle, COLOUR.warning)
	  else
		draw.pixel(cape_x_screen + block_interaction_cape, cape_y_screen + cape_middle, COLOUR.text)
	  end
	end


	-- arguments: left and bottom pixels of a given block tile
	-- return: string type of duplication that will happen
	--         false otherwise
	local function sprite_block_interaction_simulator(x_block_left, y_block_bottom)
	  --local GOOD_SPEEDS = luap.make_set{-2.5, -2, -1.5, -1, 0, 0.5, 1.0, 1.5, 2.5, 3.0, 3.5, 4.0}

	  -- get 1st carried sprite slot
	  local slot
	  for id = 0, SMW.sprite_max - 1 do
		if u8(WRAM.sprite_status + id) == 0x0b then
		  slot = id
		  break
		end
	  end
	  if not slot then return false end

	  -- sprite properties
	  local ini_x = luap.signed16(256*u8(WRAM.sprite_x_high + slot) + u8(WRAM.sprite_x_low + slot))
	  local ini_y = luap.signed16(256*u8(WRAM.sprite_y_high + slot) + u8(WRAM.sprite_y_low + slot))
	  local ini_y_sub = u8(WRAM.sprite_y_sub + slot)

	  -- Sprite clipping vs objects
	  local clip_obj = bit.band(u8(WRAM.sprite_1_tweaker + slot), 0xf)
	  local ypt_right = OBJ_CLIPPING_SPRITE[clip_obj].yright
	  local ypt_left = OBJ_CLIPPING_SPRITE[clip_obj].yleft
	  local xpt_up = OBJ_CLIPPING_SPRITE[clip_obj].xup
	  local ypt_up = OBJ_CLIPPING_SPRITE[clip_obj].yup

	  -- Parameters that will vary each frame
	  local left_direction = Real_frame%2 == 0
	  local y_speed = -112
	  local y = ini_y
	  local x_head = ini_x + xpt_up
	  local y_sub = ini_y_sub

	  --print(fmt("Block: %d %d - Spr. ^%d <%d >%d", x_block_left, y_block_bottom, ypt_up, ypt_left, ypt_right))
	  -- Predict each frame:
	  while y_speed < 0 do
		-- Calculate next position.subpixel
		--print(fmt("prediction: (%d, %d.%.2x) %+d %s", x_head, y + ypt_up, y_sub, y_speed, left_direction and "left" or "right"))
		local next_total_subpixels = 256*y + y_sub + 16*y_speed
		y, y_sub = math.floor(next_total_subpixels/256), next_total_subpixels%256

		-- verify whether the block will be duplicated:
		-- if head is on block
		if y + ypt_up <= y_block_bottom and y + ypt_up >= y_block_bottom - 15 then
		  -- lateral duplication
		  -- if head is in the left-most 4 pixels
		  if left_direction and x_block_left <= x_head and x_head - 4 < x_block_left then
			if y + ypt_left <= y_block_bottom then
			  return "Left"
			end
		  -- if head is in the right-most 4 pixels
		  elseif not left_direction and x_head <= x_block_left + 15 and x_head + 4 > x_block_left + 15 then
			if y + ypt_right <= y_block_bottom then
			  return "Right"
			end
		  end

		  -- Upward duplication
		  if y + ypt_up <= y_block_bottom - 14 then  -- 2 pixels height
			return "Upward"
		  end

		  return false
		end

		-- Set next step
		y_speed = y_speed + 3
		left_direction = not left_direction
	  end

	  return false
	end


	-- verify nearby layer 1 tiles that are drawn
	-- check whether they would allow a block duplication under ideal conditions
	local function predict_block_duplications()
	  if not OPTIONS.use_block_duplication_predictor then return end
	  local delta_x, delta_y = 48, 128

	  for number, positions in ipairs(Layer1_tiles) do
		if luap.inside_rectangle(positions[1], positions[2], Player_x - delta_x, Player_y - delta_y, Player_x + delta_x, Player_y + delta_y) then
		  local dup_status = sprite_block_interaction_simulator(positions[1], positions[2] + 15)

		  if dup_status then
			local x, y = math.floor(positions[1]/16), math.floor(positions[2]/16)
			emu.message(fmt("Duplication prediction: %d, %d", x, y))

			local xs, ys = screen_coordinates(positions[1] + 7, positions[2], Camera_x, Camera_y)
			draw.text(draw.AR_x*xs, draw.AR_y*ys - 4, fmt("%s duplication", dup_status),
			  COLOUR.warning, COLOUR.warning_bg, true, false, 0.5, 1.0)
			break
		  end

		end
	  end
	end


	local function player()
	  if not OPTIONS.display_player_info then return end

	  -- Font
	  draw.Text_opacity = 1.0

	  -- Reads WRAM
	  local x = s16(WRAM.x)
	  local y = s16(WRAM.y)
	  local previous_x = s16(WRAM.previous_x)
	  local previous_y = s16(WRAM.previous_y)
	  local x_sub = u8(WRAM.x_sub)
	  local y_sub = u8(WRAM.y_sub)
	  local x_speed = s8(WRAM.x_speed)
	  local x_subspeed = u8(WRAM.x_subspeed)
	  local y_speed = s8(WRAM.y_speed)
	  local p_meter = u8(WRAM.p_meter)
	  local take_off = u8(WRAM.take_off)
	  local powerup = Player_powerup
	  local direction = u8(WRAM.direction)
	  local cape_spin = u8(WRAM.cape_spin)
	  local cape_fall = u8(WRAM.cape_fall)
	  local flight_animation = u8(WRAM.flight_animation)
	  local diving_status = s8(WRAM.diving_status)
	  local player_blocked_status = u8(WRAM.player_blocked_status)
	  local item_box = u8(WRAM.item_box)
	  local is_ducking = u8(WRAM.is_ducking)
	  local on_ground = u8(WRAM.on_ground)
	  local spinjump_flag = u8(WRAM.spinjump_flag)
	  local can_jump_from_water = u8(WRAM.can_jump_from_water)
	  local carrying_item = u8(WRAM.carrying_item)
	  local scroll_timer = u8(WRAM.camera_scroll_timer)
	  local vertical_scroll_flag_header = u8(WRAM.vertical_scroll_flag_header)
	  local vertical_scroll_enabled = u8(WRAM.vertical_scroll_enabled)
	  emu.message("Pos" .. " " .. x .. " " .. y)

	  -- Transformations
	  if direction == 0 then direction = LEFT_ARROW else direction = RIGHT_ARROW end
	  local x_sub_simple, y_sub_simple-- = x_sub, y_sub
	  if x_sub%0x10 == 0 then x_sub_simple = fmt("%x", x_sub/0x10) else x_sub_simple = fmt("%.2x", x_sub) end
	  if y_sub%0x10 == 0 then y_sub_simple = fmt("%x", y_sub/0x10) else y_sub_simple = fmt("%.2x", y_sub) end

	  local x_speed_int, x_speed_frac = math.modf(x_speed + x_subspeed/0x100)
	  x_speed_frac = math.abs(x_speed_frac*100)

	  local spin_direction = (Effective_frame)%8
	  if spin_direction < 4 then
		spin_direction = spin_direction + 1
	  else
		spin_direction = 3 - spin_direction
	  end

	  local is_caped = powerup == 0x2
	  local is_spinning = cape_spin ~= 0 or spinjump_flag ~= 0

	  -- Display info
	  local i = 0
	  local delta_x = SNES9X_FONT_WIDTH
	  local delta_y = SNES9X_FONT_HEIGHT
	  local table_x = 0
	  local table_y = draw.AR_y*32

	  --[[draw.text(table_x, table_y + i*delta_y, fmt("Meter (%03d, %02d) %s", p_meter, take_off, direction))
	  draw.text(table_x + 18*delta_x, table_y + i*delta_y, fmt(" %+d", spin_direction),
	  (is_spinning and COLOUR.text) or COLOUR.weak)
	  i = i + 1

	  draw.text(table_x, table_y + i*delta_y, fmt("Pos (%+d.%s, %+d.%s)", x, x_sub_simple, y, y_sub_simple))
	  i = i + 1

	  draw.text(table_x, table_y + i*delta_y, fmt("Speed (%+d(%d.%02.0f), %+d)", x_speed, x_speed_int, x_speed_frac, y_speed))
	  i = i + 1

	  if is_caped then
		draw.text(table_x, table_y + i*delta_y, fmt("Cape (%.2d, %.2d)/(%d, %d)", cape_spin, cape_fall, flight_animation, diving_status), COLOUR.cape)
		i = i + 1
	  end]]
	  --local x_txt = draw.text(table_x, table_y + i*delta_y, fmt("Camera (%d, %d)", Camera_x, Camera_y))
	  if scroll_timer ~= 0 then x_txt = draw.text(x_txt, table_y + i*delta_y, 16 - scroll_timer, COLOUR.warning) end
	  if vertical_scroll_flag_header ~=0 and vertical_scroll_enabled ~= 0 then
		draw.text(x_txt, table_y + i*delta_y, vertical_scroll_enabled, COLOUR.warning2)
	  end
	  i = i + 1

	  if OPTIONS.display_static_camera_region then
		Show_player_point_position = true
		local left_cam, right_cam = u16(0x07142c), u16(0x07142e)  -- unlisted WRAM / Snes9x memory bank
		draw.box(left_cam, 0, right_cam, 224, COLOUR.static_camera_region, COLOUR.static_camera_region)
	  end

	  draw_blocked_status(table_x, table_y + i*delta_y, player_blocked_status, x_speed, y_speed)

	  -- Mario boost indicator (experimental)
	  -- This looks for differences between the expected x position and the actual x position, after a frame advance
	  -- Fails during a loadstate and has false positives if the game is paused or lagged
	  Previous.player_x = 256*x + x_sub  -- the total amount of 256-based subpixels
	  Previous.x_speed = 16*x_speed  -- the speed in 256-based subpixels

	  if Mario_boost_indicator and not Cheat.under_free_move then  -- TODO
		local x_screen, y_screen = screen_coordinates(x, y, Camera_x, Camera_y)
		gui.text(draw.AR_x*(x_screen + 4), draw.AR_y*(y_screen + 60), Mario_boost_indicator, COLOUR.warning, "#20000000")  -- unlisted color
	  end

	  -- shows hitbox and interaction points for player
	  if not (OPTIONS.display_player_hitbox or OPTIONS.display_interaction_points) then return end

	  cape_hitbox(spin_direction)
	  player_hitbox(x, y, is_ducking, powerup, 1.0)
	  -- Shows where Mario is expected to be in the next frame, if he's not boosted or stopped (DEBUG)
	  gui.opacity(0.3) -- Snes9x
	  if OPTIONS.display_miscellaneous_debug_info and OPTIONS.display_debug_player_extra then
		player_hitbox( floor((256*x + x_sub + 16*x_speed)/256),
		floor((256*y + y_sub + 16*y_speed)/256), is_ducking, powerup)
	  end

	end

	local function sprite_info(id, counter, table_position)
	  draw.Text_opacity = 1.0
		
	  local sprite_status = u8(WRAM.sprite_status + id)
	  if sprite_status == 0 then return 0 end  -- returns if the slot is empty

	  local x = 256*u8(WRAM.sprite_x_high + id) + u8(WRAM.sprite_x_low + id)
	  local y = 256*u8(WRAM.sprite_y_high + id) + u8(WRAM.sprite_y_low + id)
	  local x_sub = u8(WRAM.sprite_x_sub + id)
	  local y_sub = u8(WRAM.sprite_y_sub + id)
	  local number = u8(WRAM.sprite_number + id)
	  local stun = u8(WRAM.sprite_miscellaneous7 + id)
	  local x_speed = s8(WRAM.sprite_x_speed + id)
	  local y_speed = s8(WRAM.sprite_y_speed + id)
	  local contact_mario = u8(WRAM.sprite_miscellaneous8 + id)
	  local underwater = u8(WRAM.sprite_underwater + id)
	  local x_offscreen = s8(WRAM.sprite_x_offscreen + id)
	  local y_offscreen = s8(WRAM.sprite_y_offscreen + id)
		local  Camera_x = s16(WRAM.camera_x)
		local  Camera_y = s16(WRAM.camera_y)
	  local special = ""
	  if (OPTIONS.display_miscellaneous_debug_info and OPTIONS.display_debug_sprite_extra) or
	  ((sprite_status ~= 0x8 and sprite_status ~= 0x9 and sprite_status ~= 0xa and sprite_status ~= 0xb) or stun ~= 0) then
		special = string.format("(%d %d) ", sprite_status, stun)
	  end

	  -- Let x and y be 16-bit signed
	  x = luap.signed16(x)
	  y = luap.signed16(y)

	  ---**********************************************
	  -- Calculates the sprites dimensions and screen positions
	  local x_screen, y_screen = screen_coordinates(x, y, Camera_x, Camera_y)

	  local g_distance = 0
	  
	  -- Sprite clipping vs mario and sprites
	  local boxid = bit.band(u8(WRAM.sprite_2_tweaker + id), 0x3f)  -- This is the type of box of the sprite
	  local xoff = HITBOX_SPRITE[boxid].xoff
	  local yoff = HITBOX_SPRITE[boxid].yoff
	  local sprite_width = HITBOX_SPRITE[boxid].width
	  local sprite_height = HITBOX_SPRITE[boxid].height

	  -- Sprite clipping vs objects
	  local clip_obj = bit.band(u8(WRAM.sprite_1_tweaker + id), 0xf)  -- type of hitbox for blocks
	  local xpt_right = OBJ_CLIPPING_SPRITE[clip_obj].xright
	  local ypt_right = OBJ_CLIPPING_SPRITE[clip_obj].yright
	  local xpt_left = OBJ_CLIPPING_SPRITE[clip_obj].xleft
	  local ypt_left = OBJ_CLIPPING_SPRITE[clip_obj].yleft
	  local xpt_down = OBJ_CLIPPING_SPRITE[clip_obj].xdown
	  local ypt_down = OBJ_CLIPPING_SPRITE[clip_obj].ydown
	  local xpt_up = OBJ_CLIPPING_SPRITE[clip_obj].xup
	  local ypt_up = OBJ_CLIPPING_SPRITE[clip_obj].yup

	  -- Process interaction with player every frame?
	  -- Format: dpmksPiS. This 'm' bit seems odd, since it has false negatives
	  local oscillation_flag = bit.test(u8(WRAM.sprite_4_tweaker + id), 5) or OSCILLATION_SPRITES[number]

	  -- calculates the correct color to use, according to id
	  local info_color
	  local color_background
	  if number == 0x35 then
		info_color = COLOUR.yoshi
		color_background = COLOUR.yoshi_bg
	  else
		info_color = COLOUR.sprites[id%(#COLOUR.sprites) + 1]
		color_background = COLOUR.sprites_bg
	  end


		if (not oscillation_flag) and (Real_frame - id)%2 == 1 then color_background = 0 end -- due to sprite oscillation every other frame
                                                  -- notice that some sprites interact with Mario every frame
		;
	
	  ---**********************************************
	  -- Displays sprites hitboxes 
	  if OPTIONS.display_sprite_hitbox then
		-- That's the pixel that appears when the sprite vanishes in the pit
		if y_screen >= 224 or (OPTIONS.display_miscellaneous_debug_info and OPTIONS.display_debug_sprite_extra) then
		  draw.pixel(x_screen, y_screen, info_color)
		end

		if Sprite_hitbox[id][number].block then
		--!experimental

		local xp = s16(WRAM.x) --refactor?
		local yp = s16(WRAM.y)
		local x_screenp, y_screenp = screen_coordinates(xp, yp, Camera_x, Camera_y) --!important, set coords to absolute\
		--line to enemy
		gui.line( 
		x_screenp + 5, 
		y_screenp + 20, 
		x_screen + xpt_right, 
		y_screen + ypt_right, 
		white)
		gui.pixel(x_screen / 10, (y_screen /10) + 50, 0x7FFFFFFF)
		draw.text(x_screen + xpt_right, y_screen + ypt_right, "sprite", black, white)
		draw.text(x_screenp + 5, y_screenp + 20, "player", black, white)
		
		local xDist = x_screenp + 5 - x_screen + xpt_right
		local yDist = y_screenp + 20 - y_screen + ypt_right

		g_distance = math.sqrt( (xDist ^ 2) + (yDist ^ 2) ) 
	
		--end
		
		  draw.box(x_screen + xpt_left, y_screen + ypt_down, x_screen + xpt_right, y_screen + ypt_up,
			COLOUR.sprites_clipping_bg, Sprite_hitbox[id][number].sprite and 0 or COLOUR.sprites_clipping_bg)
		end

		if Sprite_hitbox[id][number].sprite and not ABNORMAL_HITBOX_SPRITES[number] then  -- show sprite/sprite clipping !important
		  draw.rectangle(x_screen + xoff, y_screen + yoff, sprite_width, sprite_height, info_color, color_background)
		end

		if Sprite_hitbox[id][number].block then  -- show sprite/object clipping
		  local size, color = 1, COLOUR.sprites_interaction_pts
		  draw.line(x_screen + xpt_right, y_screen + ypt_right, x_screen + xpt_right - size, y_screen + ypt_right, 1, color) -- right
		  draw.line(x_screen + xpt_left, y_screen + ypt_left, x_screen + xpt_left + size, y_screen + ypt_left, 1, color)  -- left
		  draw.line(x_screen + xpt_down, y_screen + ypt_down, x_screen + xpt_down, y_screen + ypt_down - size, 1, color) -- down
		  draw.line(x_screen + xpt_up, y_screen + ypt_up, x_screen + xpt_up, y_screen + ypt_up + size, 1, color)  -- up
		  

		end
	  end


	  ---**********************************************
	  -- Special sprites analysis:

	  --[[
	  PROBLEMATIC ONES
		29  Koopa Kid
		54  Revolving door for climbing net, wrong hitbox area, not urgent
		5a  Turn block bridge, horizontal, hitbox only applies to central block and wrongly
		86  Wiggler, the second part of the sprite, that hurts Mario even if he's on Yoshi, doesn't appear
		89  Layer 3 Smash, hitbox of generator outside
		9e  Ball 'n' Chain, hitbox only applies to central block, rotating ball
		a3  Rotating gray platform, wrong hitbox, rotating plataforms
	  ]]

	  --[[if number == 0x3d then  -- Rip Van Fish
		if u8(WRAM.sprite_miscellaneous1 + id) == 0 then -- if sleeping
		  local x1, y1, x2, y2 = -0x30, -0x30, 0x2e, 0x2e

		  -- Draw central hitbox and 8 areas around due to overflow
		  for horizontal = -1, 1 do
			local x = x_screen + 0x100*horizontal
			for vertical = -1, 1 do
			  local y = y_screen + 0x100*vertical
			  draw.box(x + x1, y + y1, x + x2, y + y2, info_color, 0)
			end
		  end

		  Show_player_point_position = true -- Only Mario coordinates matter
		end
	  end

	  if number == 0x5f then  -- Swinging brown platform (fix it)

		-- Powerup Incrementation helper
		local yoshi_right = 256*floor(x/256) - 58
		local yoshi_left  = yoshi_right + 32
		local x_text, y_text, height = draw.AR_x*(x_screen + xoff), draw.AR_y*(y_screen + yoff), SNES9X_FONT_HEIGHT

		if mouse_onregion(x_text, y_text, x_text + draw.AR_x*sprite_width, y_text + draw.AR_y*sprite_height) then
		  local x_text, y_text = 0, height
		  draw.alert_text(x_text, y_text, "Powerup Incrementation help", info_color, COLOUR.background)
		  draw.alert_text(x_text, y_text + height, "Yoshi must have: id = #4;", info_color, COLOUR.background)
		  draw.alert_text(x_text, y_text + 2*height, ("Yoshi x pos: (%s %d) or (%s %d)")
		  :format(LEFT_ARROW, yoshi_left, RIGHT_ARROW, yoshi_right), info_color, COLOUR.background)
		end
		--The status change happens when yoshi's id number is #4 and when (yoshi's x position) + Z mod 256 = 214,
		--where Z is 16 if yoshi is facing right, and -16 if facing left. More precisely, when (yoshi's x position + Z) mod 256 = 214,
		--the address 0x7E0015 + (yoshi's id number) will be added by 1.
		-- therefore: X_yoshi = 256*floor(x/256) + 32*yoshi_direction - 58
	  end

	  if number == 0x35 then  -- Yoshi
		if not Yoshi_riding_flag and OPTIONS.display_sprite_hitbox and Sprite_hitbox[id][number].sprite then
		  draw.rectangle(x_screen + 4, y_screen + 20, 8, 8, COLOUR.yoshi)
		end
	  end

	  if number == 0x54 then -- Revolving door for climbing net
		-- draw custom hitbox for Mario
		local player_x = s16(WRAM.x)  -- TODO: use external Player_x like in lsnes
		local player_y = s16(WRAM.y)

		if luap.inside_rectangle(player_x, player_y, x - 8, y - 24, x + 55, y + 55) then
		  local extra_x, extra_y = screen_coordinates(player_x, player_y, Camera_x, Camera_y)
		  draw.rectangle(x_screen - 8, y_screen - 8, 63, 63, COLOUR.very_weak, 0)
		  draw.rectangle(extra_x, extra_y, 0x10, 0x10, COLOUR.awkward_hitbox, COLOUR.awkward_hitbox_bg)
		end
	  end

	  if number == 0x62 or number == 0x63 then  -- Brown line-guided platform & Brown/checkered line-guided platform
		  xoff = xoff - 24
		  yoff = yoff - 8
		  -- for some reason, the actual base is 1 pixel below when Mario is small
		  if OPTIONS.display_sprite_hitbox then
			draw.rectangle(x_screen + xoff, y_screen + yoff, sprite_width, sprite_height, info_color, color_background)
		  end
	  end

	  if number == 0x6b then  -- Wall springboard (left wall)
		xoff = xoff - 8
		sprite_height = sprite_height + 1  -- for some reason, small Mario gets a bigger hitbox

		if OPTIONS.display_sprite_hitbox then
		  draw.rectangle(x_screen + xoff, y_screen + yoff, sprite_width, sprite_height, info_color, color_background)
		  draw.line(x_screen + xoff, y_screen + yoff + 3, x_screen + xoff + sprite_width, y_screen + yoff + 3, 1, info_color)
		end
	  end

	  if number == 0x6c then  -- Wall springboard (right wall)
		xoff = xoff - 31
		sprite_height = sprite_height + 1

		if OPTIONS.display_sprite_hitbox then
		  draw.rectangle(x_screen + xoff, y_screen + yoff, sprite_width, sprite_height, info_color, color_background)
		  draw.line(x_screen + xoff, y_screen + yoff + 3, x_screen + xoff + sprite_width, y_screen + yoff + 3, 1, info_color)
		end
	  end

	  if number == 0x7b then  -- Goal Tape

		draw.Text_opacity = 0.8

		-- This draws the effective area of a goal tape
		local x_effective = 256*u8(WRAM.sprite_miscellaneous4 + id) + u8(WRAM.sprite_miscellaneous1 + id)
		local y_low = 256*u8(WRAM.sprite_miscellaneous6 + id) + u8(WRAM.sprite_miscellaneous5 + id)
		local _, y_high = screen_coordinates(0, 0, Camera_x, Camera_y)
		local x_s, y_s = screen_coordinates(x_effective, y_low, Camera_x, Camera_y)

		if OPTIONS.display_sprite_hitbox then
		  draw.box(x_s, y_high, x_s + 15, y_s, info_color, COLOUR.goal_tape_bg)
		end
		draw.text(draw.AR_x*x_s, draw.AR_y*y_screen, fmt("Touch=%4d.0->%4d.f", x_effective, x_effective + 15), info_color, false, false)

		-- Draw a bitmap if the tape is unnoticeable
		local x_png, y_png = draw.put_on_screen(x_s, y_s, 18, 6)  -- png is 18x6 -- snes9x
		if x_png ~= x_s or y_png > y_s then  -- tape is outside the screen
		  gui.gdoverlay(x_png, y_png, IMAGES.goal_tape, 0.6) -- Snes9x
		else
		  Show_player_point_position = true
		  if y_low < 10 then gui.gdoverlay(x_png, y_png, IMAGES.goal_tape, 0.4) end  -- tape is too small, 10 is arbitrary here
		end
		draw.Text_opacity = 1.0
		draw.Bg_opacity = 1.0

	  elseif number == 0xa9 then  -- Reznor

		local reznor
		local color
		for index = 0, SMW.sprite_max - 1 do
		  reznor = u8(WRAM.sprite_miscellaneous4 + index)
		  if index >= 4 and index <= 7 then
			color = COLOUR.warning
		  else
			color = color_weak
		  end
		  draw.text(3*SNES9X_FONT_WIDTH*index, draw.Buffer_height, fmt("%.2x", reznor), color, true, false, 0.0, 1.0)
		end

	  elseif number == 0xa0 then  -- Bowser

		local height = SNES9X_FONT_HEIGHT
		local y_text = draw.Screen_height - 10*height
		local address = 0x0714b0  -- unlisted WRAM / Snes9x memory bank
		for index = 0, 9 do
		  local value = u8(address + index)
		  draw.text(draw.Buffer_width + draw.Border_right, y_text + index*height, fmt("%2x = %3d", value, value), info_color, true)
		end

	  end]]


	  ---**********************************************
	  -- Prints those informations next to the sprite  !important
	  draw.Text_opacity = 0.7  -- Snes9x
	  draw.Bg_opacity = 1.0

	  if x_offscreen ~= 0 or y_offscreen ~= 0 then
		draw.Text_opacity = 0.4
	  end

	  local contact_str = contact_mario == 0 and "" or " " .. contact_mario

	  local sprite_middle = x_screen + xoff + floor(sprite_width/2)
	  local sprite_top = y_screen + math.min(yoff, ypt_up)
	  --draw.text(draw.AR_x*sprite_middle, draw.AR_y*sprite_top, fmt("#%.2d%s", id, contact_str), info_color, true, false, 0.5, 1.0) !important
	  if Player_powerup == 2 then
		local contact_cape = u8(WRAM.sprite_disable_cape + id)
		if contact_cape ~= 0 then
		  --draw.text(draw.AR_x*sprite_middle, draw.AR_y*sprite_top - 2*SNES9X_FONT_HEIGHT, contact_cape, COLOUR.cape, true) !important
		end
	  end


	  ---**********************************************
	  -- The sprite table:
	  local x_speed_water = ""
	  if underwater ~= 0 then  -- if sprite is underwater
		local correction = floor(3*floor(x_speed/2)/2)
		x_speed_water = string.format("%+.2d=%+.2d", correction - x_speed, correction)
	  end
	  local sprite_str = fmt("#%02d %02x %s%d.%1x(%+.2d%s) %d.%1x(%+.2d)",
			  id, number, special, x, floor(x_sub/16), x_speed, x_speed_water, y, floor(y_sub/16), y_speed)

	  draw.Text_opacity = 1.0
	  draw.Bg_opacity = 1.0
	  if x_offscreen ~= 0 or y_offscreen ~= 0 then
		draw.Text_opacity = 0.6
	  end 
	  --!important 
		
	  -- Miscellaneous sprite table
	  if OPTIONS.display_miscellaneous_sprite_table then
		-- Font
		Font = false
		local x_mis, y_mis = 0, draw.AR_y*144 + counter*SNES9X_FONT_HEIGHT

		local t = OPTIONS.miscellaneous_sprite_table_number
		local misc, text = nil, fmt("#%.2d", id)
		for num = 1, 19 do
		  misc = t[num] and u8(WRAM["sprite_miscellaneous" .. num] + id) or false
		  text = misc and fmt("%s %3d", text, misc) or text
		end

		draw.text(x_mis, y_mis, text, info_color)
	  end

	  -- Exporting some values
	  Sprites_info[id].number = number
	  Sprites_info[id].x, Sprites_info[id].y = x, y
	  Sprites_info[id].x_screen, Sprites_info[id].y_screen = x_screen, y_screen
	  Sprites_info[id].boxid = boxid
	  Sprites_info[id].xoff, Sprites_info[id].yoff = xoff, yoff
	  Sprites_info[id].width, Sprites_info[id].height = sprite_width, sprite_height
	  Sprites_info.distance = g_distance
	  return g_distance
	end


	local function sprites() --!important

	  local counter = 0
	  local table_position = draw.AR_y*48
	  nearest_enemy = 0
	  for id = 0, SMW.sprite_max - 1 do --there is a problem here! breaks at 7
		counter	= counter + 1
		if sprite_info(id, counter, table_position) > nearest_enemy then
			nearest_enemy = sprite_info(id, counter, table_position)
		end
	  end

	  -- Font
	  draw.Text_opacity = 0.6 -- Snes9x

	  local swap_slot = u8(0x071861) -- unlisted WRAM / Snes9x memory bank
	  local smh = u8(WRAM.sprite_memory_header)
	  --draw.text(draw.Buffer_width + draw.Border_right, table_position - 2*SNES9X_FONT_HEIGHT, fmt("spr:%.2d", counter), COLOUR.weak, true)
	  --draw.text(draw.Buffer_width + draw.Border_right, table_position - SNES9X_FONT_HEIGHT, fmt("1st div: %d. Swap: %d", -- Snes9x: no extra space at the end
	  --                            SPRITE_MEMORY_MAX[smh] or 0, swap_slot), COLOUR.weak, true)
	  --
	  -- Miscellaneous sprite table: index
	  if OPTIONS.display_miscellaneous_sprite_table then
		Font = false

		local t = OPTIONS.miscellaneous_sprite_table_number
		local text = "Tab"
		for num = 1, 19 do
		  text = t[num] and fmt("%s %3d", text, num) or text
		end

		draw.text(0, draw.AR_y*144 - SNES9X_FONT_HEIGHT, text, info_color)
	  end
	end


	local function yoshi()
	  if not OPTIONS.display_yoshi_info then return end

	  -- Font
	  draw.Text_opacity = 1.0
	  draw.Bg_opacity = 1.0
	  local x_text = 0
	  local y_text = draw.AR_y*88

	  local yoshi_id = Yoshi_id
	  if yoshi_id ~= nil then
		local eat_id = u8(WRAM.sprite_miscellaneous16 + yoshi_id)
		local eat_type = u8(WRAM.sprite_number + eat_id)
		local tongue_len = u8(WRAM.sprite_miscellaneous4 + yoshi_id)
		local tongue_timer = u8(WRAM.sprite_miscellaneous9 + yoshi_id)
		local tongue_wait = u8(WRAM.sprite_tongue_wait)
		local tongue_height = u8(WRAM.yoshi_tile_pos)
		local tongue_out = u8(WRAM.sprite_miscellaneous13 + yoshi_id)

		local eat_type_str = eat_id == SMW.null_sprite_id and "-" or string.format("%02x", eat_type)
		local eat_id_str = eat_id == SMW.null_sprite_id and "-" or string.format("#%02d", eat_id)

		-- Yoshi's direction and turn around
		local turn_around = u8(WRAM.sprite_miscellaneous14 + yoshi_id)
		local yoshi_direction = u8(WRAM.sprite_miscellaneous12 + yoshi_id)
		local direction_symbol
		if yoshi_direction == 0 then direction_symbol = RIGHT_ARROW else direction_symbol = LEFT_ARROW end

		draw.text(x_text, y_text, fmt("Yoshi %s %d", direction_symbol, turn_around), COLOUR.yoshi)
		local h = SNES9X_FONT_HEIGHT

		if eat_id == SMW.null_sprite_id and tongue_len == 0 and tongue_timer == 0 and tongue_wait == 0 then
		  draw.Text_opacity = 0.2 -- Snes9x
		end
		draw.text(x_text, y_text + h, fmt("(%0s, %0s) %02d, %d, %d",
				  eat_id_str, eat_type_str, tongue_len, tongue_wait, tongue_timer), COLOUR.yoshi)
		;

		-- more WRAM values
		local yoshi_x = 256*s8(WRAM.sprite_x_high + yoshi_id) + u8(WRAM.sprite_x_low + yoshi_id)
		local yoshi_y = 256*s8(WRAM.sprite_y_high + yoshi_id) + u8(WRAM.sprite_y_low + yoshi_id)
		local x_screen, y_screen = screen_coordinates(yoshi_x, yoshi_y, Camera_x, Camera_y)

		-- invisibility timer
		local mount_invisibility = u8(WRAM.sprite_miscellaneous18 + yoshi_id)
		if mount_invisibility ~= 0 then
		  draw.Text_opacity = 0.5 -- Snes9x
		  draw.text(draw.AR_x*(x_screen + 4), draw.AR_y*(y_screen - 12), mount_invisibility, COLOUR.yoshi)
		end

		-- Tongue hitbox and timer
		if tongue_wait ~= 0 or tongue_out ~=0 or tongue_height == 0x89 then  -- if tongue is out or appearing
		  -- the position of the hitbox pixel
		  local tongue_direction = yoshi_direction == 0 and 1 or -1
		  local tongue_high = tongue_height ~= 0x89
		  local x_tongue = x_screen + 24 - 40*yoshi_direction + tongue_len*tongue_direction
		  x_tongue = not tongue_high and x_tongue or x_tongue - 5*tongue_direction
		  local y_tongue = y_screen + 10 + 11*(tongue_high and 0 or 1)

		  -- the drawing
		  local tongue_line
		  if tongue_wait <= 9  then  -- hitbox point vs berry tile
			draw.rectangle(x_tongue - 1, y_tongue - 1, 2, 2, COLOUR.tongue_bg, COLOUR.text)
			tongue_line = COLOUR.tongue_line
		  else tongue_line = COLOUR.tongue_bg
		  end

		  -- tongue out: time predictor
		  local tinfo, tcolor
		  if tongue_wait > 9 then tinfo = tongue_wait - 9; tcolor = COLOUR.tongue_line  -- not ready yet

		  elseif tongue_out == 1 then tinfo = 17 + tongue_wait; tcolor = COLOUR.text  -- tongue going out

		  elseif tongue_out == 2 then  -- at the max or tongue going back
			tinfo = math.max(tongue_wait, tongue_timer) + floor((tongue_len + 7)/4) - (tongue_len ~= 0 and 1 or 0)
			tcolor = eat_id == SMW.null_sprite_id and COLOUR.text or COLOUR.warning

		  elseif tongue_out == 0 then tinfo = 0; tcolor = COLOUR.text  -- tongue in

		  else tinfo = tongue_timer + 1; tcolor = COLOUR.tongue_line -- item was just spat out
		  end

		  draw.Text_opacity = 0.5 -- Snes9x
		  draw.text(draw.AR_x*(x_tongue + 4), draw.AR_y*(y_tongue + 5), tinfo, tcolor, false, false, 0.5)
		  draw.Text_opacity = 1.0
		  draw.rectangle(x_tongue, y_tongue + 1, 8, 4, tongue_line, COLOUR.tongue_bg)
		end

	  end
	end


	local function show_counters()
	  if not OPTIONS.display_counters then return end

	  -- Font
	  draw.Text_opacity = 1.0
	  draw.Bg_opacity = 1.0
	  local height = SNES9X_FONT_HEIGHT
	  local text_counter = 0

	  local pipe_entrance_timer = u8(WRAM.pipe_entrance_timer)
	  local multicoin_block_timer = u8(WRAM.multicoin_block_timer)
	  local gray_pow_timer = u8(WRAM.gray_pow_timer)
	  local blue_pow_timer = u8(WRAM.blue_pow_timer)
	  local dircoin_timer = u8(WRAM.dircoin_timer)
	  local pballoon_timer = u8(WRAM.pballoon_timer)
	  local star_timer = u8(WRAM.star_timer)
	  local invisibility_timer = u8(WRAM.invisibility_timer)
	  local animation_timer = u8(WRAM.animation_timer)
	  local fireflower_timer = u8(WRAM.fireflower_timer)
	  local yoshi_timer = u8(WRAM.yoshi_timer)
	  local swallow_timer = u8(WRAM.swallow_timer)
	  local lakitu_timer = u8(WRAM.lakitu_timer)
	  local score_incrementing = u8(WRAM.score_incrementing)
	  local end_level_timer = u8(WRAM.end_level_timer)
	  local game_intro_timer = u8(0x1df5) -- unlisted WRAM

	  local display_counter = function(label, value, default, mult, frame, color)
		if value == default then return end
		text_counter = text_counter + 1
		local color = color or COLOUR.text

		draw.text(0, draw.AR_y*102 + (text_counter * height), fmt("%s: %d", label, (value * mult) - frame), color)
	  end

	  if Player_animation_trigger == 5 or Player_animation_trigger == 6 then
		display_counter("Pipe", pipe_entrance_timer, -1, 1, 0, COLOUR.counter_pipe)
	  end
	  display_counter("Multi Coin", multicoin_block_timer, 0, 1, 0, COLOUR.counter_multicoin)
	  display_counter("Pow", gray_pow_timer, 0, 4, Effective_frame % 4, COLOUR.counter_gray_pow)
	  display_counter("Pow", blue_pow_timer, 0, 4, Effective_frame % 4, COLOUR.counter_blue_pow)
	  display_counter("Dir Coin", dircoin_timer, 0, 4, Real_frame % 4, COLOUR.counter_dircoin)
	  display_counter("P-Balloon", pballoon_timer, 0, 4, Real_frame % 4, COLOUR.counter_pballoon)
	  display_counter("Star", star_timer, 0, 4, (Effective_frame - 1) % 4, COLOUR.counter_star)
	  display_counter("Invisibility", invisibility_timer, 0, 1, 0)
	  display_counter("Fireflower", fireflower_timer, 0, 1, 0, COLOUR.counter_fireflower)
	  display_counter("Yoshi", yoshi_timer, 0, 1, 0, COLOUR.yoshi)
	  display_counter("Swallow", swallow_timer, 0, 4, (Effective_frame - 1) % 4, COLOUR.yoshi)
	  display_counter("Lakitu", lakitu_timer, 0, 4, Effective_frame % 4)
	  display_counter("End Level", end_level_timer, 0, 2, (Real_frame - 1) % 2)
	  display_counter("Score Incrementing", score_incrementing, 0x50, 1, 0)
	  display_counter("Intro", game_intro_timer, 0, 4, Real_frame % 4)  -- TODO: check whether it appears only during the intro level

	  if Lock_animation_flag ~= 0 then display_counter("Animation", animation_timer, 0, 1, 0) end  -- shows when player is getting hurt or dying

	end


	-- Main function to run inside a level
	local function level_mode()
	  if SMW.game_mode_fade_to_level <= Game_mode and Game_mode <= SMW.game_mode_level then
	  
		sprites()
		player()

		-- Draws/Erases the hitbox for objects
		if User_input.mouse_inwindow == 1 then
		  select_object(User_input.xmouse, User_input.ymouse, Camera_x, Camera_y)
		end

		
				--map(Camera_x, Camera_y)

	  end
	end
	local function running()
	  if SMW.game_mode_fade_to_level <= Game_mode and Game_mode <= SMW.game_mode_level then
		return true
	  end
	  return false
	end


	local function overworld_mode()
	  if Game_mode ~= SMW.game_mode_overworld then return end

	  -- Font
	  draw.Text_opacity = 1.0
	  draw.Bg_opacity = 1.0

	  local height = SNES9X_FONT_HEIGHT
	  local y_text = SNES9X_FONT_HEIGHT

	  -- Real frame modulo 8
	  local real_frame_8 = Real_frame%8
	  draw.text(draw.Buffer_width + draw.Border_right, y_text, fmt("Real Frame = %3d = %d(mod 8)", Real_frame, real_frame_8), true)

	  -- Star Road info
	  local star_speed = u8(WRAM.star_road_speed)
	  local star_timer = u8(WRAM.star_road_timer)
	  y_text = y_text + height
	  draw.text(draw.Buffer_width + draw.Border_right, y_text, fmt("Star Road(%x %x)", star_speed, star_timer), COLOUR.cape, true)
	end


	local function left_click()
	  for _, field in pairs(Script_buttons) do

		-- if mouse is over the button
		if mouse_onregion(field.x, field.y, field.x + field.width, field.y + field.height) then
			field.action()
			return
		end
	  end

	  -- Drag and drop sprites
	  if Cheat.allow_cheats then
		local id = select_object(User_input.xmouse, User_input.ymouse, Camera_x, Camera_y)
		if type(id) == "number" and id >= 0 and id < SMW.sprite_max then
		  Cheat.dragging_sprite_id = id
		  Cheat.is_dragging_sprite = true
		  return
		end
	  end

	  -- Layer 1 tiles
	  local x_mouse, y_mouse = game_coordinates(User_input.xmouse, User_input.ymouse, Camera_x, Camera_y)
	  x_mouse = 16*floor(x_mouse/16)
	  y_mouse = 16*floor(y_mouse/16)
	  if not Options_menu.show_menu then
		select_tile(x_mouse, y_mouse, Layer1_tiles)
	  end
	end


	-- This function runs at the end of paint callback
	-- Specific for info that changes if the emulator is paused and idle callback is called
	local function snes9x_buttons()
	  -- Font
	  draw.Text_opacity = 1.0



	  -- Drag and drop sprites with the mouse
	  if Cheat.is_dragging_sprite then
		Cheat.drag_sprite(Cheat.dragging_sprite_id)
		Cheat.is_cheating = true
	  end

	  Options_menu.display()
	end



	--#############################################################################
	-- MAIN --


	-- Key presses:
	Keys.registerkeypress("rightclick", right_click)
	Keys.registerkeypress("leftclick", left_click)
	Keys.registerkeypress(OPTIONS.hotkey_increase_opacity, draw.increase_opacity)
	Keys.registerkeypress(OPTIONS.hotkey_decrease_opacity, draw.decrease_opacity)

	-- Key releases:
	Keys.registerkeyrelease("mouse_inwindow", function() Cheat.is_dragging_sprite = false end)
	Keys.registerkeyrelease("leftclick", function() Cheat.is_dragging_sprite = false end)


	gui.register(function()
	  -- Initial values, don't make drawings here
	  snes9x_status()
	  Script_buttons = {}  -- reset the buttons

	  -- Dark filter to cover the game area
	  if Filter_opacity ~= 0 then
		gui.opacity(Filter_opacity/10)
		gui.box(0, 0, draw.Buffer_width, draw.Buffer_height, Filter_color)
		gui.opacity(1.0)
	  end

	  -- Drawings are allowed now
	  scan_smw()

	  level_mode()
	  overworld_mode()

	  show_movie_info()
	  show_misc_info()
	  show_controller_data()


	  snes9x_buttons()
	end)


	emu.registerbefore(function()
	  Joypad = joypad.get(1)

	  if Cheat.allow_cheats then
		Cheat.is_cheating = false

		Cheat.beat_level()
		Cheat.free_movement()
	  else
		-- Cancel any continuous cheat
		Cheat.under_free_move = false

		Cheat.is_cheating = false
	  end
	end)


	emu.registerexit(function()
	  config.save_options()
	  print("Finishing smw-snes9x script.")
	end)


	print("Lua script loaded successfully.")

	--[[while true do
	  -- User input data
	  Previous.User_input = luap.copytable(User_input)
	  local tmp = input.get()
	  for entry, value in pairs(User_input) do
		User_input[entry] = tmp[entry] or false
	  end
	  User_input.mouse_inwindow = mouse_onregion(0, 0, draw.Buffer_width - 1, draw.Buffer_height - 1) and 1 or 0 -- Snes9x, custom field

	  -- Detect if a key was just pressed or released
	  for entry, value in pairs(User_input) do
		if (value ~= false) and (Previous.User_input[entry] == false) then Keys.pressed[entry] = true
		  else Keys.pressed[entry] = false
		end
		if (value == false) and (Previous.User_input[entry] ~= false) then Keys.released[entry] = true
		  else Keys.released[entry] = false
		end
	  end

	  -- Key presses/releases execution:
	  for entry, value in pairs(Keys.press) do
		if Keys.pressed[entry] then
		  value()
		end
	  end
	  for entry, value in pairs(Keys.release) do
		if Keys.released[entry] then
		  value()
		end
	  end

	  -- Lag-flag is accounted correctly only inside this loop
	  Is_lagged = emu.lagged()

	  emu.frameadvance()
	end]]
	
	--!important write getters here
	local function get_mario_pos() 	  
	  local x = s16(WRAM.x)
	  local y = s16(WRAM.y) 
	  return x, y 
	end
	
	local function get_mario_pos_abs()
	  local xp = s16(WRAM.x)
	  local yp = s16(WRAM.y)
	  local x, y = screen_coordinates(xp, yp, Camera_x, Camera_y) --!important, set coords to absolute\
	  return x, y
	end
	  
	local function get_mario_state() return g_left, g_right, g_down end
	local function get_enemy_dist() return nil end
	local function get_sprite_dist()  
		return nearest_enemy
	end
	local function is_touching() return nil end
	local function e() return print("Hello") end

	-- export functions and some local variables
	yeet.screen_coordinates = screen_coordinates
	yeet.game_coordinates = game_coordinates
	yeet.get_mario_pos = get_mario_pos
	yeet.get_mario_pos_abs = get_mario_pos_abs
	yeet.running = running

	yeet.get_mario_state = get_mario_state
	yeet.get_sprite_dist = get_sprite_dist
	--yeet.get_mario_pos = get_mario_pos
	--yeet.get_mario_pos = get_mario_pos

	return yeet