PersonalCounter =
{
	[0] = 3 ,
	[1] = 4 ,
	[2] = 5 ,
	[3] = 6 ,
	[4] = 7 ,
	[5] = 8 ,
	[6] = 9 ,
	[7] = 10 ,
	[8] = 11 ,
	[9] = 12 ,
	[10] = 13 ,
	[11] = 14 ,
	[12] = 15 ,
	[13] = 0 ,
	[14] = 1 ,
	[15] = 2 ,
}

MyLoot = 13

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p204/n11653_BuergerUnterstadt.lua")	

EndDefinition()

end