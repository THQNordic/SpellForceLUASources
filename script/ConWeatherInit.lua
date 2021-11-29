function AtmoInit()
	Render:EnableFog(1)
	
	Lightmap:Brightness(1.5)
	Illumination:Brightness(1.2)
	Adorn:Brightness(0.85)      --modulate brightness retrieved from ground,update only on map load

	Atmosphere:FogCorrection(1.0)
	Atmosphere:SetLinearity(0.5)

	Atmosphere:TimeLock(0)	-- no instant updates
	Atmosphere:ClearAll()

	Sky:SetRenderMode(kDrwSkySun, RM_SRCALPHA_INVSRCALPHA)
	Sky:SetRenderMode(kDrwSkyMoon, RM_SRCALPHA_INVSRCALPHA)
	Sky:SetRenderMode(kDrwSkyCloud, RM_SRCALPHA_INVSRCALPHA)
	Sky:SetRenderMode(kDrwSkyStar, RM_SRCALPHA_ONE)
	Sky:SetRenderMode(kDrwSkyMoonAura, RM_SRCALPHA_INVSRCALPHA)

	AtmoDefaults()
	
	Sky:SetBlend(0.5, 255)
	Sky:CreateClouds(0, 0, 0)

	Ocean:SetWaves(0.008,0,0.05)	
	Ocean:SetColor(70,80,80,255)
	Ocean:SetFog(0.01,0)
	Ocean:SetLevel(3)
    Ocean:SetLayer(0, "test_ocean_relief_4.msh", 3.5, 0.0, 1.0)
    Ocean:SetLayer(1, "test_ocean_relief_4.msh", 4.5, 0.5, 1.1)

	AtmoSet{skyfog={2000,1.5}}
	AtmoSet{fog={0,100,0.5,800,0}}
	AtmoSet{layermoon={250,250,250}}
	AtmoSet{layersun={150,150,80}}

	Sky:LensflaresClear()
	Sky:LensflaresAdd("sky_lensflare",0.02, 0.5, 100, 50, 0, 30)
	Sky:LensflaresAdd("sky_lensflare",0.01, 0.8, 100, 150, 50, 30)
	Sky:LensflaresAdd("sky_lensflare",0.1, 1.5, 100, 150, 50, 20)
	Sky:LensflaresAdd("sky_lensflare",0.05, 1.7, 50, 50, 150, 25)

	-----------------------------------weather 0
	Atmosphere:WeatherActivate(0,0,0)
	Atmosphere:WeatherCloudLayer("sky_layer_cirrus.msh", 1.2, 0.25, 0.2)
	AtmoSetWeather(doscript("Weather0"))
        
	--------------------------- weather 1
	Atmosphere:WeatherActivate(1,0,0)
	Atmosphere:WeatherCloudLayer("sky_layer3.msh", 0.5, 0.3, 0.5)
	AtmoSetWeather(doscript("Weather1"))

	--------------------------- weather 2
	Atmosphere:WeatherActivate(2,0,0)
	Atmosphere:WeatherCloudLayer("sky_layer2.msh", 0.5, 0.2, 0.8)
	AtmoSetWeather(doscript("Weather2"))

	--------------------------- weather 3 (Lavafog)
	Atmosphere:WeatherActivate(3,0,0)
	Atmosphere:WeatherCloudLayer("sky_layer2.msh", 0.5, 0.2, 0.8)
	AtmoSetWeather(doscript("Weather3"))

	--------------------------- weather 4 (Lavafog Bright)
	Atmosphere:WeatherActivate(4,0,0)
	Atmosphere:WeatherCloudLayer("sky_layer3.msh", 1.2, 0.25, 0.2)
	AtmoSetWeather(doscript("Weather4"))

	--------------------------- weather 5 (Desertfog)
	Atmosphere:WeatherActivate(5,0,0)
	Atmosphere:WeatherCloudLayer("sky_layer3.msh", 0.5, 0.2, 0.8)
	AtmoSetWeather(doscript("Weather5"))

	--------------------------- weather 6 (Swampfog)
	Atmosphere:WeatherActivate(6,0,0)
	Atmosphere:WeatherCloudLayer("sky_layer3.msh", 0.5, 0.2, 0.5)
	AtmoSetWeather(doscript("Weather6"))

	--------------------------- weather 7 (Lavanight)
	Atmosphere:WeatherActivate(7,0,0)
	Atmosphere:WeatherCloudLayer("sky_layer2.msh", 0.5, 0.2, 0.8)
	AtmoSetWeather(doscript("Weather7"))

	Atmosphere:WeatherActivate(0,0,0)
	Atmosphere:SetNow()
