--------------------------------------------------------------------------------------------------------------
-- Register Effects for the different spell lines. 
-- Effects must have been named and saved with EffectSave(name) or EffectSound(params)
--------------------------------------------------------------------------------------------------------------



EffectSound{new="LakeWave",				effect="LakeWave",			sound="water"}
EffectSound{new="LavaFire",				effect="LavaFire",			sound="lava"}
EffectSound{new="SwampBlubb",			effect="SwampBlubb",		sound="swamp"}

--EffectSound{new="BuildingLight",		effect="BuildingLight",		sound={name="object_torch", length=2.65}}
EffectSound{new="BuildingFireSound",	effect="NoEffect",			sound={name="object_house_burn", length=2}}
EffectSound{new="Torch",				effect="Torch",				sound={name="object_torch", length=2.65}}
EffectSound{new="GateTorch",			effect="GateTorch",			sound={name="object_torch", length=2.65}}
--EffectSound{new="BuildingFire",			effect="BuildingFire",	sound={name="object_house_burn", length=2}}
EffectSound{new="Destroy",				effect="Destroy",			sound={name="object_house_destroy", length=5.05}}
EffectSound{new="Obelisk",				effect="Obelisk",			sound={name="object_obelisk", length=3.438}}
EffectSound{new="MonumentBind",			effect="MonumentBind",		sound={name="object_bindstone_on", length=2.746}}
EffectSound{new="Materialize",			effect="Materialize",		sound="spell_summon"}
EffectSound{new="DeMaterialize",		effect="DeMaterialize",		sound="spell_teleport"}
EffectSound{new="FireBall",				effect="FireBall",			sound="spell_hit_fireball"}
EffectSound{new="ArrowTower",			effect="ArrowTower",		sound="battle_fire_arrow"}
EffectSound{new="TorchOff",				effect="TorchOff",			sound="object_torch_off"}
EffectSound{new="HeroMonumentActive",	effect="HeroMonumentActive",		sound={name="object_obelisk", length=3.438}}
EffectSound{new="MaterializeInMonument",effect="MaterializeInMonument",		sound="spell_summon"}
EffectSound{new="IcePack",				effect="IcePack",			sound="spell_hit_freeze"}
EffectSound{new="IcePackFast",			effect="IcePackFast",		sound="spell_hit_freeze"}
EffectSound{new="IcePackFeet",			effect="IcePackFeet",		sound="spell_hit_freeze"}
EffectSound{new="Campfire",				effect="Campfire",			sound={name="object_campfire", length=2.4}}
EffectSound{new="FireHit",				effect="FireHit",			sound="spell_hit"}
EffectSound{new="Explo",				effect="Explo",				sound="spell_hit_explosion"}
EffectSound{new="GateLargeClose",		effect="GateLargeClose",	sound="object_portal_wood"}
EffectSound{new="GateLargeOpen",		effect="GateLargeOpen",		sound="object_portal_wood"}
EffectSound{new="GateSmallClose",		effect="GateSmallClose",	sound="object_portal_wood"}
EffectSound{new="GateSmallOpen",		effect="GateSmallOpen",		sound="object_portal_wood"}
EffectSound{new="StoneGateLargeClose",	effect="StoneGateLargeClose",		sound="object_portal_stone"}
EffectSound{new="StoneGateLargeOpen",	effect="StoneGateLargeOpen",		sound="object_portal_stone"}
EffectSound{new="StoneGateSmallClose",	effect="StoneGateSmallClose",		sound="object_portal_stone"}
EffectSound{new="StoneGateSmallOpen",	effect="StoneGateSmallOpen",		sound="object_portal_stone"}


-- Sounds Add On 1

EffectSound{new="ArrowAmok",	effect="ArrowAmok",		sound="spell_arrow_amok"}
EffectSound{new="DragonBreathIce",	effect="DragonBreathIce",		sound="spell_dragonicebreath"}

-- Arne Tore AddOn2
EffectSound{new="FenceOpen",           effect="FenceOpen",      	   sound="object_portal_stone"}    
EffectSound{new="FenceClose",          effect="FenceClose",            sound="object_portal_stone"}
EffectSound{new="FenceLargeOpen",      effect="FenceLargeOpen",        sound="object_portal_stone"}
EffectSound{new="FenceLargeClose",     effect="FenceLargeClose",       sound="object_portal_stone"}
EffectSound{new="EmpyriaOpen",         effect="EmpyriaOpen",           sound="object_portal_stone"}
EffectSound{new="EmpyriaClose",        effect="EmpyriaClose",          sound="object_portal_stone"}
EffectSound{new="FenceSmallOpen",      effect="FenceSmallOpen",        sound="object_portal_stone"}
EffectSound{new="FenceSmallClose",     effect="FenceSmallClose",       sound="object_portal_stone"}


-- Towersounds

EffectSound{new="ResolveIceTower",		effect="ResolveIceTowerSilent",	sound="spell_hit_icetower"}
EffectSound{new="ResolveBlackTower",	effect="ResolveBlackTower",		sound="spell_resolve_black"}
EffectSound{new="WaveFireTower",		effect="WaveFireTower",			sound="spell_hit_firetower"}
EffectSound{new="StoneTower",			effect="StoneTower",			sound="spell_hit_puff"}
EffectSound{new="ArrowTower",			effect="ArrowTower",			sound="battle_fire_arrow"}
EffectSound{new="SimpleHeal",			effect="SimpleHeal",			sound="spell_resolve_white"}
EffectSound{new="HolyTouch",			effect="HolyTouch",			sound="spell_resolve_white"}
EffectSound{new="ResolveMentalTower",	effect="ResolveMentalTower",	sound="spell_hit_illuminate"}
EffectSound{new="ExtinctTower",			effect="AreaHitBlack",			sound="spell_resolve_extincttower"}




EffectSound{new="BlizzardHit",		effect="BlizzardHit",	sound="spell_hit_icetower"}
EffectSound{new="AcidCloud",		effect="AcidCloud",		sound="spell_hit_fog"}
EffectSound{new="BlackDust",		effect="BlackDust",		sound="spell_hit_puff"}
EffectSound{new="CloudOfDust",		effect="CloudOfDust",	sound="spell_hit_puff"}
EffectSound{new="Death",			effect="Death",			sound="spell_hit_puff"}
EffectSound{new="Extinct",			effect="Extinct",		sound="spell_hit_puff"}
EffectSound{new="DarkMight",		effect="DarkMight",		sound="spell_hit_fog"}
EffectSound{new="FireBounce",		effect="FireBounce",	sound="spell_resist"}
EffectSound{new="AreaHit",			effect="AreaHit",			sound="spell_spawn_destroyed"}


-- Add sounds to create commonly used effects

EffectSound{new="ResolveSelfWhite", effect="Resolve",				sound="spell_resolve_white"}
EffectSound{new="ResolveBlack",		effect="ResolveBlackSilent",	sound="spell_resolve_black"}
EffectSound{new="ResolveMental",	effect="ResolveMentalSilent",	sound="spell_resolve_mental"}
EffectSound{new="ResolveWhite",		effect="ResolveWhiteSilent",	sound="spell_resolve_white"}
EffectSound{new="ResolveFire",		effect="ResolveFireSilent",		sound="spell_resolve_fire"}
EffectSound{new="ResolveIce",		effect="ResolveIceSilent",		sound="spell_resolve_ice"}
EffectSound{new="ResolveEarth",		effect="ResolveEarthSilent",	sound="spell_resolve_earth"}
EffectSound{new="CastWhite",		effect="CastWhiteSilent",		sound="spell_cast_white"}
EffectSound{new="CastIce",			effect="CastIceSilent",			sound="spell_cast_ice"}
EffectSound{new="CastFire",			effect="CastFireSilent",		sound="spell_cast_fire"}
EffectSound{new="CastAir",			effect="CastAirSilent",			sound="spell_cast_air"}
EffectSound{new="CastEarth",		effect="CastEarthSilent",		sound="spell_cast_earth"}
EffectSound{new="CastBlack",		effect="CastBlackSilent",		sound="spell_cast_black"}
EffectSound{new="CastMental",		effect="CastMentalSilent",		sound="spell_cast_mental"}
EffectSound{new="ResolveWhiteTower",effect="ResolveWhiteTowerSilent",sound="spell_resolve_white"}


