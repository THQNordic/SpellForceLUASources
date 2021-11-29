-- this file contains all sounds used in Drw (for example in effects or animations)

print("-- INITIALIZING SOUNDS   DrwSound.lua")


local Data = {

-- Env

	water = 
	{ 
		File = {"atmo_water_loop_01", "atmo_water_loop_02", "atmo_water_loop_03"},
		Volume=0.6, 
		FallOffMin=2,
		FallOffMax=25, 
		Length = 3.0,
		Atmo = 1,
	},
	
	
	swamp = 
	{ 
		File = {"atmo_swamp_loop_01", "atmo_swamp_loop_02", "atmo_swamp_loop_03"},
		Volume=0.7, 
		FallOffMin=2,
		FallOffMax=25, 
		Length = 6.0,
		Atmo = 1,
	},
	
	lava = 
	{ 
		File = {"atmo_lava_loop_01", "atmo_lava_loop_02", "atmo_lava_loop_03"},
		Volume=0.7, 
		FallOffMin=2,
		FallOffMax=25, 
		Length = 6.0,
		Atmo = 1,
	},
	
-- Object

	object_torch = {File = {"object_torch_loop_01"}, Volume=0.5, FallOffMin=1, FallOffMax=10},
	object_house_burn = {File = {"destroy_house_burn_02"}, Volume=0.8, FallOffMin=4, FallOffMax=60},
	object_campfire = {File = {"object_campfire_loop_01"}, Volume=0.6, FallOffMin=1, FallOffMax=10},
	object_obelisk = {File = {"object_obelisk_loop"}, Volume=0.5, FallOffMin=1, FallOffMax=20},
	object_monument_on = {File = {"dummy_silence"}, Volume=0.7, FallOffMin=4, FallOffMax=60},
	object_bindstone_on = {File = {"object_bindstone_on"}, Volume=0.5, FallOffMin=1, FallOffMax=15},
	object_bindstone_return = {File = {"dummy_silence", "dummy_silence"}, Volume=0.7, FallOffMin=4, FallOffMax=60},
	object_house_destroy = {File = {"destroy_house_03"}, Volume=0.8, FallOffMin=4, FallOffMax=60},
	object_torch_off = {File = {"object_torch_off"}, Volume=0.5, FallOffMin=1, FallOffMax=10},
	object_portal_wood = {File = {"object_portal_wood"}, Volume=0.8, FallOffMin=5, FallOffMax=30},
	object_portal_stone = {File = {"object_portal_stone"}, Volume=0.8, FallOffMin=5, FallOffMax=30},
	object_empyria_crowd01 = {File = {"object_empyria_crowd_1"}, Volume=1.0, FallOffMin=50, FallOffMax=6000},
	object_empyria_crowd02 = {File = {"object_empyria_crowd_2"}, Volume=1.0, FallOffMin=50, FallOffMax=6000},
	object_colosseum_cheers = {File = {"object_colosseum_cheers3"}, Volume=3 , FallOffMin=3000, FallOffMax=4000},
		
-- Dummies
	
	dummy_silence = {File = "dummy_silence", },

-- Spells:

-- CASTS
	
	spell_cast = {File = "spell_cast_fire",  Length = 100, },
	spell_cast_black = {File = "spell_cast_black", Length = 100, },
	spell_cast_fire = {File = "spell_cast_fire", Length = 100, },
	spell_cast_white = {File = "spell_cast_white", Volume=0.8, Length = 100, },
	spell_cast_illuminate = {File = "spell_cast_fire", Length = 100, },
	spell_cast_mental = {File = "spell_cast_mental", Length = 100, },
	spell_cast_healing = {File = "spell_cast_white", Volume=0.8, Length = 100, },
	spell_cast_ice = {File = "spell_cast_ice", Length = 100, },
	spell_cast_earth = {File = "spell_cast_earth", Length = 100, },
	spell_cast_air = {File = "spell_cast_air", Length = 100, },

-- RESOLVES

	spell_resolve_extincttower = {File = "spell_resolve_extincttower", },
	spell_resolve = {File = "spell_resolve_fire", },
	spell_resolve_white = {File = "spell_resolve_white", },
	spell_resolve_black = {File = "spell_resolve_black", },
	spell_resolve_ice = {File = "spell_resolve_ice", },
	spell_resolve_fire = {File = "spell_resolve_fire", Volume=1.0},
	spell_resolve_white_healing = {File = "spell_resolve_white", },
	spell_resolve_mental = {File = "spell_dummy_silence", },
	spell_resolve_earth = {File = "spell_resolve_earth", },
	spell_resolve_air = {File = "spell_resolve_air", },

-- HITS
	spell_hit_firerain = {File = {"spell_hit_firerain_01", "spell_hit_firerain_02", "spell_hit_firerain_03"}},
	spell_hit_icetower = {File = {"object_icetower_shot_01", "object_icetower_shot_02", "object_icetower_shot_03"}},
	spell_hit_firetower = {File = {"object_firetower_shot_01", "object_firetower_shot_02", "object_firetower_shot_03"}},
	spell_hit_explosion = {File = "spell_hit_explosion", Volume=1},
	spell_hit = {File = "spell_hit_fireball", Volume=1},
	spell_hit_puff = {File = "spell_hit_puff", Volume=1},
	spell_spawn_destroyed = {File = "spell_spawn_destroyed", Volume=1},
	spell_hit_elektro = {File = "spell_hit_elektro", Volume=1},
	spell_hit_default_black = {File = "spell_hit_default_black", },
	spell_hit_arrow = {File = "spell_dummy_silence", },
	spell_hit_fireburst = {File = "spell_hit_fireburst", },
	spell_hit_iceburst = {File = "spell_hit_iceburst", },
	spell_hit_poison = {File = "spell_dummy_silence", },
	spell_hit_healing = {File = "spell_hit_healing", Volume=0.8},
	spell_hit_death = {File = "spell_hit_pain", },
	spell_hit_invulnerability = {File = "spell_dummy_silence", },
	spell_hit_berserk = {File = "spell_dummy_silence", },
	spell_hit_hypnotize = {File = "spell_hit_hypnotize", },
	spell_hit_pain = {File = "spell_hit_pain", },
	spell_hit_lifetap = {File = "spell_hit_lifetap", },
	spell_hit_areadecay = {File = "spell_hit_petrify", },
	spell_hit_decay = {File = "spell_hit_petrify", },
	spell_hit_fireball = {File = "spell_hit_fireball", Volume=1},
	spell_hit_illuminate = {File = "spell_hit_illuminate", },
	spell_hit_freeze = {File = "spell_hit_freeze", },
	spell_hit_fireshield = {File = "spell_hit_fireshield",},
	spell_hit_iceshield = {File = "spell_hit_iceshield", },
	spell_hit_fog = {File = "spell_hit_fog", },
	spell_hit_remediless = {File = "spell_hit_remediless", },
	spell_hit_pestilence = {File = "spell_hit_pestilence", },
	spell_hit_inflexibility = {File = "spell_hit_inflexibility", },
	spell_hit_slowness = {File = "spell_hit_slowness", },
	spell_hit_weaken = {File = "spell_hit_weaken", },
	spell_hit_quickness = {File = "spell_hit_quickness", },
	spell_hit_flexibility = {File = "spell_hit_flexibility", },
	spell_hit_strengthen = {File = "spell_hit_strengthen", },
	spell_hit_petrify = {File = "spell_hit_petrify", },
	spell_hit_guard = {File = "spell_hit_guard", },
	spell_hit_regenerate = {File = "spell_hit_regenerate", },
	spell_hit_curepoison = {File = "spell_hit_regenerate", },
	spell_hit_decayarea = {File = "spell_hit_petrify", },
	spell_hit_summongoblin = {File = "spell_hit_summon_goblin", },
	spell_hit_iceshieldstun = {File = "spell_hit_iceshield", },
	spell_hit_curedisease = {File = "spell_hit_cure_disease", },
	spell_hit_stone = {File = "spell_hit_stone", },
	spell_hit_painarea = {File = "spell_hit_pain", },
	spell_hit_summonskeleton = {File = "spell_summon", },
	spell_hit_summondemon = {File = "spell_hit_summon_demon", },
	spell_hit_deathgrasp = {File = "spell_dummy_silence", },
	spell_hit_darkbanishing = {File = "spell_hit_darkbanishing", },
	spell_hit_slownessarea = {File = "spell_hit_slowness", },
	spell_hit_inflexibilityarea = {File = "spell_hit_inflexibility", },
	spell_hit_weakenarea = {File = "spell_hit_weaken", },
	spell_hit_plaguearea = {File = "spell_hit_pestilence", },
	spell_hit_darkmight = {File = "spell_hit_darkbanishing", },
	spell_hit_healingarea = {File = "spell_hit_healing", },
	spell_hit_quicknessArea = {File = "spell_hit_quickness", },
	spell_hit_flexibilityArea = {File = "spell_hit_flexibility", },
	spell_hit_strengthenArea = {File = "spell_hit_strengthen", },
	spell_hit_removeCurse = {File = "spell_hit_guard", },
	spell_hit_holymight = {File = "spell_hit_regenerate", },
	spell_hit_hallow = {File = "spell_hit_guard", },
	spell_hit_castcreo = {File = "spell_dummy_silence", },
	spell_hit_forget = {File = "spell_hit_hypnotize", },
	spell_hit_manatap = {File = "spell_hit_flexibility", },
	spell_hit_manadrain = {File = "spell_hit_quickness", },
	spell_hit_shock = {File = "spell_hit_weaken", },
	spell_hit_fear = {File = "spell_hit_pain", },
	spell_hit_rainoffire = {File = "spell_hit_fireball", },
	spell_hit_blizzard = {File = "spell_hit_iceburst", },
	spell_hit_acidcloud = {File = "spell_hit_fog", },
	spell_hit_stonerain = {File = "spell_hit_fireball", },
 	spell_hit_rockbullet = {File = "spell_hit_stone", },
 	
-- Add On 1 Hits

	spell_hit_fireresistance = {File = "spell_hit_fireresistance", },
	spell_hit_mentalessence = {File = "spell_hit_mentalessence", },
	spell_hit_spanghost = {File = "spell_hit_spanghost", },
	spell_hit_whiteessence = {File = "spell_hit_whiteessence", },
	spell_hit_whitealmightiness = {File = "spell_hit_whitealmightiness", },
	
-- Add On 1 Misc

	spell_dragonicebreath = {File = "spell_dragonicebreath", },
	spell_arrow_amok = {File = "spell_arrow_amok", },		
	
-- DOTS

	spell_dot = {File = "spell_dummy_silence",},
	-- spell_dot_illuminate = {File = "spell_dummy_silence",},
	-- spell_dot_hypnotize = {File = "spell_dummy_silence",},
	-- spell_dot_fireburst = {File = "spell_dummy_silence",},
	-- spell_dot_iceburst = {File = "spell_dummy_silence",},
	-- spell_dot_fireball = {File = "spell_dummy_silence",},
	-- spell_dot_poison = {File = "spell_dummy_silence",},

-- SUMMONS

	spell_summon_worker = {File = "ui_summon_worker",},
	spell_summon_hero = {File = "ui_summon_hero",},
	spell_summon = {File = "spell_summon",},
	spell_teleport = {File = "world_enter_portal",},

-- RESISTS

	spell_resist = {File = "spell_resist",},

-- SILENCE
	spell_silence = {File = "spell_dummy_silence", },

-- AURAS

	spell_hit_aura_white = {File = "spell_hit_aura_white", },
	spell_hit_aura_black = {File = "spell_hit_aura_black", },
	spell_hit_aura_mental = {File = "spell_hit_aura_mental", },
	
-- Melee 

	spell_melee_heal = {File = "spell_melee_heal", },
	spell_melee_berserk = {File = "spell_melee_berserk", },
	spell_melee_magicprotect = {File = "spell_magicprotect", },
	spell_melee_damageprotect = {File = "spell_melee_damageprotect", },

-- Walk:
	
	walk = {File = {"step_normal_01", "step_normal_02", "step_normal_03", "step_normal_04"}, Volume=0.9, FallOffMin=15, FallOffMax=200},
	step_normal = {File = {"step_normal_01", "step_normal_02", "step_normal_03", "step_normal_04"}, Volume=0.7, FallOffMin=4, FallOffMax=60},
	step_troll = {File = {"step_normal_01", "step_normal_02", "step_normal_03", "step_normal_04"}, Volume=0.7, FallOffMin=4, FallOffMax=60},
	step_talon = {File = {"step_talon_01", "step_talon_02", "step_talon_03", "step_talon_04"}, Volume=0.7, FallOffMin=5, FallOffMax=70},
	step_titan = {File = {"step_titan_01", "step_titan_02", "step_titan_03", "step_titan_04"}, Volume=1, FallOffMin=5, FallOffMax=150},
	step_blade = {File = {"step_blade_01", "step_blade_02", "step_blade_03", "step_blade_04"}, Volume=0.7, FallOffMin=5, FallOffMax=60},
	wings_zhuul = {File = {"object_zuuhl_wing_01", "object_zuuhl_wing_02", "object_zuuhl_wing_03"}, Volume=0.8, FallOffMin=10, FallOffMax=60},
	
	
-- Battle Figure Hit Sounds (Screams)
		
-- Mainchar Scream

	battle_char_m_scream = {File = {"battle_char_m_hit_01", "battle_char_m_hit_02", "battle_char_m_hit_03", "battle_char_m_hit_04", "battle_char_m_hit_05", "battle_char_m_hit_06"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_char_f_scream = {File = {"battle_char_f_hit_01", "battle_char_f_hit_02", "battle_char_f_hit_03", "battle_char_f_hit_04", "battle_char_f_hit_05", "battle_char_f_hit_06"}, Volume=1, FallOffMin=10, FallOffMax=90},

-- Hero Scream

	battle_hero_m_scream = {File = {"battle_hero01_m_hit_01", "battle_hero01_m_hit_02", "battle_hero01_m_hit_03", "battle_hero01_m_hit_04", "battle_hero02_m_hit_01", "battle_hero02_m_hit_02", "battle_hero02_m_hit_03", "battle_hero02_m_hit_04", "battle_hero03_m_hit_01", "battle_hero03_m_hit_02", "battle_hero03_m_hit_03", "battle_hero03_m_hit_04", "battle_hero04_m_hit_01", "battle_hero04_m_hit_02", "battle_hero04_m_hit_03", "battle_hero04_m_hit_04", "battle_hero05_m_hit_01", "battle_hero05_m_hit_02", "battle_hero05_m_hit_03", "battle_hero05_m_hit_04"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_hero_f_scream = {File = {"battle_hero01_f_hit_01", "battle_hero01_f_hit_02", "battle_hero01_f_hit_03", "battle_hero01_f_hit_04", "battle_hero02_f_hit_01", "battle_hero02_f_hit_02", "battle_hero02_f_hit_03", "battle_hero02_f_hit_04", "battle_hero03_f_hit_01", "battle_hero03_f_hit_02", "battle_hero03_f_hit_03", "battle_hero03_f_hit_04", "battle_hero04_f_hit_01", "battle_hero04_f_hit_02", "battle_hero04_f_hit_03", "battle_hero04_f_hit_04", "battle_hero05_f_hit_01", "battle_hero05_f_hit_02", "battle_hero05_f_hit_03", "battle_hero05_f_hit_04"}, Volume=1, FallOffMin=10, FallOffMax=90},	
		
-- Race Scream

	battle_race_elf_scream = {File = {"battle_elfworker_hit_01", "battle_elfworker_hit_02", "battle_elffighter_hit_01", "battle_elffighter_hit_02", "battle_elffighter_hit_03", "battle_elffighter_hit_04",}, Volume=1, FallOffMin=10,FallOffMax=90},
	battle_race_human_scream = {File = {"battle_humanworker_hit_01", "battle_humanworker_hit_02", "battle_humanfighter_hit_01", "battle_humanfighter_hit_02", "battle_humanfighter_hit_03", "battle_humanfighter_hit_04",}, Volume=1, FallOffMin=10,FallOffMax=90},
	battle_race_orc_scream = {File = {"battle_orcworker_hit_01", "battle_orcworker_hit_02", "battle_orcfighter_hit_01", "battle_orcfighter_hit_02", "battle_orcfighter_hit_03", "battle_orcfighter_hit_04",}, Volume=1, FallOffMin=10,FallOffMax=90},
	battle_race_dwarf_scream = {File = {"battle_dwarfworker_hit_01", "battle_dwarfworker_hit_02", "battle_dwarffighter_hit_01", "battle_dwarffighter_hit_02", "battle_dwarffighter_hit_03", "battle_dwarffighter_hit_04",}, Volume=1, FallOffMin=10,FallOffMax=90},
	battle_race_darkelf_scream = {File = {"battle_darkelfworker_hit_01", "battle_darkelfworker_hit_02", "battle_darkfighter_hit_01", "battle_darkfighter_hit_02", "battle_darkfighter_hit_03", "battle_darkfighter_hit_04",}, Volume=1, FallOffMin=10,FallOffMax=90},
	battle_race_troll_scream = {File = {"battle_trollworker_hit_01", "battle_trollworker_hit_02", "battle_trollfighter_hit_01", "battle_trollfighter_hit_02", "battle_trollfighter_hit_03", "battle_trollfighter_hit_04",}, Volume=1, FallOffMin=10,FallOffMax=90},

-- NPC Scream

	battle_npc_wraith_scream = {File = {"battle_npc_wraith_hit_01", "battle_npc_wraith_hit_02", "battle_npc_wraith_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_goblin_scream = {File = {"battle_npc_goblin_hit_01", "battle_npc_goblin_hit_02", "battle_npc_goblin_hit_03", "battle_npc_goblin_hit_04"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_golem_scream = {File = {"battle_npc_golem_hit_01", "battle_npc_golem_hit_02", "battle_npc_golem_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_gargoyle_scream = {File = {"battle_npc_gargoyle_hit_01", "battle_npc_gargoyle_hit_02", "battle_npc_gargoyle_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_ghoul_scream = 	{File = {"battle_npc_ghoul_hit_01", "battle_npc_ghoul_hit_02", "battle_npc_ghoul_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_skeleton_scream = {File = {"battle_npc_skeleton_hit_01", "battle_npc_skeleton_hit_02", "battle_npc_skeleton_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_beastman_scream = {File = {"battle_npc_beastman_hit_01", "battle_npc_beastman_hit_02", "battle_npc_beastman_hit_03", "battle_npc_beastman_hit_04"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_demon_scream = {File = {"battle_npc_demon_hit_01", "battle_npc_demon_hit_02", "battle_npc_demon_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_demonboss_scream = {File = {"battle_npc_demonboss_hit_01", "battle_npc_demonboss_hit_02", "battle_npc_demonboss_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_wolf_scream = {File = {"battle_npc_wolf_hit_01", "battle_npc_wolf_hit_02", "battle_npc_wolf_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_medusa_scream = {File = {"battle_npc_medusa_hit_01", "battle_npc_medusa_hit_02", "battle_npc_medusa_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_wildboar_scream = {File = {"battle_npc_boar_hit_01", "battle_npc_boar_hit_02"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_cattle_scream = {File = {"battle_npc_cattle_hit_01", "battle_npc_cattle_hit_02"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_manticore_scream = {File = {"battle_npc_manticore_hit_01", "battle_npc_manticore_hit_02", "battle_npc_manticore_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_giant_scream = {File = {"battle_npc_giant_hit_01", "battle_npc_giant_hit_02", "battle_npc_giant_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_ogre_scream = {File = {"battle_npc_ogre_hit_01", "battle_npc_ogre_hit_02", "battle_npc_ogre_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_dragon_scream = {File = {"battle_npc_dragon_hit_01", "battle_npc_dragon_hit_02", "battle_npc_dragon_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_dragonboss_scream = {File = {"battle_npc_dragonboss_hit_01", "battle_npc_dragonboss_hit_02", "battle_npc_dragonboss_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_giantspider_scream = {File = {"battle_npc_spider_hit_01", "battle_npc_spider_hit_02", "battle_npc_spider_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_giantbeetle_scream = {File = {"battle_npc_bug_hit_01", "battle_npc_bug_hit_02", "battle_npc_bug_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_zombie_scream = {File = {"battle_npc_zombie_hit_01", "battle_npc_zombie_hit_02", "battle_npc_zombie_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_spectre_scream = {File = {"battle_npc_spectre_hit_01", "battle_npc_spectre_hit_02", "battle_npc_spectre_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_minotaur_scream = {File = {"battle_npc_minotaur_hit_01", "battle_npc_minotaur_hit_02", "battle_npc_minotaur_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_basilisk_scream = {File = {"battle_npc_basilisk_hit_01", "battle_npc_basilisk_hit_02", "battle_npc_basilisk_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_succubus_scream = {File = {"battle_npc_succubus_hit_01", "battle_npc_succubus_hit_02", "battle_npc_succubus_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_griffon_scream = {File = {"battle_npc_griffon_hit_01", "battle_npc_griffon_hit_02", "battle_npc_griffon_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_blade_scream = {File = {"battle_npc_blade_hit_01", "battle_npc_blade_hit_02", "battle_npc_blade_hit_03"}, Volume=1,  FallOffMin=15, FallOffMax=90},
	battle_npc_rabbit_scream = {File = {"dummy_silence"}, Volume=1,  FallOffMin=10, FallOffMax=90},
	battle_npc_bear_scream = {File = {"battle_npc_bear_hit_01", "battle_npc_bear_hit_02", "battle_npc_bear_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_buffalo_scream = {File = {"dummy_silence"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_npc_deer_scream = {File = {"dummy_silence"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_npc_moose_scream = {File = {"dummy_silence"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_npc_elemental_scream = {File = {"battle_npc_elemental_hit_01", "battle_npc_elemental_hit_02", "battle_npc_elemental_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_bonecrusher_scream = {File = {"battle_npc_bonecrusher_hit_01", "battle_npc_bonecrusher_hit_02", "battle_npc_bonecrusher_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_gargoyle_scream = {File = {"battle_npc_gargoyle_hit_01", "battle_npc_gargoyle_hit_02", "battle_npc_gargoyle_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	
	
-- SF ADD ON 1
	
	battle_npc_aryn_scream = {File = {"battle_npc_aryn_hit_01", "battle_npc_aryn_hit_02", "battle_npc_aryn_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_drakeling_scream = {File = {"battle_npc_drakeling_hit_01", "battle_npc_drakeling_hit_02", "battle_npc_drakeling_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_fireangel_scream = {File = {"battle_npc_fireangel_hit_01", "battle_npc_fireangel_hit_02", "battle_npc_fireangel_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_headless_scream = {File = {"battle_npc_headless_hit_01", "battle_npc_headless_hit_02", "battle_npc_headless_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_gianttoad_scream = {File = {"battle_npc_kroete_hit_01", "battle_npc_kroete_hit_02", "battle_npc_kroete_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_sabretooth_scream = {File = {"battle_npc_sabre_hit_01", "battle_npc_sabre_hit_02", "battle_npc_sabre_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	-- battle_npc_screamer_scream = {File = {"battle_npc_screamer_hit_01", "battle_npc_screamer_hit_02", "battle_npc_screamer_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_skerg_scream = {File = {"battle_npc_skerg_hit_01", "battle_npc_skerg_hit_02", "battle_npc_skerg_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_treeman_scream = {File = {"battle_npc_treeman_hit_01", "battle_npc_treeman_hit_02", "battle_npc_treeman_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_werewolf_scream = {File = {"battle_npc_werewolf_hit_01", "battle_npc_werewolf_hit_02", "battle_npc_werewolf_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_fial_scream = {File = {"battle_npc_fial_hit_01", "battle_npc_fial_hit_02", "battle_npc_fial_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},

-- Titan Scream:

	battle_titan_human_scream = {File = {"battle_titan_human_hit_01", "battle_titan_human_hit_02", "battle_titan_human_hit_03"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_titan_orc_scream = {File = {"battle_titan_orc_hit_01", "battle_titan_orc_hit_02", "battle_titan_orc_hit_03"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_titan_elf_scream = {File = {"battle_titan_elf_hit_01", "battle_titan_elf_hit_02", "battle_titan_elf_hit_03"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_titan_darkelf_scream = {File = {"battle_titan_darkelf_hit_01", "battle_titan_darkelf_hit_02", "battle_titan_darkelf_hit_03"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_titan_troll_scream = {File = {"battle_titan_troll_hit_01", "battle_titan_troll_hit_02", "battle_titan_troll_hit_03"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_titan_dwarf_scream = {File = {"battle_titan_dwarf_hit_01", "battle_titan_dwarf_hit_02", "battle_titan_dwarf_hit_03"}, Volume=1, FallOffMin=10, FallOffMax=90},

-- Mainchar Attack:

	battle_char_m_attack = {File = {"battle_char_m_att_01", "battle_char_m_att_02", "battle_char_m_att_03", "battle_char_m_att_04", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_char_f_attack = {File = {"battle_char_f_att_01", "battle_char_f_att_02", "battle_char_f_att_03", "battle_char_f_att_04", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence"}, Volume=1, FallOffMin=10, FallOffMax=90},

-- Hero Attack

	battle_hero_m_attack = {File = {"battle_hero01_m_att_01", "battle_hero01_m_att_02", "battle_hero02_m_att_01", "battle_hero02_m_att_02", "battle_hero03_m_att_01", "battle_hero03_m_att_02", "battle_hero04_m_att_01", "battle_hero04_m_att_02", "battle_hero05_m_att_01", "battle_hero05_m_att_02", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_hero_f_attack = {File = {"battle_hero01_f_att_01", "battle_hero01_f_att_02", "battle_hero02_f_att_01", "battle_hero02_f_att_02", "battle_hero03_f_att_01", "battle_hero03_f_att_02", "battle_hero04_f_att_01", "battle_hero04_f_att_02", "battle_hero05_f_att_01", "battle_hero05_f_att_02", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence"}, Volume=1, FallOffMin=10, FallOffMax=90},
	
-- Race Attack:
	
	battle_race_human_attack = {File = {"battle_humanworker_att_01", "battle_humanworker_att_02", "battle_humanfighter_att_01", "battle_humanfighter_att_02", "battle_humanfighter_att_03", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_race_orc_attack = {File = {"battle_orcworker_att_01", "battle_orcworker_att_02", "battle_orcfighter_att_01", "battle_orcfighter_att_02", "battle_orcfighter_att_03", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_race_elf_attack = {File = {"battle_elfworker_att_01", "battle_elfworker_att_02", "battle_elffighter_att_01", "battle_elffighter_att_02", "battle_elffighter_att_03", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_race_darkelf_attack = {File = {"battle_darkelfworker_att_01", "battle_darkelfworker_att_02", "battle_darkfighter_att_01", "battle_darkfighter_att_02", "battle_darkfighter_att_03", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_race_troll_attack = {File = {"battle_trollworker_att_01", "battle_trollworker_att_02", "battle_trollfighter_att_01", "battle_trollfighter_att_02", "battle_trollfighter_att_03", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_race_dwarf_attack = {File = {"battle_dwarfworker_att_01", "battle_dwarfworker_att_02", "battle_dwarffighter_att_01", "battle_dwarffighter_att_02", "battle_dwarffighter_att_03", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence", "dummy_silence"}, Volume=1, FallOffMin=10, FallOffMax=90},

-- NPC Attack:

	battle_npc_golem_attack = {File = {"battle_npc_golem_att_01", "battle_npc_golem_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_goblin_attack = {File = {"battle_npc_goblin_att_01", "battle_npc_goblin_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_skeleton_attack = {File = {"battle_npc_skeleton_att_01", "battle_npc_skeleton_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_medusa_attack = {File = {"battle_npc_medusa_att_01", "battle_npc_medusa_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_basilisk_attack = {File = {"battle_npc_basilisk_att_01", "battle_npc_basilisk_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_demonboss_attack = {File = {"battle_npc_demonboss_att_01", "battle_npc_demonboss_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_demon_attack = {File = {"battle_npc_demon_att_01", "battle_npc_demon_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_bear_attack = {File = {"battle_npc_bear_att_01", "battle_npc_bear_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_giant_attack = {File = {"battle_npc_giant_att_01", "battle_npc_giant_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_beastman_attack = {File = {"battle_npc_beastman_att_01", "battle_npc_beastman_att_02", "battle_npc_beastman_att_03", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_wolf_attack = {File = {"battle_npc_wolf_att_01", "battle_npc_wolf_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_zombie_attack = {File = {"battle_npc_zombie_att_01", "battle_npc_zombie_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_elemental_attack = {File = {"battle_npc_elemental_att_01", "battle_npc_elemental_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_griffon_attack = {File = {"battle_npc_griffon_att_01", "battle_npc_griffon_att_02", "battle_npc_griffon_att_03", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_giantspider_attack = {File = {"battle_npc_spider_att_01", "battle_npc_spider_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_wraith_attack = {File = {"battle_npc_wraith_att_01", "battle_npc_wraith_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_dragon_attack = {File = {"battle_npc_dragon_att_01", "battle_npc_dragon_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_dragonboss_attack = {File = {"battle_npc_dragonboss_att_01", "battle_npc_dragonboss_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_gargoyle_attack = {File = {"battle_npc_gargoyle_att_01", "battle_npc_gargoyle_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_ogre_attack = {File = {"battle_npc_ogre_att_01", "battle_npc_ogre_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_giantbeetle_attack = {File = {"battle_npc_bug_att_01", "battle_npc_bug_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_succubus_attack = {File = {"battle_npc_succubus_att_01", "battle_npc_succubus_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_spectre_attack = {File = {"battle_npc_spectre_att_01", "battle_npc_spectre_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_minotaur_attack = {File = {"battle_npc_minotaur_att_01", "battle_npc_minotaur_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_ghoul_attack = {File = {"battle_npc_ghoul_att_01", "battle_npc_ghoul_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_manticore_attack = {File = {"battle_npc_manticore_att_01", "battle_npc_manticore_att_02", "battle_npc_manticore_att_03", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_bonecrusher_attack = {File = {"battle_npc_bonecrusher_att_01", "battle_npc_bonecrusher_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_blade_attack = {File = {"battle_npc_blade_att_01", "battle_npc_blade_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },

-- SF ADD ON 1

	battle_npc_aryn_attack = {File = {"battle_npc_aryn_att_01", "battle_npc_aryn_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_drakeling_attack = {File = {"battle_npc_drakeling_att_01", "battle_npc_drakeling_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_fireangel_attack = {File = {"battle_npc_fireangel_att_01", "battle_npc_fireangel_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_headless_attack = {File = {"battle_npc_headless_att_01", "battle_npc_headless_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_gianttoad_attack = {File = {"battle_npc_kroete_att_01", "battle_npc_kroete_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_sabretooth_attack = {File = {"battle_npc_sabre_att_01", "battle_npc_sabre_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_screamer_attack = {File = {"battle_npc_screamer_hit_01", "battle_npc_screamer_hit_02", "battle_npc_screamer_hit_03", "battle_npc_screamer_att_01", "battle_npc_screamer_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_skerg_attack = {File = {"battle_npc_skerg_att_01", "battle_npc_skerg_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_treeman_attack = {File = {"battle_npc_treeman_att_01", "battle_npc_treeman_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_werewolf_attack = {File = {"battle_npc_werewolf_att_01", "battle_npc_werewolf_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_fial_attack = {File = {"battle_npc_fial_att_01", "battle_npc_fial_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },

-- Titan Attack:
	
	battle_titan_human_attack = {File = {"battle_titan_human_att_01", "battle_titan_human_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_titan_orc_attack = {File = {"battle_titan_orc_att_01", "battle_titan_orc_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_titan_elf_attack = {File = {"battle_titan_elf_att_01", "battle_titan_elf_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_titan_darkelf_attack = {File = {"battle_titan_darkelf_att_01", "battle_titan_darkelf_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_titan_troll_attack = {File = {"battle_titan_troll_att_01", "battle_titan_troll_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_titan_dwarf_attack = {File = {"battle_titan_dwarf_att_01", "battle_titan_dwarf_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },


-- Mainchar Die:

	battle_char_m_die = {File = {"battle_char_m_die_01, battle_char_m_die_02"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_char_f_die = {File = {"battle_char_f_die_01, battle_char_f_die_02"}, Volume=1, FallOffMin=15, FallOffMax=90},
	
-- Hero Die:

	battle_hero_m_die = {File = {"battle_hero01_m_die", "battle_hero02_m_die", "battle_hero03_m_die", "battle_hero04_m_die", "battle_hero05_m_die"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_hero_f_die = {File = {"battle_hero01_f_die", "battle_hero02_f_die", "battle_hero03_f_die", "battle_hero04_f_die", "battle_hero05_f_die"}, Volume=1, FallOffMin=15, FallOffMax=90},

-- Race Die:
	
	battle_race_human_die = {File = {"battle_humanworker_die", "battle_humanfighter_die"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_race_orc_die = {File = {"battle_orcworker_die", "battle_orcfighter_die"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_race_elf_die = {File = {"battle_elfworker_die", "battle_elffighter_die"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_race_darkelf_die = {File = {"battle_darkelfworker_die", "battle_darkfighter_die"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_race_troll_die = {File = {"battle_trollworker_die", "battle_trollfighter_die"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_race_dwarf_die = {File = {"battle_dwarfworker_die", "battle_dwarffighter_die"}, Volume=1, FallOffMin=15, FallOffMax=90},
	
-- NPC Die:	
	
	battle_npc_golem_die = {File = "battle_npc_golem_die", },
	battle_npc_goblin_die = {File = "battle_npc_goblin_die", },
	battle_npc_skeleton_die = {File = "battle_npc_skeleton_die", },
	battle_npc_medusa_die = {File = "battle_npc_medusa_die", },
	battle_npc_wildboar_die = {File = "battle_npc_boar_die", },
	battle_npc_basilisk_die = {File = "battle_npc_basilisk_die", },
	battle_npc_demonboss_die = {File = "battle_npc_demonboss_die", },
	battle_npc_demon_die = {File = "battle_npc_demon_die", },
	battle_npc_bear_die = {File = "battle_npc_bear_die", },
	battle_npc_giant_die = {File = "battle_npc_giant_die", },
	battle_npc_beastman_die = {File = "battle_npc_beastman_die", },
	battle_npc_wolf_die = {File = "battle_npc_wolf_die", },
	battle_npc_deer_die = {File = "battle_npc_deer_die", },
	battle_npc_zombie_die = {File = "battle_npc_zombie_die", },
	battle_npc_cattle_die = {File = "battle_npc_cattle_die", },
	battle_npc_elemental_die = {File = "battle_npc_elemental_die", },
	battle_npc_griffon_die = {File = "battle_npc_griffon_die", },
	battle_npc_giantspider_die = {File = "battle_npc_spider_die", },
	battle_npc_wraith_die = {File = "battle_npc_wraith_die", },
	battle_npc_dragon_die = {File = "battle_npc_dragon_die", },
	battle_npc_dragonboss_die = {File = "battle_npc_dragonboss_die", },
	battle_npc_gargoyle_die = {File = "battle_npc_gargoyle_die", },
	battle_npc_ogre_die = {File = "battle_npc_ogre_die", },
	battle_npc_giantbeetle_die = {File = "battle_npc_bug_die", },
	battle_npc_succubus_die = {File = "battle_npc_succubus_die", },
	battle_npc_spectre_die = {File = "battle_npc_spectre_die", },
	battle_npc_minotaur_die = {File = "battle_npc_minotaur_die", },
	battle_npc_ghoul_die = {File = "battle_npc_ghoul_die", },
	battle_npc_manticore_die = {File = "battle_npc_manticore_die", },
	battle_npc_bonecrusher_die = {File = "battle_npc_bonecrusher_die", },
	battle_npc_blade_die = {File = "battle_npc_blade_die", },
	battle_npc_deer_die = {File = "battle_npc_deer_die", },

-- SF ADD ON 1	
	
	battle_npc_aryn_die = {File = "battle_npc_aryn_die", },
	battle_npc_drakeling_die = {File = "battle_npc_drakeling_die", },
	battle_npc_fireangel_die = {File = "battle_npc_fireangel_die", },
	battle_npc_headless_die = {File = "battle_npc_headless_die", },
	battle_npc_gianttoad_die = {File = "battle_npc_kroete_die", },
	battle_npc_sabretooth_die = {File = "battle_npc_sabre_die", },
	battle_npc_screamer_die = {File = "battle_npc_screamer_die", },
	battle_npc_skerg_die = {File = "battle_npc_skerg_die", },
	battle_npc_treeman_die = {File = "battle_npc_treeman_die", },
	battle_npc_werewolf_die = {File = "battle_npc_werewolf_die", },
	battle_npc_fial_die = {File = "battle_npc_fial_die", },
	
-- Titan Die:
	
	battle_titan_human_die = {File = {"battle_titan_human_die"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_titan_orc_die = {File = {"battle_titan_orc_die"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_titan_elf_die = {File = {"battle_titan_elf_die"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_titan_darkelf_die = {File = {"battle_titan_darkelf_die"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_titan_troll_die = {File = {"battle_titan_troll_die"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_titan_dwarf_die = {File = {"battle_titan_dwarf_die"}, Volume=1, FallOffMin=15, FallOffMax=90},
	
-- Battle Special:

	battle_orcdrummer = {File = {"battle_orcdrummer"}, Volume=1, FallOffMin=10, FallOffMax=90},
	battle_orcblower = {File = {"battle_orcblower"}, Volume=1, FallOffMin=10, FallOffMax=90},
	
-- Idle Sounds:

	idle_npc_blademinion = {File = {"idle_npc_blademinion_01", "idle_npc_blademinion_02", "idle_npc_blademinion_03", "idle_npc_blademinion_04", "dummy_silence", "dummy_silence", "dummy_silence"}, Volume=0.4, FallOffMin=2, FallOffMax=40},
	idle_npc_bladeweaver = {File = {"idle_npc_bladeweaver_01", "idle_npc_bladeweaver_02", "idle_npc_bladeweaver_03", "idle_npc_bladeweaver_04", "dummy_silence", "dummy_silence", "dummy_silence"}, Volume=0.4, FallOffMin=2, FallOffMax=40},
	idle_npc_orcdrummer = {File = {"idle_npc_orcdrummer_01", "idle_npc_orcdrummer_02"}, },
	idle_npc_manticore = {File = {"idle_npc_manticore_01", "idle_npc_manticore_02", "dummy_silence", "dummy_silence", "dummy_silence"}, Volume=0.4, FallOffMin=2, FallOffMax=40},
	idle_npc_orcblower = {File = {"dummy_silence", "dummy_silence"}, },
	
-- ADD ON2

	battle_npc_belial_scream = {File = {"battle_npc_belial_hit_01", "battle_npc_belial_hit_02", "battle_npc_belial_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_colossus_scream = {File = {"battle_npc_colossus_hit_01", "battle_npc_colossus_hit_02", "battle_npc_colossus_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_dervish_scream = {File = {"battle_npc_dervish_hit_01", "battle_npc_dervish_hit_02", "battle_npc_dervish_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_lizardman_scream = {File = {"battle_npc_lizardman_hit_01", "battle_npc_lizardman_hit_02", "battle_npc_lizardman_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_locust_scream = {File = {"battle_npc_locust_hit_01", "battle_npc_locust_hit_02", "battle_npc_locust_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_magicape_scream = {File = {"battle_npc_magicape_hit_01", "battle_npc_magicape_hit_01", "battle_npc_magicape_hit_01"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_mummy_scream = {File = {"battle_npc_mummy_hit_01", "battle_npc_mummy_hit_02", "battle_npc_mummy_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_npc_muscleman_scream = {File = {"battle_npc_muscleman_hit_01", "battle_npc_muscleman_hit_02", "battle_npc_muscleman_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	
	battle_npc_belial_attack = {File = {"battle_npc_belial_att_01", "battle_npc_belial_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_colossus_attack = {File = {"battle_npc_colossus_att_01", "battle_npc_colossus_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_dervish_attack = {File = {"battle_npc_dervish_att_01", "battle_npc_dervish_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_lizardman_attack = {File = {"battle_npc_lizardman_att_01", "battle_npc_lizardman_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_locust_attack = {File = {"battle_npc_locust_att_01", "battle_npc_locust_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_magicape_attack = {File = {"battle_npc_magicape_att_01", "battle_npc_magicape_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_mummy_attack = {File = {"battle_npc_mummy_att_01", "battle_npc_mummy_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_npc_muscleman_attack = {File = {"battle_npc_muscleman_att_01", "battle_npc_muscleman_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },

	battle_npc_belial_die = {File = "battle_npc_belial_die", },
	battle_npc_colossus_die = {File = "battle_npc_colossus_die", },
	battle_npc_dervish_die = {File = "battle_npc_dervish_die", },
	battle_npc_lizardman_die = {File = "battle_npc_lizardman_die", },
	battle_npc_locust_die = {File = "battle_npc_locust_die", },
	battle_npc_magicape_die = {File = "battle_npc_magicape_die", },
	battle_npc_mummy_die = {File = "battle_npc_mummy_die", },
	battle_npc_muscleman_die = {File = "battle_npc_muscleman_die", },
	
	battle_darkelf_swarm_scream = {File = {"battle_swarm_darkelf_hit_01", "battle_swarm_darkelf_hit_02", "battle_swarm_darkelf_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_elf_swarm_scream = {File = {"battle_swarm_elf_hit_01", "battle_swarm_elf_hit_02", "battle_swarm_elf_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_human_swarm_scream = {File = {"battle_swarm_human_hit_01", "battle_swarm_human_hit_02", "battle_swarm_human_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_dwarf_swarm_scream = {File = {"battle_swarm_dwarf_hit_01", "battle_swarm_dwarf_hit_02", "battle_swarm_dwarf_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_troll_swarm_scream = {File = {"battle_swarm_troll_hit_01", "battle_swarm_troll_hit_02", "battle_swarm_troll_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	battle_orc_swarm_scream = {File = {"battle_swarm_orc_hit_01", "battle_swarm_orc_hit_02", "battle_swarm_orc_hit_03"}, Volume=1, FallOffMin=15, FallOffMax=90},
	
	battle_darkelf_swarm_attack = {File = {"battle_swarm_darkelf_att_01", "battle_swarm_darkelf_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_elf_swarm_attack = {File = {"battle_swarm_elf_att_01", "battle_swarm_elf_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_human_swarm_attack = {File = {"battle_swarm_human_att_01", "battle_swarm_human_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_dwarf_swarm_attack = {File = {"battle_swarm_dwarf_att_01", "battle_swarm_dwarf_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_troll_swarm_attack = {File = {"battle_swarm_troll_att_01", "battle_swarm_troll_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	battle_orc_swarm_attack = {File = {"battle_swarm_orc_att_01", "battle_swarm_orc_att_02", "dummy_silence", "dummy_silence", "dummy_silence"}, },
	
	battle_darkelf_swarm_die = {File = "battle_swarm_darkelf_die", },
	battle_elf_swarm_die = {File = "battle_swarm_elf_die", },
	battle_human_swarm_die = {File = "battle_swarm_human_die", },
	battle_dwarf_swarm_die = {File = "battle_swarm_dwarf_die", },
	battle_troll_swarm_die = {File = "battle_swarm_troll_die", },
	battle_orc_swarm_die = {File = "battle_swarm_orc_die", },

-- weapon sound HIT

	battle_hit_mouth = 
	{
	File = {"spell_dummy_silence"},
	Volume=0, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_hit_fist = 
	{
	File = {"battle_hit_hand_01", "battle_hit_hand_02", "battle_hit_hand_03", "battle_hit_hand_04", "battle_hit_hand_05"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_hit_1hdagger = 
	{
	File = {"battle_hit_1hsword_01", "battle_hit_1hsword_02", "battle_hit_1hsword_03", "battle_hit_1hdagger_01", "battle_hit_1hdagger_02", "battle_hit_1hdagger_03"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_hit_1hsword = 
	{
	File = {"battle_hit_1hsword_01", "battle_hit_1hsword_02", "battle_hit_1hsword_03", "battle_hit_1haxe_01", "battle_hit_1haxe_02", "battle_hit_1hdagger_03", "battle_hit_2hsword_01", "battle_hit_2hsword_02"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_hit_1haxe = 
	{
	File = {"battle_hit_1haxe_01", "battle_hit_1haxe_02", "battle_hit_1haxe_03", "battle_hit_2haxe_01", "battle_hit_2haxe_02", "battle_hit_1hmacespiky_03"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_hit_1hmacespiky = 
	{
	File = {"battle_hit_1hmacespiky_01", "battle_hit_1hmacespiky_02", "battle_hit_1hmacespiky_03", "battle_hit_2hhalberd_01", "battle_hit_2hhalberd_02", "battle_hit_2hhalberd_03"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_hit_1hmaceblunt = 
	{
	File = {"battle_hit_1hmaceblunt_01", "battle_hit_1hmaceblunt_02", "battle_hit_1hmaceblunt_03", "battle_hit_1hmacespiky_01", "battle_hit_1hmacespiky_02", "battle_hit_1hmacespiky_03"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_hit_1hhammer = 
	{
	File = {"battle_hit_1hhammer_01", "battle_hit_1hhammer_02", "battle_hit_1hhammer_03", "battle_hit_2haxe_01", "battle_hit_2hhalberd_01", "battle_hit_2hhalberd_02", "battle_hit_2hhalberd_03"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_hit_1hstaff = 
	{
	File = {"battle_hit_1hstaff_01", "battle_hit_1hstaff_02", "battle_hit_1hstaff_03", "battle_hit_2hstaff_01", "battle_hit_2hstaff_02", "battle_hit_2hstaff_03"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_hit_2hsword = 
	{
	File = {"battle_hit_2hsword_01", "battle_hit_2hsword_02", "battle_hit_2hsword_03", "battle_hit_1haxe_01", "battle_hit_1haxe_02", "battle_hit_1haxe_03", "battle_hit_1hsword_01", "battle_hit_1hsword_02", "battle_hit_1hsword_03"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_hit_2haxe = 
	{
	File = {"battle_hit_2haxe_01", "battle_hit_2haxe_02", "battle_hit_2haxe_03", "battle_hit_2hhalberd_01", "battle_hit_2hhalberd_02", "battle_hit_2hhalberd_03"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_hit_2hhammer = 
	{
	File = {"battle_hit_2hhammer_01", "battle_hit_2hhammer_02", "battle_hit_2hhammer_03", "battle_hit_1hhammer_01", "battle_hit_1hhammer_02", "battle_hit_1hhammer_03", "battle_hit_1hmacespiky_01", "battle_hit_1hmacespiky_02", "battle_hit_1hmacespiky_03"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_hit_2hstaff = 
	{
	File = {"battle_hit_2hstaff_01", "battle_hit_2hstaff_02", "battle_hit_2hstaff_03", "battle_hit_1hstaff_01", "battle_hit_1hstaff_02", "battle_hit_1hstaff_03"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_hit_2hspear = 
	{
	File = {"battle_hit_2hspear_01", "battle_hit_2hspear_02", "battle_hit_2hspear_03", "battle_hit_2haxe_01", "battle_hit_2haxe_02", "battle_hit_2haxe_03"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_hit_2hhalberd = 
	{
	File = {"battle_hit_2hhalberd_01", "battle_hit_2hhalberd_02", "battle_hit_2hhalberd_03", "battle_hit_2haxe_01", "battle_hit_2haxe_02", "battle_hit_2haxe_03"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_hit_2hbow = 
	{
	File = {"battle_hit_2hbow_01", "battle_hit_2hbow_02", "battle_hit_2hbow_03", "battle_hit_2hcrossbow_01", "battle_hit_2hcrossbow_02", "battle_hit_2hcrossbow_03"},
	Volume=0.7, 
	FallOffMin=5,
	FallOffMax=60, 
	},

	battle_hit_2hcrossbow = 
	{
	File = {"battle_hit_2hcrossbow_01", "battle_hit_2hcrossbow_02", "battle_hit_2hcrossbow_03", "battle_hit_2hbow_01", "battle_hit_2hbow_02", "battle_hit_2hbow_03"},
	Volume=0.7, 
	FallOffMin=5,
	FallOffMax=60, 
	},

	battle_hit_2hmace = 
	{
	File = {"battle_hit_2hmace_01", "battle_hit_2hmace_02", "battle_hit_2hmace_03", "battle_hit_2hhalberd_01", "battle_hit_2hhalberd_02", "battle_hit_2hhalberd_03", "battle_hit_2haxe_01", "battle_hit_2haxe_02", "battle_hit_2haxe_03"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_hit_claw = 
	{
	File = {"battle_hit_claw_01", "battle_hit_claw_02", "battle_hit_claw_03"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},
	
	battle_fire_arrow = 
	{
	File = {"battle_fire_arrow_01", "battle_fire_arrow_02"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	
-- weapon sound MISS

	battle_miss_mouth = 
	{
	File = {"spell_dummy_silence"},
	Volume=0, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_miss_fist = 
	{
	File = {"battle_weapon_miss_hammer"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},
	
	battle_miss_axe = 
	{
	File = {"battle_weapon_miss_axe"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_miss_hammer = 
	{
	File = {"battle_weapon_miss_hammer"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},

	battle_miss_staff = 
	{
	File = {"battle_weapon_miss_axe"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},
	battle_miss_sword = 
	{
	File = {"battle_weapon_miss_sword_01", "battle_weapon_miss_sword_02", "battle_weapon_miss_sword_03"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},
	
	battle_miss_bow = 
	{
	File = {"dummy_silence"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},
	
	battle_miss_claw = 
	{
	File = {"battle_weapon_miss_fist"},
	Volume=1, 
	FallOffMin=10,
	FallOffMax=90, 
	},



-- Landscape:

--landscape_crush_building
--landscape_tree_fall

-- Work:

	work_build = 
	{
	File = {"work_build_stone_01", "work_build_stone_02", "work_build_stone_03", "work_build_stone_04", "work_build_stone_05", "work_build_stone_06", "work_build_wood_01", "work_build_wood_02", "work_build_wood_03", "work_build_wood_04", "work_build_wood_05", "work_build_wood_06"},
	Volume=0.8, 
	FallOffMin=7,
	FallOffMax=150, 
	}, 

	work_cut_stone = 
	{
	File = {"work_cut_stone_mason_01", "work_cut_stone_mason_02", "work_cut_stone_worker_01", "work_cut_stone_worker_02"},
	Volume=0.9, 
	FallOffMin=7,
	FallOffMax=150, 
	Length=0.0,
	},

	work_cut_tree = 
	{
	File = {"work_cut_tree_cutter_01", "work_cut_tree_cutter_02", "work_cut_tree_cutter_03", "work_cut_tree_cutter_04", "work_cut_tree_worker_01", "work_cut_tree_worker_02"},
	Volume=0.7, 
	FallOffMin=7,
	FallOffMax=150, 
	Length=0.0,
	},
	
	work_get_ore = 
	{
	File = {"work_get_ore_01", "work_get_ore_02"},
	Volume=0.7, 
	FallOffMin=7,
	FallOffMax=150, 
	},

	
	work_get_bronze = 
	{
	File = {"work_get_bronze_01", "work_get_bronze_02"},
	Volume=0.7, 
	FallOffMin=7,
	FallOffMax=150, 
	},
	

	work_get_coal = 
	{
	File = {"work_get_coal_01", "work_get_coal_02"},
	Volume=0.7, 
	FallOffMin=7,
	FallOffMax=150, 
	},

	work_get_iron =
	{
	File = {"work_get_iron_01", "work_get_iron_02"},
	Volume=0.7, 
	FallOffMin=7,
	FallOffMax=150, 
	},
	
	work_johnthefisherman =
	{
	File = {"work_fisherman_01", "work_fisherman_02"},
	Volume=0.7, 
	FallOffMin=7,
	FallOffMax=60, 
	},
	
	work_get_food =
	{
	File = {"work_get_food_01", "work_get_food_02"},
	Volume=0.7, 
	FallOffMin=7,
	FallOffMax=150, 
	},
	
	work_smithhold =
	{
	File = {"work_smithhold"},
	Volume=0.7, 
	FallOffMin=7,
	FallOffMax=150, 
	},
	
	work_smithhammer =
	{
	File = {"work_smith"},
	Volume=0.8, 
	FallOffMin=7,
	FallOffMax=150, 
	},
	
	work_cattlebreeding =
	{
	File = {"work_cattlebreeding"},
	Volume=0.2, 
	FallOffMin=1,
	FallOffMax=30, 
	},
				
}

-- für die Events Treffer/Daneben im Kampf:
local BattleData = { 

	hits =
	{
		kDrwWtDefault = "battle_hit_fist",
		kDrwWtMouth = "battle_hit_mouth",
		kDrwWtHand = "battle_hit_fist",
		kDrwWt1HDagger = "battle_hit_1hdagger",
		kDrwWt1HSword = "battle_hit_1hsword",
		kDrwWt1HAxe = "battle_hit_1haxe",
		kDrwWt1HMaceSpiky = "battle_hit_1hmacespiky",
		kDrwWt1HMaceBlunt = "battle_hit_1hmaceblunt",
		kDrwWt1HHammer = "battle_hit_1hhammer",
		kDrwWt1HStaff = "battle_hit_1hstaff",
		kDrwWt2HSword = "battle_hit_2hsword",
		kDrwWt2HAxe = "battle_hit_2haxe",
		kDrwWt2HMace = "battle_hit_2hmace", 
		kDrwWt2HHammer = "battle_hit_2hhammer",
		kDrwWt2HStaff = "battle_hit_2hstaff",
		kDrwWt2HSpear = "battle_hit_2hspear",
		kDrwWt2HHalberd = "battle_hit_2hhalberd",
		kDrwWt2HBow = "battle_hit_2hbow",
		kDrwWt2HCrossbow = "battle_hit_2hcrossbow",
		kDrwWt1HClaw = "battle_hit_claw",
	},

	misses =
	{
		kDrwWtDefault = "battle_miss_fist",
		kDrwWtMouth = "battle_hit_mouth",
		kDrwWtHand = "battle_miss_fist",
		kDrwWt1HDagger = "battle_miss_sword",
		kDrwWt1HSword = "battle_miss_sword",
		kDrwWt1HAxe = "battle_miss_sword",
		kDrwWt1HMaceSpiky = "battle_miss_hammer",
		kDrwWt1HMaceBlunt = "battle_miss_hammer",
		kDrwWt1HHammer = "battle_miss_hammer",
		kDrwWt1HStaff = "battle_miss_staff",
		kDrwWt2HSword = "battle_miss_sword",
		kDrwWt2HAxe = "battle_miss_sword",
		kDrwWt2HMace = "battle_miss_hammer",
		kDrwWt2HHammer = "battle_miss_hammer",
		kDrwWt2HStaff = "battle_miss_staff",
		kDrwWt2HSpear = "battle_miss_staff",
		kDrwWt2HHalberd = "battle_miss_sword",
		kDrwWt2HBow = "battle_miss_staff",
		kDrwWt2HCrossbow = "battle_miss_bow",
	},

}

-- AB HIER CODE! DO NOT CHANGE!
-- automatic tagging with EventIds:
local t = tkeys(Data) -- get all sound names
sort(t) -- durch sortieren sicherstellen, daß die Reihenfolge eindeutig ist
DrwSoundId = {}
for i = 1,getn(t) do
	DrwSoundId[t[i]] = i -- eindeutige EventId vergeben
end

-- register samples with defaults
BattleSoundDir = dir_readdirectory("sound\\speech\\battle\\*.*")
BattleSoundFile = strsplit("\n", gsub(readfile("sound\\speech\\battle\\sounds.txt"), "\r", ""))
BattleSounds = list_concat(BattleSoundDir, BattleSoundFile)
BattleSounds = list_converttoset(BattleSounds)

function GetSoundFile(file)
	if Find(file, %BattleSounds) then
		return "sound\\speech\\battle\\" .. file .. ".wav"
	end

	return "sound\\" .. file .. ".wav"
end


if not ObjectLibrary then -- only if called from soundsystem
	SoundDir = dir_readdirectory("sound\\*.*")
	BattleSoundDir = dir_readdirectory("sound\\battle\\*.*")

	SndDrwEventSamples = {}
	for i,v in Data do
		-- generierte EventId eintragen
		v.EventId = DrwSoundId[i]
		
		-- complete filename and substitute 1-9 names
		if type(v.File) == "table" then
			local Factor = 1
			local Files = {}
			for j = 1,getn(v.File) do
				if type(v.File[j])=="number" then
					Factor = v.File[j] -- factor was given for the following files
				else
					local File = v.File[j]
					pos1, pos2, from, to = strfind(File,"(%d+)%-(%d+)")
					if pos1 then -- filename in the form "name1-3" means "name1","name2","name3"
						Enumerated = {}
						for k = tonumber(from), tonumber(to) do
							local s = gsub(File,"%d+%-%d+",tostring(k))
							tinsert(Enumerated,s)
						end
						File = Enumerated
					end
					for l = 1, Factor do -- if there was a factor given then make multiple entries
						tinsert(Files,GetSoundFile(File))
					end
					-- Factor = 1 -- maybe it is better to reset the factor to 1 so you have to repeat the factor for every name?
				end
			end
			v.File = Files
		else
			v.File = GetSoundFile(v.File)
		end


		-- set defaults
		v.FallOffMin = v.FallOffMin or 15
		v.FallOffMax = v.FallOffMax or 100
		v.Volume = v.Volume or 1
		v.Length = v.Length or 0
		v.Atmo = v.Atmo or 0

		-- now register it
		SndDrwEventSamples[v.EventId] = v
--		if type(v.File)=="table" then
--			print("registering Sound#"..v.EventId..": "..strjoin(", ", v.File))
--		else
--			print("registering Sound#"..v.EventId..": "..v.File)
--		end
	end
else
    
	-- process BattleData defined above:
	SoundLibrary = ObjectLibrary:GetSoundLibrary()
	local t = {"hits","misses"} -- hits are type 1, misses are type 2
	for type=1, getn(t) do
		for weapon_type_name,sound_name in BattleData[t[type]] do
			local weapon_type = globals()[weapon_type_name]
			if not weapon_type then
				error(weapon_type_name .. "is an unknown weapon type!")
			end
			local sound_id = DrwSoundId[sound_name]
			if not sound_id then
				error(sound_name .. "is an unknown sound name!")
			end
			SoundLibrary:AddSound(sound_id,type,weapon_type,0)
		end
	end

end