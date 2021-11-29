
-- Ctrl-T places groups of friends in the world...
group_human = {495,525,521,512,515,519,498,503,507,520}
group_human_melee = {495,499,501,504,506,507,509,512,513,516}
group_human_robe = {497,503,515,517,521,525}
group_human_pain_caster = {525}
group_elf_melee = {462, 454, 459, 474, 464, 466}
group_elf_archer = {456, 467, 460, 463, 469}
group_elf_melee_weaponright = {461,465,464,470,473,474} 
group_dwarf1 = {412,419,418,423,406,407,394}
group_dwarf2 = {404,422,413,395,420}
group_pr_elfendruid = {460}
group_pr_elfenarcher = {456}

group_ao2_knights = {2058, 2064, 2058, 2064, 2065,2058, 2064, 2058, 2064, 2065}
group_ao1_iceelves = {1826,1827,1828,1829,1826,1827,1828,1829,1826,1827,1828,1829}
group_ao2_uniques = {2110, 2099,2110, 2099,2110, 2099,2110, 2099}

--friend_groups = {group_pr_elfenarcher, group_elf_melee , group_elf_archer, group_elf_melee_weaponright, group_pr_elfendruid, group_human_melee, group_human_melee}
friend_groups = {group_ao1_iceelves, group_ao2_knights, group_ao2_uniques}

-- Alt-T places groups of enemies in the world...
group_orc_all = {366,365,374,393,385,377,370,371,373,369,384,376,376,393}
group_orc = {393,369,393,386}
group_orc1 = {366,365}
group_orc2 = {393,385}
group_orc3 = {370,369}
group_orc4 = {384,376,376,393}
group_golem_snow = {117,118,119}
group_golem_rock = {123,124,125}
group_golem_lava = {120,121,122}
group_skeleton1 = {134,135,133,137,142,144,145}
group_skeleton2 = {151,147,150,146,148,149}
group_skeleton3 = {134,135,134,135,134,135,134,135,134,135,}
group_wolf = {351,350,349}
group_animal = {354,356,352,344,346,343,355}
group_wraith = {280,281,286,289,291,292,290}
group_darkelf = {436,428,431,435,434,433}
group_manticore = {198,224,225,197,199}
group_manticore_single = {198}
group_medusa = {127,126,128}
group_medusa_one = {127}
group_smalldragon = {585,586,587}
group_dragon1 = {585}
group_dragon2 = {587}
group_ogre = {193,196,195,190,192,194}
-- Presseshots 17. März 2003
group_pr_goblin = {257,258,257,252}
group_pr_golem = {120}
group_pr_ogres = {711}
group_pr_skelett = {135,138,141}
group_pr_wraith = {283}
group_pr_elfendruid = {460}
group_pr_elfenarcher = {456}
group_pr_orcs = {741,740,364,829,393}
group_pr_beastmen = {216,671}	
group_pr_daemon = {175}
group_variable = {1177}

group_ao2_dervish = {2436,2437,2438,2049,2050,2051}
group_ao2_mummy = {2427, 2428, 2429,2427, 2428, 2429}
group_ao2_lizard = {2079,2079,2079,2082,2082, 2083, 2085}
group_ao2_empyria1 = {2156,2157,2159,2162,2163,2164}
group_ao2_bronze = {2169, 2451, 2451, 2195, 2195}

--enemy_groups = {group_variable, group_medusa, group_dragon1, group_dragon2, group_golem_lava, group_wraith}
enemy_groups = {group_ao2_empyria1, group_ao2_dervish, group_ao2_mummy,group_ao2_lizard, group_ao2_bronze}
  
comment = [[
enemy_groups = 
{
	group_orc1, group_orc2, group_goblin, group_golem, 
	group_skeleton, group_wraith, group_darkelf, group_wolf,
	group_manticore, group_medusa, group_smalldragon,
	group_ogre, group_animal,
}
]]
comment = nil

-- code for placing those follows:

TotalNumberOfUnitsPlaced = 0