-- Monument effects
-- see defines in gdobject.hpp
local kGdObjMonumentHuman	= tonumber("303",16)
local kGdObjMonumentDwarf	= tonumber("304",16)
local kGdObjMonumentElf		= tonumber("305",16)
local kGdObjMonumentDarkElf = tonumber("306",16)
local kGdObjMonumentOrc		= tonumber("307",16)
local kGdObjMonumentTroll	= tonumber("308",16)
local kGdObjMonumentHero	= tonumber("309",16)

RegisterEffect(kGdEffectMonumentClaimed, kGdObjMonumentHuman, EffectGet("HumanMonumentClaimed"))
RegisterEffect(kGdEffectMonumentClaimed, kGdObjMonumentDwarf, EffectGet("DwarfMonumentClaimed"))
RegisterEffect(kGdEffectMonumentClaimed, kGdObjMonumentElf,	EffectGet("ElfMonumentClaimed"))
RegisterEffect(kGdEffectMonumentClaimed, kGdObjMonumentDarkElf, EffectGet("DarkelfMonumentClaimed"))
RegisterEffect(kGdEffectMonumentClaimed, kGdObjMonumentOrc, EffectGet("OrcMonumentClaimed"))
RegisterEffect(kGdEffectMonumentClaimed, kGdObjMonumentTroll, EffectGet("TrollMonumentClaimed"))
RegisterEffect(kGdEffectMonumentClaimed, kGdObjMonumentHero, EffectGet("HeroMonumentClaimed"))

RegisterEffect(kGdEffectMonumentWorking, 0, EffectGet("BindstoneActive"))

RegisterEffect(kGdEffectMonumentWorking, kGdObjMonumentHuman, EffectGet("HumanMonumentActive"))
RegisterEffect(kGdEffectMonumentWorking, kGdObjMonumentElf, EffectGet("ElfMonumentActive"))
RegisterEffect(kGdEffectMonumentWorking, kGdObjMonumentOrc, EffectGet("OrcMonumentActive"))
RegisterEffect(kGdEffectMonumentWorking, kGdObjMonumentDwarf, EffectGet("DwarfMonumentActive"))
RegisterEffect(kGdEffectMonumentWorking, kGdObjMonumentTroll, EffectGet("TrollMonumentActive"))
RegisterEffect(kGdEffectMonumentWorking, kGdObjMonumentDarkElf, EffectGet("DarkelfMonumentActive"))
RegisterEffect(kGdEffectMonumentWorking, kGdObjMonumentHero, EffectGet("HeroMonumentActive"))
RegisterEffect(kGdEffectPlayerBind,	0, EffectGet("MonumentBind"))
RegisterEffect(kGdEffectMonumentBullet,	0, EffectGet("BindstoneResolve"))
RegisterEffect(kGdEffectMonumentHitFigure,	0, EffectGet("BindstoneHit"))

RegisterEffect(kGdEffectTitanProduction, kGtRaceHuman, EffectGet("HumanTitan"))
RegisterEffect(kGdEffectTitanProduction, kGtRaceElf, EffectGet("ElfTitan"))
RegisterEffect(kGdEffectTitanProduction, kGtRaceDwarf, EffectGet("DwarfTitan"))
RegisterEffect(kGdEffectTitanProduction, kGtRaceOrc, EffectGet("OrcTitan"))
RegisterEffect(kGdEffectTitanProduction, kGtRaceDarkElf, EffectGet("DarkelfTitan"))
RegisterEffect(kGdEffectTitanProduction, kGtRaceTroll, EffectGet("TrollTitan"))


-- Projectile effects
RegisterEffect(kGdEffectProjectile, kDrwWtThrow, EffectGet("ThrowStone"))
RegisterEffect(kGdEffectProjectile, 0, EffectGet("Arrow"))
RegisterEffect(kGdEffectProjectile, 1285 , EffectGet("ThrowLavaStone"))
RegisterEffect(kGdEffectProjectile, 1288 , EffectGet("ThrowIceStone"))
RegisterEffect(kGdEffectProjectile, 1238 , EffectGet("ThrowHammer"))
RegisterEffect(kGdEffectProjectile, 1229 , EffectGet("ArrowIce"))
------- addon
RegisterEffect(kGdEffectProjectile, 3605 , EffectGet("ArrowIce"))
RegisterEffect(kGdEffectProjectile, 3604 , EffectGet("ArrowFire"))
RegisterEffect(kGdEffectProjectile, 3607 , EffectGet("ArrowPoison"))
RegisterEffect(kGdEffectProjectile, 3608 , EffectGet("ArrowAmok"))
RegisterEffect(kGdEffectProjectile, 3606 , EffectGet("ArrowMental"))
RegisterEffect(kGdEffectProjectile, 3609 , EffectGet("ArrowEarth"))
RegisterEffect(kGdEffectProjectile, 2199 , EffectGet("ArrowFire"))
RegisterEffect(kGdEffectProjectile, 3218 , EffectGet("ArrowMental"))

SpellEffect{line=kGdSpellLineIceArrowEffect, hit="IceBurst"}
SpellEffect{line=kGdSpellLineIceBlockEffect, hit="IceBurst"}
SpellEffect{line=kGdSpellLineFireBlockEffect, hit="FireBall"}

RegisterEffect(kGdEffectProjectile, 1699 , EffectGet("DragonBreathIce"))


-- Special Kategories and defaults
SpellEffect{default=kGdEffectWorkerAppears,			hit="MaterializeInMonument",	hitsound="spell_summon_worker"}
SpellEffect{default=kGdEffectHeroAppears,			hit="MaterializeInMonument",	hitsound="spell_summon_hero"}
SpellEffect{default=kGdEffectPetAppears,			hit="Materialize",				hitsound="spell_summon"}
SpellEffect{default=kGdEffectMainCharAppears,		hit="Materialize",				hitsound="spell_teleport"}
SpellEffect{default=kGdEffectSummonWorker,			hit="NoEffect",					hitsound="spell_resolve_air"}		
SpellEffect{default=kGdEffectSpellTargetResisted,	hit="Resist",					hitsound="spell_resist"}
SpellEffect{default=kGdEffectStoneFall,				hit="StoneFall"}
SpellEffect{default=kGdEffectStoneHit,				hit="StoneHit",					hitsound="spell_hit_firerain"}
SpellEffect{default=kGdEffectBlizzardFall,			hit="BlizzardFall"}
SpellEffect{default=kGdEffectBlizzardHit,			hit="BlizzardHit",				hitsound="spell_hit"}
SpellEffect{default=kGdEffectMeteorFall,			hit="FireFall"}
SpellEffect{default=kGdEffectMeteorHit,				hit="FireHit",					hitsound="spell_hit_firerain"}
SpellEffect{default=kGdEffectSpellResolve,			hit="Resolve",					hitsound="spell_resolve"}
SpellEffect{default=kGdEffectSpellResolveSelf,		hit="Resolve"}
SpellEffect{default=kGdEffectSpellCast,				hit="Lightning",				hitsound="spell_cast"}
SpellEffect{default=kGdEffectSpellHitTarget,		hit="DefaultGlow",					hitsound="spell_silence"}
SpellEffect{default=kGdEffectSpellHitWorld,			hit="AreaHit",					hitsound="spell_spawn_destroyed"}
SpellEffect{default=kGdEffectAuraResolve,			hit="AuraResolveTest",			hitsound="spell_resolve_air"}
SpellEffect{default=kGdEffectProjectile,			hit="Arrow",					hitsound="battle_fire_arrow"}


