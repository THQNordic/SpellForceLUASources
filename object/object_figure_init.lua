
      -- this file registers all figure objects to the DrwObjectLibrary -- this includes the according movie objects

print("-- INITIALIZING FIGURES   object_figure_init.lua")

-- these movielibraries will be used when creating CDrwObjects
local Movies = {} 

-- sizes of shadows for each race. (or any significant string from the mesh)
-- but you can always override shadow sizes for individual units by specifying a 
-- shadowsize = 1.0 value in the Register{} call
local ShadowSize = 
{
   aryn_small = 1.5,
   basilisk = 1.6,
   bear = 1.4,
   beastman = 0.8,
   beetle = 1.0,
   blade = 1.5,
   boar = 1.0,
   boss = 2.0,
   boss_aryn = 3.0,
   boss_belial = 2.0,
   boss_rohan_on_saurian_undead = 2.0,
   boss_soulforger = 2.0,
   buffalo = 1.5,
   cattle = 1.8,
   darkelf = 1.2,
   darkelf_slave = 0.7, 
   darkelf_swarm_bat = 0.6, 
   deer = 1.0,
   default = 1.2, 
   demon = 1.5,
   dragon = 2,
   dryade = 1.2,
   dwarf = 0.8, 
   dwarf_swarm_ram = 0.7, 
   elemental = 1.0,
   elf = 0.8, 
   elf_swarm_pixie = 0.6,
   fial_darg = 1.4,
   gargoyle = 1.4,
   giant = 1.5,
   giantape = 1.7,
   ghoul = 1.4,
   gladiator = 1.1,
   goblin = 0.6,
   golem = 2.5,
   headtoucher = 1.5,
   hero = 1.0, 
   human = 1.0, 
   human_swarm_dog = 0.7, 
   human_siege = 0.8, 
   kithar = 1.4,	
   manticore = 1.5,	
   mantis = 1.9,	
   medusa = 1.1,
   minotaur = 1.5,
   moose = 1.4,
   mumie = 1.0,
   muscleman = 1.0,
   ogre = 1.6,
   orc = 1.1, 
   orc_swarm_wildboar = 0.7, 
   plate_dragon = 1.0,		-- fix for this chest item
   rabbit = 0.4,
   reptileman = 1.7,
   rohen = 1.0,
   sabretooth = 1.4,
   saurian_undead = 2.0,
   screamer = 1.4,
   scorpionblade = 1.4,
   skeleton = 1.1,
   skerg = 0.7, 
   spectre = 1.0,
   spider = 2.5,
   succubus = 1.2,
   tar_skerg = 0.7, 
   toad = 1.8,
   treewraith = 1.8,
   troll = 1.8,
   werewolf = 1.2,
   wolf = 1.0,
   wraith = 1.0,
   zhuul = 1.8,
   zombie = 1.0,
   _titan_ = 2,
}

-- this function creates a new movie library from the given table.
function CreateMovieLib(t)
	local prefix = t.base_name.."_"
    local pLib = CDrwMovieLibrary:new()
	-- print("creating movie lib for "..prefix)
	
	for key, animation_params in t do
	
		if key ~= "base_name" and key ~= "walkcycle" then
	
			if not globals()[key] then
				error(key .. "is an unknown job id identifier!")
			end
	
			local job_id = globals()[key]
	
			for subkey,animation_variants in animation_params do -- for all types
	
				if subkey~= "mode" and subkey~= "sound" then -- skip params
					local iSubType
	
					if type(subkey) == "string" then -- lookup value for constants like kDrwAnimDefault etc.
						if not globals()[subkey] then
							error(subkey .. "is an unknown attack-anim id identifier!")
						end
						iSubType = globals()[subkey]
					else
						iSubType = subkey-1 -- when just using {a,b,c} use number 0,1,2
					end
					
					if type(animation_variants) ~= "table" then
						animation_variants = {animation_variants}
					end
					
					for iVariant = 1,getn(animation_variants) do -- for all variants

						local anim = animation_variants[iVariant]
						
						if type(anim) == "string" then 
							anim = {anim = anim} 
						else
							--print(anim.anim)
						end
					
						name = prefix..anim.anim

						if ((key == "kGdJobStrike") or (key == "kGdJobStab") or (key == "kGdJobPunch")) then
							if FindAnim(prefix.."attack"..anim.anim) then		
								name = prefix.."attack"..anim.anim
							end
						end

						local sound = anim.sound or animation_variants.sound or animation_params.sound
						if type(sound) == "string" then sound = {name = sound} end

						local mode = anim.mode or animation_variants.mode or animation_params.mode
						
						if FindAnim(name) then
							
							local pMovie = pLib:AddNewMovie(job_id, iSubType, iVariant-1)
							local pEffect = pMovie:AddAnimation(name..".boa")

							if mode then	
								pEffect:SetRangeAndModes(0, 1, mode)  -- default for playmode is Clamped
							end

							if (key == "kGdJobGroupWalk") then
								if (type(t.walkcycle) == "table") then
									local speed = t.walkcycle[subkey] or 1
									if t.walkcycle[subkey] then
										--print("registering with walkcycle", name, %Walkspeed[name]*1.4)
										pEffect:SetWalkCycleDistance(speed * 1.4)
									else
										print ("MISSING WALKCYCLEDATA:", t.base_name, subkey)
									end
								else
									print ("MISSING WALKCYCLEDATA:", t.base_name)
								end
							end
							

							if sound then
								if not DrwSoundId[sound.name] then
									print("MISSING SOUND:", sound.name)
								else
									pEffect = pMovie:AddSound(DrwSoundId[sound.name], sound.delay or 0)
									pEffect:SetSoundOffset(sound.offset or 0)
									if animation_params.mode == kDrwPlayLooped or sound.length then
										pEffect:SetRangeAndModes(0, sound.length or 0.5, kDrwPlayLooped)
									end
								end
							end
							--print("registering", key, job_id, iSubType, iVariant-1, animation_variants[iVariant], animation_params.sound)
						else
							print("MISSING ANIMATION:", name)
						end
					end
				end
			end
		end
	end
	return pLib
end

function GetShadowSize(mesh)
	local retval, len = %ShadowSize.default, 0
	for i,v in %ShadowSize do
		if strfind(mesh,i) then
			if len<strlen(i) then -- use this value if it is a better match
				retval, len = v, strlen(i)
			end
		end
	end
	-- print("shadowsize for ",mesh,retval)
	return retval
end

local registered = {}
local SubVar = {
	male 	= 	{0,0},
	female 	= 	{1,0},
	warm 	= 	{0,1},
	warm2 	= 	{0,2},
	cold2	= 	{0,3}
}	

local sql_races = doscript("sql_race")
-- register a figure object, with movielib explicitly specified
Register = function(t)
	t.shadowsize = GetShadowSize(t.mesh.male)
	if t.id then
		if %registered[t.id] then
			print("OVERLOADING FIGURE", t.id)
		end
		%registered[t.id] = t.mesh

		for name, mesh in t.mesh do
			if FindMesh(mesh) then
				-- print("Registering Figure", t.id, name, mesh)
				if t.animset == "figure_hero_male" then
					if name == "female" then
						t.movielib = %Movies["figure_hero_female"]
					else
						t.movielib = %Movies["figure_hero_male"]
					end
				end	

				 
				local object = ObjectLibrary:CreateNewFigure(mesh..".msh", t.movielib, t.shadowsize or 0);
				
				if (t.head) then
					ObjectLibrary:AddObject(object, kGtCategoryHead, t.id, %SubVar[name][1], %SubVar[name][2]); -- with subtype 0/1, variant 0/1, as specified in local variants
				else
					ObjectLibrary:AddObject(object, kGtCategoryFigure, t.id, %SubVar[name][1], %SubVar[name][2]); -- with subtype 0/1, variant 0/1, as specified in local variants
				end
				
				if t.selectionscaling or t.shadowsize then
					object:SetSelectSize(t.selectionscaling or t.shadowsize)
				end
				if t.additionalskins then
					--print("Hero-Item", t.id, mesh, "add skins: ", t.additionalskins)
					object:SetAdditionalSkinsNeeded(t.additionalskins)
				end
				if t.race and %sql_races[t.race] then
					object:SetReferenceScale(%sql_races[t.race].equipmentscaling*0.01)
					--print(mesh,t.race,%sql_races[t.race].equipmentscaling*0.01)
				end
			else
				print("MESH MISSING", t.id, name, mesh)		
			end
		end
	else
		error("id undefined - name is " .. t.mesh)
	end
end

-- register hero specific equipment (the helmets that fit the rest of the outfit)
RegisterEquipment = function(t)
	if t.id then
		local object = ObjectLibrary:AddNewEquipment(t.id, 0,0, "head")
		local element = object:ElementMesh(t.mesh..".msh");
	else
		error("id undefined - name is " .. t.mesh)
	end
end


-----------------------------------------------------------------------
-- HUMAN
-----------------------------------------------------------------------
Movies.figure_human = CreateMovieLib{ base_name = "figure_human",

--- default -----------------------------------------------------------
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimFront = "idlefront", 
		kDrwAnimShoulder = "idleshoulder", 
		kDrwAnimSpecial1 = "idlespecial", 
		kDrwAnimSpecial2 = "idlespecial2", 
		kDrwAnimWar = "idlewar", 
		kDrwAnimTalkIdle = "idle",
		kDrwAnimTalk = {"talkidle", "talk1", "talk2"},
		mode = kDrwPlayLooped,
	},
	kGdJobGroupWalk = {	
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "run", -- #wip "runwar"
		kDrwAnimShoulder = "carryshoulder", 
		kDrwAnimFront = "carryfront", 
		kDrwAnimMagic = "carryfront",
		mode = kDrwPlayLooped, 
		sound = "step_normal",
	},
	walkcycle = {
		kDrwAnimDefault = 1.3,
		kDrwAnimRun = 2.7,
		kDrwAnimRetreat = 1.4,
		kDrwAnimWar = 2.7,
		kDrwAnimShoulder = 1.4,
		kDrwAnimFront = 1.4,
		kDrwAnimMagic = 1.4,
	},	
	kGdJobPunch = {	
		kDrwAnimDefault = {
			"righthand1", 
			"rightstaff1",
		}, 
		kDrwAnimLeft = {
			"rightswordweapon2",
		}, sound = "battle_race_human_attack",
		mode = kDrwPlayStretched, sound = "battle_race_human_attack",
	},
	
	kGdJobStrike = {	
		kDrwAnimDefault = {
			"rightswordempty1", 
			"rightswordempty2", 
			"rightmaceempty1", 
			"rightmaceempty2", 
		}, 
		kDrwAnimLeft = {
			"rightswordweapon1", 
			"rightswordweapon2",
		}, sound = "battle_race_human_attack",
		kDrwAnimShield = {
			"rightswordempty1", 
			"rightswordempty2", 
			"rightmaceshield1", 
			"rightmaceempty1", 
			"rightmaceempty2", 
			"rightswordshield1",
			"rightstaff1",
		}, 
		kDrwAnimBoth = {
			"bothsword1", 
			"bothsword2", 
			"bothmace1", 
			"bothmace2"
		}, sound = "battle_race_human_attack",
		kDrwAnimStaff = {
			"bothstaff1", 
			"bothstaff2",
		}, sound = "battle_race_human_attack",
		kDrwAnimDual = {
			"rightswordweapon1", 
			"rightswordweapon2",
		}, 
		mode = kDrwPlayStretched,
		sound = "battle_race_human_attack",

		kDrwWt1HStaff   = "rightstaff1",
		mode = kDrwPlayStretched, sound = "battle_race_human_attack",
	},

	kGdJobHitTargetRange1 = {
		"attackcrossbow_aim_1";
		mode = kDrwPlayStretched,
		},
	kGdJobHitTargetRange2 = {
		"attackcrossbow_shoot_1";
		mode = kDrwPlayStretched,
		},

	kGdJobCast = {"cast"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveself"},
	kGdJobDie = {"die"; sound = "battle_race_human_die"},
	kGdJobCriticalHit = {{"hit", "hit2", "hit3", "hit4", "hit5"}; sound = "battle_race_human_scream"},
	kGdJobStoop = {
		kDrwAnimDefault = "dropfront2", 
		kDrwAnimMagic = "dropfront1",  
		kDrwAnimShoulder = "dropshoulder1", 
		kDrwAnimFront = "dropfront1", 
		mode = kDrwPlayStretched,
	},

	-- economy global job animations
	kGdJobShrineWorkerTakeMana = {"pickaria"; mode = kDrwPlayStretched},
	kGdJobWoodCutterCutTree = {"cuttreeworker", "cuttreeaxe"; mode = kDrwPlayStretched, sound = {name = "work_cut_tree", offset = 0.20, length = 1}},
	kGdJobStoneMinerCrushStone = {"cutstonepike", "cutstonepike"; mode = kDrwPlayStretched, sound = {name = "work_cut_stone", offset = 0.15, length = 1.4}},
	kGdJobMinerWork = {"cutstonepike"; mode = kDrwPlayStretched, sound = {name = "work_cut_stone", offset = 0.15, length = 1.4}},
	kGdJobBuilderBuild = {"build"; mode = kDrwPlayStretched, sound = {name = "work_build", length = 1.4}},
	kGdJobHunterCutCorpse = {"eviscerate"; mode = kDrwPlayStretched},
	kGdJobHunterHitTarget = {"attackcrossbow2"; mode = kDrwPlayStretched, sound = "battle_fire_arrow"},
	kGdJobFisherWalkToWork = {"carryfishnet_empty"; mode = kDrwPlayLooped},
	kGdJobFisherWork = {"fish"; mode = kDrwPlayLooped, sound = {name = "work_johnthefisherman", offset = 1.0, length = 1}},
	kGdJobFisherWalkHome = {"carryfishnet_full"; mode = kDrwPlayLooped},
	kGdJobFisherWalkToDeliverGood = {"carryfishnet_full"; mode = kDrwPlayLooped},
	kGdJobFarmerHarvest = {"harvest"; mode = kDrwPlayLooped},
	kGdJobFarmerSow = {"seed"; mode = kDrwPlayLooped},
 
	-- Economy local building animations
	kGdJobCattleBreederFeed = {"work_cattlebreeding"; mode = kDrwPlayStretched, sound = {name = "work_cattlebreeding", offset = 2.2, length = 8.2}},
	kGdJobSmithWork = {{
		{anim = "smithhold", sound = {name = "work_smithhold", offset = 0.0, length = 5.8}}, 
		{anim = "smithhammer", sound = {name = "work_smithhammer", offset = 0.0, length = 7}}}; 
		mode = kDrwPlayLooped },
	kGdJobCarpenterWork = {"work_sawmill"; mode = kDrwPlayStretched},
	kGdJobFoodWorkerWork = {"work_foodstore"; mode = kDrwPlayStretched, sound = {name = "work_get_food", offset = 0.0, length = 1.4}},
	kGdJobSmelterWork = {"work_smeltingworks"; mode = kDrwPlayStretched},
	kGdJobPriestWork = {"work_templeoflight"; mode = kDrwPlayStretched},
}