-- encapsulates the placing of a unit (after all the checks that it is allowed)
function place_unit(x,y,owner,id)
	local npcid = 0
	if owner==1 then
		npcid = -1
	end
	
	if (type(id) == "string") then 
		local units = doscript("sql_unit")
        for i, v in units do
			if (strfind(v.name, id)) then 
				id = i
				break
			end
		end
	end

	if (type(id) == "string") then 
		print(id, "not found")
		return
	end
	
	print(id)

	TotalNumberOfUnitsPlaced = TotalNumberOfUnitsPlaced + 1
	Application:Test_SpawnUnit(id, npcid, x, y)
end

-- encapsulates the placing of a unit (after all the checks that it is allowed)
function place(id)
	local x = 0
	local y = 0
	local valid
	valid, x, y = GameControl:GetMousePosGrid(x, y)
	print(valid, x, y)
	if valid == 1 then place_unit(x,y,1,id) end
end

function getselection()
	local category = 0
	local id = 0
	local elements = GameControl:GetSelection():GetSize()

	if (elements == 0) then return end

	category, id = GameControl:GetSelection():GetItem(0, category, id)
	print(category,id)
	return id
end

function vanish(id)
	if (id == nil) then id = getselection() end
	
	if (id == nil) then return end

	Application:Test_FigureVanish(id)
end


--group_offsets = {{1,1},{-1,-1},{1,0},{0,1},{-1,0},{0,-1},{0,0},{2,2},{-2,-2},{2,0},{0,2},{-2,0},{0,-2}} -- max 7 in a place_all
-- utility function - returns a function that places all units from the group
function place_all(group_ids, x,y, owner)
	for i = 1,getn(group_ids) do
		place_unit(x, y, owner, group_ids[i])
		--if i <= getn(group_offsets) then 
			-- place_unit(x+group_offsets[i][1], y+group_offsets[i][2], owner, group_ids[i])
		--end
	end
end

function test_ctrl_t()
	local x = 0
	local y = 0
	local valid
	valid, x, y = GameControl:GetMousePosGrid(x, y)
	local t = friend_groups
	if valid == 1 and y > 1 and x > 1 then
		if t.current == nil or t.current>=getn(t) then
			t.current = 1
		else
			t.current = t.current + 1
		end
		place_all(t[t.current], x,y, 1)
	end
end


function test_alt_t()
	local x = 0
	local y = 0
	local valid
	valid, x, y = GameControl:GetMousePosGrid(x, y)
	local t = enemy_groups
	if valid == 1 and y > 1 and x > 1 then
		if t.current == nil or t.current>=getn(t) then
			t.current = 1
		else
			t.current = t.current + 1
		end
		place_all(t[t.current], x,y, 0)
	end
end


-- figure placement for balancing...
function RuleThemAll(Unit1, Unit2, Amount1, Amount2, Distance, UnitsPerRow)
	if not Amount1 then Amount1 = 10 end
	if not Amount2 then Amount2 = 10 end
	if not Distance then Distance = 6 end
	if not UnitsPerRow then UnitsPerRow = 10 end

	-- default position:
	local DefaultX = 35
	local DefaultY = 15
	
	local x = DefaultX
	local y = DefaultY
	for i = 1, Amount1 do
		Application:Test_SpawnUnit(Unit1, 0, x, y)
		TotalNumberOfUnitsPlaced = TotalNumberOfUnitsPlaced + 1
		y = y + 1
		if mod(i, UnitsPerRow) == 0 then
			x = x - 1 
			y = DefaultY
		end
	end

	local x = DefaultX + Distance
	local y = DefaultY
	for i = 1, Amount2 do
		Application:Test_SpawnUnit(Unit2, 0, x, y)
		TotalNumberOfUnitsPlaced = TotalNumberOfUnitsPlaced + 1
		y = y + 1
		if mod(i, UnitsPerRow) == 0 then 
			x = x + 1
			y = DefaultY
		end
	end
end

function SlayThemAll()
	for i = 2, (TotalNumberOfUnitsPlaced + 2) do
		vanish(i)
	end
end
