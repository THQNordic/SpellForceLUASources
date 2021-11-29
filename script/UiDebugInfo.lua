-- this file initializes the in game user interface

-- cat_table = {"Figure","Building","Thingy","Effect"} -- map category numbers to strings...
cat_table = make_dict(globals(), "kGtCategory", 1)

debug_stats = -- what stats to show?
{
	"Life", "Mana", 
	"AC", 
	"Agi", "Cha", "Dex", "Int", "Sta", "Str", "Wis",
	"ResBlackMagic", "ResFire", "ResIce", 
	"ResMindMagic",
	"CastSpeed", "FightSpeed", 
	"WalkSpeed", 
}

short_names = -- shorter names for long stat names:
{
	CastSpeed="SC", FightSpeed="SF", WalkSpeed="SW", 
	ResBlackMagic="RBl", ResFire="RFi", ResIce="RIc", ResMindMagic="RMi",
}

stat_colors =
{
	Life="%c88ff88",
	Mana="%c8888ff",
	CastSpeed="%c00cccc", FightSpeed="%c00cccc", WalkSpeed="%c00cccc", 
	ResBlackMagic="%ccccc00", ResFire="%ccccc00", ResIce="%ccccc00", ResMindMagic="%ccccc00",
}

figure_flags = -- what figure flags to display?
{
	Undead = 1,
	ReservedOnly = 2,
	Angry = 4,
	Dead = 8,
	Redo = 16,
	CheckSpellsBeforeJob = 32,
	CheckSpellsBeforeCheckBattle = 64,
	WalkJobWait = 128,
	Freezed = 256,
	HasLoot = 512,
	HasDialog = 1024,
	Female = 2048,
	GotAggro = 4096,
	Retreat = 8192,
	NoWayToTarget = 16384,
	AuraRunning = 32768,
	AIBlocked = 65536,
	Tower = 131072,
	IsSwapping = 262144,
	CurActiveDialog = 524288,
	IsInFight = 1048576,
	ViewMode1st3rd = 2097152,
	IsTalking = 4194304,
	IsImportantDialog = 8388608,
	UnKillable = 16777216,
	FollowMode = 33554432,
	HitLeftHandNext = 67108864,
	ForestSpirit = 134217728,
	VIP = 268435456,
	Illusion = 536870912,
	Spawn = 1073741824,
}

figure_jobflags =
{
	ManualJobChange = 1,
	SkipOnce = 2,
	ManualHitTarget = 4,
	CorpseCantRott = 8,
	StartWalk = 16,
	RunMode = 32,
	War = 64,
	CheckBattle = 128,
	PatrolMode = 256,
	WayPointsReadReverse = 512,
	SuperiorPathing = 1024,
	RoundHit = 2048,
	DeathBlow = 4096,
	StartWorkAtBuildingForceJob = 8192,
}
	
-- create a table containing all spelllines to display
spell_lines = make_dict(globals(), "kGdSpellLine", 1)

-- building flags to display:
building_flags = make_dict(globals(), "kGdBitBuilding", 1)

-------------------------------------------------------------------------------------------------------------
-- functions
-------------------------------------------------------------------------------------------------------------