-----------------------------------------------------------------------
-- ELF
-----------------------------------------------------------------------
Movies.figure_elf = CreateMovieLib{ base_name = "figure_elf",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimSpecial1 = "idlespecial", 
		kDrwAnimSpecial2 = "idlespecial2", 
		kDrwAnimMagic = "idlemagic", 
		kDrwAnimFront = "idlemagic", -- Meat, Berrybaskets
		kDrwAnimShoulder = "idleshoulder", 
		kDrwAnimTalkIdle = "idle",
		kDrwAnimTalk = {"talkidle", "talk1", "talk2"},
		mode = kDrwPlayLooped,
	},
	kGdJobGroupWalk = {	
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		kDrwAnimMagic = "carrymagic", 
		kDrwAnimFront = "carrymagic", -- Meat, Berrybaskets
		kDrwAnimShoulder = "carryshoulder", 
		mode = kDrwPlayLooped, 
		sound = "step_normal",
	},
	walkcycle = {
		kDrwAnimDefault = 1, 
		kDrwAnimRun = 3, 
		kDrwAnimWar = 3,
		kDrwAnimRetreat = 1,
		kDrwAnimFront = 1,
		kDrwAnimMagic = 1, 
		kDrwAnimShoulder = 1.2, 
	},	

	kGdJobPunch	 = {	
		kDrwAnimDefault = {"righthand1"},
		kDrwAnimLeft = {"lefthand1"}, 
		mode = kDrwPlayStretched, 
		sound = "battle_race_elf_attack",
	},

	kGdJobStrike = {
		kDrwAnimDefault = {
			"rightswordempty1", 
			"rightswordempty2",
			"rightmaceempty2",
		}, 
		kDrwAnimShield = {
			"rightmaceshield1", 
			"rightmaceshield2",
			"rightmaceempty1", 
			"rightmaceempty2", 
			"rightswordempty1",
		}, sound = "battle_race_elf_attack",
		kDrwAnimStaff = {
			"bothstaff1", 
			"bothstaff2",
		}, sound = "battle_race_elf_attack",
		kDrwWt1HStaff = {
			"rightstaff1",
			"rightmaceempty1", 
			"rightmaceempty2", 
		}, sound = "battle_race_elf_attack",
		kDrwWt2HStaff = {
			"bothstaff1", 
			"bothstaff2",
		}, sound = "battle_race_elf_attack",
		kDrwWt2HAxe = {"rightmaceempty2"}, sound = "battle_race_elf_attack",
		kDrwWt2HSword = {"rightmaceempty2", "rightswordempty1"}, sound = "battle_race_elf_attack",
		kDrwAnimBoth = {
			"rightmaceempty1", 
			"rightswordempty1", 
			"rightswordempty2",
		}, 
		mode = kDrwPlayStretched
	},
	kGdJobStab = {	
		kDrwAnimDefault = {"rightswordempty2"},
		mode = kDrwPlayStretched,
	},
	kGdJobHitTargetRange1 = {
		"attackbow_aim_1";
		mode = kDrwPlayStretched
		},
	kGdJobHitTargetRange2 = {
		"attackbow_shoot_1";
		mode = kDrwPlayStretched
		},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveself"},
	kGdJobDie = {"die"; sound = "battle_race_elf_die"},
	kGdJobBuilderBuild = {"build"; mode = kDrwPlayStretched, sound = {name = "work_build", offset = 0.37}},
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3", "hit4", "hit5"}; sound = "battle_race_elf_scream"},
	kGdJobStoop = {
		kDrwAnimDefault = "dropshoulder2",
		kDrwAnimMagic = "dropmagic1",  
		kDrwAnimShoulder = "dropshoulder1", 
		kDrwAnimFront = "dropmagic1",
		mode = kDrwPlayStretched
	},

	-- economy global job animations
	kGdJobWoodCutterCutTree = {"cuttreeaxe", "cuttreeaxe"; mode = kDrwPlayStretched, sound = {offset = 0.19, name = "work_cut_tree", length = 2}},
	kGdJobShrineWorkerTakeMana = { "picklenya"; mode = kDrwPlayStretched},
	kGdJobHunterHitTarget = {"attackbow1"; mode = kDrwPlayStretched, sound = "battle_fire_arrow"},
	kGdJobHunterCutCorpse = {"eviscerate"; mode = kDrwPlayStretched},
	kGdJobGathererWork = {"pickfruits"; mode = kDrwPlayStretched, sound = {name = "work_get_food", offset = 0.0, length = 1.4}},
	kGdJobForesterPlant = {"eviscerate"; mode = kDrwPlayStretched},
	-- Elfen Worker können testweise auch Eisen abbauen
	kGdJobStoneMinerCrushStone = {"cutstonepike", "cutstonepike"; mode = kDrwPlayStretched, sound = {name = "work_cut_stone", offset = 0.15, length = 1.4}},
	kGdJobMinerWork = {"cutstonepike"; mode = kDrwPlayStretched, sound = {name = "work_cut_stone", offset = 0.15, length = 1.4}},

	-- Economy Animations:
        kGdJobCarpenterWork = {"work_sawmill"; mode = kDrwPlayLooped},
        kGdJobFoodWorkerWork = {"work_foodstore"; mode = kDrwPlayLooped},
        kGdJobPriestWork = {"work_ailantary"; mode = kDrwPlayLooped},
        kGdJobSmithWork = {"work_armory"; mode = kDrwPlayLooped},
}
 
Movies.figure_elf_bow = Movies.figure_elf

-----------------------------------------------------------------------
-- DWARF
-----------------------------------------------------------------------
DwarfAnims = 
{ base_name = "figure_dwarf",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimFront = "idlefront", 
		kDrwAnimSpecial1 = "idlespecial1", 
		kDrwAnimWar = "idlewar", 
		kDrwAnimTalkIdle = "idle",
		kDrwAnimTalk = {"talkidle", "talk1", "talk2"},
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {	
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		kDrwAnimFront = "carryfront", 
		mode = kDrwPlayLooped, 
		sound = "step_normal",
	},
	walkcycle = {
		kDrwAnimDefault = 1.0, 
		kDrwAnimRun = 2.0, 
		kDrwAnimRetreat = 1.4, 
		kDrwAnimWar = 2.0,
		kDrwAnimFront = 1.4
	},	

	------ Dwarf Defender Upgrade / "Hammer-Throwing" -------------------
	kGdJobHitTargetRange1 = { kDrwAnimDefault = "attackhammer_aim", mode = kDrwPlayStretched },
	kGdJobHitTargetRange2 = { kDrwAnimDefault = "attackhammer_throw", mode = kDrwPlayStretched },

	kGdJobPunch = {	
		kDrwAnimDefault = {
			"righthand1",
			"rightdagger1",
		}, 
		kDrwAnimLeft = {
			"lefthand1", 
			"rightmaceweapon1",
		}, 
		mode = kDrwPlayStretched, 
		sound = "battle_race_dwarf_attack",
	},
	kGdJobStrike = {	
		kDrwAnimDefault = {
			"rightmaceempty1", 
			"rightmaceempty2", 
			"rightmaceweapon2",
		}, 
		kDrwAnimLeft = {
			"leftweapon1", 
			"leftweapon2", 
			"rightmaceweapon1", 
		}, sound = "battle_race_dwarf_attack",
		kDrwAnimShield	 = {
			"rightmaceshield1", 
			"rightmaceshield2", 
			"rightmaceweapon2",
			"rightmaceempty1",
			"rightmaceempty2",
		}, sound = "battle_race_dwarf_attack",
		kDrwAnimBoth	 = {
			"bothmace1", 
			"bothmace2", 
		}, sound = "battle_race_dwarf_attack",
		kDrwAnimRoundHit = {"whirlwind"}, -- Dwarf Warrior Upgrade "Whirlaxe"
		mode = kDrwPlayStretched,
	},
	kGdJobStab		 = {	
		kDrwAnimDefault = {
			"rightdagger1",
		},
		mode = kDrwPlayStretched,
	},

	kGdJobCast = {"attackhammer_aim"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"attackhammer_throw","attackhammer_throw"},
	kGdJobDie = {"die"; sound = "battle_race_dwarf_die"},
	kGdJobBuilderBuild = {"build"; mode = kDrwPlayStretched, sound = {name = "work_build", length = 1.4}},
	kGdJobCriticalHit = {{"hitweak1", "hitweak2", "hitweak3", "hitweak4", "hitweak5"}; sound = "battle_race_dwarf_scream"},
	kGdJobStoop = {
		kDrwAnimDefault = "dropfront2", 
		kDrwAnimFront = "dropfront1", 
		mode = kDrwPlayStretched
	},

	-- economy global job animations
	kGdJobMinerWork = {"cutstoneworker"; mode = kDrwPlayStretched, sound = {name = "work_cut_stone", offset = 0.15, length = 1.4}},
	kGdJobStoneMinerCrushStone = {"cutstoneworker", "cutstoneworker"; mode = kDrwPlayStretched, sound = {name = "work_cut_stone", offset = 0.15, length = 1.4}},

	-- Economy Animations
        kGdJobSmithWork = {"work_forge"; mode = kDrwPlayStretched}, -- = Forge
        kGdJobSmelterWork = {"work_smeltingworks"; mode = kDrwPlayStretched},
        kGdJobFoodWorkerWork = {"work_foodstore"; mode = kDrwPlayStretched},
	kGdJobCarpenterWork = {"work_stonemasonhut"; mode = kDrwPlayStretched}, -- Stonemason
	kGdJobCattleBreederFeed = {"work_swinefarm"; mode = kDrwPlayStretched}, -- Swinefarm
}

Movies.figure_dwarf = CreateMovieLib(DwarfAnims)

--------- Dwarf Melee Abilities ---------------------------------------------------------------

	------ Dwarf Battlepriest / "Benefactions" Melee-Ability MDD 15.2.1 -------------------
	DwarfAnims.kGdJobMeleeAbility = { kDrwAnimDefault = "pray", mode = kDrwPlayLooped }
	Movies.figure_dwarf_battlepriest = CreateMovieLib(DwarfAnims)

	------ Dwarf Elder / "Warcry" Melee-Ability MDD 15.2.1 --------------------------------
	DwarfAnims.kGdJobMeleeAbility = { kDrwAnimDefault = "warcry", mode = kDrwPlayLooped }
	Movies.figure_dwarf_elder = CreateMovieLib(DwarfAnims)

--------- END Dwarf Melee-Abilities -----------------------------------------------------------

-----------------------------------------------------------------------
-- DWARF Demolisher
-----------------------------------------------------------------------
Movies.figure_dwarf_demolisher = CreateMovieLib{ base_name = "figure_dwarf_demolisher",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		kDrwAnimRetreat = "retreat", 
		mode = kDrwPlayLooped, 
		sound = "step_normal",
	},
	walkcycle = {
		kDrwAnimDefault = 1.1, 
		kDrwAnimRun = 2.0, 
		kDrwAnimRetreat = 1.4, 
		kDrwAnimWar = 2.0,
	},	
	kGdJobStrike = { 
		kDrwAnimDefault = {"attackspecial1", "attackspecial2"}, 
		mode = kDrwPlayStretched, sound = "battle_race_dwarf_attack", 
	},
	kGdJobDie = {"die"; sound = "battle_race_dwarf_die"},
	kGdJobCriticalHit = {"retreat"; sound = "battle_race_dwarf_scream"},
}

-----------------------------------------------------------------------
-- ORC
-----------------------------------------------------------------------
Movies.figure_orc = CreateMovieLib{base_name = "figure_orc",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {	
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1", 
		kDrwAnimMagic = "idlemagic", 
		kDrwAnimShoulder = "idleshoulder", 
		kDrwAnimWar = "idlewar", 
		kDrwAnimTalkIdle = "idle",
		kDrwAnimTalk = {"talkidle", "talk1", "talk2"},
		mode = kDrwPlayLooped,
	},
	kGdJobGroupWalk = {	
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		kDrwAnimMagic = "carrymagic", 
		kDrwAnimShoulder = "carryshoulder", 
		kDrwAnimFront = "carryfront", 
		mode = kDrwPlayLooped, 
		sound = "step_normal",
	},
	walkcycle = {
		kDrwAnimDefault = 1.3, 
		kDrwAnimRun = 2.2, 
		kDrwAnimRetreat = 1.1, 
		kDrwAnimWar = 2.2,
		kDrwAnimMagic = 1.1,
		kDrwAnimShoulder = 1.1,
		kDrwAnimFront = 1.1 
	},	

	kGdJobPunch	 = {	
		kDrwAnimDefault = {"righthand1", "rightmaceempty1"},
		kDrwAnimLeft = {"lefthand1"}, 
		mode = kDrwPlayStretched, sound = "battle_race_orc_attack"
	},

	kGdJobFeignDeath = {
		kDrwAnimDefault = {"die"; sound = "battle_race_orc_die"}, 
	},
		 
	kGdJobStrike = {	
		kDrwAnimDefault = {
			"rightswordempty1", 
			"rightswordempty2", 
			"rightmaceweapon1", 
			"rightmaceempty1", 
			"rightmaceempty2", 
		}, 
		kDrwAnimLeft = {"leftweapon1", "leftweapon2"},
		kDrwAnimBoth = {"bothmace1", "bothmace2"},
		kDrwWt2HSpear = {"bothstaff2"},
		kDrwAnimStaff = {"bothstaff1", "bothstaff2", "bothstaff3"},
		kDrwWt1HStaff = {"rightmaceempty1"}, sound = "battle_race_orc_attack",
		kDrwWt2HAxe = {"bothmace1", "bothmace2"}, sound = "battle_race_orc_attack",
		kDrwWt2HSword = {"bothmace1", "bothmace2"}, sound = "battle_race_orc_attack",
		kDrwAnimScytheHit = {"bothstaff_multiple_hit"}, -- Orc Swordsman/"Scythespear" Upgrade 
		mode = kDrwPlayStretched, sound = "battle_race_orc_attack",
	},

	kGdJobStab = {	
		kDrwAnimDefault = {"rightdagger1", "rightdagger2"},
		kDrwAnimLeft = {"leftweapon1"},
		mode = kDrwPlayStretched,
	},

	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolve"},
	kGdJobDie = {"die"; sound = "battle_race_orc_die"},
	kGdJobBuilderBuild = {"build"; mode = kDrwPlayStretched, sound = {name = "work_build", length = 1.4}},
	kGdJobCriticalHit = {{"hit", "hit2", "hit3", "hit4", "hit5"}; sound = "battle_race_orc_scream"},
	kGdJobStoop = {kDrwAnimDefault = "dropfront2", kDrwAnimMagic = "dropmagic1",  kDrwAnimShoulder = "dropshoulder1", kDrwAnimFront = "dropfront1", mode = kDrwPlayStretched},

	-- economy global job animations
	kGdJobShrineWorkerTakeMana = { "picklenya"; mode = kDrwPlayStretched},
	kGdJobMinerWork = {"cutstoneworker"; mode = kDrwPlayStretched, sound = {name = "work_cut_stone", offset = 0.15, length = 1.4}},
	kGdJobWoodCutterCutTree = {"cuttreeworker"; mode = kDrwPlayStretched, sound = {name = "work_cut_tree", offset = 0.16, length = 2}},
	kGdJobHunterHitTarget = {"attackleftweapon2"; mode = kDrwPlayStretched, sound={name="battle_hit_1haxe", offset=1}},
	kGdJobHunterCutCorpse = {"eviscerate"; mode = kDrwPlayStretched},
	kGdJobFisherWork = {"work_smeltingworks"; mode = kDrwPlayLooped},

	-- economy animations
	kGdJobFoodWorkerWork = {"work_foodstore"; mode = kDrwPlayStretched},
	kGdJobCattleBreederFeed = {"work_boarbreeding"; mode = kDrwPlayStretched},
	kGdJobSmithWork = {"work_forge"; mode = kDrwPlayStretched},
	kGdJobPriestWork = {"work_shamanhut"; mode = kDrwPlayStretched},
	kGdJobClubMakerWork = {"work_macecarver"; mode = kDrwPlayStretched},
	kGdJobSmelterWork = {"work_smeltingworks"; mode = kDrwPlayStretched},
}

