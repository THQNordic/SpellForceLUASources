-->INFO: Greif
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2,
Conditions = {
		IsNpcFlagFalse{Name = "GriffonFreed"}
		},
}
--zu Uthar gehen
OnIdleGoHome{WalkMode = Run, X = 144, Y = 278, Direction = 4,
Conditions = {
		IsNpcFlagTrue{Name = "GriffonFreed"}
		},
HomeActions = {
			QuestSolve{QuestId = 493}
			}
}
Despawn
{
Conditions = {
		IsGlobalFlagTrue{Name = "Q490DespawnGriffon" , UpdateInterval = 2}
		}
}





--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\p16\n3605_Greif.txt


	

	OnBeginDialog{
		Conditions = {
			UND(FigureDead{NpcId = 3608} , IsNpcFlagFalse{Name = "GriffonFreed"}),
		},
		Actions = {
			Say{Tag = "greif001", String = "(Der Greif ist verletzt und wirkt veränstigt.)"},
			OfferAnswer{Tag = "greif001PC", String = "Du bist frei, fliege zu Deinem Meister!", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(UND(FigureDead{NpcId = 3608} , IsNpcFlagFalse{Name = "GriffonFreed"})),
		},
		Actions = {
			Say{Tag = "greif001", String = "(Der Greif ist verletzt und wirkt veränstigt.)"},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "GriffonFreed"} , RemoveDialog{},
			EndDialog(),
		}}


	EndDefinition()
end