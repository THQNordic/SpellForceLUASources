function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Gruppe eins der Angriffswellen legt gegen den Vorposten los
OnIdleGoHome
{
	WalkMode = Run, X = VorpostenX, Y = VorpostenY, Direction = 0,
	Conditions =
	{
		--IsGlobalTimeElapsed {Name = "KarteBetretenP108", Seconds = AngriffswelleEinsP108},
		IsGlobalFlagTrue {Name = "P108_RagnarCutscene"},
		IsGlobalFlagFalse {Name = "VorpostenTotP108"},
	},
	HomeActions =
	{
		SetNpcFlagTrue{Name = "VorpostenTotP108"},
	}
}

--Gruppe eins hat den Vorposten klein und zieht zur Stadt weiter
OnIdleGoHome
{
	WalkMode = Run, X = HauptstadtP108X, Y = HauptstadtP108Y, Direction = 0,
	Conditions =
	{
		IsNpcFlagTrue {Name = "VorpostenTotP108"},
	},
	HomeActions =
	{
		
	}
}

EndDefinition()

end
