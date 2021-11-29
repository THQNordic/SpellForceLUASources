function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


Despawn
{
PlayDeathAnim = FALSE ,
	Conditions = 
	{
		ODER(ODER(IsGlobalFlagTrue { Name = "Torch1ElementarVerschwindenP111"}, IsGlobalFlagTrue { Name = "Torch2ElementarVerschwindenP111"}),
			ODER(IsGlobalFlagTrue { Name = "Torch3ElementarVerschwindenP111"}, IsGlobalFlagTrue { Name = "Torch4ElementarVerschwindenP111"})),
		
	} ,
	Actions = 
	{
		
	}
}

REM = [[
Umspawn
{
UnitId = self ,
	Conditions = 
	{
		ODER(ODER(IsGlobalFlagTrue { Name = "Torch1ElementarVerschwindenP111"}, IsGlobalFlagTrue { Name = "Torch2ElementarVerschwindenP111"}),
			ODER(IsGlobalFlagTrue { Name = "Torch3ElementarVerschwindenP111"}, IsGlobalFlagTrue { Name = "Torch4ElementarVerschwindenP111"})),
		
	} ,
	Actions = 
	{
		SetGlobalFlagTrue {Name = "ElementarVerschwindenP111"},
	}
}
]]


Respawn
{
WaitTime = 30,
UnitId = self ,
NoSpawnEffect = FALSE , 
	Conditions = 
	{
		
	} , 
	Actions = 
	{
		ChangeFigureOwner { NpcId = self},
		SetGlobalFlagFalse { Name = "Torch1ElementarVerschwindenP111"},
		SetGlobalFlagFalse { Name = "Torch2ElementarVerschwindenP111"},
		SetGlobalFlagFalse { Name = "Torch3ElementarVerschwindenP111"},
		SetGlobalFlagFalse { Name = "Torch4ElementarVerschwindenP111"},

	} , 
	DeathActions = 
	{
	
	}
}

SpawnOnlyWhen
{
 
	Conditions = 
	{
			IsGlobalFlagTrue { Name = "ElementarBeschwoertP111"},
	} , 
	Actions = 
	{
			ChangeFigureOwner { NpcId = self},
	} 
}

OnPlatformOneTimeEvent
{
	Conditions = 
	{
	} , 
	Actions = 
	{
		ChangeFigureOwner { NpcId = self},
	} 
}

EndDefinition()

end