-----------------------------------------------------------------------
-- ORC Drummer
-----------------------------------------------------------------------
Movies.figure_orc_drummer = CreateMovieLib{ base_name = "figure_orc_drummer",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial2", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "walk_drum_faster", 
		mode = kDrwPlayLooped
	},
	walkcycle = {
		kDrwAnimDefault = 1.1, 
		kDrwAnimRun = 2.2, 
		kDrwAnimWar = 2.2,
	},	
	kGdJobMeleeAbility = {
		kDrwAnimDefault = {"idlespecial1"},
		mode = kDrwPlayLooped, sound = {name = "battle_orcdrummer", offset = 0.0, length = 5.160},
	},
	kGdJobStrike = {
		kDrwAnimDefault = {
			"rightmaceempty1",
		}, 
		kDrwAnimLeft = {
			"rightmaceempty1",
		},
		mode = kDrwPlayStretched, sound = "battle_race_orc_attack",
	},
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3", "hit4", "hit5"}; sound = "battle_race_orc_scream"},
	kGdJobDie = {"die"; sound = "battle_race_orc_die"},
}

-----------------------------------------------------------------------
-- ORC Hornblower
-----------------------------------------------------------------------

Movies.figure_orc_hornblower = CreateMovieLib{ base_name = "figure_orc_hornblower",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1", 
		kDrwAnimSpecial2 = "idlespecial2", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1.1, 
		kDrwAnimRun = 2.2, 
		kDrwAnimWar = 2.2,
	},	
	kGdJobMeleeAbility = {
		kDrwAnimDefault = {"idleblow"},
		mode = kDrwPlayLooped, sound = {name = "battle_orcblower", offset = 0.0, length = 5},
	},
	kGdJobStrike = {{"righthand", "rightswordempty1"};	mode = kDrwPlayStretched},
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3", "hit4", "hit5"}; sound = "battle_race_orc_scream"},
	kGdJobDie = {"die"; sound = "battle_race_orc_die"},
}

-----------------------------------------------------------------------
-- DARKELF
-----------------------------------------------------------------------
Movies.figure_darkelf = CreateMovieLib{ base_name = "figure_darkelf",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {	
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1", 
		kDrwAnimWar = "idlewar", 
		kDrwAnimTalkIdle = "idle",
		kDrwAnimTalk = {"talkidle", "talk1", "talk2"},
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {	
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run",  -- #wip runwar 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1.3, 
		kDrwAnimRun = 2.2, 
		kDrwAnimRetreat = 1.3, 
		kDrwAnimWar = 2.2,
	},	

	kGdJobPunch	 = {	
		kDrwAnimDefault = {"righthand1"}, 
		kDrwAnimLeft = {"leftsword1"}, sound = "battle_race_darkelf_attack",
		mode = kDrwPlayStretched
	},
	kGdJobStrike = {	
		kDrwAnimDefault = {
			"rightswordempty1", 
			"rightswordempty2", 
			"rightmaceempty1", 
			"rightmaceempty2"
		}, sound = "battle_race_darkelf_attack",
		kDrwAnimLeft = {
			"leftsword1", 
			"leftsword2", 
			"rightswordweapon1", 
			"rightswordweapon2"
		}, sound = "battle_race_darkelf_attack",
		kDrwAnimShield = {
			"rightswordshield1", 
			"rightswordshield2"
		}, sound = "battle_race_darkelf_attack",
		kDrwAnimBoth = {
			"bothmace1", 
			"bothmace2"
		}, sound = "battle_race_darkelf_attack",
		kDrwAnimStaff = {
			"bothstaff1", 
			"bothstaff2"
		}, 
		kDrwWt2HSpear = {"rightmaceempty1"},
		kDrwWt1HStaff = {"rightmaceempty1", "rightswordempty2"}, sound = "battle_race_darkelf_attack",
		kDrwWt2HAxe = {"bothmace1", "bothmace2"}, sound = "battle_race_darkelf_attack",
		kDrwWt2HSword = {"bothmace1", "bothmace2"}, sound = "battle_race_darkelf_attack",
		kDrwAnimDeathBlow = {"deathblow"}, sound = "battle_race_darkelf_attack",
		mode = kDrwPlayStretched
	},
	kGdJobStab		 = {	
		kDrwAnimDefault = {"rightswordempty1", "rightswordempty2"},
		kDrwAnimLeft = {"leftsword1"}, sound = "battle_race_darkelf_attack",
		mode = kDrwPlayStretched,
	},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolvearea"},
	kGdJobDie = {"die"; sound = "battle_race_darkelf_die"},
	kGdJobCriticalHit = {"hitweak1"; sound = "battle_race_darkelf_scream"},
}

-----------------------------------------------------------------------
-- DARKELF Worker
-----------------------------------------------------------------------
Movies.figure_darkelf_worker = CreateMovieLib{ base_name = "figure_darkelf_worker",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimFront = "idlefront",
		kDrwAnimMagic = "idlefront",
		kDrwAnimSpecial1 = "idlespecial1",
		kDrwAnimSpecial2 = "idlespecial2",
		kDrwAnimWar = "idlewar",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk",
		kDrwAnimRun = "run",
		kDrwAnimRetreat = "retreat",
		kDrwAnimWar = "runwar",
		kDrwAnimFront = "carryfront",
		kDrwAnimMagic = "carryfront",
		mode = kDrwPlayLooped,
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 0.8,
		kDrwAnimRun = 2.0,
		kDrwAnimRetreat = 0.8,
		kDrwAnimMagic = 0.7,
		kDrwAnimFront = 0.7,
		kDrwAnimWar = 2.0,
	},

	kGdJobPunch = {	
		kDrwAnimDefault = {
			"righthand1",
			"righthand2"
		}, 
		mode = kDrwPlayStretched, sound = "battle_race_darkelf_attack",
	},
	kGdJobStrike	 = {	
		kDrwAnimDefault = {"attackleftmace1", "rightmaceempty1", "rightmaceempty2"},
		mode = kDrwPlayStretched, sound = "battle_race_darkelf_attack",
	},
	kGdJobDie = {"die"; sound = "battle_race_darkelf_die"},
	kGdJobBuilderBuild = {"build"; mode = kDrwPlayStretched, sound = {name = "work_build", length = 1.4}},
	kGdJobCriticalHit = {"hitweak1"; sound = "battle_race_darkelf_scream"},
	kGdJobStoop = {
		kDrwAnimDefault = "dropfront", 
		kDrwAnimFront = "dropfront", 
		mode = kDrwPlayStretched
	},

	-- Economy Animations:
	kGdJobMinerWork = {"cutstonepike"; mode = kDrwPlayStretched, sound = {name = "work_cut_stone", offset = 0.15, length = 1.4}},
	kGdJobStoneMinerCrushStone = {"cutstonepike"; mode = kDrwPlayStretched, sound = {name = "work_cut_stone", offset = 0.15, length = 1.4}},
	kGdJobFarmerSow = {"seed"; mode = kDrwPlayLooped},
	kGdJobFarmerHarvest = {"pickmushroom"; mode = kDrwPlayLooped},
	kGdJobShrineWorkerTakeMana = {"pickaria"; mode = kDrwPlayStretched},

	-- Economy local building animations
	kGdJobCattleBreederFeed = {"workbreeder"; mode = kDrwPlayStretched},
	kGdJobFoodWorkerWork = {"workfoodstore"; mode = kDrwPlayStretched},
	kGdJobSmithWork = {{
		{anim = "smithhold", sound = {name = "work_smithhold", offset = 0.0, length = 5.8}}, 
		{anim = "smithhammer", sound = {name = "work_smithhammer", offset = 0.0, length = 7}}}; 
		mode = kDrwPlayLooped },
	kGdJobPriestWork = {"workonyxtower"; mode = kDrwPlayStretched},
	kGdJobSmelterWork = {"worksmeltingworks"; mode = kDrwPlayStretched},
	kGdJobCarpenterWork = {"workstonemasonhut"; mode = kDrwPlayStretched}, -- Stonemason
}

-----------------------------------------------------------------------
-- NPC Skerg/TarSkerg
-----------------------------------------------------------------------
Movies.figure_npc_skerg = CreateMovieLib{ base_name = "figure_npc_skerg",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimSpecial1 = "idlespecial1",
		kDrwAnimSpecial2 = "idlespecial2",
		kDrwAnimWar = "idlewar",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk",
		kDrwAnimRun = "run",
		kDrwAnimRetreat = "retreat",
		kDrwAnimWar = "runwar",
		mode = kDrwPlayLooped,
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 0.8,
		kDrwAnimRun = 2.0,
		kDrwAnimRetreat = 0.8,
		kDrwAnimWar = 2.0,
	},

	kGdJobPunch = {	
		kDrwAnimDefault = {
			"righthand1",
			"righthand2"
		}, 
		mode = kDrwPlayStretched, sound = "battle_npc_skerg_attack",
	},
	kGdJobStrike	 = {	
		kDrwAnimDefault = {"attackleftmace1", "rightmaceempty1", "rightmaceempty2"},
		mode = kDrwPlayStretched, sound = "battle_npc_skerg_attack",
	},
	kGdJobDie = {"die"; sound = "battle_npc_skerg_die"},
	kGdJobCriticalHit = {"hitweak1"; sound = "battle_npc_skerg_scream"},
}

Movies.figure_tar_skerg = Movies.figure_skerg

-----------------------------------------------------------------------
-- TROLL
-----------------------------------------------------------------------
Movies.figure_troll = CreateMovieLib{ base_name = "figure_troll",

--- default -----------------------------------------------------------
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimShoulder = "idleshoulder", 
		kDrwAnimSpecial1 = "idlespecial1", 
		kDrwAnimWar = "idlewar", 
		mode = kDrwPlayLooped
	},

--- walk --------------------------------------------------------------
	kGdJobGroupWalk = {	
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run",
		kDrwAnimWar = "runwar",
		kDrwAnimRetreat = "retreat", 
		kDrwAnimFront = "carryfront", 
		kDrwAnimShoulder = "carryshoulder", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1.1, 
		kDrwAnimRun = 2.2, 
		kDrwAnimWar = 2.2,
		kDrwAnimRetreat = 1.1, 
		kDrwAnimFront = 1.1,
		kDrwAnimShoulder = 1.1,
	},	

--- attack ------------------------------------------------------------
	kGdJobPunch = {	
		kDrwAnimDefault = {"righthand1"},
		kDrwAnimLeft = {"lefthand1"}, 
		mode = kDrwPlayStretched, sound = "battle_race_troll_attack",
	},
	kGdJobStrike = {	
		kDrwAnimDefault = {
			"rightmaceempty1", 
			"rightmaceempty2", 
			"rightmaceweapon1", 
		}, sound = "battle_race_troll_attack",
		kDrwAnimBoth = {
			"bothmace1", 
			"bothmace2",
			"rightmaceweapon2", 
		}, sound = "battle_race_troll_attack",
		kDrwAnimLeft = {
			"lefthandweapon1", 
			"lefthandweapon2", 
			"rightmaceweapon1", 
			"rightmaceweapon2", 
		}, sound = "battle_race_troll_attack",
		mode = kDrwPlayStretched
	},
	kGdJobHitTargetRange1 = {
		kDrwAnimDefault = "attackthrow_aim1", 
		kDrwAnimSpecial1 = "attackthrow_aim2", 
		mode = kDrwPlayStretched
		},
	kGdJobHitTargetRange2 = {
		kDrwAnimDefault = "attackthrow_shoot1", 
		kDrwAnimSpecial1 = "attackthrow_shoot2", 
		mode = kDrwPlayStretched
		},

--- general ability "berserk" -----------------------------------------
	kGdJobCastResolve = {"warcry"; mode = kDrwPlayStretched, sound = "battle_titan_troll_attack"},	

--- misc --------------------------------------------------------------
	kGdJobDie = {"die"; sound = "battle_race_troll_die"},
	kGdJobCriticalHit = {{"hitweak1", "hitweak2", "hitweak3", "hitweak4", "hitweak5"}; sound = "battle_race_troll_scream"},
	kGdJobStoop = {
		kDrwAnimDefault = "dropfront2", 
		kDrwAnimMagic = "dropfront1",  
		kDrwAnimShoulder = "dropshoulder1", 
		kDrwAnimFront = "dropfront1", 
		mode = kDrwPlayStretched
	},

--- economy jobs ------------------------------------------------------
	kGdJobWoodCutterCutTree = {"cuttreeworker", "cuttreeaxe"; mode = kDrwPlayStretched, sound = {name = "work_cut_tree", offset = 0.20, length = 1}},
	kGdJobStoneMinerCrushStone = {"cutstonepike"; mode = kDrwPlayStretched, sound = {name = "work_cut_stone", offset = 0.15, length = 1.4}},
	kGdJobBuilderBuild = {"build"; mode = kDrwPlayStretched, sound = {name = "work_build", length = 1.4}},
	kGdJobHunterCutCorpse = {"eviscerate"; mode = kDrwPlayStretched},
	kGdJobCorpseCollectorCutCorpse  = {"eviscerate"; mode = kDrwPlayStretched},
	kGdJobHunterHitTarget = {"attackbothmace1"; mode = kDrwPlayStretched, sound = "battle_fire_arrow"},
	-- Troll Worker können testweise auch Eisen abbauen
	kGdJobMinerWork = {"cutstonepike"; mode = kDrwPlayStretched, sound = {name = "work_cut_stone", offset = 0.15, length = 1.4}},

--- building linked animations ----------------------------------------
    kGdJobFoodWorkerWork = {"work_foodstore"; mode = kDrwPlayStretched},
    kGdJobSmithWork = {"work_clubmaker"; mode = kDrwPlayStretched}, -- Clubmaker
}

-----------------------------------------------------------------------
-- HERO female
-----------------------------------------------------------------------

