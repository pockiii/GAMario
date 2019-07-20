local size = 15 --size of population
local mutate_rate = 0.0--rate of mutation
local still_frames = 200--frames Mario can stand still until termination, must be greater than 50
--local mutate_individual_genes = false --changes order of mutation
local weighting = 0.6--set the max weighting for any gene to be in the mating pool

local self = {}	 

local function get_size() return size end
local function get_mutate_rate() return mutate_rate end
local function get_still_frames() return still_frames end
local function get_weighting() return weighting end

self.get_size = get_size
self.get_mutate_rate = get_mutate_rate
self.get_still_frames = get_still_frames
self.get_weighting = get_weighting
return self