end

function BigOcean()
	Ocean:SetWaves(0.008,0,0.05)	
	Ocean:SetColor(50,70,60,255)
	Ocean:SetFog(0.01,0)
	Ocean:SetLevel(11)
    Ocean:SetLayer(0, "landscape_ocean_test_2.msh", 0.5, 0.15, 2.0)
    Ocean:SetLayer(1, "landscape_ocean_test_4.msh", 1.5, 0.85, 2.1)
end

function LavaOcean()
	AtmoReload()
	Ocean:SetWaves(0.008,0,0.05)	
	Ocean:SetColor(12*16+11,7*16+7,2*16,255)
	Ocean:SetFog(0.002,0.1)
	Ocean:SetLevel(3)
    Ocean:SetLayer(0, "landscape_lake_gray.msh", 2.5, 0.25, 2.0)
    Ocean:SetLayer(1, "landscape_lake_gray.msh", 2.4, 0.75, 2.1)
end

function LavaOcean2()
	AtmoReload()
	Ocean:SetWaves(0.008,0,0.05)	
	Ocean:SetColor(160,80,0,255)
	Ocean:SetFog(0.003,0.05)
	Ocean:SetLevel(3)
    Ocean:SetLayer(0, "test_ocean_relief_4.msh", 3.5, 0.0, 0.5)
    Ocean:SetLayer(1, "test_ocean_relief_4.msh", 3.5, 0.5, 0.5)
end

function AtmoReload()
	doscript("conweatherinit")
	AtmoInit()
end

function AtmoDefaults()
	Ocean:SetFogFar(1000)
	
	Sky:SetColor(kDrwSkySun, kDrwColorDiffuse, 0,0,0,255)
	Sky:SetColor(kDrwSkySun, kDrwColorEmissive, 255,255,255,255)

	Sky:SetColor(kDrwSkyMoon, kDrwColorDiffuse, 0,0,0,255)
	Sky:SetColor(kDrwSkyMoon, kDrwColorEmissive, 255,255,255,255)

	Sky:SetColor(kDrwSkyCloud, kDrwColorDiffuse, 0,0,0,100)
	Sky:SetColor(kDrwSkyCloud, kDrwColorEmissive, 150,150,150,255)

	Sky:SetColor(kDrwSkyMoonAura, kDrwColorDiffuse, 0,0,0,100)
	Sky:SetColor(kDrwSkyMoonAura, kDrwColorEmissive, 100,100,200,255)

	Sky:SetColor(kDrwSkyStar, kDrwColorDiffuse, 0,0,0,255)
	Sky:SetColor(kDrwSkyStar, kDrwColorEmissive, 255,255,255,255)

	Sky:SetColor(kDrwSkyLayer, kDrwColorDiffuse, 240,250,255,255)
	Sky:SetColor(kDrwSkyLayer, kDrwColorSpecular, 255,255,240,255)
end

function AtmoSetWeather(weather)
	for index, atmo in weather do
		tDump = {}
		if type(atmo) == "string" then
			Atmosphere:WeatherNameSet(atmo)
			tinsert(tDump, atmo)
		else
			if type(atmo.angle) ~= "table" then
				print("atmo error: angle must be passed as table")
				break
			end
			
			for iIndex, Entry in atmo.angle do
				tinsert(tDump, Entry)
				Atmosphere:SetAngle(Entry)
				AtmoDefaults()
				AtmoSet(atmo)
				Atmosphere:SaveAngle()
			end
		end
	end
end

