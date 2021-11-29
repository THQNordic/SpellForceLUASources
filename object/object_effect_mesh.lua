--------------------------------------------------------------------------------
-- standard billboards, meshes and anims for effects in a table called "flic" --
--------------------------------------------------------------------------------

flics = 
{
	-- billboards
	sun		= "sky_sun",
	sunblend	= "sky_sunblend",
	lightblend1	= "effect_light_blend1",
	lightblend2	= "effect_light_blend2",
	swamp = "effect_swamp_particle",
	waterhit = "effect_water_fountain",
	chain = "effect_spell_chain",
	star4point = "effect_spell_star4point",
	runes = "effect_spell_runes",
	runessmall = "effect_spell_runes_02",
	fadeout = "effect_spell_circle_fadeout",
	fadein = "effect_spell_circle_fadein",
	fire = "effect_spell_fire",
	fire2 = "effect_spell_fire2",
	plasma = "effect_spell_plasma3",
	explo = "effect_spell_explosion",
	star_halo = "effect_spell_star_halo",
	flare = "effect_spell_flare",
	flare02 = "effect_spell_flare_02",
	bubble = "effect_spell_bubble",
	star6point = "effect_spell_6star",
	solar = "effect_spell_solar",
	smoke = "effect_spell_smoke",
	dust = "effect_spell_dust",
	blackwhirl = "effect_spell_blackwhirl",
	ice = "effect_spell_ice",
	ice3 = "effect_spell_ice3",
	warp = "effect_spell_warp",
	blurry = "effect_spell_blurry",
	earth = "effect_spell_earth",
	circle = "effect_spell_circle",
	circledark = "effect_spell_circle_copy",
	fog = "effect_spell_fog",
	diamond = "effect_spell_diamond",
	ring = "effect_spell_ring",
	ring2 = "effect_spell_ring_02",
	spark = "effect_spell_spark",
	ghost = "effect_spell_ghost",
	skull = "effect_spell_skull",
	materialize1 = "effect_spell_materialize1",
	materialize2 = "effect_spell_materialize2",
	sol_br = "effect_spell_sol_br",
	sol_bg = "effect_spell_sol_bg",
	sol_gy = "effect_spell_sol_gy",
	sol_rp = "effect_spell_sol_rp",
	sol_pb = "effect_spell_sol_pb",
	sol_bb = "effect_spell_sol_bb",
	particles01 = "effect_spell_particles01",
	groundwave = "effect_spell_groundwave",
	stripes = "effect_spell_stripes",
	whiteorange = "effect_spell_whiteorange",
	ring_whiteorange = "effect_spell_ring_whiteorange",

	-- billboard anims
	explosion = EnumeratedStrings("effect_spell_explosion10%02d", 11),
	fireanim = EnumeratedStrings("effect_spell_fire10%02d", 14),
	sparks = EnumeratedStrings("effect_spell_sparks%02d",15),
	bat = EnumeratedStrings("effect_spell_bat%02d",4),
	hypno=EnumeratedStrings("effect_spell_hypno%02d",5),


	-- meshes
	flagpole = "building_flag_pole",
	fish = "figure_animal_fish2",
	swampbubble = "landscape_sphere_swamp",
	lightning01 = "effect_spell_lightning01",
	beamround = "effect_spell_circle_ds",
	beampointy = "effect_spell_square_45_ds",
	beampointy2 = "effect_spell_square_45_ds_copy",
	knife = "effect_spell_knife",
	flash = "effect_spell_flash",
	cylinder = "effect_spell_cylinder",
	cylinder_stripes = "effect_spell_cylinder_stripes",
	sphere = "effect_spell_sphere_spherical",
	sphereparticle = "effect_spell_sphere_particles",
	spheremat = "effect_spell_sphere_materialize",
	iceblock = "effect_spell_iceblock03",
	iceshield4 = "effect_spell_iceshield04",
	iceshield5 = "effect_spell_iceshield05",
	chicken	= "nature_chicken",
	question = "ui_dia_question",
	attention = "ui_dia_attention",
	coin = "ui_dia_coin",
	arrow = "equipment_weapon_elf_arrow",
	rock = "effect_spell_blood_03",

	ariafountain = "worlditem_aria_source_water_fontaine",
	aria = "worlditem_aria_source_water",

	obelisk = "worlditem_obelisk",
	crystal = "worlditem_obelisk_crystal",
	portal = "worlditem_portal",
	gate_small = "building_human_wall_towngate_open_small",
	gate_large = "building_human_wall_towngate_open",
	gate_small_door = "building_human_wall_towngate_open_small_door",
	stonegate = "worlditem_stonegate_large_open",
	stonegate_door = "worlditem_stonegate_gate",
	elfgate = "building_elf_wall_towngate",
	elfgate_door = "building_elf_wall_towngate_gate",
	darkelfgate = "building_darkelf_wall_towngate",
	darkelfgate_door = "building_darkelf_wall_towngate_gate",
	palisadegate = "nature_prop_palisade_gate_main",
	palisadegate_door = "nature_prop_palisade_gate_door",

	indoorgate_door = "worlditem_indoor_gate_gate",
	indoorgate = "worlditem_indoor_gate_solo",

	fence_door = "worlditem_wall_gold_large_solo",
	fencesmall_door = "worlditem_wall_gold_medium",
	fencelarge_door = "worlditem_wall_gold_extra_large_solo",
	
	empyria_gate = "building_goldencity_wall_towngate",
	empyria_door = "building_goldencity_wall_towngate_gate",
	
	firegate = "worlditem_firegate",
	portal = "worlditem_portal",
	dragonstone = "worlditem_icemonolith_on",

	caustic1 = "effect_caustic",

	lantern_dwarf = "building_dwarf_lantern",
	lantern_human = "building_human_lantern",
	lantern_elf = "building_elf_lantern",
	lantern_orc = "building_orc_lantern",
	lantern_troll = "building_troll_lantern",
	lantern_darkelf = "building_darkelf_lantern",

	tower_mental = "building_darkelf_tower_mentalmagic",
	tower_mental_eye = "building_darkelf_tower_mentalmagic_eye",

	temple = "building_human_temple_of_light",
	templecrystal = "building_human_temple_of_light_crystal",

	hammer = "equipment_weapon_dwarf_hammer",


	sf_fountain = "worlditem_soulforger_fountain",
	sf_crystal = "worlditem_soulforger_crystal_black",
	sf_crystalgreen = "worlditem_soulforger_crystal_green",

	portal_time ="worlditem_portal_time",

	roots = "effect_spell_roots",
	clay = "effect_spell_feetclay",

	head_large = "worlditem_statue_head_large1",
	head_small = "worlditem_statue_head_small_special",

	skull_mesh = "effect_spell_skull_solo",

	-- mesh anims
	simplelightning = EnumeratedStrings("effect_spell_simplelightning_%02d",3),
	lightning = EnumeratedStrings("effect_spell_lightning%02d",3),
	flashsphere = EnumeratedStrings("effect_spell_sphere_flash%02d",3),
	iceblocks = EnumeratedStrings("effect_spell_iceblock%02d",3),
	fireshield = EnumeratedStrings("effect_spell_fireshield%02d",3),
	iceshield = EnumeratedStrings("effect_spell_iceshield%02d",3),
	icerocks = EnumeratedStrings("effect_spell_icerock%02d",4),
	stones = EnumeratedStrings("effect_spell_stone%1d",6),

	--skins
	flag = "building_flag",
	flag_occupied = "building_flag_occupied",
	dwarf = "figure_dwarf_worker_cold",
	titan = "figure_titan_orc",
	banner_human = "building_human_monument_flag_grey",
	banner_elf = "building_elf_monument_flag_grey",
	banner_orc = "building_orc_monument_flag_grey",
	banner_dwarf = "building_dwarf_monument_flag_grey",
	banner_troll = "building_troll_monument_flag_grey",
	banner_darkelf = "building_darkelf_monument_flag_grey",
	banner_hero = "worlditem_hero_monument_flag_grey",
	rallyflag = "effect_flag_rallypoint",
	cow = "figure_animal_cattle",
	pig = "figure_animal_swine_dirty",
	boar = "figure_animal_wildboar_normal",
	skeleton = "figure_npc_skeleton_normal",

	titan_human = "figure_titan_human",
	titan_dwarf = "figure_titan_dwarf",
	titan_elf = "figure_titan_elf",
	titan_darkelf = "figure_titan_darkelf",
	titan_troll = "figure_titan_troll",
	titan_orc = "figure_titan_orc",

	head_tongue = "effect_tongue",

	-- decals
	decal_berserk = "effect_spell_melee_decal_berserk",
	decal_blessing = "effect_spell_melee_decal_blessing",
	decal_trueshot = "effect_spell_melee_decal_trueshot",
	decal_salvo = "effect_spell_melee_decal_salvo",
	decal_steelskin = "effect_spell_melee_decal_steelskin",
	decal_durability = "effect_spell_melee_decal_durability",
	decal_shelter = "effect_spell_melee_decal_shelter",
	decal_shiftlife = "effect_spell_melee_decal_shiftlife",
	decal_riposte = "effect_spell_melee_decal_riposte",
	decal_criticalhits = "effect_spell_melee_decal_criticalhits",

	playerdecal = "effect_playerdecal",
}


