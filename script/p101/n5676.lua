-- Steintor vor Portal nach Flee To Ice

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 1,
	X = 374 , Y = 425,		-- exact position of portal object!
	Type = SteinTorGross,   -- type of portal
	OpenConditions = 
			{
			IsGlobalFlagTrue {Name = "P101Elune÷ffnetEiselfentor"}, -- Elune hat Outcry gemacht
			},
	CloseConditions = {},	-- no conditions: close when no enemy & no playerunit in range
	OpenActions = 
	{
		SetGlobalTimeStamp{Name = "P101EiselfentorOffen"},
	},
	StayOpen = TRUE,
}

EndDefinition()

end


