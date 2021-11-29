function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p25/n3024_CutsceneSartariusDeath.lua")

ersterTrupp = 360 	-- Ein Blade aus dem NordCaynyon
zweiterTrupp = 480  -- Zwei Blades aus dem NordCaynyon
dritterTrupp = 510 	-- Drei Blades aus SüdNord
vierterTrupp = 570  -- Drei aus dem Norden
fuenfterTrupp = 690	-- Aus dem mittleren sechs Blades
sechsterTrupp = 750	-- von allen Standorten aus einer 4 Stück
siebterTrupp = 810 	-- Reste von überall 10 Stück
achterTrupp = 870	-- Osten und letze Reste 10 Stück



-- das Blade Camp in der Mitte, mit den ANgriffswellen
caynyonFillerRespawn1 = 300 	--Zeit nach der die Blades respawnen
caynyonAttack1 = 540		-- erste Angriffswelle, nach 540 sec.
caynyonFillerRespawn2 = 360 	--Zeit nach der die Blades respawnen
caynyonAttack2 = 1140
caynyonFillerRespawn3 = 420
caynyonAttack3	= 1740
caynyonFillerRespawn4 = 480
caynyonAttack4 = 2340

XBuildingCoordinateBlades = 219
YBuildingCoordinateBlades = 159


XSpawnCoordinateBlades = 222
YSpawnCoordinateBlades = 160

XAttackTarget1 = 445
YAttackTarget1 = 472

XAttackTarget2 = 256 
YAttackTarget2 = 464 

XAttackTarget3 = 419
YAttackTarget3 = 322

XAttackTarget4 = 191
YAttackTarget4 = 440 

XAttackTarget5 = 180
YAttackTarget5 = 388

XAttackTarget6 = 458
YAttackTarget6 = 386

SpawnWaitTime = 120


OneTimeInitAction (SetGlobalTimeStamp {Name = "FillCaynyonAttackTimer"})

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "AttackWaves"},
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "CaynyonAttackTimer"}
	}
}
----MainQuest starten
-------------------MAINQUEST Q531 Klingensturm begins here
OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 531 , State = StateUnknown},
	},
	Actions =
	{
		QuestBegin{QuestId = 531},
		QuestBegin{QuestId = 549},
	}
}
--Icegate solven
OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 523 , State = StateActive},
	},
	Actions =
	{
		QuestSolve{QuestId = 523},
		QuestSolve{QuestId = 519},
	}
}
--Anfangswellen durch?
OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 549 , State = StateActive},
		IsGlobalFlagTrue {Name = "AlleBlockadeBladesTot"},
	},
	Actions =
	{
		QuestSolve{QuestId = 549},
		QuestBegin{QuestId = 550},
	}
}
--Orcmonumetn claimed??
OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 550 , State = StateActive},
		IsMonumentInUse{X = 446 , Y = 479 , Range = 5}, 
	},
	Actions =
	{
		QuestSolve{QuestId = 550},
		QuestBegin{QuestId = 532},
		SetRewardFlagTrue{ Name = "Klingensturm1Monument"}
	}
}
--Blockade ist weg und tot
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 4021},
		FigureDead {NpcId = 4022},
		FigureDead {NpcId = 4023},
		FigureDead {NpcId = 4024},
		FigureDead {NpcId = 4025},
		FigureDead {NpcId = 4026},
		FigureDead {NpcId = 4027},
		FigureDead {NpcId = 4028},
		FigureDead {NpcId = 4029},
		FigureDead {NpcId = 4030},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "AlleBlockadeBladesTot"},
	}
}

-------------------MAINQUEST Q531 Klingensturm ends here
---Wolfsqueste solver
OnOneTimeEvent
{
	Conditions = {
		QuestState{QuestId = 267 , State = StateActive},
		Negated(QuestState{QuestId = 555 , State = StateUnknown}),
	},
	Actions = {
		QuestSolve{QuestId = 267},
		QuestSolve{QuestId = 266},
	},
} 
EndDefinition()

end