-- debug infos on currently selected figure - can also be used from console! print(Debug_FigureInfo(1))
function Debug_FigureInfo(id)
	local caption = ""

	local flags = { -- which "flags" to show?
		IsCivilian="Civ.",
		IsHero="Hero",
		IsMainChar="Main",
		IsDead="Dead",
		IsMerchant="Merchant",
		IsPatrolling="Patrolling",
		IsPet="Pet",
		IsUndead="Undead",
		IsWarrior="Warrior",
	}
	for i,v in flags do
		if Figure[i](Figure,id) then -- call Figure:IsCivilian(id) etc.
			caption = caption .. "-"..v.."- " 
		end
	end

	caption = caption .. "Id:" .. id .. " "
	caption = caption .. "At:" .. Figure:GetX(id) .. "," .. Figure:GetY(id) .. " "	
	caption = caption .. "Race:" .. tostring(search_global(Figure:GetRace(id), "kGtRace", 1)) .. " "
	caption = caption .. "Lvl:" .. Figure:GetLevel(id) .. " "
	caption = caption .. "Own:" .. Figure:GetOwner(id) .. " "
	caption = caption .. "NpcId:" .. Figure:GetNPCID(id) .. " "

	caption = caption .. "\nJob:" .. tostring(search_global(Figure:GetJob(id), "kGdJob", 1)) .. " - "
	caption = caption .. "WalkTo:" .. (Figure.GetWalkToX and Figure:GetWalkToX(id) or "?") .. "," .. (Figure.GetWalkToY and Figure:GetWalkToY(id) or "?") .. " - "
	caption = caption .. "WalkMode:" .. Figure:GetWalkMode(id) .. " - "
	caption = caption .. "PathingMode:" .. Figure:GetPathingMode(id) .. " - "
	caption = caption .. "Head:" .. Figure:GetHead(id) .. "\n"
	for i,v in figure_flags do
		if Figure:IsFlagSet(id, v) then
			caption = caption .. "-" .. i .. " "
		end
	end
	for i,v in figure_jobflags do
		if Figure:IsJobFlagSet(id, v) then
			caption = caption .. "-" .. i .. " "
		end
	end
	caption = caption .. "\nUnitId:" .. Figure:GetUnitID(id) .. " "
	caption = caption .. "Faction:" .. Figure:GetFaction(id) .. " "
	caption = caption .. "GroupLeader:" .. Figure:GetGroupLeader(id) .. " "
	if Figure:GetGroupLeader(id) == id then
		caption = caption .. "(Leader!) "
	end
	caption = caption .. "Activity:" .. Figure:GetActivity(id) .. " "
	if Figure:GetAlarmed(id) ~= 0 then
		caption = caption .. "Alarmed! "
	end

	caption = caption .. "\nItems: "
	for slot=kGtEquipSlotHead,kGtMaxEquipmentSlots-1 do
		local item=Figure:GetEquipment(id,slot)
		if item and item > 0 then
			caption = caption .. search_global(slot, "kGtEquipSlot", 1) .. ":" .. item 
			if slot == kGtEquipSlotRightHand then
				caption = caption .. "(" .. Figure:GetWeaponStats(id, kGdFigureWeaponStatsRightHand).iWeaponType .. ")"
			elseif slot == kGtEquipSlotLeftHand then
				caption = caption .. "(" .. Figure:GetWeaponStats(id, kGdFigureWeaponStatsLeftHand).iWeaponType .. ")"
			end
			caption = caption .. " "
		end
	end

	local infos = {}
	for i = 1,getn(debug_stats) do
		local stat = debug_stats[i]
		local current = Figure["Get"..stat.."Current"] and Figure["Get"..stat.."Current"](Figure,id) or "?"
		local currentmax = Figure["Get"..stat.."CurrentMax"] and Figure["Get"..stat.."CurrentMax"](Figure,id) or "?"
		local buff = Figure["Get"..stat.."Buff"] and Figure["Get"..stat.."Buff"](Figure,id) or 0
		local equip = Figure["Get"..stat.."Equip"] and Figure["Get"..stat.."Equip"](Figure,id) or 0

		local stat_color = stat_colors[stat] or "%d"
		stat = short_names[stat] or stat
		local info
		if current < currentmax then
			info = {"%cff0000" .. stat_color .. stat, "%cff0000" .. current .. stat_color .. "/" .. currentmax}
		else
			info = {stat_color .. stat, stat_color .. current}
		end
		if buff ~= 0 then 
			info[1] = info[1] .. "%c1818ffB"
			info[2] = info[2] .. "%c1818ff~" .. buff
		end
		if equip ~= 0 then 
			info[1] = info[1] .. "%c38ff38E"
			info[2] = info[2] .. "%c38ff38~" .. equip
		end
		tinsert(infos, info)
	end

	-- convert info array to 2 lines
	local labelstring = ""
	local valuestring = ""

	for i = 1,getn(infos) do
		local label = infos[i][1]
		local value = tostring(infos[i][2])
		local length = max(strlen(label),strlen(value))
		labelstring = labelstring..label..strrep(" ", 1+length-strlen(label))
		valuestring = valuestring..value..strrep(" ", 1+length-strlen(value))
	end

	local caption = caption .. "\n" .. labelstring .. "\n" .. valuestring .. "\n"

	caption = caption .. "%cff8888"

	for i,v in spell_lines do 
		if FigureToolBox:HasSpellOnIt(id,i) then
			caption = caption .. v .. " "
		end
	end

	caption = caption .. "%d"

	g_DrwDebuggedFigure = id

	return caption
end

-- debug infos on currently selected building - can also be used from console! print(Debug_BuildingInfo(1))
function Debug_BuildingInfo(id)
	local caption = ""

	if Building:IsActive(id) then caption = caption .. "-Active- " end
	if Building:IsAlive(id) then caption = caption .. "-Alive- " end
	if Building:IsBuildUp(id) then caption = caption .. "-BuildUp- " end

	caption = caption .. "Id:" .. id .. " "
	caption = caption .. "At:" .. Building:GetX(id) .. "," .. Building:GetY(id) .. " "	
	caption = caption .. "Race:" .. tostring(search_global(Building:GetRace(id), "kGtRace", 1)) .. " "
	caption = caption .. "Own:" .. Building:GetOwner(id) .. " "
	caption = caption .. "\n"

	caption = caption .. "Type:" .. tostring(search_global(Building:GetType(id), "kGdBuilding", 1, "kGdBuildingCalc")) .. " "
	caption = caption .. "\n"

	caption = caption .. "Angle:" .. Building:GetAngle(id) .. " "
	caption = caption .. "BuildUp:" .. Building:GetBuildUp(id) .. " "
	caption = caption .. "LifePoints:" .. Building:GetLifeCurrent(id) .. " "
	caption = caption .. "\n"

	for i,v in building_flags do
		if Building:GetFlagBit(id, i) ~= 0 then
			caption = caption .. "-" .. v .. " "
		end
	end

	return caption
