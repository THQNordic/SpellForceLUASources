function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPortalEvent
{
	UpdateInterval = 10,
	X = 157 , Y = 198,		-- exact position of portal object!
	Type = SteinTorKlein,		-- type of portal
	OpenConditions = 
	{
		ODER(IsGlobalFlagTrue { Name = "TorFlankenangriff" }, PlayerUnitInRange { X = 152, Y = 199, Range = 3 , FigureType = FigureAll, UpdateInterval = 10}), -- Wenn die Tunnelwache gestroben ist oder der Spieler auf der Innenseite des Tores steht
	},	
	CloseConditions = {}, 	-- Standartmaessig zu
	StayOpen = TRUE,
}
EndDefinition()

end


