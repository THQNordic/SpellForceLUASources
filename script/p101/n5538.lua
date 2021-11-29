-->INFO: Willit

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
 
 
 
-- Dialog Manager
-- Dialog aus am Anfang der Map
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = { },
	Actions = 
	{
		RemoveDialog{NpcId = self },
	},
}

--Dialog an, wenn Cutscene gelaufen und Aedar bekannt; aus, wenn Dialog geführt
OnToggleEvent
{
NotInDialog = FALSE , UpdateInterval = 60 ,
	OnConditions = 
	{ 
		
		IsGlobalFlagTrue{Name = "P101WillitDialogAn", UpdateInterval = 20},
		IsGlobalFlagFalse{Name = "IchWarAufRune1", UpdateInterval = 30},

	},
	OnActions = 
	{
		EnableDialog{NpcId = self , Important = TRUE},
	},
	OffConditions = 
	{  
		ODER
		(
		IsGlobalFlagTrue{Name = "IchWarAufRune1", UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "P101DialogWillitEnded", UpdateInterval = 30}
		)
	},
	OffActions = 
	{ 
		RemoveDialog{NpcId = self },
	},
}
 
 
 --despawn, wenn alle anderen in LAger west
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{ 
		IsGlobalTimeElapsed{Name = "AbSpielerHatQuestarmee", Seconds = 70, UpdateInterval = 30},
		
	},
	Actions = 
	{ 
		Goto {X = 225, Y = 98, NpcId = self , Range = 1 , WalkMode = Walk , GotoMode = GotoNormal , XRand = 0 , YRand = 0},
	},
}	

Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		FigureInRange{X = 225, Y = 98, NpcId = self , Range = 1}
	} , 
	Actions = { }
}






--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p101\n5538_Willit.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "willit101_001", String = "Oh! Runenkrieger spricht mit Willit! Große Ehre für Willit!"},
			Answer{Tag = "willit101_002PC", String = "Aedar hat mir erzählt, dass Ihr ein Gefolgsmann Dunhans wart und wüsstet, wo er zu finden ist?", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "willit101_003", String = "Dunhan! Ja! Willit sein Diener gewesen! Großer Krieger und König! Und Runenkrieger, so wie Ihr!"},
			Answer{Tag = "willit101_004PC", String = "Wo finde ich ihn?", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "willit101_005", String = "Oh ... Dunhan war böse auf Reowys, böse auf Aedar, böse auf Willit! Armer Willit ..."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "willit101_006", String = "Dunhan fortgegangen im Zorn ... Ihr ihn suchen werdet?"},
			Answer{Tag = "willit101_007PC", String = "Das werde ich, sobald Ihr mir endlich sagt, wohin er gegangen ist.", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "willit101_008", String = "In die Sturmfelsen, zu den Kithar, dorthin er gegangen ist! Dem Weg nach Norden Ihr folgen müsst! Dann nach Westen."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
				
	RevealUnExplored{X = 28, Y = 420, Range = 15} ,
	SetGlobalFlagTrue{Name = "HabeMitWillitGesprochen"}
	,
			Say{Tag = "willit101_009", String = "Dort oben Ihr finden ein Portal! Das bringt Euch in die Sturmfelsen! Aber langer gefährlicher Weg durch den Sumpf bis dahin!"},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			 
	QuestBegin{QuestId = 572,}
	,
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 7},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
				
	
	SetGlobalFlagTrue{Name = "P101DialogWillitEnded"},
	SetGlobalFlagFalse{Name = "P101WillitDialogAn"}
	
	,
			Say{Tag = "", String = ""},
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end