------------------------------------------------------------------------------
-- change the rendermode of some meshes --------------------------------------
------------------------------------------------------------------------------
-- modes:
-- RM_ONE_ZERO
-- RM_SRCALPHA_ONE
-- RM_SRCALPHA_INVSRCALPHA
-- RM_DESTCOLOR_ONE
-- RM_ZERO_INVSRCCOLOR
-- RM_DESTCOLOR_INVSRCALPHA
-- RM_ONE_INVSRCALPHA
-- RM_ONE_ONE
-- RM_DESTCOLOR_SRCCOLOR
-- RM_DESTCOLOR_ZERO


RenderMode(flics.lightblend1, RM_SRCALPHA_ONE) 
RenderMode(flics.waterhit, RM_SRCALPHA_ONE) 
RenderMode(flics.runes, RM_SRCALPHA_ONE) 
RenderMode(flics.decal_berserk, RM_SRCALPHA_ONE) 
RenderMode(flics.runessmall, RM_SRCALPHA_ONE) 
RenderMode(flics.whiteorange, RM_SRCALPHA_ONE) 
RenderMode(flics.ring_whiteorange, RM_SRCALPHA_ONE) 
RenderMode(flics.groundwave, RM_SRCALPHA_INVSRCALPHA)   
RenderMode(flics.flashsphere, RM_SRCALPHA_ONE)
RenderMode(flics.flare, RM_SRCALPHA_ONE) 
RenderMode(flics.bubble, RM_SRCALPHA_ONE) 
RenderMode(flics.beampointy, RM_SRCALPHA_INVSRCALPHA) 
RenderMode(flics.beampointy2, RM_SRCALPHA_INVSRCALPHA)
RenderMode(flics.cylinder, RM_SRCALPHA_INVSRCALPHA) 
RenderMode(flics.sphere, RM_SRCALPHA_ONE) 
RenderMode(flics.fireshield, RM_SRCALPHA_ONE) 
RenderMode(flics.iceshield, RM_SRCALPHA_ONE) 
RenderMode(flics.spheremat, RM_SRCALPHA_INVSRCALPHA)
RenderMode(flics.iceblocks, RM_SRCALPHA_ONE) 
RenderMode(flics.circledark, RM_SRCALPHA_INVSRCALPHA) 
RenderMode(flics.bat, RM_SRCALPHA_INVSRCALPHA) 
RenderMode(flics.skull, RM_SRCALPHA_ONE) 
RenderMode(flics.fog, RM_SRCALPHA_INVSRCALPHA) 
RenderMode(flics.dust, RM_SRCALPHA_INVSRCALPHA) 
RenderMode(flics.explo, RM_SRCALPHA_INVSRCALPHA) 
RenderMode(flics.earth, RM_SRCALPHA_INVSRCALPHA) 
RenderMode(flics.caustic1, RM_ONE_INVSRCALPHA) 
--RenderMode(flics.caustic1, RM_ONE_ONE) 