-- Procs
SpellEffect{line=kGdSpellLineSpark,				hit="Spark",	projectile="SparkNext"}


-- Melee Abilities
SpellEffect{line=kGdSpellLineAbilityBerserk,	hit="DecalBerserk", 		cast="ResolveYellow", castsound="spell_melee_berserk",		resolve="ResolveYellow"}
SpellEffect{line=kGdSpellLineAbilityBlessing,	hit="DecalBlessing", 		cast="ResolveYellow", castsound="spell_melee_heal",		resolve="ResolveYellow"}
SpellEffect{line=kGdSpellLineAbilityTrueShot,	hit="DecalTrueshot", 		cast="ResolveYellow", castsound="spell_melee_berserk",		resolve="ResolveYellow"}
SpellEffect{line=kGdSpellLineAbilitySalvo,	hit="DecalSalvo", 		cast="ResolveYellow", castsound="spell_melee_berserk",		resolve="ResolveYellow"}
SpellEffect{line=kGdSpellLineAbilitySteelSkin,	hit="DecalSteelskin", 		cast="ResolveYellow", castsound="spell_melee_damageprotect",	resolve="ResolveYellow"}
SpellEffect{line=kGdSpellLineAbilityDurability,	hit="DecalDurability",	 	cast="ResolveYellow", castsound="spell_melee_magicprotect", 	resolve="ResolveYellow"}

SpellEffect{line=kGdSpellLineAbilityWarCry,			hit="DecalBerserk", 		cast="ResolveYellow", castsound="spell_melee_berserk",		resolve="ResolveYellow"}
SpellEffect{line=kGdSpellLineAbilityBenefactions,	hit="DecalBlessing", 	 	cast="ResolveYellow", castsound="spell_melee_heal", 		resolve="ResolveYellow"}
SpellEffect{line=kGdSpellLineAbilityPatronize,		hit="DecalTrueshot", 		cast="ResolveYellow", castsound="spell_melee_magicprotect",	resolve="ResolveYellow"}
SpellEffect{line=kGdSpellLineAbilityEndurance,		hit="DecalSalvo", 			cast="ResolveYellow", castsound="spell_melee_damageprotect",	resolve="ResolveYellow"}
SpellEffect{line=kGdSpellLineAbilityShelter,		hit="DecalShelter", 		cast="ResolveYellow", castsound="spell_melee_heal",		resolve="ResolveYellow"}
SpellEffect{line=kGdSpellLineAbilityShiftLife,		hit="DecalShiftLife", 		cast="ResolveYellow", castsound="spell_melee_shiftlife",		resolve="ResolveYellow"}
SpellEffect{line=kGdSpellLineAbilityRiposte,		hit="DecalRiposte", 		cast="ResolveYellow", castsound="spell_melee_riposte",		resolve="ResolveYellow"}
SpellEffect{line=kGdSpellLineAbilityCriticalHits,	hit="DecalCriticalHits", 	cast="ResolveYellow", castsound="spell_melee_criticalhits",		resolve="ResolveYellow"}

--Towers
SpellEffect{line=kGdSpellLineIceburstTower,		hit="IceBurst",			hitsound="spell_hit_iceburst",	dot="IceBurst",			resolve="ResolveIceTower"}
SpellEffect{line=kGdSpellLineArrowTower,		resolve="NoEffect",		hit="ArrowTower"}
SpellEffect{line=kGdSpellLineFireBurstTower,	hit="FireBall",			resolve="WaveFireTower", dot="NoEffect"}
SpellEffect{line=kGdSpellLineHealingTower,		hit="SimpleHeal",		resolve="ResolveWhiteTower"}
SpellEffect{line=kGdSpellLineHypnotizeTower,	hit="Hypnotize",		dot="Hypnotize",		resolve="ResolveMentalTower"}
RegisterEffect(kGdEffectMentalTowerIdle,	0,	EffectGet("TowerMentalIdle"))
RegisterEffect(kGdEffectMentalTowerCast,	0,	EffectGet("TowerMentalCast"))
SpellEffect{line=kGdSpellLinePainTower,			hit="NoEffect",			hitsound="spell_hit_default_black",		resolve="ResolveBlackTower"}
SpellEffect{line=kGdSpellLineStoneTower,		hit="NoEffect",			resolve="StoneTower"}
SpellEffect{line=kGdSpellLineExtinctTower,		world="ExtinctTower",	hit="Extinct",	hitsound="spell_hit_puff",		resolve="NoEffect"}
SpellEffect{line=kGdSpellLineAcidCloud,				hit="Poison",		hitsound="spell_hit_poison",			world="AcidCloud",	worldsound="spell_hit_acidcloud",		cast="CastAir"}



--------------- Blackmagic
-- Death
SpellEffect{line=kGdSpellLinePain,				hit="DefaultBlack",		hitsound="spell_hit_default_black",		cast="CastBlack",	resolve="ResolveBlack", dot="DefaultBlack"}
SpellEffect{line=kGdSpellLineAuraWeakness,		hit="AuraBlack",		hitsound="spell_hit_aura_black",		cast="CastBlack",	resolve="ResolveBlack", resolvesound="dummy_silence", aura="AuraResolveBlack"}
SpellEffect{line=kGdSpellLineExtinct,			hit="Extinct",			hitsound="spell_hit_puff",				cast="CastBlack",	resolve="ResolveBlack"}
SpellEffect{line=kGdSpellLineDeath,				hit="Death",			hitsound="spell_hit_puff",				cast="CastBlack",	resolve="ResolveBlack", dot="DefaultBlack"}
SpellEffect{line=kGdSpellLinePestilence,		hit="Pestilence",		hitsound="spell_hit_pestilence",		cast="CastBlack",	resolve="ResolveBlack", dot="Pestilence"}
SpellEffect{line=kGdSpellLinePainArea,			hit="DefaultBlack",		hitsound="spell_hit_default_black",		cast="CastBlack",	resolve="ResolveBlack", world="AreaHitBlack"}
SpellEffect{line=kGdSpellLineAuraSuffocation,	hit="AuraBlack",		hitsound="spell_hit_puff",		cast="CastBlack",	resolve="ResolveBlack", resolvesound="dummy_silence", aura="AuraResolveBlack"}
SpellEffect{line=kGdSpellLineSuicideDeath,		hit="Death",			hitsound="spell_hit_default_black",		cast="CastBlack",	resolve="ResolveBlack"}

