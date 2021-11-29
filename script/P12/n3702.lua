function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

--	NewUnits = { 143, 149, 146, 147 },	-- spawn all of these units at destination
OnSkeletalAnimation
{
	GotoX = 253, GotoY = 163,			-- despawn destination
	SpawnX = 330, SpawnY = 252,			-- newspawn destination
	RunnerClan = 3,						-- runner unit's clan
	MaxClanSizeRunner = 2,				-- runner clansize
	NewUnits = { 143, 149, 146 },		-- spawn all of these units at destination
	NewUnitsClan = 7,					-- welchen clan die neuen units haben sollen
	MaxClanSizeNew = 20,					-- wie gross der clan maximal sein darf
	TransitDelay = 60,					-- time in s it takes for skeletons to walk through tunnels
	SpawnDelay = 3,						-- spawn delay between each new unit
	RespawnDelay = 90,					-- delay for this unit's respawn, should be > TransitDelay + SpawnDelay
	BeginConditions = {},				-- begin conditions (initial spawn of unit)
	BeginActions = {},
	RespawnConditions = {},				-- suppress respawn (death automatically stops it)
	RespawnActions = {},
}

EndDefinition()

end
