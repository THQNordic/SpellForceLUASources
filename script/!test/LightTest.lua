function testsundown()
	Sky:SetSunAngle(0)
	Sky:SetZenithColor(0,50,200)
	Sky:SetHorizonColor(200,100,50)
	Illumination:SetAmbientLight(0, 60, 30, 50)
	Illumination:SetDirectedLight(0, 200, 150, 50)
end

function testsunset()
	Sky:SetSunAngle(3.1415)
	Sky:SetZenithColor(0,100,200)
	Sky:SetHorizonColor(180,160,140)
	Illumination:SetAmbientLight(0, 60, 50, 50)
	Illumination:SetDirectedLight(0, 200, 180, 150)
end

function testnight()
	Sky:SetSunAngle(1.5)
	Sky:SetZenithColor(0,0,0)
	Sky:SetHorizonColor(80,80,80)
	Illumination:SetAmbientLight(0, 0, 20, 60)
	Illumination:SetDirectedLight(0, 40, 40, 40)
end

function testnoon()
	Sky:SetSunAngle(1.5)
	Sky:SetZenithColor(0,100,200)
	Sky:SetHorizonColor(140,170,200)
	Illumination:SetAmbientLight(0, 80, 80, 80)
	Illumination:SetDirectedLight(0, 220, 220, 150)
end
