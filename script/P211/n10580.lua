MyNumber = 8

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

NpcId10580_X = _X
NpcId10580_Y = _Y

dofile("script/p211/n10573_Hoehle4.lua")

-- Outcry
-- als Schattenkrieger
-- Wenn Craig befreit, Goto der Blades zum Gefängnisaufgang
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211CraigBefreit", UpdateInterval = 20},
		IsGlobalFlagTrue {Name = "g_P211CSPhoenixAuftrittGelaufen", UpdateInterval = 10}
	},
	Actions = 
	{
		Outcry {NpcId = 10580, String = "Haltet sie auf!" , Tag = "oca2soulforgerP211_001" , Delay = TRUE , Color = ColorWhite}
	},
}


-- Outcry
-- als Phönixkrieger
-- Wenn CS Befreiung gelaufen, Goto der Blades zum Gefängnisaufgang
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P211CSBefreiungGelaufen", UpdateInterval = 20},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler", UpdateInterval = 30}
	},
	Actions = 
	{
		Outcry {NpcId = 10580, String = "Haltet sie auf!" , Tag = "oca2soulforgerP211_001" , Delay = TRUE , Color = ColorWhite}
	},
}
EndDefinition()
end