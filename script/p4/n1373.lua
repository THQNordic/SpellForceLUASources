-->INFO: ElfHostage
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Dialogsteuerung
--initial
OnOneTimeEvent
{
Conditions = {},
Actions = {
		SetDialogType{Type = SideQuest}
		}
}

--In Ketten legen
OnOneTimeEvent
{
Conditions = {},
Actions =	{
		SetEffect{Effect = "Chain" , Length = 0 , TargetType = Figure , NpcId = self}
		}
}

--Umwandlung Killbefehl Orcs in Wandlungskommando für die elfen
OnOneTimeEvent
{
Conditions = 	{
		IsGlobalFlagTrue{Name = "KillComandGiven"}
		},
Actions =	{
		ChangeRace{Race = 134, NpcId = self}
		}
}

--Befreiungsevent
OnOneTimeEvent
{
Conditions = 	{
		IsGlobalFlagTrue{Name = "LeafshadeElvesFree" , UpdateInterval = 20}
		},
	Actions =	
	{
		ChangeUnit{NpcId = self , Unit = 1471},
		ChangeRace{Race = 144, NpcId = self},
		IncreasePlayerCounter{Name = "FreedElves" , Step = 1},
		IncreasePlayerCounter{Name = "DeadandFreeElves" , Step = 1},
		StopEffect{TargetType = Figure , NpcId = self},
		TransferXP{XP = 10 , Flag = Give},
		SetPlayerFlagTrue{Name = "Elf1373Freed"},
		TransferItem{GiveItem = 2457 , Flag = Give},
		RemoveDialog{NpcId = self},
	}
}
OnPlatformOneTimeEvent
{
	Conditions = {
		IsGlobalFlagTrue{Name = "LeafshadeElvesFree" , UpdateInterval = 20},
	},
	Actions = {
		ChangeOwner{NpcId = self , Owner = OwnerPlayer},
	},
}


DefineLocationCircle{X = 424, Y = 121, Range = 2 , Name = "Point001"}
DefineLocationCircle{X = 418, Y = 121, Range = 2 , Name = "Point002"}
DefineLocationCircle{X = 375, Y = 120, Range = 2 , Name = "Point003"}
DefineLocationCircle{X = 358, Y = 132, Range = 2 , Name = "Point004"}
DefineLocationCircle{X = 352, Y = 171, Range = 2 , Name = "Point005"}
DefineLocationCircle{X = 370, Y = 199, Range = 2 , Name = "Point006"}
DefineLocationCircle{X = 362, Y = 224, Range = 2 , Name = "Point007"}
DefineLocationCircle{X = 330, Y = 251, Range = 2 , Name = "Point008"}
DefineLocationCircle{X = 297, Y = 285, Range = 2 , Name = "Point009"}
DefineLocationCircle{X = 266, Y = 323, Range = 2 , Name = "Point010"}
DefineLocationCircle{X = 244, Y = 334, Range = 2 , Name = "Point011"}
DefineLocationCircle{X = 226, Y = 315, Range = 2 , Name = "Point012"}
DefineLocationCircle{X = 204, Y = 293, Range = 2 , Name = "Point013"}
DefineLocationCircle{X = 205, Y = 264, Range = 2 , Name = "Point014"}
DefineLocationCircle{X = 174, Y = 238, Range = 2 , Name = "Point015"}
DefineLocationCircle{X = 168, Y = 199, Range = 2 , Name = "Point016"}
DefineLocationCircle{X = 162, Y = 163, Range = 2 , Name = "Point017"}
DefineLocationCircle{X = 137, Y = 167, Range = 2 , Name = "Point018"}
DefineLocationCircle{X = 111, Y = 169, Range = 2 , Name = "Point019"}
DefineLocationCircle{X = 101, Y = 162, Range = 2 , Name = "Point020"}
DefineLocationCircle{X = 100, Y = 156, Range = 2 , Name = "Point021"}

AddControlPoint{Name = "001", Location = "Point001", WalkMode = Run}
AddControlPoint{Name = "002", Location = "Point002", WalkMode = Run}
AddControlPoint{Name = "003", Location = "Point003", WalkMode = Run}
AddControlPoint{Name = "004", Location = "Point004", WalkMode = Run}
AddControlPoint{Name = "005", Location = "Point005", WalkMode = Run}
AddControlPoint{Name = "006", Location = "Point006", WalkMode = Run}
AddControlPoint{Name = "007", Location = "Point007", WalkMode = Run}
AddControlPoint{Name = "008", Location = "Point008", WalkMode = Run}
AddControlPoint{Name = "009", Location = "Point009", WalkMode = Run}
AddControlPoint{Name = "010", Location = "Point010", WalkMode = Run}
AddControlPoint{Name = "011", Location = "Point011", WalkMode = Run}
AddControlPoint{Name = "012", Location = "Point012", WalkMode = Run}
AddControlPoint{Name = "013", Location = "Point013", WalkMode = Run}
AddControlPoint{Name = "014", Location = "Point014", WalkMode = Run}
AddControlPoint{Name = "015", Location = "Point015", WalkMode = Run}
AddControlPoint{Name = "016", Location = "Point016", WalkMode = Run}
AddControlPoint{Name = "017", Location = "Point017", WalkMode = Run}
AddControlPoint{Name = "018", Location = "Point018", WalkMode = Run}
AddControlPoint{Name = "019", Location = "Point019", WalkMode = Run}
AddControlPoint{Name = "020", Location = "Point020", WalkMode = Run}
AddControlPoint{Name = "021", Location = "Point021", WalkMode = Run}

DailyJobParams
{
Loop = FALSCH,
Conditions = {
	IsNpcFlagTrue{Name = "FreeElfRunToEloni"},
	},
}

---Despawn wenn sie das Portal erreicht
OnOneTimeEvent
{
Conditions = 	{
		FigureInRange{ X = 100 , Y = 156 , NpcId = _NpcId , Range = 3}
		},
Actions =	{
		SetGlobalFlagTrue{Name = "EinarHasLeftTheBuilding"},
		Vanish{NpcId = _NpcId}
		}
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p4\n1373_ElfHostage.txt


	

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{Tag = "elfHostage001", String = "Danke! Ich schulde Euch mein Leben!"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "elfHostage002", String = "Bitte, nehmt dies als Zeichen unserer Dankbarkeit! Wir werden an Eurer Seite kämpfen! Vertreiben wir die Horden aus dem Schattenhain!"},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "LeafshadeElvesFree"},
			RemoveDialog{NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}


	EndDefinition()
end