Movies.figure_hero_female = CreateMovieLib{ base_name = "figure_hero_female",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial4",
		kDrwAnimSpecial2 = "idlespecial5",
		kDrwAnimSpecial3 = "idlespecial6",
		kDrwAnimSpecial4 = "idlespecial7",
		kDrwAnimTalkIdle = "idle",
		kDrwAnimTalk = {
			"talkidle", 
			"talk1", 
			"talk2", 
			"talk3", 
			"talk5", 
			"talk6", 
			"talk7", 
			"talk8",
		},
		mode = kDrwPlayLooped,
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk",
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar",
		kDrwAnimBack = "walkback", 
		kDrwAnimRight = "straferight",
		kDrwAnimLeft = "strafeleft",
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1.15,
		kDrwAnimRun = 2.8,
		kDrwAnimWar = 2.8,
		kDrwAnimBack = 1.1,
		kDrwAnimRight = 1.1,
		kDrwAnimLeft = 1.1,
	},

	kGdJobPunch	 = {	
		kDrwAnimDefault = {
			"righthand", 
			"righthand1", 
			"righthand2", 
		},
		kDrwAnimLeft = {
			"lefthand1", 
			"lefthand2",
		}, 
		mode = kDrwPlayStretched, sound = "battle_hero_f_attack"
	},

	kGdJobFeignDeath = {
		kDrwAnimDefault = {"die"; sound = "battle_hero_f_die"}, 
	},
		 
	kGdJobStrike = {
		kDrwAnimDefault = {
			"rightmaceempty", 
			"rightmaceempty1", 
			"rightmaceempty2", 
			"rightswordshield1", 
			"rightswordshield2", 
		}, sound = "battle_hero_f_attack",
		kDrwAnimLeft = {
			"rightswordweapon1", 
			"left1", 
			"left2",
		}, 
		kDrwAnimShield = {
			"rightmaceshield1", 
			"rightmaceshield2",
			"rightswordshield1",
			"rightswordshield2",
			"rightmaceempty",
			"rightmaceempty1",
			"rightmaceempty2"
		}, 
		kDrwAnimStaff = {
			"bothstaff1", 
			"bothstaff2", 
		}, sound = "battle_hero_f_attack",
		kDrwWt1HStaff = {
			"rightmaceempty", 
			"rightmaceempty1", 
			"rightmaceempty2", 
			"rightswordshield1", 
		}, sound = "battle_hero_f_attack",
		kDrwWt2HAxe = {
			"bothmace1", 
			"bothsword1", 
			"bothsword2", 
		}, sound = "battle_hero_f_attack",
		kDrwWt2HSword = {
			"bothmace1", 
			"bothmace2", 
			"bothsword1", 
			"bothsword2", 
		},
		mode = kDrwPlayStretched, sound = "battle_hero_f_attack"
	},

	kGdJobStab = {	
		kDrwAnimDefault = {"rightswordempty2"},
		kDrwAnimLeft = {
			"left1", 
			"left3", 
		},
		mode = kDrwPlayStretched,
	},

	kGdJobHitTargetRange1 = {
		kDrwAnimDefault = "attackbow_aim_01",
		kDrwWt2HCrossbow = "attackcrossbow_aim",
		mode = kDrwPlayStretched
		},
	kGdJobHitTargetRange2 = {
		kDrwAnimDefault = "attackbow_shoot_01",
		kDrwWt2HCrossbow = "attackcrossbow_shoot",
		mode = kDrwPlayStretched, sound = "battle_fire_arrow"
		},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched}, 
	kGdJobCastResolve = {"resolveenemy","resolveself"},
	kGdJobCriticalHit = {{"hitweak1","hitweak2","hitweak3","hitweak4","hitweak5"}; sound = "battle_hero_f_scream"},
	kGdJobDie = {"die"; sound = "battle_hero_f_die"},
}

-----------------------------------------------------------------------
-- HERO male
-----------------------------------------------------------------------
Movies.figure_hero_male = CreateMovieLib{ base_name = "figure_hero_male",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {	
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial4",
		kDrwAnimSpecial2 = "idlespecial5",
		kDrwAnimSpecial3 = "idlespecial6",
		kDrwAnimTalkIdle = "idle",
		kDrwAnimTalk = {"talk3", "talk5", "talk6", "talk7", "talk8"},
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk",
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", -- #wip "runwar",
		kDrwAnimBack = "walkback", 
		kDrwAnimRight = "straferight",
		kDrwAnimLeft = "strafeleft",
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1.55, 
		kDrwAnimRun = 3.0, 
		kDrwAnimWar = 3.0,
		kDrwAnimBack = 1.1,
		kDrwAnimRight = 1.0,
		kDrwAnimLeft = 1.0
	},

	kGdJobFeignDeath = {
		kDrwAnimDefault = {"die"; sound = "battle_hero_m_die"}, 
	},

	kGdJobPunch	 = {	
		kDrwAnimDefault = {
			"righthand1", 
			"righthand2", 
		},
		kDrwAnimLeft = {
			"lefthand1", 
			"lefthand2",
		}, 
		mode = kDrwPlayStretched
	},

	kGdJobStrike = { 
		kDrwAnimDefault = {
			"rightmaceempty1", 
			"rightmaceempty2", 
			"rightmaceshield1", 
			"rightmaceshield2", 
			"rightswordempty1", 
			"rightswordempty2", 
			"rightswordshield1", 
			"rightswordshield2"
		}, sound = "battle_hero_m_attack",
		kDrwAnimLeft = {
			"left1", 
			"left2",
			"rightswordweapon2",
		}, 
		kDrwAnimStaff = {
			"bothstaff1", 
			"bothstaff2", 
		}, sound = "battle_hero_m_attack",
		kDrwAnimBoth = {
			"bothmace1", 
			"bothmace2"
		}, sound = "battle_hero_m_attack",
		kDrwAnimShield = {
			"rightmaceempty2", 
			"rightmaceshield2", 
			"rightswordempty1", 
			"rightswordempty2", 
			"rightswordshield1", 
			"rightswordshield2"}, 
		mode = kDrwPlayStretched,
		},

	kGdJobStab = {	
		kDrwAnimDefault = {
			"rightdagger1", 
			"rightdagger2", 
		},
		kDrwAnimLeft = {
			"left3", 
		}, 
		mode = kDrwPlayStretched, sound = "battle_hero_m_attack"
	},

	kGdJobHitTargetRange1 = {
		kDrwAnimDefault = "attackbow_aim_01", 
		kDrwAnimSpecial1 = "attackbow_aim_02", 
		kDrwWt2HCrossbow = "attackcrossbow_aim",
		mode = kDrwPlayStretched
		},
	kGdJobHitTargetRange2 = {
		kDrwAnimDefault = "attackbow_shoot_01", 
		kDrwAnimSpecial1 = "attackbow_shoot_02", 
		kDrwWt2HCrossbow = "attackcrossbow_shoot",
		mode = kDrwPlayStretched, sound = "battle_fire_arrow"
		},

	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched}, 
	kGdJobCastResolve = {"resolveenemy","resolveself"},
	kGdJobCriticalHit = {{"hitweak1","hitweak2","hitweak3","hitweak4","hitweak5"}; sound = "battle_hero_m_scream"},
	kGdJobDie = {"die"; sound = "battle_hero_m_die"},
}

-- Goblins: ------------------------------------------------------
Movies.figure_npc_goblin = CreateMovieLib{ base_name = "figure_npc_goblin",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimWar = "idlewar", 
		kDrwAnimSpecial1 = "idlespecial1", 
		kDrwAnimSpecial2 = "idlespecial2", 
		kDrwAnimSpecial3 = "idlespecial3", 
		mode = kDrwPlayLooped,
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "walk", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 

	},
	walkcycle = {
		kDrwAnimDefault = 1.05, 
		kDrwAnimRun = 1.2, 
		kDrwAnimRetreat = 0.7, 
		kDrwAnimWar = 2.0,
	},

	kGdJobPunch	 = {	
		kDrwAnimDefault = {
			"rightdagger1", 
			"righthand1", 
			"righthand2", 
		},
		kDrwAnimLeft = {
			"leftdagger1", 
		}, 
		mode = kDrwPlayStretched, sound = "battle_npc_goblin_attack"
	},

	kGdJobFeignDeath = {
		kDrwAnimDefault = {"die"; sound = "battle_npc_goblin_die"}, 
	},
		 
	kGdJobStrike = {
		kDrwAnimDefault = {
			"rightdagger1", 
		}, sound = "battle_npc_goblin_attack",
		kDrwAnimLeft = {
			"leftdagger1", 
		}, 
		kDrwAnimStaff = {
			"rightdagger1", 
			"righthand2", 
		}, sound = "battle_npc_goblin_attack",
		kDrwWt1HStaff = {
			"rightdagger1", 
			"righthand2", 
		}, sound = "battle_npc_goblin_attack",
		kDrwWt2HAxe = {
			"rightdagger1", 
		}, sound = "battle_npc_goblin_attack",
		kDrwWt2HSword = {
			"rightdagger1", 
		},
		mode = kDrwPlayStretched, sound = "battle_npc_goblin_attack"
	},

	kGdJobStab = {	
		kDrwAnimDefault = {"rightdagger2"},
		kDrwAnimLeft = {"leftdagger1"},
		mode = kDrwPlayStretched,
	},
	kGdJobDie = {"die"; sound = "battle_npc_goblin_die"},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched}, 
	kGdJobCastResolve = {"resolveenemy"},
	kGdJobCriticalHit = {{"hitweak1", "retreat"}; sound = "battle_npc_goblin_scream"},
}

-- Gargoyles: ------------------------------------------------------
Movies.figure_npc_gargoyle = CreateMovieLib{ base_name = "figure_npc_gargoyle_normal",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1", 
		kDrwAnimTalkIdle = "talkidle",
		kDrwAnimWar = "idlewar", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_talon"
	},
	walkcycle = {
		kDrwAnimDefault = 3, 
		kDrwAnimRun = 2.7, 
		kDrwAnimRetreat = 3, 
		kDrwAnimWar = 2.5,
	},
	kGdJobStrike = {	
		kDrwAnimDefault = {"righthand1","righthand2","lefthand1","lefthand2"}, 
		mode = kDrwPlayStretched, sound = "battle_npc_gargoyle_attack"
	},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolve","resolve"},
	kGdJobDie = {"die"; sound = "battle_npc_gargoyle_die"},
	kGdJobCriticalHit = {"hitstrong1"; sound = "battle_npc_gargoyle_scream"},
}

-- Ghouls: ------------------------------------------------------
Movies.figure_npc_ghoul = CreateMovieLib{ base_name = "figure_npc_ghoul",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimSpecial1 = "idlespecial1",
		kDrwAnimSpecial2 = "idlespecial2", 
		kDrwAnimSpecial3 = "idlespecial3", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 0.7, 
		kDrwAnimRun = 1.6, 
		kDrwAnimRetreat = 1, 
		kDrwAnimWar = 1.9,
	},
	kGdJobStrike = {
		kDrwAnimDefault = {"rightmaceempty1","rightmaceempty2", "bothmace1"},
		mode = kDrwPlayStretched, sound = "battle_npc_ghoul_attack"
	},
	kGdJobPunch = {
		kDrwAnimDefault = {"lefthand1"},	
		mode = kDrwPlayStretched, sound = "battle_npc_ghoul_attack"
	}, 
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_ghoul_die"},
	kGdJobCriticalHit = {{"hit", "hitstrong1", "hitweak1"}; sound = "battle_npc_ghoul_scream"},
}

--Register{id = 433, mesh = "figure_npc_ghoul_cloth1", movielib = Movies.figure_npc_ghoul}

-- Golems: ------------------------------------------------------
Movies.figure_npc_golem = CreateMovieLib{ base_name = "figure_npc_golem",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial", 
		kDrwAnimSpecial2 = "idlespecial2", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_titan"
	},
	walkcycle = {
		kDrwAnimDefault = 1.5, 
		kDrwAnimRun = 2.1, 
		kDrwAnimRetreat = 0.75, 
		kDrwAnimWar = 2.1,
	},
	kGdJobStrike = {	
		kDrwAnimDefault = {
			"righthand1",
			"righthand2", 
			"special",
		},
		kDrwAnimLeft = { 
			"lefthand1", 
			"lefthand2",
		},
		mode = kDrwPlayStretched, sound = "battle_npc_golem_attack"
	}, 
	kGdJobCast = {"cast"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolve","resolve"},
	kGdJobDie = {"die"; sound = "battle_npc_golem_die"},
	kGdJobCriticalHit = {"hitstrong"; sound = "battle_npc_golem_scream"},
}

-- Wraith: ------------------------------------------------------
Movies.figure_npc_wraith = CreateMovieLib{ base_name = "figure_npc_wraith",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimWar = "idlewar", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 0.62, 
		kDrwAnimRun = 3.2,
		kDrwAnimWar = 3.2,
	},
	kGdJobPunch		 = { 
		kDrwAnimDefault = {"righthand1"}, 
		kDrwAnimLeft = {"lefthand1"},
		mode = kDrwPlayStretched, sound = "battle_npc_wraith_attack"
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"rightswordempty", "righthand1"},
		kDrwAnimStaff = {"rightswordempty", "bothstaff1"},
		mode = kDrwPlayStretched, sound = "battle_npc_wraith_attack"
	}, 
	kGdJobCriticalHit = {"hit", "hit2"; sound = "battle_npc_wraith_scream"},
	kGdJobDie = {"die"; sound = "battle_npc_wraith_die"},
}


-- Skeletons: ------------------------------------------------------
Movies.figure_npc_skeleton = CreateMovieLib{ base_name = "figure_npc_skeleton",
	kGdJobDefault = {"lesser_idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "lesser_idle", 
		kDrwAnimSpecial1 = "idlespecial1", 
		kDrwAnimSpecial2 = "idlespecial2", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk2", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 0.7, 
		kDrwAnimRun = 2.5,
		kDrwAnimWar = 2.5,
	},
	kGdJobPunch = { 
		kDrwAnimDefault = {"righthand2"}, 
		kDrwAnimLeft = { 
			"lefthand1", 
			"lefthand2",
		},
		mode = kDrwPlayStretched, sound = "battle_npc_skeleton_attack"
	},
	kGdJobStrike	 = { 
		kDrwAnimDefault = {"rightmaceempty1", "rightmaceshield1", "rightmaceshield2", "rightswordempty1", "rightswordempty2", "rightswordshield1"}, 
		kDrwAnimBoth	 = {"bothmace1", "bothmace2", "bothsword1", "bothsword2"},
		kDrwAnimLeft	 = {"leftmace1", "leftsword1", "leftsword2"},
		kDrwAnimShield	 = {"rightswordshield1", "rightmaceshield2", "rightswordempty1", "rightswordempty2"},
		kDrwAnimDual	 = {"rightswordweapon1", "rightmaceweapon1"},
		mode = kDrwPlayStretched, sound = "battle_npc_skeleton_attack"
	},
	kGdJobStab		 = { 
		kDrwAnimDefault = {"rightswordshield2", "bothstaff2"}, 
		mode = kDrwPlayStretched, sound = "battle_npc_gargoyle_attack"
	},

	kGdJobHitTargetRange1 = {
		kDrwAnimDefault = "attackbow_aim_01", 
		kDrwAnimSpecial1 = "attackbow_aim_02", 
		mode = kDrwPlayStretched
	},
	kGdJobHitTargetRange2 = {
		kDrwAnimDefault = "attackbow_shoot_01", 
		kDrwAnimSpecial1 = "attackbow_shoot_02", 
		mode = kDrwPlayStretched
	},

	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_skeleton_die"},
	kGdJobCriticalHit = {"resolveenemy"; sound = "battle_npc_skeleton_scream"},
}


-- Succubus: ------------------------------------------------------
Movies.figure_npc_succubus_normal = CreateMovieLib{ base_name = "figure_npc_succubus_normal",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 1.4, 
		kDrwAnimRun = 2.5,
		kDrwAnimRetreat = 1.4, 
		kDrwAnimWar = 2.5,
	},
	kGdJobPunch  = {
		kDrwAnimDefault = {"righthand"},
		kDrwAnimLeft = {"lefthand"},
		mode = kDrwPlayStretched, 
		sound = "battle_npc_succubus_attack",
		},
	kGdJobStrike = {
		kDrwAnimDefault = {
			"righthand", 
			"lefthand",
		},
		mode = kDrwPlayStretched, 
		sound = "battle_npc_succubus_attack",
	}, 
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveself"},
	kGdJobDie = {"die"; sound = "battle_npc_succubus_die"},
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_succubus_scream"},
}