-- Necromant
SpellEffect{line=kGdSpellLineSummonSkeleton,	cast="CastBlack",	resolve="ResolveBlack"}
SpellEffect{line=kGdSpellLineLifeTap,			hit="LifeTap",		hitsound="spell_hit_weaken",			cast="CastBlack",	resolve="ResolveBlack"}
SpellEffect{line=kGdSpellLineDeathGrasp,		hit="DeathGrasp",	cast="CastBlack",	resolve="ResolveBlack"}
SpellEffect{line=kGdSpellLineSummonGoblin,		cast="CastBlack",	resolve="ResolveBlack"}
SpellEffect{line=kGdSpellLineRaiseDead,			world="AreaHitBlack",	hit="RaiseDead",	cast="CastBlack",	resolve="ResolveBlack"}
SpellEffect{line=kGdSpellLineAuraLifeTap,		hit="AuraBlack",	hitsound="spell_hit_explosion",			cast="CastBlack", resolve="ResolveBlack", aura="AuraResolveBlack"}
SpellEffect{line=kGdSpellLineSummonSpectre,		cast="CastBlack",	resolve="ResolveBlack"}
SpellEffect{line=kGdSpellLineFeignDeath,		cast="CastBlack",	resolve="ResolveBlack"}
-- feigndeath is gd only

-- Curse
SpellEffect{line=kGdSpellLineAuraSlowFighting,	hit="AuraBlack",	hitsound="spell_hit_aura_black",			cast="CastBlack", resolve="ResolveBlack", aura="AuraResolveBlack"}
SpellEffect{line=kGdSpellLinePoison,			hit="Poison",		hitsound="spell_hit_poison",				cast="CastBlack",	resolve="ResolveBlack", dot="Poison"}
SpellEffect{line=kGdSpellLineAuraInflexibility,	hit="AuraBlack",	hitsound="spell_hit_aura_black",			cast="CastBlack", resolve="ResolveBlack", aura="AuraResolveBlack"}
SpellEffect{line=kGdSpellLineDispelWhiteAura,	hit="AuraBounceWhite",											cast="CastBlack", resolve="ResolveBlack", aura="AuraResolveBlack"}
SpellEffect{line=kGdSpellLineAuraSlowWalking,	hit="AuraBlack",	hitsound="spell_hit_aura_black",			cast="CastBlack", resolve="ResolveBlack", aura="AuraResolveBlack"}
SpellEffect{line=kGdSpellLineDarkBanishing,		hit="DarkBanishing", cast="CastBlack",	resolve="ResolveBlack"}
SpellEffect{line=kGdSpellLineAuraInability,		hit="AuraBlack",	hitsound="spell_hit_aura_black",			cast="CastBlack", resolve="ResolveBlack", resolvesound="dummy_silence", aura="AuraResolveBlack"}
SpellEffect{line=kGdSpellLineRemediless,		hit="Remediless",	hitsound="spell_hit_remediless",			cast="CastBlack",	resolve="ResolveBlack", dot="Remediless"}


