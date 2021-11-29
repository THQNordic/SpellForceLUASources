PersonalCounter =
{
	[0] = 10 ,
	[1] = 11 ,
	[2] = 12 ,
	[3] = 13 ,
	[4] = 14 ,
	[5] = 15 ,
	[6] = 0 ,
	[7] = 1 ,
	[8] = 2 ,
	[9] = 3 ,
	[10] = 4 ,
	[11] = 5 ,
	[12] = 6 ,
	[13] = 7 ,
	[14] = 8 ,
	[15] = 9 ,
}

MyLoot = 4

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p204/n11653_BuergerUnterstadt.lua")	

EndDefinition()

end
