
-- Ctrl-R places groups of friends in the world...
animal_deer = {354,353,353,355}
animal_cow	= {356}
animal_buff = {352}
animal_rabb = {343}
animal_boar	= {348}
friend_a_groups = 
{
	animal_deer, animal_cow, animal_rabb, animal_boar,
}

-- Alt-R places groups of enemies in the world...
animal_bear1 = {345}
animal_bear2 = {344}
animal_wolf1 = {349}
animal_wolf2 = {350}
tower_enemy1 = {2614,2614,2614,2614,2614,2614}
tower_enemy2 = {2615,2615,2615,2615,2615,2615}
tower_enemy3 = {2616,2616,2616,2616,2616,2616}
tower_enemy4 = {2617,2617,2617,2617,2617,2617}
tower_enemy5 = {2618,2618,2618,2618,2618,2618}
tower_enemy6 = {2619,2619,2619,2619,2619,2619}
tower_enemy7 = {2620,2620,2620,2620,2620,2620}
enemy_a_groups = 
{
	tower_enemy1,
	tower_enemy2,
	tower_enemy3,
	tower_enemy4,
	tower_enemy5,
	tower_enemy6,
	tower_enemy7,
}

-- code for placing those follows:

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

function test_ctrl_r()
	local x = 0
	local y = 0
	local valid
	valid, x, y = GameControl:GetMousePosGrid(x, y)
	local t = friend_a_groups
	if valid == 1 and y > 1 and x > 1 then
		if t.current == nil or t.current>=getn(t) then
			t.current = 1
		else
			t.current = t.current + 1
		end
		place_all(t[t.current], x,y, 1)
	end
end


function test_alt_r()
	local x = 0
	local y = 0
	local valid
	valid, x, y = GameControl:GetMousePosGrid(x, y)
	local t = enemy_a_groups
	if valid == 1 and y > 1 and x > 1 then
		if t.current == nil or t.current>=getn(t) then
			t.current = 1
		else
			t.current = t.current + 1
		end
		place_all(t[t.current], x,y, 0)
	end
end