--------------- Whitemagic
-- Life
SpellEffect{line=kGdSpellLineHealing,			hit="SimpleHeal",		hitsound="spell_hit_healing",			cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite"}
SpellEffect{line=kGdSpellLineHealingArea,		world="AreaHitWhite",	hit="SimpleHeal",	hitsound="spell_hit_healing",			cast="CastWhite",	resolve="ResolveWhite"}
SpellEffect{line=kGdSpellLineAuraStrength,		hit="AuraWhite",		hitsound="spell_hit_aura_white",		cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite", aura="AuraResolveWhite"}
SpellEffect{line=kGdSpellLineGreaterHealing,	hit="GreaterHeal",		hitsound="spell_hit_healing",			cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite"}
SpellEffect{line=kGdSpellLineAuraHealing,		hit="AuraWhite",		hitsound="spell_hit_aura_white",		cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite", aura="AuraResolveWhite"}
SpellEffect{line=kGdSpellLineAuraEndurance,		hit="AuraWhite",		hitsound="spell_hit_aura_white",		cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite", aura="AuraResolveWhite"}
SpellEffect{line=kGdSpellLineSentinelHealing,	hit="GreaterHeal",		hitsound="spell_hit_healing",			cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite"}
SpellEffect{line=kGdSpellLineSuicideHeal,		hit="SuicideHeal",		cast="CastWhite", 	resolve="ResolveWhite"}

-- nature
SpellEffect{line=kGdSpellLineThornShield,		hit="ThornShield",		hitsound="spell_hit_iceshield",			cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite"}
SpellEffect{line=kGdSpellLineCureDisease,		hit="CureDisease",		hitsound="spell_hit_curedisease",		cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite"}
SpellEffect{line=kGdSpellLineSummonWolf,		cast="CastWhite", 		resolve="ResolveWhite"}
SpellEffect{line=kGdSpellLineAuraRegeneration,	hit="AuraWhite",		hitsound="spell_hit_aura_white",		cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite", aura="AuraResolveWhite"}
SpellEffect{line=kGdSpellLineDominateAnimal,	hit="CharmChainWhite",	hitsound="spell_hit",				cast="CastWhite",	resolve="ResolveWhite", dot="CharmChainWhite"}
SpellEffect{line=kGdSpellLineCurePoison,		hit="CurePoison",		hitsound="spell_hit_curedisease",		cast="CastWhite", 	resolve="ResolveWhite"}
SpellEffect{line=kGdSpellLineSummonBear,		cast="CastWhite", 		resolve="ResolveWhite"}
SpellEffect{line=kGdSpellLineCharmAnimal,		hit="CharmChainWhite2",	hitsound="spell_hit",				cast="CastWhite",	resolve="ResolveWhite", dot="CharmChainWhite"}

-- blessing
SpellEffect{line=kGdSpellLineAuraFastFighting,	hit="AuraWhite",		hitsound="spell_hit_aura_white",		cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite", aura="AuraResolveWhite"}
SpellEffect{line=kGdSpellLineHallow,			hit="StaticCloud",		dot="StaticCloud",						cast="CastWhite", resolve="WhiteProjectile", self="ResolveSelfWhite"}
SpellEffect{line=kGdSpellLineAuraFlexibility,	hit="AuraWhite",		hitsound="spell_hit_aura_white",		cast="CastWhite", resolve="ResolveWhite", resolvesound="dummy_silence", self="ResolveSelfWhite", aura="AuraResolveWhite"}
SpellEffect{line=kGdSpellLineDispelBlackAura,	hit="AuraBounceBlack",											cast="CastWhite", resolve="ResolveWhite", resolvesound="dummy_silence", aura="AuraResolveWhite"}
SpellEffect{line=kGdSpellLineAuraFastWalking,	hit="AuraWhite",		hitsound="spell_hit_aura_white",		cast="CastWhite", resolve="ResolveWhite", resolvesound="dummy_silence", self="ResolveSelfWhite", aura="AuraResolveWhite"}
SpellEffect{line=kGdSpellLineAuraLight,			hit="AuraWhite",		hitsound="spell_hit_aura_white",		cast="CastWhite", resolve="ResolveWhite", resolvesound="dummy_silence", self="ResolveSelfWhite", aura="AuraResolveWhite"}
SpellEffect{line=kGdSpellLineAuraDexterity,		hit="AuraWhite",		hitsound="spell_hit_aura_white",		cast="CastWhite", resolve="ResolveWhite", resolvesound="dummy_silence", self="ResolveSelfWhite", aura="AuraResolveWhite"}
SpellEffect{line=kGdSpellLineInvulnerability,	hit="SparkleSphere",	hitsound="spell_hit_strengthen",		cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite"}



--------------- Elemental
-- Fire
SpellEffect{line=kGdSpellLineFireBurst,			hit="NoEffect",		hitsound="spell_hit_fireburst",			cast="CastFire",	resolve="WaveFire", resolvesound = "spell_resolve_fire", dot="BurnFromFeet"}
SpellEffect{line=kGdSpellLineFireShield,		hit="FireShield",	hitsound="spell_hit_fireshield",		cast="CastFire",	resolve="ResolveFire"}
SpellEffect{line=kGdSpellLineFireBall,			hit="FireBall",		hitsound="spell_hit_fireball",			cast="CastFire",	resolve="WaveFire", resolvesound = "spell_resolve_fire", dot="BurnFromFeet", dotsound="spell_hit_fireburst"}
SpellEffect{line=kGdSpellLineFireBallEffect,	hit="NoEffect",		projectile="NoEffect", dot="NoEffect"}
SpellEffect{line=kGdSpellLineIlluminate,		world="Illuminate",	worldsound="spell_hit_illuminate",		cast="CastFire",	resolve="ResolveFire"}
SpellEffect{line=kGdSpellLineFireElemental,		cast="CastFire",	resolve="ResolveFire"}
SpellEffect{line=kGdSpellLineWaveOfFire,		cast="CastFire",	resolve="ResolveFire",				projectile="WaveFire"}
SpellEffect{line=kGdSpellLineMeltResistance,	hit="MeltResistance", cast="CastFire",	resolve="ResolveFire"}
SpellEffect{line=kGdSpellLineFireShieldDamage,	hit="BurnFromFeet"}
SpellEffect{line=kGdSpellLineRainOfFire,		world="AreaHitFire",	cast="CastFire",	resolve="ResolveFire"}

-- Ice
SpellEffect{line=kGdSpellLineIceBurst,			hit="IcePackFast",	hitsound="spell_hit_iceburst",			cast="CastIce",	resolve="WaveIce", dot="IceBurst"}
SpellEffect{line=kGdSpellLineIceShield,			hit="IceShield",	hitsound="spell_hit_iceshield",			cast="CastIce",	resolve="ResolveIce"}
SpellEffect{line=kGdSpellLineIceShieldStun,		hit="IcePackFast"}
SpellEffect{line=kGdSpellLineFreeze,			hit="IcePack",		hitsound="spell_hit_freeze",			cast="CastIce",	resolve="ResolveIce", dot="IcePack"}
SpellEffect{line=kGdSpellLineFog,				world="Fog",		worldsound="dummy_silence",				cast="CastAir"}
SpellEffect{line=kGdSpellLineIceElemental,		cast="CastIce",		resolve="ResolveIce"}
SpellEffect{line=kGdSpellLineChillResistance,	hit="ChillResistance", cast="CastIce",		resolve="ResolveIce"}
SpellEffect{line=kGdSpellLineBlizzard,			world="AreaHitIce",		cast="CastAir",		resolve="ResolveIce"}

-- Earth
SpellEffect{line=kGdSpellLineRockBullet,		world="RockBullet",   hit="RockBullet",   cast="CastEarth",	resolve="ResolveEarth"}
SpellEffect{line=kGdSpellLineConservation,		hit="Conservation",		hitsound="spell_hit_petrify",			cast="CastEarth",	resolve="Resolve"}
SpellEffect{line=kGdSpellLineDetectMetal,		cast="CastEarth",	resolve="ResolveEarth"}
SpellEffect{line=kGdSpellLineDecay,				hit="Decay",		hitsound="spell_hit_decay",				cast="CastEarth",	resolve="ResolveEarth"}
SpellEffect{line=kGdSpellLineEarthElemental,	cast="CastEarth",	resolve="ResolveEarth"}
SpellEffect{line=kGdSpellLineWaveOfRocks,		cast="CastEarth",	resolve="ResolveEarth", projectile="RockBullet"}
SpellEffect{line=kGdSpellLinePetrify,			hit="Petrify",		hitsound="spell_hit_petrify",			cast="CastEarth",	resolve="ResolveEarth"}
SpellEffect{line=kGdSpellLineStoneRain,			world="AreaHitEarth",		cast="CastEarth",	resolve="ResolveEarth"}

SpellEffect{line=kGdSpellLineAuraSiegeTroll,	world="SiegeStone",   cast="CastEarth",	resolve="ResolveEarth"}
SpellEffect{line=kGdSpellLineAuraSiegeHuman,	world="SiegeFlash",   resolve="ResolveEarth"}
SpellEffect{line=kGdSpellLineAuraSiegeElf,		world="SiegeStars",   cast="CastAir",	resolve="ResolveEarth"}
SpellEffect{line=kGdSpellLineAuraSiegeDarkElf,	world="SiegePlanets", cast="CastBlack",	resolve="ResolveEarth"}
SpellEffect{line=kGdSpellLineAuraSiegeOrc,		world="SiegeFire",	  cast="CastFire",	resolve="ResolveEarth"}
 
--------------- Mental
-- Charm
SpellEffect{line=kGdSpellLineSelfIllusion,		hit="SelfIllusion",	cast="CastMental", resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineDistract,			hit="Forget",		hitsound="spell_hit_elektro",				cast="CastMental",	resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineDominate,			hit="CharmChain",	hitsound="spell_hit",					cast="CastMental",	resolve="ResolveMental", dot="CharmChain"}
SpellEffect{line=kGdSpellLineInvisibility,		hit="Invisibility",	cast="CastMental",	resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineCharm,				hit="CharmChain2",	hitsound="spell_hit",					cast="CastMental",	resolve="ResolveMental", dot="CharmChain"}
SpellEffect{line=kGdSpellLineBefriend,			hit="Forget",		cast="CastMental",	resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineDisenchant,		hit="CharmChainBreak",		cast="CastMental",	resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineCharisma,			hit="Charisma",		cast="CastMental",	resolve="ResolveMental"}

-- offensive
SpellEffect{line=kGdSpellLineShock,				hit="HeadShock",	hitsound="spell_hit_shock",				cast="CastMental",	resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineConfuse,			hit="Confuse",												cast="CastMental", resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineHypnotize,			hit="MentalHit",	hitsound="spell_hit_hypnotize",			cast="CastMental",	resolve="ResolveMental", dot="Hypnotize"}
SpellEffect{line=kGdSpellLineHypnotizeTwo,		hit="MentalHit",	hitsound="spell_hit_hypnotize",			cast="CastMental",	resolve="ResolveMental", dot="Hypnotize"}
SpellEffect{line=kGdSpellLineAmok,				hit="Amok",			hitsound="spell_hit",					cast="CastMental",	resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineShockwave,			hit="HeadShock",	hitsound="spell_hit_elektro",			cast="CastMental",	resolveself="ResolveMental"}
SpellEffect{line=kGdSpellLineDisrupt,			hit="HeadFlash",	hitsound="spell_hit_slowness",			cast="CastMental",	resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineAuraHypnotization,	hit="AuraMental",	hitsound="spell_hit_hypnotize",		cast="CastMental", resolve="ResolveMental", aura="AuraResolveMental"}
SpellEffect{line=kGdSpellLineDemoralization,	hit="Demoralize",											cast="CastMental",	resolve="ResolveMental"}

-- defensive
SpellEffect{line=kGdSpellLineManaDrain,			hit="ManaOut",		hitsound="spell_hit_manadrain",			cast="CastMental",	resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineSacrificeMana,		hit="ManaIn",		hitsound="spell_hit_quickness",		cast="CastMental",	resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineDetectMagic,		cast="CastMental",	resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineManaTap,			hit="ManaOut",		hitsound="spell_hit_manatap",			cast="CastMental",	resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineAuraBrilliance,	hit="AuraMental",	hitsound="spell_hit_aura_mental",		cast="CastMental", resolve="ResolveMental", resolvesound="dummy_silence", aura="AuraResolveMental"}
SpellEffect{line=kGdSpellLineEnlightenment,		hit="Enlightenment",	cast="CastMental",	resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineAuraManaTap,		hit="AuraMental",	hitsound="spell_hit_aura_mental",		cast="CastMental", resolve="ResolveMental", resolvesound="dummy_silence", aura="AuraResolveMental"}
SpellEffect{line=kGdSpellLineMeditation,		hit="NoEffect",		cast="CastMental",	resolve="ResolveMental"}


-- Aura Black Magic Hits
SpellEffect{line=kGdSpellLineSlowness,			hit="Slowness",		hitsound="spell_hit_slowness",			cast="CastBlack",	resolve="ResolveBlack", dot="Slowness"}
SpellEffect{line=kGdSpellLineInflexibility,		hit="Inflex",		hitsound="spell_hit_inflexibility",		cast="CastBlack",	resolve="ResolveBlack", dot="Inflex"}
SpellEffect{line=kGdSpellLineWeaken,			hit="Weaken",		hitsound="spell_hit_weaken",			cast="CastBlack",	resolve="ResolveBlack", dot="Weaken"}
SpellEffect{line=kGdSpellLineSlowFighting,		hit="SlowFighting",	hitsound="spell_hit_slowness"}
SpellEffect{line=kGdSpellLineInability,			hit="Inability",	hitsound="spell_hit_puff"}
SpellEffect{line=kGdSpellLineSuffocation,		hit="Suffocation",	hitsound="spell_hit_puff"}

-- Aura White Magic Hits
SpellEffect{line=kGdSpellLineQuickness,			hit="Quickness",	hitsound="spell_hit_quickness",			cast="CastWhite", resolve="ResolveWhite", dot="Quickness"}
SpellEffect{line=kGdSpellLineFlexibility,		hit="Flexibility",	hitsound="spell_hit_flexibility",		cast="CastWhite", resolve="ResolveWhite", dot="Flexibility"}
SpellEffect{line=kGdSpellLineStrengthen,		hit="Strengthen",	hitsound="dummy_silence",		cast="CastWhite", resolve="ResolveWhite", dot="Strengthen"}
SpellEffect{line=kGdSpellLineGuard,				hit="Guard",		hitsound="spell_hit_flexibility",				cast="CastWhite", resolve="ResolveWhite", dot="Guard"}
SpellEffect{line=kGdSpellLineRegenerate,		hit="Regenerate",	hitsound="dummy_silence",		cast="CastWhite", resolve="ResolveWhite", dot="Regenerate", dotsound="dummy_silence"}
SpellEffect{line=kGdSpellLineFastFighting,		hit="FastFighting",	hitsound="spell_hit_quickness",			cast="CastWhite", resolve="ResolveWhite", dot="Regenerate", dotsound="dummy_silence"}
SpellEffect{line=kGdSpellLineHealingAura,		hit="SimpleHeal",	hitsound="spell_hit_healing",			cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite"}
SpellEffect{line=kGdSpellLineDexterity,			hit="Dexterity",	hitsound="spell_hit_flexibility",		cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite"}
SpellEffect{line=kGdSpellLineEndurance,			hit="Endurance",	hitsound="dummy_silence",		cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite"}

SpellEffect{line=kGdSpellLineManaTapAura,		hit="ManaOut",		hitsound="spell_hit_elektro",			cast="CastMental",	resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineLifeTapAura,		hit="LifeTap",		hitsound="spell_hit_explosion",			cast="CastBlack",	resolve="ResolveBlack"}
SpellEffect{line=kGdSpellLineBrilliance,		hit="ManaIn",		hitsound="spell_hit_elektro",			cast="CastMental",	resolve="ResolveMental"}


--------------------------- addon
SpellEffect{line=kGdSpellLineFireResistance,	hit="FireResistance",	hitsound="spell_hit_fireresistance",		cast="CastBlack",	resolve="ResolveBlack"}

SpellEffect{line=kGdSpellLineEssenceBlack,		hit="SpanGhost",	hitsound="spell_hit_spanghost",		cast="CastBlack",	resolve="ResolveBlack"}
SpellEffect{line=kGdSpellLineAlmightinessBlack,	hit="SpanGhost",	hitsound="spell_hit_spanghost",		cast="CastBlack",	resolve="ResolveBlack"}

SpellEffect{line=kGdSpellLineHealing,			hit="SimpleHeal",		hitsound="spell_hit_healing",			cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite"}

SpellEffect{line=kGdSpellLineEssenceWhite,		hit="WhiteEssence",		hitsound="spell_hit_whiteessence",			cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite"}
SpellEffect{line=kGdSpellLineAlmightinessWhite,	hit="WhiteAlmightiness",hitsound="spell_hit_whitealmightiness",			cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite"}

SpellEffect{line=kGdSpellLineEssenceMental,		hit="MentalEssence",	hitsound="spell_hit_mentalessence",				cast="CastMental",	resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineAlmightinessMental,hit="MentalAlmightiness",hitsound="spell_hit_mentalessence",				cast="CastMental",	resolve="ResolveMental"}


SpellEffect{line=kGdSpellLineEssenceElemental,		hit="NoEffect", hitsound="spell_hit_fireball",		cast="CastElementalSilent",	resolve="ElementalEssence", resolvesound = "spell_resolve_fire"}
SpellEffect{line=kGdSpellLineAlmightinessElemental,	hit="NoEffect", hitsound="spell_hit_fireball",	cast="CastElementalSilent",	resolve="ElementalAlmightiness", resolvesound = "spell_resolve_fire"}

---------------------------- addon2
SpellEffect{default=kGdEffectSpellAssistanceHitFigure,	hit="ResolveAssistantSilent"}
SpellEffect{line=kGdSpellLineAssistance,		hit="Assistance",		hitsound="spell_hit_aura_white",		cast="CastWhite", 	resolve="ResolveWhite", self="ResolveSelfWhite"}

SpellEffect{line=kGdSpellLineSummonTreeWraith,		cast="CastWhite", 		hitsound="spell_hit_summonskeleton",		resolve="ResolveWhite"}
SpellEffect{line=kGdSpellLineSummonBlade,		cast="CastBlack", 		hitsound="spell_hit_summondemon",		resolve="ResolveBlack"}
SpellEffect{line=kGdSpellLineSummonFireGolem,		cast="CastFire", 		hitsound="spell_summon",			resolve="ResolveFire"}
SpellEffect{line=kGdSpellLineSummonIceGolem,		cast="CastIce", 		hitsound="spell_summon",			resolve="ResolveIce"}
SpellEffect{line=kGdSpellLineSummonEarthGolem,		cast="CastEarth", 		hitsound="spell_summon",			resolve="ResolveEarth"}

SpellEffect{line=kGdSpellLineAuraEternity,		hit="AuraWhite",		hitsound="spell_hit_aura_white",		cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite", aura="AuraResolveWhite"}
SpellEffect{line=kGdSpellLineEternity,			hit="Eternity",			hitsound="spell_hit_quickness",			cast="CastWhite", resolve="ResolveWhite", dot="Eternity"}

SpellEffect{line=kGdSpellLineHypnotizeArea,		world="AreaHitMental",	hit="Hypnotize",	hitsound="spell_hit_hypnotize",			cast="CastMental",	resolve="ResolveMental", dot="Hypnotize"}
SpellEffect{line=kGdSpellLineConfuseArea,		world="AreaHitMental",	hit="Confuse",		hitsound="spell_hit_spanghost",			cast="CastMental",	resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineFreezeArea,		world="AreaHitIce",	hit="IcePackFeet",	hitsound="spell_hit_freeze",			cast="CastIce",		resolve="ResolveIce"}
SpellEffect{line=kGdSpellLineRevenge,			world="AreaHitWhite",	hit="Revenge",		hitsound="spell_hit_weaken",			cast="CastWhite",	resolve="ResolveWhite", dot="SimpleHeal"}
SpellEffect{line=kGdSpellLineTorture,			world="AreaHitBlack",	hit="Torture",		hitsound="spell_hit_pain",			cast="CastBlack",	resolve="ResolveBlack"}
--SpellEffect{line=kGdSpellLineTortureReceive,	hit="SimpleHeal"}

SpellEffect{line=kGdSpellLineDominateUndead,		hit="CharmChainBlack",	hitsound="spell_hit_explosion",	cast="CastBlack",	resolve="ResolveBlack", dot="CharmChainBlack"}

SpellEffect{line=kGdSpellLineRoots,			hit="Roots",	hitsound="spell_hit_firetower",	cast="CastWhite",	resolve="ResolveWhite", dot="NoEffect"}
SpellEffect{line=kGdSpellLineRootsArea,			hit="Roots",	hitsound="spell_hit_elektro",	cast="CastWhite",	resolve="ResolveWhite", world="AreaHitWhite", dot="NoEffect"}
SpellEffect{line=kGdSpellLineFeetClay,			hit="Clay",	hitsound="spell_hit_icetower",	cast="CastEarth",	resolve="ResolveEarth", dot="Clay", world="AreaHitEarth"}

SpellEffect{line=kGdSpellLineHallowChained,		hit="StaticCloud",	hitsound="spell_hit_quickness",	dot="StaticCloud",						cast="CastWhite", resolve="WhiteProjectile", self="ResolveSelfWhite", chain="ResolveWhite"}
SpellEffect{line=kGdSpellLineChainHallow,		hit="StaticCloud",	hitsound="spell_hit_regenerate",	dot="StaticCloud",						cast="CastWhite", resolve="NoEffect", self="ResolveSelfWhite", chain="ResolveWhite"}

SpellEffect{line=kGdSpellLinePainChained,		hit="DefaultBlack",	hitsound="spell_hit_default_black",	cast="CastBlack", resolve="ResolveBlack", chain="ResolveBlack"}
SpellEffect{line=kGdSpellLineChainPain,			hit="DefaultBlack",	hitsound="spell_hit_default_black",	cast="CastBlack", resolve="ResolveBlack", chain="ResolveBlack"}

SpellEffect{line=kGdSpellLineLifeTapChained,		hit="LifeTap",		hitsound="spell_hit_weaken",		cast="CastBlack", resolve="ResolveBlack", chain="ResolveBlack"}
SpellEffect{line=kGdSpellLineChainLifetap,		hit="LifeTap",		hitsound="spell_hit_weaken",		cast="CastBlack", resolve="ResolveBlack", chain="ResolveBlack"}

SpellEffect{line=kGdSpellLineFireBurstChained,		hit="NoEffect",		hitsound="spell_hit_fireburst",		cast="CastFire",	resolve="WaveFire", resolvesound = "spell_resolve_fire", dot="BurnFromFeet", chain="WaveFire"}
SpellEffect{line=kGdSpellLineChainFireburst,		hit="NoEffect",		hitsound="spell_hit_fireburst",		cast="CastFire",	resolve="NoEffect", resolvesound = "spell_resolve_fire", dot="BurnFromFeet", chain="WaveFire"}

SpellEffect{line=kGdSpellLineFireBallChained,		hit="FireBall",		hitsound="spell_hit_fireball",		cast="CastFire",	resolve="WaveFire", resolvesound = "spell_resolve_fire", dot="BurnFromFeet", dotsound="spell_hit_fireburst", chain="WaveFire"}
SpellEffect{line=kGdSpellLineChainFireball,		hit="FireBall",		hitsound="spell_hit_fireball",		cast="CastFire",	resolve="NoEffect", resolvesound = "spell_resolve_fire", dot="BurnFromFeet", dotsound="spell_hit_fireburst", chain="WaveFire"}

SpellEffect{line=kGdSpellLineIceBurstChained,		hit="IcePackFast",	hitsound="spell_hit_iceburst",		cast="CastIce",	resolve="WaveIce", dot="IceBurst",	chain="WaveIce"}
SpellEffect{line=kGdSpellLineChainIceburst,		hit="IcePackFast",	hitsound="spell_hit_iceburst",			cast="CastIce",	resolve="NoEffect", dot="IceBurst",	chain="WaveIce"}

SpellEffect{line=kGdSpellLineRockBulletChained,		hit="RockBullet",	hitsound="spell_hit_stone",			cast="CastEarth",	resolve="ResolveEarth",	chain="ResolveEarth"}
SpellEffect{line=kGdSpellLineChainRockBullet,		hit="RockBullet",	hitsound="spell_hit_stone",			cast="CastEarth",	resolve="NoEffect",	chain="ResolveEarth"}

SpellEffect{line=kGdSpellLineShockChained,		hit="HeadShock",	hitsound="spell_hit_shock",			cast="CastMental",	resolve="ResolveMental",	chain="ResolveMental"}
SpellEffect{line=kGdSpellLineChainShock,		hit="HeadShock",	hitsound="spell_hit_shock",			cast="CastMental",	resolve="ResolveMental",	chain="HeadShock"}

SpellEffect{line=kGdSpellLineManaTapChained,		hit="ManaOut",		hitsound="spell_hit_manatap",		cast="CastMental",	resolve="ResolveMental",	chain="ResolveMental"}
SpellEffect{line=kGdSpellLineChainManatap,		hit="ManaOut",		hitsound="spell_hit_manatap",		cast="CastMental",	resolve="ResolveMental",	chain="ManaOut"}

SpellEffect{line=kGdSpellLineCharmChained,		hit="CharmChain2",	hitsound="spell_hit",				cast="CastMental",	resolve="ResolveMental", dot="CharmChain",	chain="ResolveMental"}
SpellEffect{line=kGdSpellLineChainCharm,		hit="CharmChain2",	hitsound="spell_hit",				cast="CastMental",	resolve="ResolveMental", dot="CharmChain",	chain="CharmChain2"}


SpellEffect{line=kGdSpellLineReinforcement,	 	world="DeMaterialize",	hitsound="spell_summon",	hit="Materialize",	cast="CastWhite", 		resolve="ResolveWhite",}
SpellEffect{line=kGdSpellLineHolyTouch,		 	hit="HolyTouch",	hitsound="spell_hit_whiteessence",	cast="CastWhite", 		resolve="ResolveWhite"}

SpellEffect{line=kGdSpellLineCannibalize,		hit="Cannibalize",	 hitsound="spell_hit_manatap",		cast="CastBlack", resolve="ResolveBlack"}

SpellEffect{line=kGdSpellLineMutation,			hit="Mutation",		hitsound="spell_hit_spanghost",		cast="CastBlack", resolve="ResolveBlack"}
SpellEffect{line=kGdSpellLineMutationChained,		hit="Mutation",		hitsound="spell_hit_darkmight",		cast="CastBlack", resolve="ResolveBlack", chain="ResolveBlack"}
SpellEffect{line=kGdSpellLineChainMutation,		hit="Mutation",		hitsound="spell_hit_darkmight",		cast="CastBlack", resolve="ResolveBlack", chain="ResolveBlack"}

SpellEffect{line=kGdSpellLineDarknessArea,		hit="DarkBanishing", cast="CastBlack",	resolve="ResolveBlack", world="AreaHitBlack"}

SpellEffect{line=kGdSpellLineMirrorImage,		hit="MirrorImage",									cast="CastMental", resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineShiftMana,			dot="ManaIn", 		hit="ManaOut",		hitsound="spell_hit_manatap",		cast="CastMental", resolve="ResolveMental"}
SpellEffect{line=kGdSpellLineManaShield,		hit="ManaShield",				hitsound="spell_hit_manatap",		cast="CastMental", resolve="ResolveMental"}

RegisterEffect(kGdEffectSpellManaShieldHitFigure,	0, EffectGet("AuraBounceMental"))
RegisterEffect(kGdEffectSpellVoodooHitFigure,	0, EffectGet("VodooBounce"))
SpellEffect{line=kGdSpellLineVoodoo,		hit="Vodoo",		hitsound="spell_hit_darkbanishing",		cast="CastMental", resolve="ResolveMental"}


SpellEffect{line=kGdSpellLineFakeSpellOneFigure,		 hit="BelialGlow",		cast="CastBlack", 		resolve="SupportBelial"}

--------------------------- obsolete

-- Mind Magic
--SpellEffect{line=kGdSpellLineForget,			hit="Forget",		hitsound="spell_hit_forget",			cast="CastMental",	resolve="ResolveMental"}
--SpellEffect{line=kGdSpellLineFear,			cast="CastMental", resolve="ResolveMental"}
--SpellEffect{line=kGdSpellLineObjectIllusion,	cast="CastMental",	resolve="ResolveMental"}

-- White Magic
--SpellEffect{line=kGdSpellLineRemoveCurse,		hit="RemoveCurse",		hitsound="spell_hit_removecurse",		cast="CastWhite", resolve="ResolveWhite", self="ResolveSelfWhite"}
--SpellEffect{line=kGdSpellLineAuraBrilliance,	hit="AuraMental",	hitsound="spell_hit_aura_mental",		cast="CastMental", resolve="ResolveMental", aura="AuraResolveMental"}


--SpellEffect{line=kGdSpellLineSummonDemon,			cast="CastBlack",	resolve="ResolveBlack"}
--SpellEffect{line=kGdSpellLineSummonChanneler,		cast="CastBlack",	resolve="ResolveBlack"}

-- Area Effects
--SpellEffect{line=kGdSpellLineDarkMight,			world="DarkMight",	worldsound="spell_hit_darkmight",		cast="CastBlack",	resolve="ResolveBlack"}

--SpellEffect{line=kGdSpellLineWeakenArea,			world="AreaHitBlack",	hit="Weaken",		hitsound="spell_hit_weaken",			cast="CastBlack",	resolve="ResolveBlack"}
--SpellEffect{line=kGdSpellLineInflexibilityArea,	world="AreaHitBlack",	hit="Inflex",		hitsound="spell_hit_inflexibility",		cast="CastBlack",	resolve="ResolveBlack"}
--SpellEffect{line=kGdSpellLineSlownessArea,		world="AreaHitBlack",	hit="Slowness",		hitsound="spell_hit_slowness",			cast="CastBlack",	resolve="ResolveBlack"}
--SpellEffect{line=kGdSpellLinePlagueArea,			world="AreaHitBlack",	hit="Pestilence",	hitsound="spell_hit_pestilence",		cast="CastBlack",	resolve="ResolveBlack"}

--SpellEffect{line=kGdSpellLineFlexibilityArea,		world="AreaHitWhite",	hit="Flexibility",	hitsound="spell_hit_flexibility",		cast="CastWhite",	resolve="ResolveWhite"}
--SpellEffect{line=kGdSpellLineQuicknessArea,		world="AreaHitWhite",	hit="Quickness",	hitsound="spell_hit_quickness",			cast="CastWhite",	resolve="ResolveWhite"}
--SpellEffect{line=kGdSpellLineStrengthenArea,		world="AreaHitWhite",	hit="Strengthen",	hitsound="spell_hit_strengthen",		cast="CastWhite",	resolve="ResolveWhite"}
--SpellEffect{line=kGdSpellLineHolyMight,			world="AreaHitWhite",	cast="CastWhite",	resolve="ResolveWhite"}
--SpellEffect{line=kGdSpellLineDecayArea,			world="AreaHitEarth",		hit="Decay",		hitsound="spell_hit_decay",				cast="CastEarth",	resolve="ResolveEarth"}
--SpellEffect{line=kGdSpellLinePestilenceArea,		hit="Pestilence",	hitsound="spell_hit_pestilence",		cast="CastBlack",	resolve="ResolveBlack"}
--SpellEffect{line=kGdSpellLineRemedilessArea,		hit="Remediless",	hitsound="spell_hit_remediless",		cast="CastBlack",	resolve="ResolveBlack"}

SpellEffect{line=kGdSpellLineWaveOfIce,			cast="CastIce",		resolve="ResolveIce",				projectile="WaveIce"}


------------------------------------------------- register special Drw-Effects
RegisterEffect(kGdEffectTest, 2000, EffectGet("Dialog"))
RegisterEffect(kGdEffectTest, 2001, EffectGet("Cursor"))
RegisterEffect(kGdEffectTest, 2002, EffectGet("BloodRed"))
RegisterEffect(kGdEffectTest, 2003, EffectGet("Loot"))
RegisterEffect(kGdEffectTest, 2004, EffectGet("Titan"))
RegisterEffect(kGdEffectTest, 2005, EffectGet("Merchant"))
RegisterEffect(kGdEffectTest, 2006, EffectGet("BloodBlack"))
RegisterEffect(kGdEffectTest, 2007, EffectGet("DialogImportant"))
RegisterEffect(kGdEffectTest, 2008, EffectGet("RallyFade"))
RegisterEffect(kGdEffectTest, 2009, EffectGet("Rally"))
RegisterEffect(kGdEffectTest, 2010, EffectGet("LootTreasure"))
RegisterEffect(kGdEffectTest, 2011, EffectGet("Wisp"))
RegisterEffect(kGdEffectTest, 2012, EffectGet("LevelD"))
RegisterEffect(kGdEffectTest, 2013, EffectGet("Aura2"))
RegisterEffect(kGdEffectTest, 2014, EffectGet("WispGreen"))
RegisterEffect(kGdEffectTest, 2015, EffectGet("Blitzwesen"))
RegisterEffect(kGdEffectTest, 2016, EffectGet("Aura2Titan"))
RegisterEffect(kGdEffectTest, 2017, EffectGet("Aura2"))

-------------------addon
RegisterEffect(kGdEffectTest, 2018, EffectGet("Wing")) -- Zhuul



------------------- soundeffects Arne
--EffectSound{new="SoundEffectTalk1",	effect="NoEffect",	sound="spell_resolve_extincttower"}
EffectSound{new="env_empyria_crowd01",	effect="AcidCloud",	sound={name="object_empyria_crowd01", length=9.5}}
EffectSound{new="env_empyria_crowd02",	effect="AcidCloud",	sound={name="object_empyria_crowd02", length=9.5}}
EffectSound{new="object_colosseum_cheers",	effect="NoEffect",	sound="object_colosseum_cheers"}


------------------------------------------------- register effects that can be scripted
NewObject{subobject={EffectGet("SpawnPointActive"), EffectGet("GroundWave")}}
EffectSave("GroundWave")

doscript("object_scripteffects")
RegisterScriptEffects()