-- Medusa: ------------------------------------------------------
Movies.figure_npc_medusa = CreateMovieLib{ base_name = "figure_npc_medusa",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimWar = "idlewar", 
		kDrwAnimSpecial1 = "idlespecial1", 
		kDrwAnimSpecial2 = "idlespecial2",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 1.4, 
		kDrwAnimRun = 2.7,
		kDrwAnimRetreat = 1.4, 
		kDrwAnimWar = 2.7
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {
			"right", 
			"righthand1", 
			"righthand2", 
			"special"
		}, 
		mode = kDrwPlayStretched, sound = "battle_npc_medusa_attack"
	}, 

	kGdJobHitTargetRange1 = {
		kDrwAnimDefault = "attackbow_aim_1", 
		kDrwAnimSpecial1 = "attackbow_aim_2", 
		mode = kDrwPlayStretched
	},
	kGdJobHitTargetRange2 = {
		kDrwAnimDefault = "attackbow_shoot_1", 
		kDrwAnimSpecial1 = "attackbow_shoot_2", 
		mode = kDrwPlayStretched
	},

	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobCriticalHit = {"hit2", "hitstrong"; sound = "battle_npc_medusa_scream"},
	kGdJobDie = {"die"; sound = "battle_npc_medusa_die"},
}

-- Bonecrusher: ------------------------------------------------------
Movies.figure_boss_bonecrusher = CreateMovieLib{ base_name = "figure_boss_bonecrusher",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimWar = "idlewar", 
		kDrwAnimSpecial1 = "idlespecial1", 
		kDrwAnimSpecial2 = "idlespecial2", 
		kDrwAnimSpecial3 = "idlespecial3", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		kDrwAnimRetreat = "retreat", 
		mode = kDrwPlayLooped, 
		sound = "step_titan"
	},
	walkcycle = {
		kDrwAnimDefault = 2.8, 
		kDrwAnimRun = 3,
		kDrwAnimWar = 3,
		kDrwAnimRetreat = 1.5 
	},
	kGdJobStrike = {
		kDrwAnimDefault = {"rightsword1", "rightswordempty1", "rightswordempty2", "rightswordempty3", "rightswordempty4"},
		mode = kDrwPlayStretched, sound = "battle_npc_bonecrusher_attack"
	}, 
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy"},
	kGdJobCriticalHit = {"hit", "hit1", "hit2", "hit3"; sound = "battle_npc_bonecrusher_scream"},
	kGdJobDie = {"die"; sound = "battle_npc_bonecrusher_die"}, 
}

-- Dragon Boss: ------------------------------------------------------
Movies.figure_boss_dragon = CreateMovieLib{ base_name = "figure_boss_dragon",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1", 
		kDrwAnimSpecial2 = "idlespecial2", 
		kDrwAnimSpecial3 = "idlespecial3", 
		kDrwAnimWar = "idlewar", 
		mode = kDrwPlayLooped
	},
	kGdJobStrike = {
		kDrwAnimDefault = {"1", "2", "3", "4", "5"},
		mode = kDrwPlayStretched, sound = "battle_npc_dragonboss_attack"
	}, 
	kGdJobDie = {"die"; sound = "battle_npc_dragon_die"},
	kGdJobCriticalHit = {{"hitweak1", "hitweak2"}; sound = "battle_npc_dragonboss_scream"},
}

-- Wolves: ------------------------------------------------------
Movies.figure_animal_wolf = CreateMovieLib{ base_name = "figure_animal_wolf",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1", 
		kDrwAnimWar = "idlewar", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 1.0, 
		kDrwAnimRun = 2.0, 
		kDrwAnimWar = 2.0, 
	},
	kGdJobStrike = {{"special1", "special2"}; mode = kDrwPlayStretched, sound = "battle_npc_wolf_attack"}, 
	kGdJobDie = {"die"; sound = "battle_npc_wolf_die"},
	kGdJobCriticalHit = {"hitweak1"; sound = "battle_npc_wolf_scream"},
}

-- Bären: ------------------------------------------------------
Movies.figure_animal_bear = CreateMovieLib{ base_name = "figure_animal_bear",
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1",
		kDrwAnimWar = "idlewar", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 1.0, 
		kDrwAnimRun = 2.0, 
		kDrwAnimWar = 2.0, 
	},
	kGdJobStrike = {{"special1", "special2"}; mode = kDrwPlayStretched, sound = "battle_npc_bear_attack"}, 
	kGdJobCriticalHit = {"hit"; sound = "battle_npc_bear_scream"}, 
	kGdJobDie = {"die"; sound = "battle_npc_bear_die"}, 
}

-- Manticore: ------------------------------------------------------
Movies.figure_npc_manticore = CreateMovieLib{ base_name = "figure_npc_manticore",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimSpecial1 = "idlespecial1",
		kDrwAnimWar = "idlewar", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 0.7, 
		kDrwAnimRun = 3.8,
		kDrwAnimWar = 4.2,
		kDrwAnimRetreat = 1.2 
	},
	kGdJobStrike = {{"righthand1", "special1", "special2", "lefthand1"}; mode = kDrwPlayStretched, sound = "battle_npc_manticore_attack"}, 
	kGdJobCriticalHit = {"hit"; sound = "battle_npc_manticore_scream"},
	kGdJobDie = {"die"; sound = "battle_npc_manticore_die"},
}

-- Dragon: ------------------------------------------------------
Movies.figure_npc_smalldragon = CreateMovieLib{ base_name = "figure_npc_smalldragon",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimWar = "idlewar",
		kDrwAnimSpecial1 = "idlespecial1",
		kDrwAnimSpecial2 = "idlespecial2", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_talon"
	},
	walkcycle = {
		kDrwAnimDefault = 1.7, 
		kDrwAnimRun = 3.9, 
		kDrwAnimRetreat = 1.9, 
		kDrwAnimWar = 4.2
	},
	kGdJobStrike = {{"righthand1", "special1", "special2", "lefthand1"}; mode = kDrwPlayStretched, sound = "battle_npc_dragon_attack"}, 
	kGdJobDie = {"die"; sound = "battle_npc_dragon_die"},
	kGdJobCriticalHit = {"hit"; sound = "battle_npc_dragon_scream"},
}

-- Ogre: ------------------------------------------------------
Movies.figure_npc_ogre = CreateMovieLib{ base_name = "figure_npc_ogre",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimWar = "idlewar",
		kDrwAnimSpecial1 = "idlespecial", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 1.3, 
		kDrwAnimRun = 2.1, 
		kDrwAnimRetreat = 0.9, 
		kDrwAnimWar = 2.1,
	},
	kGdJobStrike = {
		kDrwAnimDefault = { 
			"rightmace1", 
			"rightmace2",
		}, 
		mode = kDrwPlayStretched, 
		sound = "battle_npc_ogre_attack"
	},
	kGdJobPunch = {
		kDrwAnimDefault = {"righthand1", "righthand2"}, 
		kDrwAnimLeft = "lefthand1", 
		mode = kDrwPlayStretched, 
		sound = "battle_npc_ogre_attack"
	}, 
	kGdJobCriticalHit = {"hit"; sound = "battle_npc_ogre_scream"},
	kGdJobDie = {"die"; sound = "battle_npc_ogre_die"},
}

-- Beastman: ------------------------------------------------------
Movies.figure_npc_beastman = CreateMovieLib{ base_name = "figure_npc_beastman",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimWar = "idlewar",
		kDrwAnimSpecial1 = "idlespecial", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 1,
		kDrwAnimRun = 1.7,
		kDrwAnimRetreat = 1,
		kDrwAnimWar = 1.7,
	},
	kGdJobPunch = {
		{"righthand1", "righthand2", "special1"}; 
		mode = kDrwPlayStretched, sound = "battle_npc_beastman_attack"
		},
	kGdJobStrike = { 
		kDrwAnimDefault = {"rightmace1", "rightmace2", "special1"},
		kDrwAnimLeft = {"leftmace"}, 
		mode = kDrwPlayStretched, sound = "battle_npc_beastman_attack"
		}, 
	kGdJobCriticalHit = {"hitstrong", "hit2"; sound = "battle_npc_beastman_scream"},
	kGdJobDie = {"die"; sound = "battle_npc_beastman_die"},
}

-- Elemental: ------------------------------------------------------
Movies.figure_npc_elemental = CreateMovieLib{ base_name = "figure_npc_elemental",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimWar = "idlewar",
		kDrwAnimSpecial1 = "idlespecial1", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 2.5, 
		kDrwAnimRun = 5, 
		kDrwAnimRetreat = 2.5, 
		kDrwAnimWar = 5,
	},
	kGdJobStrike = {
		kDrwAnimDefault = {"righthand1", "righthand2"},
		kDrwAnimLeft = {"lefthand1", "lefthand2"},
		mode = kDrwPlayStretched,
		sound = "battle_npc_elemental_attack",
	},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_elemental_die"},
	kGdJobCriticalHit = {"hit"; sound = "battle_npc_elemental_scream"},
}

-- Giant: ------------------------------------------------------
Movies.figure_npc_giant = CreateMovieLib{ base_name = "figure_npc_giant",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimWar = "idlewar",
		kDrwAnimSpecial1 = "idlespecial1",
		kDrwAnimSpecial2 = "idlespecial2", 
		kDrwAnimSpecial3 = "idlespecial3", 
		kDrwAnimTalk = {"idlespecial2", "idlespecial3"},
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "walk", -- faster walk 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_titan"
	},
	walkcycle = {
		kDrwAnimDefault = 2.5, 
		kDrwAnimRun = 1.8, 
		kDrwAnimRetreat = 2.3, 
		kDrwAnimWar = 1.8,
	},
	kGdJobStrike = {
		kDrwAnimDefault = {"rightmace1", "rightmace2", "special"},
		kDrwAnimLeft = {"lefthand1", "lefthand2"},
	        mode = kDrwPlayStretched,
	        sound = "battle_npc_giant_attack",
        }, 
	kGdJobDie = {"die"; sound = "battle_npc_giant_die"},
	kGdJobCriticalHit = {"hit"; sound = "battle_npc_giant_scream"},
}

-- Sleeping Giant: ---- Schlafender Quest-Riese ------------------
Movies.figure_npc_sleepinggiant = CreateMovieLib{ base_name = "figure_npc_sleepinggiant",
	kGdJobDefault = {"dead"; mode = kDrwPlayLooped},
}

-- Sitting Gargoyle: ---- versteinerte Gargoyles, die geweckt werden können ------------------
Movies.figure_npc_gargoyle_sitting = CreateMovieLib{ base_name = "figure_npc_gargoyle_sitting",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
}

-- Sleeping Dwarf: ---- Schlafender Quest-Dwarf ------------------
Movies.figure_npc_sleepingdwarf = CreateMovieLib{ base_name = "figure_npc_sleepingdwarf",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
}

-- Sleeping Elf: ---- Schlafende Quest-Elfe ------------------
Movies.figure_npc_sleepingelf = CreateMovieLib{ base_name = "figure_npc_sleepingelf",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
}

-- Minotaur: ------------------------------------------------------
Movies.figure_npc_minotaur = CreateMovieLib{ base_name = "figure_npc_minotaur",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimWar = "idlewar",
		kDrwAnimSpecial1 = "idlespecial1",
		kDrwAnimSpecial2 = "idlespecial2", 
		kDrwAnimSpecial3 = "idlespecial3", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 1.3, 
		kDrwAnimRun = 2.5, 
		kDrwAnimRetreat = 1.3, 
		kDrwAnimWar = 2.5,
	},
	kGdJobPunch = {{"righthand1", "righthand2"}; mode = kDrwPlayStretched, sound = "battle_npc_minotaur_attack"}, 
	kGdJobStrike = {
		kDrwAnimDefault = {"rightmace1", "rightmace2", "special1"}, 
		kDrwAnimLeft = "leftmace1", 
		mode = kDrwPlayStretched, sound = "battle_npc_minotaur_attack"
	}, 
	kGdJobDie = {"die"; sound = "battle_npc_minotaur_die"},
	kGdJobCriticalHit = {"hit"; sound = "battle_npc_minotaur_scream"},
}

-- Zombie: ------------------------------------------------------
Movies.figure_npc_zombie = CreateMovieLib{ base_name = "figure_npc_zombie",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimWar = "idlewar",
		kDrwAnimSpecial1 = "idlespecial", 
		kDrwAnimSpecial2 = "idlespecial2", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 1.3, 
		kDrwAnimRun = 2, 
		kDrwAnimRetreat = 1.3, 
		kDrwAnimWar = 2.5,
	},
	kGdJobPunch		 = { 
		kDrwAnimDefault = {"righthand", "righthand2"}, 
		kDrwAnimLeft = {"lefthand"}, 
		mode = kDrwPlayStretched, sound = "battle_npc_zombie_attack"
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"rightmaceempty"},	
		mode = kDrwPlayStretched, sound = "battle_npc_zombie_attack"
	}, 
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_zombie_die"},
	kGdJobCriticalHit = {"hit"; sound = "battle_npc_zombie_scream"},
}

-- Demon: ------------------------------------------------------
Movies.figure_npc_demon_lesser = CreateMovieLib{ base_name = "figure_npc_demon_lesser",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimWar = "idlewar",
		kDrwAnimSpecial1 = "idle_special1", 
		kDrwAnimSpecial2 = "idle_special2",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_talon"
	},
	walkcycle = {
		kDrwAnimDefault = 1.9, 
		kDrwAnimRun = 5.5, 
		kDrwAnimRetreat = 1.6, 
		kDrwAnimWar = 5.5,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"righthand", "special", "special2"},	
		kDrwAnimLeft = {"lefthand", "lefthand2"}, 
		mode = kDrwPlayStretched, sound = "battle_npc_demon_attack"
	}, 
	kGdJobCast = {"cast"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolve","resolve"},
	kGdJobDie = {"die"; sound = "battle_npc_demon_die"},
	kGdJobCriticalHit = {"hit"; sound = "battle_npc_demon_scream"},
}

-- Spectre: ------------------------------------------------------
Movies.figure_npc_spectre_normal = CreateMovieLib{ base_name = "figure_npc_spectre_normal",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimWar = "idlewar", 
		kDrwAnimSpecial1 = "idlespecial", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 1.0, 
		kDrwAnimRun = 1.6, 
		kDrwAnimRetreat = 0.8, 
		kDrwAnimWar = 1.6,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"righthand1", "righthand2"}, 
		kDrwAnimLeft = {"lefthand1", "lefthand2"}, 
		mode = kDrwPlayStretched, sound = "battle_npc_spectre_attack"
	}, 
	kGdJobCast = {"cast"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolve","resolve"},
	kGdJobDie = {"die"; sound = "battle_npc_spectre_die"},
	kGdJobCriticalHit = {"hit"; sound = "battle_npc_spectre_scream"},
}


-- Basilisk: ------------------------------------------------------
Movies.figure_npc_basilisk = CreateMovieLib{ base_name = "figure_npc_basilisk",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimWar = "idlewar",
		kDrwAnimSpecial1 = "idlespecial1", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 1.4, 
		kDrwAnimRun = 3, 
		kDrwAnimRetreat = 0.8, 
		kDrwAnimWar = 3,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"1", "special2"},	
		mode = kDrwPlayStretched, sound = "battle_npc_basilisk_attack"
	}, 
	kGdJobCast = {"cast"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolve","resolve"},
	kGdJobDie = {"die"; sound = "battle_npc_basilisk_die"},
	kGdJobCriticalHit = {"hitstrong1"; sound = "battle_npc_basilisk_scream"},
}

