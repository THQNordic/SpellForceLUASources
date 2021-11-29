function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


OnOneTimeEvent
{ 	
	Conditions =
	{
	},
	Actions =
	{
		Outcry{ Tag = "outcryEinarShiel002", NpcId = 5029, String = "Ich bin ebenfalls erfreut Euch zu sehen, Hauptmann!", Color = ColorWhite },
	}
}

OnOneTimeEvent
{ 	
	Conditions =
	{
	},
	Actions =
	{
		Outcry{ Tag = "outcryEinarShiel002", NpcId = 5029, String = "Ich bin ebenfalls erfreut Euch zu sehen, Hauptmann!", Color = ColorWhite },
	}
}

OnOneTimeEvent
{
	Conditions =
	{
	},
	Actions =
	{
		Outcry{ Tag = "outcryOrkShiel001", NpcId = 5029, String = "Arrr! Menschen! Los, gebt Nachricht zum Lager! Schnell!", Color = ColorWhite },
	}
}


EndDefinition()

end
