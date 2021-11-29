 -----------------------------------
-- Belohnungen für gelöste Questen --
 -----------------------------------


-- Quest von P206 gelöst
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

-- Quest vom Riesen gelöst
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

-- Quest Zwerg befreit gelöst
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

-- Quest Erste Festung besiegt gelöst
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

-- Quest Schalterrätsel gelöst
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

-- Quest Zweite Festung besiegt gelöst
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

-- Quest Dritte Festung besiegt gelöst
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

-- Quest Vierte Festung besiegt gelöst
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

-- Quest Bezwinge Rohen gelöst
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