function LakesReload()
	doscript("conlakesinit")
	LakesInit()
end


function LakesInit()
	local _Lake

	_Lake = Lake.Water
--	_Lake:SetColor(30,100,180,255)
	_Lake:SetColor(50,60,255,200)

	--  SetWaves(density, amplitude, speed)
	_Lake:SetWaves(1.0,0.1,0.1)	

	--  SetLayer(layernumber, meshname, scale, direction, speed)	
    _Lake:SetLayer(0, "landscape_lake_ripples_bright1.msh", 0.9, 0.75, 0.01)
    _Lake:SetLayer(1, "landscape_lake_ripples.msh", 1.0, 0.25, 0.0001)

	_Lake:SetEffect(EffectGetId("LakeWave"), 10.0, 20)

	_Lake = Lake.Swamp
	_Lake:SetColor(100,100,100,230)
	_Lake:SetWaves(2.5,0.01,0.2)	-- density, amplitude, speed   
    _Lake:SetLayer(0, "landscape_lake_ripples.msh", 1.0, 0.5, 0.8)
    _Lake:SetLayer(1, "landscape_lake_swamp2.msh", 1.1, 0, 0.1)


	_Lake:SetEffect(EffectGetId("SwampBlubb"), 10.0, 25)

	_Lake = Lake.Lava
	_Lake:SetColor(20,20,20,250)
	_Lake:SetWaves(2,0.05,0.2)	-- density, amplitude, speed   
    _Lake:SetLayer(1, "system_element_invis.msh", 1.0, 0.75, 1.3)
    _Lake:SetLayer(0, "landscape_lake_lava1.msh", 1.1, 0.25, 0.3)
	_Lake:SetEffect(EffectGetId("LavaFire"), 20.0, 25)

	_Lake = Lake.Ice
	_Lake:SetColor(240,240,230,230)
	_Lake:SetWaves(2.5,0,0.2)	-- density, amplitude, speed   
    _Lake:SetLayer(0, "landscape_lake_blue.msh", 0.5, 0, 0.5)
    --_Lake:SetLayer(1, "landscape_lake_blue.msh", 0.5, 0, 0.5)
    _Lake:SetLayer(1, "landscape_lake_ice.msh", 1.0, 0.5, 0)

	Lake:RecalculateData()
end