-- Demon Boss: ------------------------------------------------------
Movies.figure_boss_demon = CreateMovieLib{ base_name = "figure_boss_demon",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "special_attack_1", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		kDrwAnimRetreat = "retreat", 
		mode = kDrwPlayLooped, 
		sound = "step_talon"
	},
	walkcycle = {
		kDrwAnimDefault = 2.4, 
		kDrwAnimRun = 4, 
		kDrwAnimRetreat = 2.8, 
		kDrwAnimWar = 2.4,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"righthand"},	
		kDrwAnimLeft = {"lefthand"}, 
		mode = kDrwPlayStretched, sound = "battle_npc_demonboss_attack"
	}, 
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveself"},
	kGdJobDie = {"die"; sound = "battle_npc_demonboss_die"},
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_demonboss_scream"},

}

-- Titan Orc: ------------------------------------------------------
Movies.figure_titan_orc = CreateMovieLib{ base_name = "figure_titan_orc",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = {name = "step_titan", offset = 0.0, length = 0.8},
	},
	walkcycle = {
		kDrwAnimDefault = 2,
		kDrwAnimRun = 2.8,
		kDrwAnimWar = 2.8,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"righthand1", "lefthand1", "special1"},
		kDrwAnimLeft = {"lefthand1"}, 
		mode = kDrwPlayStretched, sound = "battle_titan_orc_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_demonboss_scream"},
	kGdJobDie = {"die"; sound = "battle_titan_orc_die"},
}

-- Titan Troll: ------------------------------------------------------
Movies.figure_titan_troll = CreateMovieLib{ base_name = "figure_titan_troll",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = {name = "step_titan", offset = 0.0, length = 0.8},
	},
	walkcycle = {
		kDrwAnimDefault = 1.6,
		kDrwAnimRun = 2.5,
		kDrwAnimWar = 2.5,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"righthand1", "lefthand1", "special1"},	
		kDrwAnimLeft = {"lefthand1"}, 
		mode = kDrwPlayStretched, sound = "battle_titan_troll_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_demonboss_scream"},
	kGdJobDie = {"die"; sound = "battle_titan_troll_die"},
}

-- Titan Elf: ------------------------------------------------------
Movies.figure_titan_elf = CreateMovieLib{ base_name = "figure_titan_elf",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = {name = "step_titan", offset = 0.0, length = 0.6},
	},
	walkcycle = {
		kDrwAnimDefault = 1.4,
		kDrwAnimRun = 1.8,
		kDrwAnimWar = 1.8,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"righthand1", "lefthand1", "special1"},	
		kDrwAnimLeft = {"lefthand1"}, 
		mode = kDrwPlayStretched, sound = "battle_titan_elf_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_demonboss_scream"},
	kGdJobDie = {"die"; sound = "battle_titan_elf_die"},
}

-- Titan Darkelf: ------------------------------------------------------
Movies.figure_titan_darkelf = CreateMovieLib{ base_name = "figure_titan_darkelf",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped,
		sound = {name = "step_titan", offset = 0.0, length = 0.2},
	},
	walkcycle = {
		kDrwAnimDefault = 1.2,
		kDrwAnimRun = 2.3,
		kDrwAnimWar = 2.3,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"righthand1", "lefthand1", "special1"},	
		kDrwAnimLeft = {"lefthand1"}, 
		mode = kDrwPlayStretched, sound = "battle_titan_darkelf_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_demonboss_scream"},
	kGdJobDie = {"die"; sound = "battle_titan_darkelf_die"},
}

-- Titan Human: ------------------------------------------------------
Movies.figure_titan_human = CreateMovieLib{ base_name = "figure_titan_human",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 2.5,
		kDrwAnimRun = 4,
		kDrwAnimWar = 4, 
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"righthand1", "lefthand1", "special1"},	
		kDrwAnimLeft = {"lefthand1"},	
		mode = kDrwPlayStretched, sound = "battle_titan_human_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_demonboss_scream"},
	kGdJobDie = {"die"; sound = "battle_titan_human_die"},
}

-- Titan Dwarf: ------------------------------------------------------
Movies.figure_titan_dwarf = CreateMovieLib{ base_name = "figure_titan_dwarf",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = {name = "step_titan", offset = 0.0, length = 0.9},
	},
	walkcycle = {
		kDrwAnimDefault = 2,
		kDrwAnimRun = 2.8,
		kDrwAnimWar = 2.8,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"righthand1", "lefthand1", "special1"},	
		kDrwAnimLeft = {"lefthand1"},	
		mode = kDrwPlayStretched, sound = "battle_titan_dwarf_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_demonboss_scream"},
	kGdJobDie = {"die"; sound = "battle_titan_dwarf_die"},
}

-- Rabbit: ------------------------------------------------------
Movies.figure_animal_rabbit = CreateMovieLib{ base_name = "figure_animal_rabbit",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped
	},
	walkcycle = {
		kDrwAnimDefault = 1.5,
		kDrwAnimRun = 1,
		kDrwAnimWar = 1,
	},
	kGdJobDie = {"die"; sound = "dummy_silence"},
}

-- Spider: ------------------------------------------------------
Movies.figure_npc_giantspider = CreateMovieLib{ base_name = "figure_npc_giantspider",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimWar = "idlewar",
		kDrwAnimSpecial1 = "idlespecial1", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 1.7,
		kDrwAnimRun = 4.0, 
		kDrwAnimWar = 4.0,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"lefthand1", "lefthand2", "righthand1", "righthand2", "special1"}, 
		mode = kDrwPlayStretched,
		sound = "battle_npc_giantspider_attack",
	}, 
	kGdJobDie = {"die"; sound = "battle_npc_giantspider_die"},
	kGdJobCriticalHit = {"hitweak"; sound = "battle_npc_giantspider_scream"},
}

-- Beetle: ------------------------------------------------------
Movies.figure_npc_giantbeetle = CreateMovieLib{ base_name = "figure_npc_giantbeetle",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimWar = "idlewar",
		kDrwAnimSpecial1 = "idlespecial1", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 1.2,
		kDrwAnimRun = 3.0, 
		kDrwAnimWar = 3.0,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {
			"lefthand1", 
			"lefthand2", 
			"righthand1", 
			"righthand2", 
			"special1"
		}, 
	mode = kDrwPlayStretched,
	sound = "battle_npc_giantbeetle_attack",
	}, 
	kGdJobDie = {"die"; sound = "battle_npc_giantbeetle_die"},
	kGdJobCriticalHit = {"hitweak"; sound = "battle_npc_giantbeetle_scream"},
}

-- Büffel: ------------------------------------------------------
Movies.figure_animal_buffalo = CreateMovieLib{ base_name = "figure_animal_buffalo",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1",
		kDrwAnimWar = "idlewar",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 1, 
		kDrwAnimRun = 3, 
		kDrwAnimWar = 3, 
	},
	kGdJobStrike = {"special1", "special2"; mode = kDrwPlayStretched}, 
	kGdJobCriticalHit = {"hit"; sound = "battle_npc_cattle_scream"},
	kGdJobDie = {"die"; sound = "battle_npc_cattle_die"}, 
}

-- Kuh: ------------------------------------------------------
Movies.figure_animal_cattle = CreateMovieLib{ base_name = "figure_animal_cattle_normal",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 1, 
		kDrwAnimRun = 3, 
		kDrwAnimWar = 3, 
	},
	kGdJobDie = {"die"; sound = "battle_npc_cattle_die"},
	kGdJobCriticalHit = {"hit"; sound = "battle_npc_cattle_scream"},
}

-- DeerOld: ------------------------------------------------------
Movies.figure_animal_deer_old = CreateMovieLib{ base_name = "figure_animal_deer_old",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 0.9, 
		kDrwAnimRun = 3.7, 
		kDrwAnimWar = 3.7, 
	},
	kGdJobDie = {"die"; sound = "battle_npc_deer_die"},
	kGdJobCriticalHit = {"hit"; sound = "dummy_silence"},
}

-- DeerYoung: ------------------------------------------------------
Movies.figure_animal_deer_young = CreateMovieLib{ base_name = "figure_animal_deer_young",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 0.65, 
		kDrwAnimRun = 3.0, 
		kDrwAnimWar = 3.0, 
	},
	kGdJobDie = {"die"; sound = "battle_npc_deer_die"},
	kGdJobCriticalHit = {"hit"; sound = "dummy_silence"},
}

-- Moose: ------------------------------------------------------
Movies.figure_animal_moose_normal = CreateMovieLib{ base_name = "figure_animal_moose_normal",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1", 
		kDrwAnimWar = "idlewar",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 0.9, 
		kDrwAnimRun = 4.0, 
		kDrwAnimWar = 4.0, 
	},
	kGdJobStrike = {"special1"; mode = kDrwPlayStretched}, 
	kGdJobDie = {"die"; sound = "battle_npc_deer_die"},
	kGdJobCriticalHit = {"hit"; sound = "dummy_silence"},
}

-- Wildboar: ------------------------------------------------------
Movies.figure_animal_wildboar_normal = CreateMovieLib{ base_name = "figure_animal_wildboar_normal",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1", 
		kDrwAnimWar = "idlewar",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
	},
	walkcycle = {
		kDrwAnimDefault = 1.0, 
		kDrwAnimRun = 2.0, 
		kDrwAnimWar = 2.0, 
	},
	kGdJobStrike = {{"special1", "special2"}; mode = kDrwPlayStretched}, 
	kGdJobDie = {"die"; sound = "battle_npc_wildboar_die"},
	kGdJobCriticalHit = {"hit"; sound = "battle_npc_wildboar_scream"},
}

-- Blade Weaver: ------------------------------------------------------
Movies.figure_npc_blade_weaver = CreateMovieLib{ base_name = "figure_npc_blade_weaver",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimWar = "idlewar",
		kDrwAnimSpecial1 = {"idlespecial1"; sound = "idle_npc_bladeweaver"}, 
		mode = kDrwPlayLooped,
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_blade"
	},
	walkcycle = {
		kDrwAnimDefault = 1.1, 
		kDrwAnimRun = 2.5, 
		kDrwAnimWar = 2.5,
	},
	kGdJobStrike	 = { 
		kDrwAnimDefault = {
			"righthand1", 
			"righthand1", 
			"special1", 
			"special2", 
		}, 
		kDrwAnimLeft = {"lefthand1", "lefthand2"},	
		mode = kDrwPlayStretched, sound = "battle_npc_blade_attack"
	},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_blade_die"},
	kGdJobCriticalHit = {"hit"; sound = "battle_npc_blade_scream"},
}

-- Blade Minion: ------------------------------------------------------
Movies.figure_npc_blade_minion = CreateMovieLib{ base_name = "figure_npc_blade_minion",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimWar = "idlewar",
		kDrwAnimSpecial1 = "idlespecial1", 
		kDrwAnimSpecial2 = {"idlespecial2"; sound = "idle_npc_blademinion"},
		mode = kDrwPlayLooped,
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_blade"
	},
	walkcycle = {
		kDrwAnimDefault = 1.1, 
		kDrwAnimRun = 2.5, 
		kDrwAnimWar = 2.5,
	},
	kGdJobStrike	 = { 
		kDrwAnimDefault = {
			"righthand1", 
			"righthand2", 
			"special1",
			"special2",
		}, 
		kDrwAnimLeft = {
			"lefthand1", 
			"lefthand2", 
		}, 
		mode = kDrwPlayStretched, sound = "battle_npc_blade_attack"
	},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_blade_die"},
	kGdJobCriticalHit = {"hitweak1"; sound = "battle_npc_blade_scream"},
}

-- Blade Principal: ------------------------------------------------------
Movies.figure_npc_blade_principal = CreateMovieLib{ base_name = "figure_npc_blade_principal",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimWar = "idlewar",
		kDrwAnimSpecial1 = {"idlespecial"; sound = "idle_npc_blademinion"},
		mode = kDrwPlayLooped,
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = "step_blade"
	},
	walkcycle = {
		kDrwAnimDefault = 1.3, 
		kDrwAnimRun = 2.0, 
		kDrwAnimWar = 2.0, 
	},
	kGdJobStrike	 = { 
		kDrwAnimDefault = {
			"righthand1", 
			"righthand2", 
			"special1", 
			"special2"
		}, 
		kDrwAnimLeft = {
			"lefthand1", 
			"lefthand2", 
		}, 
		mode = kDrwPlayStretched, sound = "battle_npc_blade_attack"
	},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_blade_die"},
	kGdJobCriticalHit = {"hitweak"; sound = "battle_npc_blade_scream"},
}

-- Soulforger: ------------------------------------------------------
Movies.figure_boss_soulforger = CreateMovieLib{ base_name = "figure_boss_soulforger",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1",
		kDrwAnimWar = "idlewar",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		kDrwAnimRetreat = "retreat", 
		mode = kDrwPlayLooped, 
		sound = "step_blade"
	},
	walkcycle = {
		kDrwAnimDefault = 2, 
		kDrwAnimRun = 5.5, 
		kDrwAnimWar = 5.5, 
		kDrwAnimRetreat = 5.5
	},
	kGdJobStrike	 = { 
		kDrwAnimDefault = {
			"rightmaceempty1", 
			"rightmaceempty2", 
			"special1", 
			"special2"
		}, 
		kDrwAnimLeft = {
			"lefthand1", 
			"lefthand2", 
		}, 
		mode = kDrwPlayStretched, sound = "battle_npc_blade_attack"
	},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_blade_die"},
	kGdJobCriticalHit = {"hitweak1"; sound = "battle_npc_blade_scream"},
}

-- Gladiator: ------------------------------------------------------
Movies.figure_npc_gladiator = CreateMovieLib{ base_name = "figure_npc_gladiator",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial",
		kDrwAnimWar = "idlespecial",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run",
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1.1,
		kDrwAnimRun = 2.2,
		kDrwAnimWar = 2.2,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"righthand"},	
		kDrwAnimLeft = {"lefthand"}, 
		mode = kDrwPlayStretched, sound = "battle_npc_ogre_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_ogre_scream"},
	kGdJobDie = {"die"; sound = "battle_npc_ogre_die"},
}

-- Sabretooth: ------------------------------------------------------
Movies.figure_npc_sabretooth = CreateMovieLib{ base_name = "figure_npc_sabretooth",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial",
		kDrwAnimWar = "idlespecial",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 2,
		kDrwAnimRun = 2.8,
		kDrwAnimWar = 2.8,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"righthand", "special"},	
		mode = kDrwPlayStretched, sound = "battle_npc_sabretooth_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_sabretooth_scream"},
	kGdJobDie = {"die"; sound = "battle_npc_sabretooth_die"},
}
-----------------------------------------------------------------
-- ADDON 1 - Breath of Winter -----------------------------------
-----------------------------------------------------------------

-- Kithar: ------------------------------------------------------
Movies.figure_npc_kithar = CreateMovieLib{ base_name = "figure_npc_kithar",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial",
		kDrwAnimWar = "idlespecial",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 2,
		kDrwAnimRun = 2.8,
		kDrwAnimWar = 2.8,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"righthand", "special"},	
		mode = kDrwPlayStretched, sound = "battle_npc_sabretooth_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_sabretooth_scream"},
	kGdJobCast = {"cast"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_sabretooth_die"},
}

-- Toad: ------------------------------------------------------
Movies.figure_npc_toad = CreateMovieLib{ base_name = "figure_npc_toad",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial",
		kDrwAnimWar = "idlespecial",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 2,
		kDrwAnimRun = 2.8,
		kDrwAnimWar = 2.8,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"righthand", "special"},	
		mode = kDrwPlayStretched, sound = "battle_npc_gianttoad_attack"
	}, 
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_gianttoad_scream"},
	kGdJobDie = {"die"; sound = "battle_npc_gianttoad_die"},
}

