PersonalCounter =
{
	[0] = 8 ,
	[1] = 9 ,
	[2] = 10 ,
	[3] = 11 ,
	[4] = 12 ,
	[5] = 13 ,
	[6] = 14 ,
	[7] = 15 ,
	[8] = 0 ,
	[9] = 1 ,
	[10] = 2 ,
	[11] = 3 ,
	[12] = 4 ,
	[13] = 5 ,
	[14] = 6 ,
	[15] = 7 ,
}

MyLoot = 2

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p204/n11653_BuergerUnterstadt.lua")	

EndDefinition()

end
