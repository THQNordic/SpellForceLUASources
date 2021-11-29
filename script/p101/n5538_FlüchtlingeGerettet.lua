-->INFO: Fl�chtlinge, die gerettet werden sollen
-- NpcId  6049 - 6060, 6661, 8124-8128




--Counter f�r gerettete Fl�chtlinge                                
OnOneTimeEvent                                                        
{                                                                     
	NotInDialog = FALSE , UpdateInterval = 60 ,                         
	Conditions =                                                        
	{                                                                   
		FigureInRange {X = 462, Y = 456, NpcId = self , Range = 10},
	},                                                                  
	Actions =                                                           
	{                                                                   
		IncreasePlatformCounter{Name = "CounterFl�chtlingeGerettet", Step = 1}                                                                
	},                                                                  
} 


---- Umspawn w�hrend Cutscene Gef�ngnis 
Umspawn
{
	UnitId = self , Clan = 0 , X = 269 , Y = 159 , Target = none , NoSpawnEffect = FALSE , OnlyOnce = TRUE , PlayDeathAnim = FALSE ,
	Conditions = 
	{  
		IsGlobalFlagTrue{Name = "P101UmspawnInitFl�chtlinge", UpdateInterval = 10},	
	} , 
	Actions = 
	{
		--ChangeFigureOwner {NpcId = self},                  
		Goto{X = 256, Y = 121, Range = 7, WalkMode = Run, NpcId = self },
		SetGlobalFlagFalse{Name = "P101UmspawnInitFl�chtlinge"},
		RemoveDialog{NpcId = self},	
		SetGlobalFlagTrue{Name = "P101Fl�chtlingeFolgenElune"},
	}                    
}



--Follow auf Elune
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "P101Fl�chtlingeFolgenElune", UpdateInterval = 20},
		
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




