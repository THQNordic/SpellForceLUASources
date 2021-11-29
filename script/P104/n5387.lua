-- einer von der dunkelelfen (portal) truppe die den spieler angreifen
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--dofile("script/p104/n5380_Dunkelelfen_Trupp1.lua")

SpawnOnlyWhen
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "NEVER_TRUE_!!!!!!!!!!!!!!!!!!!"},
	},
	Actions = 
	{
	},
}

EndDefinition()
end