function AtmoSet(params)
	-- Einstellungen für diesen Winkel, 0=360=Sonne geht auf, 180 = Sonne geht unter
	if type(params.angle) == "number" then
		Atmosphere:SetAngle(params.angle)
	end

	foreach(params, function(name, value)
		
		-- Einfluss der Winkel Ebene zur Sonne, vergleichbar mit "Specular Light"
		if name=="bump"				then	Lightmap:BumpContrast(value[1], value[2])
		
		-- Gesamthelligkeit für die Map
		elseif name=="brightness"	then	Lightmap:Brightness(value[1])

		-- Weichheit der Schattenränder
		elseif name=="blur"			then	Lightmap:ShadowBlur(value[1])

		-- Einfluss von direktem Sonnenlicht in Vergleich zu diffusem Himmelslicht
		-- Minus und Plus schaltet zwischen zwei Algorhithmen, hier nur (-}, verwenden
		elseif name=="ratio"		then	Lightmap:SunSkyRatio(value[1])
	
		-- Sonnen und Himmelsfarbe für die Berechnung der Landschaftsbeleuchtung
		elseif name=="mapsun"		then	Lightmap:SunColor(value[1],value[2],value[3])	 
		elseif name=="mapsky"		then	Lightmap:SkyColor(value[1],value[2],value[3])	 

		-- Himmelsfarben für die Kuppel, hellster und dunkelster Punkt, diametral gegenüberliegend
		elseif name=="skysun"		then	Sky:SetColor(kDrwSkyBack, kDrwColorSpecular,  value[1],value[2],value[3], 255)	 
		elseif name=="skymoon"		then	Sky:SetColor(kDrwSkyBack, kDrwColorDiffuse, value[1],value[2],value[3], 255)	 
		
		-- dasselbe für den Cloud-Layer
		elseif name=="layermoon"	then	Sky:SetColor(kDrwSkyLayer, kDrwColorDiffuse, value[1],value[2],value[3], 255)  
		elseif name=="layersun"		then	Sky:SetColor(kDrwSkyLayer, kDrwColorSpecular, value[1],value[2],value[3], 255)   

		-- Farben für Objektbeleuchtung. 
		elseif name=="ambient"		then	Illumination:SetAmbientLight(0, value[1],value[2],value[3])	 
		elseif name=="directed"		then	Illumination:SetDirectedLightColor(value[1],value[2],value[3])  

		-- Fog-Parameter: Distanzen, Farbe, und Höhe und Dichte für Horizont
		elseif name=="fog"			then	Render:SetFogDensity(value[1],value[2],value[3],value[4],value[5])  
		elseif name=="fogcolor"		then	Render:SetFogColor(value[1],value[2],value[3])  
		elseif name=="skyfog"		then	Sky:SetFog(value[1],value[2])  
		elseif name=="oceanfog"		then	Ocean:SetFogFar(value[1])  

		-- Einstellungen für Himmelskörper
		elseif name=="sun"			then	Sky:SetColor(kDrwSkySun, kDrwColorEmissive, value[1],value[2],value[3],value[4])   
		elseif name=="star"			then	Sky:SetColor(kDrwSkyStar, kDrwColorDiffuse, 0,0,0,value[1])   
		elseif name=="moonaura"		then	Sky:SetColor(kDrwSkyMoonAura, kDrwColorEmissive, value[1],value[2],value[3], 255)   
		elseif name=="moon"			then	Sky:SetColor(kDrwSkyMoon, kDrwColorEmissive, value[1],value[2],value[3], 255)   

		elseif name ~= "angle" then print(name, "unknown")
		end
	end)
end


AtmoShortcutAngle = 0
AtmoShortcutBuffer = 0

function AtmoAngle(param)
	Atmosphere:TimeLock(1)

	if type(param) == "number" then 
		Atmosphere:SetAngle(params.angle)
		return
	end

	if type(param) ~= "string" then 
		return
	end

	if param == "Set" then
		AtmoShortcutAngle = AtmoShortcutBuffer
		AtmoShortcutBuffer = 0
	elseif param == "+" then
		AtmoShortcutAngle = AtmoShortcutAngle + 1
	elseif param == "-" then
		AtmoShortcutAngle = AtmoShortcutAngle - 1
	else
		AtmoShortcutBuffer = AtmoShortcutBuffer * 10 + tonumber(param)
		return
	end

	print("sunangle -> ", AtmoShortcutAngle)
	Atmosphere:SetAngle(AtmoShortcutAngle)
end

function AtmoWeather(weather,time)
	if (weather >= 0 and weather <= Atmosphere:WeatherMaxGet()) then
		print("WeatherSwitch", weather, time)
		Atmosphere:WeatherActivate(weather,time or 0, 1)
		Atmosphere:Refresh()
	end
end