end

-- debug infos on currently selected object - can also be used from console! print(Debug_ObjectInfo(1))
function Debug_ObjectInfo(id)
	local caption = ""

	if Object:IsMonumentObject(id) == 1 then caption = caption .. "-Monument- " end
	if Object:IsIronObject(id) == 1 then caption = caption .. "-Iron- " end
	if Object:IsMithrilObject(id) == 1 then caption = caption .. "-Mithril- " end
	if Object:IsStoneObject(id) == 1 then caption = caption .. "-Stone- " end
	if Object:IsTreeObject(id) == 1 then caption = caption .. "-Tree- " end
	if Object:IsManaHerbObject(id) == 1 then caption = caption .. "-ManaHerb- " end
	if Object:IsManaSpringObject(id) == 1 then caption = caption .. "-ManaSpring- " end
	if Object:IsBerryBushObject(id) == 1 then caption = caption .. "-BerryBush- " end

	caption = caption .. "At:" .. Object:GetX(id) .. "," .. Object:GetY(id) .. " "	
	caption = caption .. "Type:" .. Object:GetType(id) .. " "
	caption = caption .. "\n"

	return caption
end

dict_goods = make_dict(globals(), "kGdGood", 1)
dict_races = make_dict(globals(), "kGtRace", 1)


function Debug_OnDataUpdate()
	local pGameContainer

	pGameContainer = tolua.cast(Screen:ControlByName ("<Cont>GameContainer"), "CMnuContainer")
	if pGameContainer ~= nil then
		if pGameContainer:Visible() == 0 then
			--Application:Log("pGameContainer INVIS")
			return
		else
			--Application:Log("pGameContainer visible")
		end
	end

	local pUpdate

	-- mouse info
	pUpdate = tolua.cast(Screen:ControlByName ("<ctrl>lbMouseGrid"), "CMnuLabel")
	if pUpdate ~= nil then

		local caption
		local selcount
		local selcat = 0
		local selid = 0
		selcount = Selection:GetSize()
		if selcount == 1 then
			selcat, selid = Selection:GetItem(0)
			selcat = cat_table[selcat] or tostring(selcat)
		end

		caption = ""

		if Debug and Debug.SelectionInfo==1 then

			-- get the grid pos of the mouse
			local valid
			local mousex = 0
			local mousey = 0
			local x = 0
			local y = 0
			local sps = Application:GetAppSession():GetStepsPerSecond()

			valid, x, y = GameControl:GetMousePosGrid(x, y)

			if valid == 1 then
				local art = World:GetType(x,y)
				caption = caption .. format('Gridpos = %1$.0f/%2$.0f; Steps/s = %3$.1f; ', x, y, sps) -- "Terrain = %3$d;", art, 
			else
				caption = caption .. format('Gridpos = %1$.0f/%2$.0f (invalid); Steps/s = %3$.1f; ', x, y, sps)
			end


			if selcount == 1 then
				caption = caption .. format('Selected %1$s = %2$d', selcat, selid)
			elseif selcount > 1 then
				caption = caption .. format('Multi-Selection (%1$d)',selcount)
			end

			if selcat == 'Building' then
				if Building:GetBuildUp(selid) > 0 then
					caption = caption .. format(' (Build:%1$d)', Building:GetBuildUp(selid))
				end
				caption = caption .. format(' (Type:%1$d)', Building:GetType(selid))
			end

		else

			caption = ""

		end

		if Debug and Debug.CameraInfo==1 then 
			x,y,z = Camera:GetPosition(0,0,0)
			caption = format("Camera = %1$.1f/%2$.1f/%3$.1f; ",x,y,z) .. caption
		end

		pUpdate:SetCaption(caption)

		-- figure info
		pUpdate = tolua.cast(Screen:ControlByName ("<ctrl>lbDebugInfo"), "CMnuLabel")
		if pUpdate ~= nil then
			local caption = ""

			-- AI Infos oben anzeigen?
			if Ai and Debug and Debug.AiInfo==1 then
				caption = caption.."AiInfos: #Friends:"..Count(Ai.Figures).." #Enemies:"..Count(Ai.Enemies).."\n"..Ai.Status.."\n"
			end

			-- falls gewünscht: Extrainfos wenn Figur selektiert...
			if Debug and Debug.ExtendedFigureInfo==1 and (selcat == 'Figure') then 
				caption = Debug_FigureInfo(selid)
			elseif Debug and Debug.ExtendedBuildingInfo==1 and (selcat == 'Building') then 
				caption = Debug_BuildingInfo(selid)
			elseif Debug and Debug.ExtendedObjectInfo==1 and (selcat == 'Object') then 
				caption = Debug_ObjectInfo(selid)
			end

			pUpdate:SetCaption(caption)
		end
	end

end -- Debug_OnDataUpdate()