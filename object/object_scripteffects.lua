local iScriptEffectSpace = 1000

local tScriptEffects =
{
	-- ACHTUNG: neue effekte IMMER ganz unten anhängen!
	-- sonst gehen savegames kaputt...
	"GroundWave",
	"Torch",
	"TorchOff",
	"Campfire",
	"AreaHit",
	"AreaHit1",
	"CastAirSilent",
	"Lightning",
	"GlowingTube",
	"Materialize",
	"DeMaterialize",
	"Chain",
	"CastFire",
	"PlasmaSmoke",
	"Inflex",
	"Spawnboss",
	-- ACHTUNG: neue effekte IMMER ganz unten anhängen!
	-- sonst gehen savegames kaputt...
	"GateSmallOpen",
	"GateSmallClose",
	"GateLargeOpen",
	"GateLargeClose",
	"StoneGateSmallOpen",
	"StoneGateSmallClose",
	"StoneGateLargeOpen",
	"StoneGateLargeClose",
	"ElfGateOpen",
	"ElfGateClose",
	"DarkElfGateOpen",
	"DarkElfGateClose",
	"FireGateOpen",
	"FireGateClose",
	"PalisadeOpen",
	"PalisadeClose",
	-- ACHTUNG: neue effekte IMMER ganz unten anhängen!
	-- sonst gehen savegames kaputt...
	"Petrify",
	"MaterializeInMonument",
	"HeroMonumentActive",
	"Loot",
	"SimpleInvis",
	"BuildingFire",
	"IcePack",
	"Explo",
	"Poison",
	"IcePackForever",
	"Gladiator",
	"DarkMight",
	"Blitzwesen",
	"IceShield",
	"IceShieldOld",
	"Amok",
	"Halo",
	"Obelisk",
	"LeniaEffect",
	-- ACHTUNG: neue effekte IMMER ganz unten anhängen!
	-- sonst gehen savegames kaputt...
	"IndoorGateOpen",
	"IndoorGateClose",
	"OccludeBlack",
	"OccludeWhite",
	-- für ulather cutscene
	"FireShieldOld",
	"FireFall",
	"CastFireSilent",
	-- these are used mainly for testing...	
	"FogForever",
	"Fog",
	"AcidCloud",
	"Dialog",
	"DialogRieseSpecial",
	"FenceOpen",
	"FenceClose",
	"FenceLargeOpen",
	"FenceLargeClose",
	-- ACHTUNG: neue effekte IMMER ganz unten anhängen!
	-- sonst gehen savegames kaputt...
	"EmpyriaOpen",
	"EmpyriaClose",
	"ObeliskBeam",
	"OccludeBlackBig",
	"OccludeWhiteBig",
	"FenceSmallOpen",
	"FenceSmallClose",
	"Tongue",
	"Head",
	"Pestilence",

	
	-- ACHTUNG: neue effekte IMMER ganz unten anhängen!
	-- sonst gehen savegames kaputt...
}


function GetScriptEffectList()
	local tEffectList = {}

	local nEffect = %iScriptEffectSpace
	for i, v in %tScriptEffects do
		tEffectList[v] = nEffect
		nEffect = nEffect + 1
	end

	return tEffectList
end

function RegisterScriptEffects()
	local nEffect = %iScriptEffectSpace
	for i, v in %tScriptEffects do
		RegisterEffect(kGdEffectTest, nEffect, EffectGet(v))
		nEffect = nEffect + 1
	end
end
