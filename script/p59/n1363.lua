spline = [[
   Camera:ScriptReset()
	 Camera:ScriptAddDeploy(0,0.2, 300,100,44, 150,150, 20)
	 Camera:ScriptAddDeploy(0.2,1, 250,120,44, 150,150, 20)
	 Camera:ScriptAddDeploy(1,2, 200,200,44, 150,250, 20)
	 Camera:ScriptAddDeploy(2,3, 120,300,44, 150,250, 20)
	 Camera:ScriptAddDeploy(3,4, 300,100,44, 150,350, 20)
	 Camera:ScriptAddDeploy(4,5, 200,200,44, 350,150, 20)
	 Camera:ScriptAddDeploy(5,6, 100,300,44, 250,250, 20)
	 Camera:ScriptAddDeploy(6,7,400,300,44, 250,350, 20)
	 Camera:ScriptAddDeploy(7,8,50,10,44, 150,250, 30)
   Camera:ScriptAddSpline(10,25,0,"script\\p1\\003spline.lua")
   Camera:ScriptAddLookAt(10,25,1, 256, 256, 30)
   Camera:ScriptStart()
]]


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

	OnBeginDialog{
		Conditions = {
		},
		Actions = {
			Say{String = "Willkommen in der Karte mit den vielen Ausrufezeichen, lieber Klaus. Ich bin die braune Milka-Kuh und stehe zu fast all euren Diensten allzeit bereit! Die restlichen Dienste erweise ich selbstverständlich ebenso gerne, allerdings nur gegen ein kleines Entgelt..."},
			OfferAnswer{String = "Uuuuuugh...", AnswerId = 1},
		}}

	OnAnswer{1;
		Conditions = {
		},
		Actions = {
			Say{String="Ich glaube ich muss mal wieder gemelkt werden, würdest du mir diesen Gefallen erweisen, oh weiser Quelltexteintipper?"},
			Answer{String="Halts Maul! Ich will nur meine verdammten Dialoge testen.", AnswerId=2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			CutSceneBegin(),
			CutSceneSay{NpcId = 1363, String = "Die Macht ist stark in dir!"},
			ExecuteCameraScript{Script = spline},
			SetNpcTimeStamp{Name = "endegelände"},
			CGdsEndDialog:new(),
		}}

OnOneTimeEvent
{
	Conditions = {
			IsNpcTimeElapsed{Name = "endegelände", Seconds = 25},
			},
	Actions = {
		CutSceneEnd(),
	},
}

EndDefinition()

end
