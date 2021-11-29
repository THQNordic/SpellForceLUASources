-->INFO: Craig
--INFO CRAIG UN'SHALLACH

function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--Wenn Spieler von der Weapon to Kill zurückkommt und der Nichtangriffspakt nicht eingegangen oder gebrochen wurde, ersscheint Craig im Innenbereich!



Despawn
{
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "FireCityMoonPriestRules"},--Mondpriester wird umgespawned
	} ,
	Actions = 
	{
	
	}
}


-- Cutscene Init GrimQuestioning
Umspawn
{
	UnitId = self , Clan = 0 , X = 415, Y = 283, Target = None , NoSpawnEffect = TRUE , OnlyOnce = TRUE ,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "CutsceneInitGrimQuestCraigh", UpdateInterval = 10},
		Negated(FigureInRange{NpcId = self, X = 415, Y = 283, Range = 5}),
	}, 
	Actions = 
	{
		SetNoFightFlagTrue {NpcId = self},
		SetGlobalFlagFalse {Name = "CutsceneInitGrimQuestCraigh"},			
	}
}




--------------------------------------------------------------------------
-- DO NOT EDIT THIS LINE OR THE ABOVE LINE, MOREOVER AND MOST IMPORTANTLY:
-- DO NOT EDIT ANYTHING BELOW THIS LINE! ANY CHANGES WILL BE LOST!
--------------------------------------------------------------------------
-- Script file created by AllClear -> Lua exporter 1.1
-- Source: C:\project\main\mission\dialoge\P110\n6046_Craig.txt


	

	OnBeginDialog{
		Conditions = {
			IsGlobalFlagTrue{Name = "HaendlerFireCitySpawnP110"},
		},
		Actions = {
			Say{Tag = "craig110_001", String = "Ihr habt die Waffe?"},
			Answer{Tag = "", String = "", AnswerId = 1},
		}}

	OnBeginDialog{
		Conditions = {
			Negated(IsGlobalFlagTrue{Name = "HaendlerFireCitySpawnP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 9},
		}}

	OnAnswer{1;
		Conditions = {
			Negated(IsItemFlagTrue{Name = "PlayerHasItemSchattenschwert"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "craig110_007PC", String = "Nein. Noch nicht.", AnswerId = 7},
		}}

	OnAnswer{1;
		Conditions = {
			IsItemFlagTrue{Name = "PlayerHasItemSchattenschwert"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			Answer{Tag = "craig110_002PC", String = "Ja. Wir haben den Wächter getäuscht, die Schattenklinge gehört uns.", AnswerId = 2},
		}}

	OnAnswer{2;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_003", String = "Dann ist es soweit. Es wird Zeit für Euch, dem Fial Darg gegenüber zu treten."},
			Answer{Tag = "", String = "", AnswerId = 3},
		}}

	OnAnswer{3;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_005", String = "Nehmt den Glutstein, er wird das Tor öffnen."},
			Answer{Tag = "", String = "", AnswerId = 4},
		}}

	OnAnswer{4;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_006", String = "Mögen die Götter mir verzeihen."},
			Answer{Tag = "", String = "", AnswerId = 5},
		}}

	OnAnswer{5;
		Conditions = {
		},
		Actions = {
			SetItemFlagTrue {Name = "PlayerHasItemGlowstone"},
			   QuestSolve { QuestId = 747},
			   QuestBegin { QuestId = 749},
			   RemoveDialog {NpcId = self},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 6},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{6;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{7;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_008", String = "Ohne das Schwert hat es keinen Sinn, gegen den Fial Darg anzutreten. Ihr müsst es erringen!"},
			Answer{Tag = "", String = "", AnswerId = 8},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{8;
		Conditions = {
		},
		Actions = {
			EndDialog(),
		}}

	OnAnswer{9;
		Conditions = {
			IsNpcFlagFalse{Name = "Known"},
		},
		Actions = {
			Say{Tag = "craig110_009", String = "Wenn Ihr obsiegen wollt, müsst Ihr wissen, wie die drei Städte und der brennende Fels miteinander verbunden sind."},
			Answer{Tag = "", String = "", AnswerId = 10},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			IsNpcFlagFalse{Name = "QuestionCity"},
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "craig110_012", String = "Runenkrieger?"},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			IsNpcFlagFalse{Name = "QuestionCity"},
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "craig110_012", String = "Runenkrieger?"},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "craig110_012", String = "Runenkrieger?"},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "craig110_012", String = "Runenkrieger?"},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			IsNpcFlagFalse{Name = "QuestionCity"},
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "craig110_012", String = "Runenkrieger?"},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			IsNpcFlagFalse{Name = "QuestionCity"},
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "craig110_012", String = "Runenkrieger?"},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "craig110_012", String = "Runenkrieger?"},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{9;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "Known"}),
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "craig110_012", String = "Runenkrieger?"},
		}}

	OnAnswer{10;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_010", String = "Die drei Städte von Shal`Dun sind nach Mond, Sonne und den Sternen benannt. Jede Stadt hat einen Schlüssel, doch nur alle drei Schlüssel gemeinsam öffnen die Tore zum brennenden Fels."},
			Answer{Tag = "", String = "", AnswerId = 11},
		}}

	OnAnswer{11;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_011", String = "Ihr müsst all diese Schlüssel erringen. Aber jede Stadt hat ihre eigene Armee und ihre Priester, die sie mit mächtiger Magie schützen."},
			Answer{Tag = "", String = "", AnswerId = 12},
		}}

	OnAnswer{12;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagTrue{Name = "P110_DialogCraigEnded"},
			SetNpcFlagTrue{Name = "Known"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 13},
		}}

	OnAnswer{13;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			IsNpcFlagFalse{Name = "QuestionCity"},
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{13;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			IsNpcFlagFalse{Name = "QuestionCity"},
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{13;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			IsNpcFlagFalse{Name = "QuestionCity"},
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			IsNpcFlagFalse{Name = "QuestionCity"},
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{13;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{14;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_014", String = "Ihr müsst sie von den Hohen Priestern der Städte erringen. Die Priester der Sternenstadt sind geübt in Mentalmagie, die Mondstadt ist die Hochburg der schwarzen Magie und die Sonnenstadt ein einziger Tempel des Feuers."},
			Answer{Tag = "", String = "", AnswerId = 15},
		}}

	OnAnswer{15;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_015", String = "Die Sternenstadt dürfte für Euch nun ein Leichtes sein, aber die beiden anderen Städte sind durch Turmbarrieren geschützt!"},
			Answer{Tag = "", String = "", AnswerId = 16},
		}}

	OnAnswer{16;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_016", String = "Ihr werdet magischen Schutz brauchen, um sie zu durchqueren. Beide Städte haben im Geheimen ihre Magie ausgebaut, um der Macht der anderen widerstehen zu können. Diese Magie müsst Ihr Euch erschließen!"},
			Answer{Tag = "", String = "", AnswerId = 17},
		}}

	OnAnswer{17;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionThreeKeys"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 18},
		}}

	OnAnswer{18;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			IsNpcFlagFalse{Name = "QuestionCity"},
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{18;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			IsNpcFlagFalse{Name = "QuestionCity"},
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{18;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			IsNpcFlagFalse{Name = "QuestionCity"},
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			IsNpcFlagFalse{Name = "QuestionCity"},
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{18;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{19;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_018", String = "Priester, Freund! Zauberer und Priester. Jeder von ihnen will Recht behalten, jeder der einzig Wahrhaftige sein!"},
			Answer{Tag = "", String = "", AnswerId = 20},
		}}

	OnAnswer{20;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_019", String = "Als der Feuerberg sich erhob und die Stadt in drei Teile zerschlug, entstand auch der Zarachkult. Priester, die uns Norcaine von nun an als Sendboten des Feuers und als Diener des Zarach ansahen."},
			Answer{Tag = "", String = "", AnswerId = 21},
		}}

	OnAnswer{21;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_020", String = "Doch die Prediger Nors, die uns so lange gelenkt hatten, wollten ihre Macht natürlich nicht teilen. Es entbrannte ein bitterer Streit, auch zwischen den Schulen der Magie!"},
			Answer{Tag = "", String = "", AnswerId = 22},
		}}

	OnAnswer{22;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_021", String = "Schließlich teilten sie die Stadt unter sich auf, und in der Sternenstadt versammelten sich jene, die dem Streit nicht folgen wollten. Krieger wie ich."},
			Answer{Tag = "", String = "", AnswerId = 23},
		}}

	OnAnswer{23;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_022", String = "Daraus ging ein unsicherer Frieden hervor. Um die Machtkämpfe zu schlichten, ersann der damalige Dracon die List mit den drei Schlüsseln. Die drei Stadtherren sollten die innere Stadt nur gemeinsam betreten können."},
			Answer{Tag = "", String = "", AnswerId = 24},
		}}

	OnAnswer{24;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_023", String = "Aber alle Seiten forschten insgeheim nach Wegen, ihre Widersacher zu vernichten. Man berichtet von magischen Wesen, die immun waren gegenüber der Magie des Feuers oder der Finsternis."},
			Answer{Tag = "", String = "", AnswerId = 25},
		}}

	OnAnswer{25;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_024", String = "Dieses Intrigantentum widert mich an! Sollen sie sterben, je eher unser Volk diese verblendeten Narren los ist, desto besser!"},
			Answer{Tag = "", String = "", AnswerId = 26},
		}}

	OnAnswer{26;
		Conditions = {
		},
		Actions = {
			SetNpcFlagTrue{Name = "QuestionCity"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 27},
		}}

	OnAnswer{27;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			IsNpcFlagFalse{Name = "QuestionCity"},
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			IsNpcFlagFalse{Name = "QuestionCity"},
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
		}}

	OnAnswer{27;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			IsNpcFlagFalse{Name = "QuestionCity"},
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			IsNpcFlagFalse{Name = "QuestionCity"},
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{27;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}

	OnAnswer{28;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_026", String = "Es würde Eure Lage um ein Vielfaches verbessern! Aber diese Priester sind falsche Schlangen, sie haben weder Ehre noch Vernunft im Leib!"},
			Answer{Tag = "", String = "", AnswerId = 29},
		}}

	OnAnswer{29;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_027", String = "Wenn Ihr es annehmt, wird es einen Preis haben! Und Ihr oder irgendjemand sonst wird ihn zahlen müssen, so viel ist sicher!"},
			Answer{Tag = "", String = "", AnswerId = 30},
		}}

	OnAnswer{30;
		Conditions = {
		},
		Actions = {
			Say{Tag = "craig110_028", String = "Niemals wird einem etwas geschenkt, Runenkrieger, vergesst das nicht!"},
			Answer{Tag = "", String = "", AnswerId = 31},
		}}

	OnAnswer{31;
		Conditions = {
		},
		Actions = {
			SetGlobalFlagFalse{Name = "NachdenkenP110"},
			Say{Tag = "", String = ""},
			Answer{Tag = "", String = "", AnswerId = 32},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			IsNpcFlagFalse{Name = "QuestionCity"},
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			IsNpcFlagFalse{Name = "QuestionCity"},
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{32;
		Conditions = {
			IsNpcFlagFalse{Name = "QuestionThreeKeys"},
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_013PC", String = "Wie gelange ich an die drei Schlüssel?", AnswerId = 14},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			IsNpcFlagFalse{Name = "QuestionCity"},
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			IsNpcFlagFalse{Name = "QuestionCity"},
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_017PC", String = "Warum ist diese Stadt so seltsam aufgeteilt?", AnswerId = 19},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			IsGlobalFlagTrue{Name = "NachdenkenP110"},
		},
		Actions = {
			Say{Tag = "", String = ""},
			OfferAnswer{Tag = "craig110_025PC", String = "Sollte ich das Angebot der Mondpriester annehmen?", AnswerId = 28},
		}}

	OnAnswer{32;
		Conditions = {
			Negated(IsNpcFlagFalse{Name = "QuestionThreeKeys"}),
			Negated(IsNpcFlagFalse{Name = "QuestionCity"}),
			Negated(IsGlobalFlagTrue{Name = "NachdenkenP110"}),
		},
		Actions = {
			Say{Tag = "", String = ""},
		}}


	EndDefinition()
end