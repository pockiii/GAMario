--[[
class for creating a DNA of genes
DNA is structured as follows:
[<response>][<distance for action>] (10 <= distance <= 150, if 0 then immediate response)
[downCollide][-1]
[rightCollide][-1]
[leftCollide][-1]
[airborne][-1]
[enemy][x]
[wall][x]
[ledge][x]

TODO: Come up with 2 ways to interact, discuss w/Jeffery about data collection
--]]
local self = {}
local reacts = {"right", "left", "X", "Y", "A", "B", "down", "up"}
--make random DNA
local function DNA()
	local self = {}
	local fitness 
	local flag = 0 --flag chromosome to -1 for bad and +1 for good 
	local gene = {}
	local weight = 0
	for i = 1, 14 do 
		if i%2 == 1 then --insert distance 
			gene[i] = reacts[math.random(8)] 
		elseif i%2 == 0 then --insert response 
			gene[i] = math.random(1,100)
		end
	end 
	
	--set distance to -1 for immediate responses: downCollide, rightCollide, leftCollide
	gene[2] = -1 
	gene[4] = -1
	gene[6] = -1 
	gene[8] = -1
	--for _ in pairs(gene) do print(gene[_]) end

	local function get_gene(num) 
		if num <= 0 then return gene end
		return gene[num] 
	end
	
	local function set_flag(val) flag = val end
	
	local function get_flag() return flag end 
	
	local function set_gene(g) gene = g end
	
	local function get_fitness() return fitness end
	
	local function get_weight() return weight end
	
	local function set_weight(num) weight = num end
	
	local function crossover(dna2) --use multipoint crossover
		local index = 1
		local g2 = {}
		for i = 1,7 do
			if i%2 == 1 then 
				g2[index] = gene[index]
				g2[index+1] = gene[index+1]				
			elseif i%2 == 0 then 
				g2[index] = dna2.get_gene(index)
				g2[index+1] = dna2.get_gene(index+1)
			end	
			index = index + 2
		end
		
		--print("crossover~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
		--for _ in pairs(g2) do io.write(g2[_]) end

		return g2
	end
	
	local function mutate(rate)
		for i = 1,#gene do 
			if math.random() < rate then
			--print("mutate guy")
				if i%2 == 1 then 
					gene[i] = reacts[math.random(8)] 
				elseif i%2 == 0 then  
					gene[i] = math.random(0,100)
				end
			end
		end
		--print("mutate~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	
	end 
	
	local function calc_fitness(distance) fitness = distance return fitness end

	self.crossover = crossover
	self.mutate = mutate
	self.get_flag = get_flag
	self.set_flag = set_flag
	self.set_gene = set_gene
	self.set_weight = set_weight
	self.get_weight = get_weight
	self.get_gene = get_gene
	self.calc_fitness = calc_fitness
	self.get_fitness = get_fitness
	return self
end

local function population(r, s)
	local self = {}
	local rate = r --mutation rate
	local size = s --population size
	local population = {}
	local mating_pool = {}
    for i = 1,size do --fill population with entities
		local entity = DNA()
		table.insert(population, entity)
    end

	function selection(w, size)
		local temp
		local j
		local max = 0
		local pc = w 
		local selection_rate = 0
		local rand
		
		local count = 0
		for n = 1,#population do
			if population[n].get_flag() == 1 then 
				for m = 1,#population do
					if population[m].get_flag() == -1 then
						population[n].set_flag(0)
						population[m].set_flag(0)
						population[m] = DNA()
						population[m].set_gene(population[n].get_gene(0))
						population[m].calc_fitness(population[n].get_fitness())
						count = count + 1
						break
					end
				end
			end
		end
		print("swaps: " .. count)
		
		for i = 2,#population do  --sort population using insertion sort
			temp = population[i]
			j = i - 1
			while j >= 1 and temp.get_fitness() >= population[j].get_fitness() do 
				population[j + 1] = DNA()
				population[j + 1].set_gene(population[j].get_gene(0)) --0 param to return whole gene
				population[j + 1].calc_fitness(population[j].get_fitness())

				j = j - 1
			end
			population[j + 1] = DNA()
			population[j + 1].set_gene(temp.get_gene(0))
			population[j + 1].calc_fitness(temp.get_fitness())

		end
		
		for n = 1,#population do 
			if n == 1 then
				population[n].set_weight(pc) --TODO: make pc dynamic
			elseif n == #population then 
				population[n].set_weight((1 - pc)^(n-1)) 
			else
				population[n].set_weight(((1 - pc)^(n-1)) * pc ) 
			end
	       			
		end
		--print("selection~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
		--for _ = 1,#population do print(_ .. " " .. population[_].get_fitness() .. " " .. population[_].get_weight()) end
		
		--loop thru to populate mating_pool TODO
		for n = 1,size do 
			selection_rate = 0 --sr used for weights 
			rand = math.random(0, 999999) * 1e-6
			for m = 1,#population do 
			--print(rand)
				selection_rate = selection_rate + population[m].get_weight()
				if rand < selection_rate then mating_pool[n] = population[m] break end
			end	
		end	
		--print("selection pt2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
		--for _ in pairs(mating_pool) do print(_ .. " " ..mating_pool[_].get_fitness() .. " " .. mating_pool[_].get_weight()) end

	end
	
	function crossover()
		local size_p = #population --checks for odd population size
		if #population%2 == 1 then
			size_p = size_p - 1
		end
		
		local i = 1
		while i < size_p do
			local a = mating_pool[math.random(1, #mating_pool)]
			local b = mating_pool[math.random(1, #mating_pool)]
			local c = DNA()
			local d = DNA()
			c.set_gene(a.crossover(b))
			c.mutate(rate)
			d.set_gene(b.crossover(a))
			d.mutate(rate)
			population[i] = c
			population[i+1] = d
			i = i + 2
		end	
		
		if #population%2 == 1 then --add single child if size is odd
			local e = mating_pool[math.random(1, #mating_pool)]
			local f = mating_pool[math.random(1, #mating_pool)]
			local g = DNA()
			g.set_gene(e.crossover(f))
			g.mutate(rate)
			population[#population] = g
		end
		
		--print("crossover~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
		--for _ = 1,#population do print(_ .. " ") end	
	end
	
	function getDNA(num) return population[num] end

	self.getDNA = getDNA
	self.mutate = mutate
	self.crossover = crossover
	self.selection = selection
	return self
end
      
local function getEntity() return DNA() end
local function generate_population(r, s) 
	return population(r, s)
end

self.generate_population = generate_population
self.getEntity = getEntity
return self