 -----------------------------------
-- Belohnungen f�r gel�ste Questen --
 -----------------------------------


-- Quest von P206 gel�st
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {QuestId = 891, State = StateSolved},
	},
	Actions =
	{			
		SetRewardFlagTrue { Name = "P207KarteErreicht" },
	},
}

-- Quest vom Riesen gel�st
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {QuestId = 989, State = StateSolved},
	},
	Actions =
	{			
		SetRewardFlagTrue { Name = "BergrieseGeholfen" },
	},
}

-- Quest Zwerg befreit gel�st
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {QuestId = 977, State = StateSolved},
	},
	Actions =
	{			
		SetRewardFlagTrue { Name = "SprengzwergBefreit" },
	},
}

-- Quest Erste Festung besiegt gel�st
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {QuestId = 973, State = StateSolved},
	},
	Actions =
	{			
		SetRewardFlagTrue { Name = "ErsteFestungBesiegt" },
	},
}

-- Quest Schalterr�tsel gel�st
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {QuestId = 983, State = StateSolved},
	},
	Actions =
	{			
		SetRewardFlagTrue { Name = "SchalterraetselGeloest" },
	},
}

-- Quest Zweite Festung besiegt gel�st
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {QuestId = 978, State = StateSolved},
	},
	Actions =
	{			
		SetRewardFlagTrue { Name = "ZweiteFestungBesiegt" },
	},
}

-- Quest Dritte Festung besiegt gel�st
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {QuestId = 981, State = StateSolved},
	},
	Actions =
	{			
		SetRewardFlagTrue { Name = "DritteFestungBesiegt" },
	},
}

-- Quest Vierte Festung besiegt gel�st
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {QuestId = 986, State = StateSolved},
	},
	Actions =
	{			
		SetRewardFlagTrue { Name = "VierteFestungBesiegt" },
	},
}

-- Quest Bezwinge Rohen gel�st
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {QuestId = 988, State = StateSolved},
	},
	Actions =
	{			
		SetRewardFlagTrue { Name = "UndeadRohenGetoetet" },
	},
}