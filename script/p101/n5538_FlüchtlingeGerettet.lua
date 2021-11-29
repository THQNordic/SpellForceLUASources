-->INFO: Flüchtlinge, die gerettet werden sollen
-- NpcId  6049 - 6060, 6661, 8124-8128




--Counter für gerettete Flüchtlinge                                
OnOneTimeEvent                                                        
{                                                                     
	NotInDialog = FALSE , UpdateInterval = 60 ,                         
	Conditions =                                                        
	{                                                                   
		FigureInRange {X = 462, Y = 456, NpcId = self , Range = 10},
	},                                                                  
	Actions =                                                           
	{                                                                   
		IncreasePlatformCounter{Name = "CounterFlüchtlingeGerettet", Step = 1}                                                                
	},                                                                  
} 


---- Umspawn während Cutscene Gefängnis 
Umspawn
{
	UnitId = self , Clan = 0 , X = 269 , Y = 159 , Target = none , NoSpawnEffect = FALSE , OnlyOnce = TRUE , PlayDeathAnim = FALSE ,
	Conditions = 
	{  
		IsGlobalFlagTrue{Name = "P101UmspawnInitFlüchtlinge", UpdateInterval = 10},	
	} , 
	Actions = 
	{
		--ChangeFigureOwner {NpcId = self},                  
		Goto{X = 256, Y = 121, Range = 7, WalkMode = Run, NpcId = self },
		SetGlobalFlagFalse{Name = "P101UmspawnInitFlüchtlinge"},
		RemoveDialog{NpcId = self},	
		SetGlobalFlagTrue{Name = "P101FlüchtlingeFolgenElune"},
	}                    
}



--Follow auf Elune
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "P101FlüchtlingeFolgenElune", UpdateInterval = 20},
		
	},
	Actions = 
	{ 
		Follow {NpcId = self, Target = 5937},
	}
}


--Despawn, wenn Player auf Flee to Ice war
Despawn
{
	PlayDeathAnim = FALSE ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "PlayerWarAufFleeToIce", UpdateInterval = 20},
	} , 
	Actions = {}
}