-- Screamer: ------------------------------------------------------
Movies.figure_npc_screamer = CreateMovieLib{ base_name = "figure_npc_screamer",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimWar = "idlewar",
		kDrwAnimTalkIdle = "idle",
		kDrwAnimTalk = {"talk"},
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 2,
		kDrwAnimRun = 2.8,
		kDrwAnimWar = 2.8,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"special1"},	
		mode = kDrwPlayStretched, sound = "battle_npc_screamer_attack"
	}, 
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_screamer_die"},
}

-- Treewraith: ------------------------------------------------------
Movies.figure_npc_treewraith = CreateMovieLib{ base_name = "figure_npc_treewraith",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run",
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1.5,
		kDrwAnimRun = 2.3,
		kDrwAnimWar = 2.3,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"righthand1", "special1", "lefthand1"},
		mode = kDrwPlayStretched, sound = "battle_npc_treeman_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_treeman_scream"},
	kGdJobDie = {"die"; sound = "battle_npc_treeman_die"},
}

-- Werewolf: ------------------------------------------------------
Movies.figure_npc_werewolf = CreateMovieLib{ base_name = "figure_npc_werewolf",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run",
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 2,
		kDrwAnimRun = 2.8,
		kDrwAnimWar = 2.8,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"rightweapon", "special"},	
		kDrwAnimLeft = {"leftweapon"},	
		mode = kDrwPlayStretched, sound = "battle_npc_werewolf_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_werewolf_scream"},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_werewolf_die"},
}

-- Zhuul: ------------------------------------------------------
Movies.figure_npc_zhuul = CreateMovieLib{ base_name = "figure_npc_zhuul",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		mode = kDrwPlayLooped,
		sound = "wings_zhuul"
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = "step_titan"
	},
	walkcycle = {
		kDrwAnimDefault = 2,
		kDrwAnimRun = 2.8,
		kDrwAnimWar = 2.8,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"righthand1", "special1", "lefthand1"},	
		mode = kDrwPlayStretched, sound = "battle_npc_fireangel_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_fireangel_scream"},
	kGdJobDie = {"die"; sound = "battle_npc_fireangel_die"},
}

-- Boss Fial Darg: ------------------------------------------------------
Movies.figure_boss_fial_darg = CreateMovieLib{ base_name = "figure_boss_fial_darg",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial",
		kDrwAnimTalkIdle = "idle",
		kDrwAnimTalk = "talkidle",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = "step_titan"
	},
	walkcycle = {
		kDrwAnimDefault = 3,
		kDrwAnimRun = 3,
		kDrwAnimWar = 3,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"right", "special"},
		mode = kDrwPlayStretched, sound = "battle_npc_fial_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_fial_scream"},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_fial_die"},
}

-- Headtoucher/Frost: ------------------------------------------------------
Movies.figure_npc_headtoucher = CreateMovieLib{ base_name = "figure_npc_headtoucher",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1.9,
		kDrwAnimRun = 2,
		kDrwAnimWar = 2,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"righthand1", "special1", "lefthand1"},	
		mode = kDrwPlayStretched, sound = "battle_npc_headless_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_headless_scream"},
	kGdJobCast = {"cast"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_headless_die"},
}

-- Aryn small: ------------------------------------------------------
Movies.figure_npc_aryn_small = CreateMovieLib{ base_name = "figure_npc_aryn_small",
	kGdJobDefault = {"idlespecial3"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idlespecial3", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk2", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 2,
		kDrwAnimRun = 4.3,
		kDrwAnimWar = 4.3,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"special"},	
		mode = kDrwPlayStretched, sound = "battle_npc_drakeling_attack"
	}, 
	kGdJobCriticalHit = {{"hit01", "hit02", "hit03"}; sound = "battle_npc_drakeling_scream"},
	kGdJobCast = {"cast"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_drakeling_die"},
}

-- Boss Aryn: ------------------------------------------------------
Movies.figure_boss_aryn = CreateMovieLib{ base_name = "figure_boss_aryn",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial",
		kDrwAnimWar = "idlewar", 
		mode = kDrwPlayLooped
	},
	kGdJobHitTargetRange1 = {
		"attackspecial";
		mode = kDrwPlayStretched
		},
	kGdJobHitTargetRange2 = {
		"attackresolve";
		mode = kDrwPlayStretched
		},

	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_drakeling_scream"},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
}

-----------------------------------------------------------------
-- ADDON 2 ------------------------------------------------------
-----------------------------------------------------------------

-- Siege Human: ------------------------------------------------------
Movies.figure_human_siege_mage = CreateMovieLib{ base_name = "figure_human_siege_mage",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial", 
		mode = kDrwPlayLooped,
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "dummy_silence",
	},
	walkcycle = {
		kDrwAnimDefault = 1,
		kDrwAnimRun = 2,
		kDrwAnimWar = 2,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"rightstaff1", "rightstaff2"},	
		mode = kDrwPlayStretched, sound = "battle_race_human_attack",
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_race_human_scream"},
	kGdJobDie = {"die"; sound = "battle_race_human_die"},
}

-- Siege Elf: ------------------------------------------------------
Movies.figure_elf_siege = CreateMovieLib{ base_name = "figure_elf_siege",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "dummy_silence"
	},
	walkcycle = {
		kDrwAnimDefault = 1,
		kDrwAnimRun = 2,
		kDrwAnimWar = 2,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"rightstaff1", "rightstaff2"},	
		mode = kDrwPlayStretched, sound = "battle_race_elf_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_race_elf_scream"},
	kGdJobDie = {"die"; sound = "battle_race_elf_die"},
}

-- Siege Dwarf: ------------------------------------------------------
Movies.figure_dwarf_siege = CreateMovieLib{ base_name = "figure_dwarf_siege",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1,
		kDrwAnimRun = 2,
		kDrwAnimWar = 2,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"right1", "right2", "tower"}, -- tower = siege attack	
		mode = kDrwPlayStretched, sound = "battle_race_dwarf_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_race_dwarf_scream"},
	kGdJobDie = {"die"; sound = "battle_race_dwarf_die"},
}

-- Siege Orc: ------------------------------------------------------
Movies.figure_orc_siege = CreateMovieLib{ base_name = "figure_orc_siege",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1,
		kDrwAnimRun = 1.8,
		kDrwAnimWar = 1.8,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"rightsword1", "rightsword2"},	
		mode = kDrwPlayStretched, sound = "battle_race_orc_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_race_orc_scream"},
	kGdJobDie = {"die"; sound = "battle_race_orc_die"},
}

-- Siege Darkelf: ------------------------------------------------------
Movies.figure_darkelf_siege = CreateMovieLib{ base_name = "figure_darkelf_siege",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1,
		kDrwAnimRun = 2,
		kDrwAnimWar = 2,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"1", "2"},	
		mode = kDrwPlayStretched, sound = "battle_race_darkelf_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_race_darkelf_scream"},
	kGdJobCast = {"cast"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolve","resolve"},
	kGdJobDie = {"die"; sound = "battle_race_darkelf_die"},
}

-- Siege Troll: ------------------------------------------------------
Movies.figure_troll_siege = CreateMovieLib{ base_name = "figure_troll_siege",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1,
		kDrwAnimRun = 2,
		kDrwAnimWar = 2,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"right1", "right2"},	
		mode = kDrwPlayStretched, sound = "battle_race_troll_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_race_troll_scream"},
	kGdJobCast = {"cast"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolve","resolve"},
	kGdJobDie = {"die"; sound = "battle_race_troll_die"},
}

-- Swarm Human Dog: ------------------------------------------------------
Movies.figure_human_swarm_dog = CreateMovieLib{ base_name = "figure_human_swarm_dog",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1,
		kDrwAnimRun = 2,
		kDrwAnimWar = 2,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {""},	
		mode = kDrwPlayStretched, sound = "battle_human_swarm_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_human_swarm_scream"},
	kGdJobDie = {"die"; sound = "battle_human_swarm_die"},
}

-- Swarm Troll Geier: ------------------------------------------------------
Movies.figure_troll_swarm_vulture = CreateMovieLib{ base_name = "figure_troll_swarm_vulture",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = "dummy_silence"
	},
	walkcycle = {
		kDrwAnimDefault = 1,
		kDrwAnimRun = 2,
		kDrwAnimWar = 2,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {""},	
		mode = kDrwPlayStretched, sound = "battle_troll_swarm_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_troll_swarm_scream"},
	kGdJobDie = {"die"; sound = "battle_troll_swarm_die"},
}

-- Swarm Orc Wildboar: ------------------------------------------------------
Movies.figure_orc_swarm_wildboar = CreateMovieLib{ base_name = "figure_orc_swarm_wildboar",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1,
		kDrwAnimRun = 2,
		kDrwAnimWar = 2,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {""},	
		mode = kDrwPlayStretched, sound = "battle_orc_swarm_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_orc_swarm_scream"},
	kGdJobDie = {"die"; sound = "battle_orc_swarm_die"},
}

-- Swarm Dwarf Rammer: ------------------------------------------------------
Movies.figure_dwarf_swarm_ram = CreateMovieLib{ base_name = "figure_dwarf_swarm_ram",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1,
		kDrwAnimRun = 2,
		kDrwAnimWar = 2,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {""},	
		mode = kDrwPlayStretched, sound = "battle_dwarf_swarm_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_dwarf_swarm_scream"},
	kGdJobDie = {"die"; sound = "battle_dwarf_swarm_die"},
}

-- Swarm Elf Pixie: ------------------------------------------------------
Movies.figure_elf_swarm_pixie = CreateMovieLib{ base_name = "figure_elf_swarm_pixie",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = "dummy_silence"
	},
	walkcycle = {
		kDrwAnimDefault = 1,
		kDrwAnimRun = 2,
		kDrwAnimWar = 2,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {""},	
		mode = kDrwPlayStretched, sound = "battle_elf_swarm_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_elf_swarm_scream"},
	kGdJobDie = {"die"; sound = "battle_elf_swarm_die"},
}

-- Swarm Darkelf Bat: ------------------------------------------------------
Movies.figure_darkelf_swarm_bat = CreateMovieLib{ base_name = "figure_darkelf_swarm_bat",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = "dummy_silence"
	},
	walkcycle = {
		kDrwAnimDefault = 1,
		kDrwAnimRun = 2,
		kDrwAnimWar = 2,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {""},	
		mode = kDrwPlayStretched, sound = "battle_darkelf_swarm_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_darkelf_swarm_scream"},
	kGdJobDie = {"die"; sound = "battle_darkelf_swarm_die"},
}

-----------------------------------------------------------------------
-- Dervish (Elf Anims)
-----------------------------------------------------------------------
Movies.figure_npc_dervish = CreateMovieLib{ base_name = "figure_elf",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle",
		kDrwAnimSpecial1 = "idlespecial", 
		kDrwAnimSpecial2 = "idlespecial2", 
		kDrwAnimTalkIdle = "idle",
		kDrwAnimTalk = {"talkidle", "talk1", "talk2"},
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {	
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1, 
		kDrwAnimRun = 3, 
		kDrwAnimWar = 3,
		kDrwAnimRetreat = 1,
	},	

	kGdJobPunch	 = {	
		kDrwAnimDefault = {"righthand1"},
		kDrwAnimLeft = {"lefthand1"}, 
		mode = kDrwPlayStretched, 
		sound = "battle_npc_dervish_attack",
	},

	kGdJobStrike = {
		kDrwAnimDefault = {
			"rightswordempty1", 
			"rightswordempty2", 
			"rightmaceempty2"
		}, 
		kDrwAnimShield = {
			"rightmaceshield1", 
			"rightmaceshield2",
			"rightmaceempty1", 
			"rightmaceempty2", 
			"rightswordempty1",
		}, sound = "battle_npc_dervish_attack",
		kDrwAnimStaff = {
			"bothstaff1", 
			"bothstaff2"
		}, sound = "battle_npc_dervish_attack",
		kDrwWt1HStaff = {
			"rightstaff1",
			"rightmaceempty1", 
			"rightmaceempty2", 
		}, sound = "battle_npc_dervish_attack",
		kDrwWt2HStaff = {
			"bothstaff1", 
			"bothstaff2"
		}, sound = "battle_race_elf_attack",
		kDrwWt2HAxe = {"rightmaceempty2"}, sound = "battle_npc_dervish_attack",
		kDrwWt2HSword = {"rightmaceempty2", "rightswordempty1"}, sound = "battle_npc_dervish_attack",
		kDrwAnimBoth = {
			"rightmaceempty1", 
			"rightswordempty1", 
			"rightswordempty2"
		}, 
		mode = kDrwPlayStretched
	},
	kGdJobStab = {	
		kDrwAnimDefault = {"rightswordempty2"},
		mode = kDrwPlayStretched,
	},
	kGdJobHitTargetRange1 = {
		"attackbow_aim_1";
		mode = kDrwPlayStretched
		},
	kGdJobHitTargetRange2 = {
		"attackbow_shoot_1";
		mode = kDrwPlayStretched
		},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveself"},
	kGdJobDie = {"die"; sound = "battle_npc_dervish_die"},
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3", "hit4", "hit5"}; sound = "battle_npc_dervish_scream"},
}

-- Muscleman: ------------------------------------------------------
Movies.figure_npc_muscleman = CreateMovieLib{ base_name = "figure_npc_muscleman",

--- default -----------------------------------------------------------
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimWar = "idlewar", 
		kDrwAnimTalkIdle = "idle",
		kDrwAnimTalk = {"talkidle", "talk1", "talk2"},
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {	
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimRetreat = "retreat", 
		kDrwAnimWar = "runwar",
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1.3,
		kDrwAnimRun = 2.7,
		kDrwAnimRetreat = 1.4,
		kDrwAnimWar = 2.7,
	},	
	kGdJobPunch = {	
		kDrwAnimDefault = {
			"special", 
			"righthand1", 
			"rightstaff1"
		}, 
		kDrwAnimLeft = {
			"rightswordweapon2",
		}, sound = "battle_npc_muscleman_attack",
		mode = kDrwPlayStretched, sound = "battle_npc_muscleman_attack",
	},
	
	kGdJobStrike = {	
		kDrwAnimDefault = {
			"rightswordempty1", 
			"rightswordempty2", 
			"rightmaceempty1", 
			"rightmaceempty2", 
		}, 
		kDrwAnimLeft = {
			"rightswordweapon1", 
			"rightswordweapon2",
		}, sound = "battle_npc_muscleman_attack",
		kDrwAnimShield = {
			"rightswordempty1", 
			"rightswordempty2", 
			"rightmaceshield1", 
			"rightmaceempty1", 
			"rightmaceempty2", 
			"rightswordshield1",
			"rightstaff1",
		}, 
		kDrwAnimBoth = {
			"bothsword1", 
			"bothsword2", 
			"bothmace1", 
			"bothmace2"
		}, sound = "battle_npc_muscleman_attack",
		kDrwAnimStaff = {
			"bothstaff1", 
			"bothstaff2"
		}, sound = "battle_npc_muscleman_attack",
		kDrwAnimDual = {
			"rightswordweapon1", 
			"rightswordweapon2"
		}, 
		mode = kDrwPlayStretched,
		sound = "battle_npc_muscleman_attack",

		kDrwWt1HStaff   = "rightstaff1",
		mode = kDrwPlayStretched, sound = "battle_npc_muscleman_attack",
	},

	kGdJobHitTargetRange1 = {
		"attackcrossbow_aim_1";
		mode = kDrwPlayStretched
		},
	kGdJobHitTargetRange2 = {
		"attackcrossbow_shoot_1";
		mode = kDrwPlayStretched
		},

	kGdJobCast = {"cast"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveself"},
	kGdJobDie = {"die"; sound = "battle_npc_muscleman_die"},
	kGdJobCriticalHit = {{"hit", "hit2", "hit3", "hit4", "hit5"}; sound = "battle_npc_muscleman_scream"},
}



-- wing_test: ------------------------------------------------------
Movies.wing_test = CreateMovieLib{ base_name = "wing_test",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		mode = kDrwPlayLooped
	},
}

