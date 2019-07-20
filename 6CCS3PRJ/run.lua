local smw = require "src.smw-snes9x"
local display = require "draw"
local ga = require "genetic_alg"
local get_params = require "param"

local t1 = {}
local completed = false
local function jump2frames(key)

		joypad.set(1, key)
			emu.frameadvance()
		joypad.set(1, key)
			emu.frameadvance()
		joypad.set(1, key)
			emu.frameadvance()
		joypad.set(1, key)
			emu.frameadvance()
		joypad.set(1, key)
			emu.frameadvance()
		joypad.set(1, key)
			emu.frameadvance()


end
local function decode(gene)
	if gene == "right" then return {right=1}
	elseif gene == "left" then return {left=1}
	elseif gene == "X" then return {X=1}
	elseif gene == "Y" then return {Y=1}
	elseif gene == "A" then jump2frames({A=1}) return {A=1}
	elseif gene == "B" then jump2frames({B=1}) return {B=1}
	elseif gene == "down" then return {down=1}
	elseif gene == "up" then return {up=1}
	end
end
	
	
local function run_dna(dna, s, still_frames)
	
	completed = false
	idle = still_frames --terminate Mario after standstill 
	alive = true --set to false to end level
	consecutive_x = 0
	prev_x = 0
	prev_y = 0 --for ledge detection
	prev_frame_down = 1--for ledge detection
	
	--display.display()

	while alive and not completed do 
	
	t1 = joypad.get(1)
	
	display.mapping()
	mario_x, mario_y = smw.get_mario_pos()
	mario_x_abs, mario_y_abs = smw.get_mario_pos_abs()
	sprite_dist = smw.get_sprite_dist()
	mario_left, mario_right, mario_down = smw.get_mario_state()
	
	--for every frame
	local nearestEnemy
	local nearestWall
	local nearestLedge
	--local nearestEnemyPos --above, left, right
	
	local nearestWallDist --compare x
	local nearestLedgeDist --compare x
	local nearestEnemyDist = sprite_dist
	
	local leftCollide, rightCollide, downCollide = smw.get_mario_state()	
	
	if prev_frame_down == 1 and prev_y < mario_y and prev_y > 0 then
		display.add_ledge_mapping(mario_x, mario_y)
		prev_frame_down = 0
		prev_y = mario_y
	else 
		prev_frame_down = mario_down
		prev_y = mario_y
	end
	
	if nearestEnemyDist <= dna.get_gene(10) and nearestEnemyDist ~= 0 then
		joypad.set(1, decode(dna.get_gene(9)))
	end
	
	if downCollide == 1 then
		joypad.set(1, decode(dna.get_gene(1)))

	else --airborne
		joypad.set(1, decode(dna.get_gene(7)))

	end
	if rightCollide == 1  then
		--jump2frames({B=1})
		joypad.set(1, decode(dna.get_gene(3)))

	end
	if leftCollide == 1 then
		joypad.set(1, decode(dna.get_gene(5)))
	end
	if nearestWallDist == dna.get_gene(12) then
		joypad.set(1, decode(dna[11]))

	end
	if nearestLedgeDist == dna.get_gene(14) then
		joypad.set(1, decode(dna [13]))

	end
	
	--count frames Mario stands still 
	if prev_x == mario_x then
		consecutive_x = consecutive_x + 1
	else
		prev_x = mario_x
		consecutive_x = 0	
	end
	--flag run
	if t1.L == true then
	print("up flag")
		dna.set_flag(1)
	end
	
	if t1.R == true then
	print("down flag")
		dna.set_flag(-1)
		display.remove_ledge(mario_x)
		savestate.load(s)
		alive = false
	end
	
	--terminate when mario reaches goal
	--condition for death
	--terminate when key press
	if consecutive_x == still_frames-50 and mario_down == 0 then joypad.set(1, {A=1}) end
	if mario_y >= 600 or consecutive_x == still_frames then	
		--print("dead")
		display.remove_ledge(mario_x)
		savestate.load(s)
		alive = false
	end
	
	--program will wait when goal is reached until reinitialization 
	if mario_x >= 4900 then 
		--print("dead")
		display.remove_ledge(mario_x)
		savestate.load(s)
		alive = false
		
	end
	emu.frameadvance() --move
	end
end
	
local function run_pop(population, save, still_frames, size, weight) 
	local pc = weight
	
	for i = 1, size do--loop through population 
		
		--print("genotype " .. i) commented out for import
		run_dna(population.getDNA(i), save, still_frames)--run_gene(DNA) frames 
		population.getDNA(i).calc_fitness(mario_x)--calcfitness(DNA)
		print(population.getDNA(i).get_fitness())
		--print(" ")commented out for import
		--if level finished
			--terminate simulation until mouse click
			--create new save 
		while completed do
			if t1.select == true then
				completed = false
			end
		end
	end
	
	population.selection(pc, size)
	population.crossover()
	
end	

--execute
local save = savestate.create(1)
savestate.save(save)
local counter = 0

local m_rate = get_params.get_mutate_rate()
local pop_size = get_params.get_size()
local still_frames = get_params.get_still_frames()
local weight = get_params.get_weighting()

local foo = ga.getEntity(1)
print(m_rate)
local population = ga.generate_population(m_rate, pop_size) --TODO: make rate and size dynamic
while true do
print("----------------------------------------------------------------------")
print("generation " .. counter)
run_pop(population, save, still_frames, pop_size, weight) --TODO: make size dynamic for still 
counter = counter + 1

end
	
	