--Orkbewohner
--NpcId ab 6783
-- wieder ab 

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

--Orkbewohner aus Flüchtlingslagern

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 60 ,
	Conditions = 
	{
		IsGlobalFlagTrue{ Name = "P101_DunkelElfBossKilled", UpdateInterval = 30}
	},
	Actions = 
	{ 
		--Flüchtlinge gehen heim in die Stadt
		Goto {X = 229, Y = 277, NpcId = 6783 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 210, Y = 273, NpcId = 6784 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 281, Y = 279, NpcId = 6785 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 280, Y = 282, NpcId = 6786 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 291, Y = 283, NpcId = 6787 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 233, Y = 316, NpcId = 6788 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 199, Y = 283, NpcId = 6789 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 200, Y = 278, NpcId = 6790 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 281, Y = 226, NpcId = 6791,  Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 279, Y = 225, NpcId = 6792 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 211, Y = 291, NpcId = 6793 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 263, Y = 288, NpcId = 6794 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto {X = 262, Y = 287, NpcId = 6795 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		--Goto {X = 326, Y = 194, NpcId = 6796 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		--Goto {X = 326, Y = 195, NpcId = 5968 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		--Goto {X = 327, Y = 192, NpcId = 5969 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		--Goto {X = 327, Y = 193, NpcId = 5970 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		--Goto {X = 327, Y = 194, NpcId = 5971 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		--Goto {X = 327, Y = 195, NpcId = 5972 , Range = 1 , WalkMode = Run , GotoMode = GotoContinuous}, 
		
		
	} 
}




EndDefinition()

end