-- Mumie ----------------------------------------------------------------
Movies.figure_npc_mumie = CreateMovieLib{ base_name = "figure_npc_mumie",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial", 
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar",
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 0.6,
		kDrwAnimRun = 1.4,
		kDrwAnimWar = 1.4,
	},
	kGdJobStrike = { 
		kDrwAnimDefault = {"right"},	
		kDrwAnimLeft = {"left"},	
		mode = kDrwPlayStretched, sound = "battle_npc_mummy_attack"
	}, 
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_mummy_scream"},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_mummy_die"},
}

-- Bronzeriese ----------------------------------------------------------------
Movies.figure_boss_giant_bronce = CreateMovieLib{ base_name = "figure_boss_giant_bronce",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1",
		kDrwAnimWar = "idlewar",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		kDrwAnimRetreat = "retreat", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 2, 
		kDrwAnimRun = 5.5, 
		kDrwAnimWar = 5.5, 
		kDrwAnimRetreat = 5.5
	},
	kGdJobStrike	 = { 
		kDrwAnimDefault = {
			"rightmaceempty1", 
			"rightmaceempty2", 
			"special1" 
		}, 
		kDrwAnimLeft = {
			"lefthand1", 
			"lefthand2", 
		}, 
		mode = kDrwPlayStretched, sound = "battle_npc_colossus_attack"
	},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_colossus_die"},
	kGdJobCriticalHit = {"hit1"; sound = "battle_npc_colossus_scream"},
}

-- Boss Belial ----------------------------------------------------------------
Movies.figure_boss_belial = CreateMovieLib{ base_name = "figure_boss_belial",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial1",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 2, 
		kDrwAnimRun = 5.5, 
		kDrwAnimWar = 5.5
	},
	kGdJobStrike	 = { 
		kDrwAnimDefault = {
			"right", 
		}, 
		kDrwAnimLeft = {
			"left", 
		}, 
		mode = kDrwPlayStretched, sound = "battle_npc_belial_attack"
	},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_belial_die"},
	kGdJobCriticalHit = {{"hit1", "hit2", "hit3"}; sound = "battle_npc_belial_scream"},
}

-- Scorpionblade ----------------------------------------------------------------
Movies.figure_npc_scorpionblade = CreateMovieLib{ base_name = "figure_npc_scorpionblade",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial",
		kDrwAnimWar = "idlespecial",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_blade"
	},
	walkcycle = {
		kDrwAnimDefault = 2.5, 
		kDrwAnimRun = 4.0, 
		kDrwAnimWar = 4.0, 
	},
	kGdJobStrike	 = { 
		kDrwAnimDefault = {
			"tail", 
			"melee1", 
			"melee2" 
		}, 
		mode = kDrwPlayStretched, sound = "battle_npc_blade_attack"
	},
	kGdJobDie = {"die"; sound = "battle_npc_blade_die"},
	kGdJobCriticalHit = {"hit1","hit2","hit3"; sound = "battle_npc_blade_scream"},
}

-- Mantis (Gottesanbeterin) ----------------------------------------------------------------
Movies.figure_npc_mantis = CreateMovieLib{ base_name = "figure_npc_mantis",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial",
		kDrwAnimWar = "idlespecial",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1.0, 
		kDrwAnimRun = 2.7, 
		kDrwAnimWar = 2.7, 
	},
	kGdJobStrike	 = { 
		kDrwAnimDefault = {
			"right", 
			"special", 
		}, 
		kDrwAnimLeft = {
			"left", 
		}, 
		mode = kDrwPlayStretched, sound = "battle_npc_locust_attack"
	},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_locust_die"},
	kGdJobCriticalHit = {"hit1","hit2","hit3"; sound = "battle_npc_locust_scream"},
}

-- Boss Dryade ----------------------------------------------------------------
Movies.figure_boss_dryade = CreateMovieLib{ base_name = "figure_boss_dryade",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial",
		kDrwAnimWar = "idlespecial",
		kDrwAnimTalkIdle = "idle",
		kDrwAnimTalk = {
			"talkidle", 
			"talk1", 
			"talk2", 
			"talk3", 
		},
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "run", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1.0, 
		kDrwAnimRun = 2.7, 
		kDrwAnimWar = 2.7,
	},
	kGdJobCast = {"cast"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_boss_dryade_die"},
	kGdJobCriticalHit = {"hit1","hit2","hit3"; sound = "battle_boss_dryade_scream"},
}

-- Giant Ape (Lemure) ----------------------------------------------------------------
Movies.figure_npc_giantape = CreateMovieLib{ base_name = "figure_npc_giantape",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial",
		kDrwAnimWar = "idlespecial",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault =  0.8, 
		kDrwAnimRun = 2.8, 
		kDrwAnimWar = 2.8, 
	},
	kGdJobStrike	 = { 
		kDrwAnimDefault = {
			"right", 
		}, 
		kDrwAnimLeft = {
			"left", 
		}, 
		mode = kDrwPlayStretched, sound = "battle_npc_magicape_attack"
	},
	kGdJobHitTargetRange1 = {
		"throw_aim";
		mode = kDrwPlayStretched
		},
	kGdJobHitTargetRange2 = {
		"throw_shoot";
		mode = kDrwPlayStretched
		},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_magicape_die"},
	kGdJobCriticalHit = {"hit1","hit2","hit3"; sound = "battle_npc_magicape_scream"},
}

-- Reptileman ----------------------------------------------------------------
Movies.figure_npc_reptileman = CreateMovieLib{ base_name = "figure_npc_reptileman",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial",
		kDrwAnimWar = "idlespecial",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 1.6, 
		kDrwAnimRun = 3.5, 
		kDrwAnimWar = 3.5, 
	},
	kGdJobStrike	 = { 
		kDrwAnimDefault = {
			"right", 
		}, 
		kDrwAnimLeft = {
			"left", 
		}, 
		mode = kDrwPlayStretched, sound = "battle_npc_lizardman_attack"
	},
	kGdJobHitTargetRange1 = {
		"attack_blowtube1";
		mode = kDrwPlayStretched
		},
	kGdJobHitTargetRange2 = {
		"attack_blowtube2";
		mode = kDrwPlayStretched
		},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_lizardman_die"},
	kGdJobCriticalHit = {"hit1","hit2","hit3"; sound = "battle_npc_lizardman_scream"},
}

-- Undead Saurian ----------------------------------------------------------------
Movies.figure_npc_saurian_undead = CreateMovieLib{ base_name = "figure_npc_saurian_undead",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial",
		kDrwAnimWar = "idlespecial",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 2.5, 
		kDrwAnimRun = 3.8, 
		kDrwAnimWar = 3.8, 
	},
	kGdJobStrike	 = { 
		kDrwAnimDefault = {
			"1", 
			"2" 
		}, 
		mode = kDrwPlayStretched, sound = "battle_npc_fireangel_attack"
	},
	kGdJobCast = {"attack2"; mode = kDrwPlayStretched},
	kGdJobDie = {"die"; sound = "battle_npc_fireangel_die"},
	kGdJobCriticalHit = {"hit1","hit2","hit3"; sound = "battle_npc_fireangel_scream"},
}

-- Boss Rohan on Saurian ----------------------------------------------------------------
Movies.figure_boss_rohan_on_saurian_undead = CreateMovieLib{ base_name = "figure_boss_rohan_on_saurian_undead",
	kGdJobDefault = {"idle"; mode = kDrwPlayLooped},
	kGdJobGroupNothing = {
		kDrwAnimDefault = "idle", 
		kDrwAnimSpecial1 = "idlespecial",
		kDrwAnimWar = "idlespecial",
		mode = kDrwPlayLooped
	},
	kGdJobGroupWalk = {
		kDrwAnimDefault = "walk", 
		kDrwAnimRun = "run", 
		kDrwAnimWar = "runwar", 
		mode = kDrwPlayLooped, 
		sound = "step_normal"
	},
	walkcycle = {
		kDrwAnimDefault = 2.5, 
		kDrwAnimRun = 3.8, 
		kDrwAnimWar = 3.8, 
	},
	kGdJobStrike	 = { 
		kDrwAnimDefault = {
			"1", 
			"2" 
		}, 
		mode = kDrwPlayStretched, sound = "battle_npc_bonecrusher_attack"
	},
	kGdJobCast = {"castdamage"; mode = kDrwPlayStretched},
	kGdJobCastResolve = {"resolveenemy","resolveenemy"},
	kGdJobDie = {"die"; sound = "battle_npc_bonecrusher_die"},
	kGdJobCriticalHit = {"hit1","hit2","hit3"; sound = "battle_npc_bonecrusher_scream"},
}

--------------------------------------------------------
-- und nun die meshes aus der Datenbank:
--------------------------------------------------------

function QuickRegister(id,name,anim)
	if not FindMesh(name) then return end

	local std_anim = "_idle" -- automatisch nach idle-anim gucken
	local anim2
	local pLib
	if FindBones(name) then
		if not anim and FindAnim(name..std_anim) then
			anim = name..std_anim
		end
		if anim then
			pLib = CDrwMovieLibrary:new()
			local pMovie = pLib:AddNewMovie(0)
			local pEffect = pMovie:AddAnimation(anim..".boa")
			pEffect:SetRangeAndModes(0, 1, kDrwPlayLooped)
			if FindAnim(gsub(anim,"idle","walk")) then
				anim2 = gsub(anim,"idle","walk")
				local pMovie = pLib:AddNewMovie(kGdJobGroupWalk)
				local pEffect = pMovie:AddAnimation(anim2..".boa")
				pEffect:SetRangeAndModes(0, 1, kDrwPlayLooped)
			end
		end
	end
	local pObject
	if pLib then
		local shadowsize = GetShadowSize(name)
		local pObject = ObjectLibrary:AddNewFigure(0, id, name..".msh", pLib, shadowsize);
		pObject:SetSelectSize(shadowsize)
		print("REDUCED ANIMATION", id, name, anim, anim2)
	else -- ohne anims - immer noch besser besser als glowing mesh...
		pObject = ObjectLibrary:CreateNewObject(kGtCategoryObject)
		local pElement = pObject:ElementMesh(name..".msh")
		ObjectLibrary:AddObject(pObject, kGtCategoryFigure, id)
		print("ANIMATION MISSING COMPLETELY", id, name)
	end
end

local dictanim = 
{
	figure_npc_gargoyle_normal = "figure_npc_gargoyle_idle",
	figure_animal_buffalo_normal = "figure_animal_buffalo_idle",
	figure_animal_wolf_ = "figure_animal_wolf_idle",
	figure_boss_demon = "figure_boss_demon_fear",
	figure_npc_beastman = "figure_npc_beastman_idle",
	figure_npc_demon_lesser = "figure_npc_demon_lesser_idle",
	figure_npc_gargoyle_stone = "figure_npc_gargoyle_idle",
	figure_npc_giant_ = "figure_npc_giant_idle",
	figure_npc_minotaur_greater = "figure_npc_minotaur_greater_idle",
	figure_npc_minotaur_lesser = "figure_npc_minotaur_lesser_idle",
	figure_npc_ogre_greater = "figure_npc_ogre_idle",
	figure_npc_ogre_normal = "figure_npc_ogre_idle",
	figure_npc_spectre_normal = "figure_npc_spectre_idle",
	figure_npc_wraith_normal = "figure_npc_wraith_idle",
	figure_npc_zombie_normal_ = "figure_npc_zombie_idle",
}

function GetAnim(mesh)
	local anim
	repeat
		anim = %dictanim[mesh]
		if anim then 
			return anim 
		end
		mesh = strsub(mesh,1,-2)
	until strlen(mesh) <= 0
end
	
local sql_items = doscript("sql_item")

for i,v in sql_items do
	v.mesh = {}
	if v.meshmalecold ~= "<undefined>" then	v.mesh.male = v.meshmalecold end
	if v.meshfemalecold ~= "<undefined>" then v.mesh.female = v.meshfemalecold end

	if v.mesh.male and (strfind(v.mesh.male,"^figure_") or v.mesh.male =="wing_test") then

		if registered[i] then
			-- print(i, v.mesh.male, "already registered")
		else
			if strfind(v.mesh.male, "^figure_hero") then
				v.animset = "figure_hero_male"
			end

			if (v.animset and Movies[v.animset]) then
				v.id = i
				v.movielib = Movies[v.animset]
				if (v.cat == 1) then
					if (v.subcat == 2) then v.additionalskins = 2  end		-- chest item, add head and legs
					if (v.subcat == 10) then v.additionalskins = 1  end		-- robe item, add head only
					
					if v.additionalskins and v.additionalskins > 1 then
						assert(strfind(v.mesh.male, "^figure_hero"), "Subcat for for heros only, id " ..  i)
					end

					if (v.subcat == 13) then
						v.mesh.cold2 = 	v.mesh.male.."_cold2"
						v.mesh.warm = 	v.mesh.male.."_warm"
						v.mesh.warm2 = 	v.mesh.male.."_warm2"
						v.mesh.male = 	v.mesh.male.."_cold"
					end
				end

				Register(v)
			else
				QuickRegister(i,v.mesh.male,GetAnim(v.mesh.male))
    			registered[i] = v.mesh.male
			end
		end
	end
end


-- "nackt-defaults"
Register{id = 0, mesh = {male = "figure_hero_male_chest_naked", female = "figure_hero_female_chest_naked"}, animset = "figure_hero_male", additionalskins = 2}
Register{id = 30, mesh = {male = "figure_hero_male_legs_naked", female = "figure_hero_female_legs_naked"}, animset = "figure_hero_male"}


-- heads
local sql_heads = doscript("sql_head")
for i,v in sql_heads do
	v.id = i
	v.animset = "figure_hero_male"
	v.mesh = {}
	
	if (v.meshmale ~= "<undefined>") then v.mesh.male =  v.meshmale end
	if (v.meshfemale ~= "<undefined>") then v.mesh.female = v.meshfemale end
	v.head = 1

	Register(v)
end


-- Zur Info hier alle Waffentypen
--	kDrwWtDefault
--	kDrwWtHand
--	kDrwWt1HDagger
--	kDrwWt1HSword
--	kDrwWt1HAxe	
--	kDrwWt1HMaceSpiky
--	kDrwWt1HMaceBlunt
--	kDrwWt1HHammer
--	kDrwWt1HStaff
--	kDrwWt2HSword
--	kDrwWt2HAxe
--	kDrwWt2HMace
--	kDrwWt2HHammer
--	kDrwWt2HStaff
--	kDrwWt2HSpear
--	kDrwWt2HHalberd
--	kDrwWt2HBow
--	kDrwWt2HCrossbow
