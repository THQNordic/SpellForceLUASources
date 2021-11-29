-------------------------------------------------------------------------- Star Burst for Monument
gParams.particles=17
NewMovie(gParams.particles)
--Translation{min={0,0,5}}
Rotation{axis="x", range=20}
Burst{radius2=0, particles=gParams.particles}
Scale{min=0.2, max={0.2,0.2,2}, trail=1}
Scale{min=2}
Color{min=1, max=0, trail=1, path=kDrwPathSine}
local starburst = NewObject{billboard=flics.circle, movie=pMovie, bone=kDrwBoneCrown}

LightMovie{offset={0,0,0}, size=2, deviation=0.15, color={0.5,0.5,0.5,0.5}}
local radiosity = Radiosity{movie=pMovie}

local starburst = NewObject{subobject={starburst, radiosity}}
EffectSave("StarBurst")

--------------------------------------------------------- monument claimed
if Claim == nil then
	Claim = {0,0,0,1}
end

function Pos(x,y,z,s)
	Claim = {x,y,z,s}
	ReloadEffects()
end

function ClaimPos()
	Translation{min={Claim[1], Claim[2], Claim[3]}}
	Scale{min=Claim[4]}
end


function MonumentClaim(params)
	local eye1			= params.eye1 or {0.2,1.9,8.65}
	local eye2			= params.eye2 or {-eye1[1], eye1[2], eye1[3]}
	local eyecolor		= params.eyecolor or {0.5,0.5,1,0.2}

	NewMovie()
	Translation{min=eye1}
	Scale{min=0.4}
	Color{min=eyecolor}
	local claim1 = NewObject{subobject=%starburst, movie=pMovie}

	NewMovie()
	Translation{min=eye2}
	Scale{min=0.4}
	Color{min=eyecolor}
	local claim2 = NewObject{subobject=%starburst, movie=pMovie}

	if (params.banner == 0) then
		return NewObject{subobject={claim1, claim2}, boundingradius=5}
	end

	local banner		= params.banner or flics.banner_human
	local banner1		= params.banner1 or {0,0,2}
	local banner2		= params.banner2 or {0,0,2}
	local bannerscale	= params.bannerscale or 1

	NewMovie()
	Translation{min=banner1}
	Animation{file="building_monument_flag_anim", range=3}
	Color{dim=kDrwDimPlayer}
	Scale{min=bannerscale}
	local ban1 = NewObject{skin=banner, movie=pMovie}

	NewMovie()
	Translation{min=banner2}
	Animation{file="building_monument_flag_anim", range=3.1}
	Color{dim=kDrwDimPlayer}
	Scale{min=bannerscale}
	local ban2 = NewObject{skin=banner, movie=pMovie}
	
	return NewObject{subobject={ban1, ban2, claim1, claim2}, boundingradius=5}
end


function MonumentActive(params)
	local eye1			= params.eye1 or {0.2,1.9,8.65}
	local eye2			= params.eye2 or {-eye1[1], eye1[2], eye1[3]}
	local eyecolor		= params.eyecolor or {0.4,0.4,1,0.7}
						
	local smokecolor1	= params.smokecolor1 or {0.3,0.6,1,0}
	local smokecolor2	= params.smokecolor2 or {0.5,0.7,1,1}
	local smokeoffset	= params.smokeoffset or {0,-1.6,0}
	local angle			= params.angle or 160
	local angle2		= params.angle2 or 0

	local weldonly		= params.weldonly

	NewMovie()
	Rotation{axis="z", min=angle2, direction=0}
	Rotation{axis="x", min=angle, direction=0}
	Scale{min={0.1,0.1, 10}}
	Scale{min=0, max=1, range=0.5, play=kDrwPlayClamped}
	Color{min=eyecolor, max=eyecolor[4] + 0.2, range=5, path=kDrwPathRandom}
	local beam = NewObject{mesh=flics.cylinder_stripes, movie=pMovie}

	NewMovie()	
	Translation{min=eye1}
	Scale{min=0, max=1, range=0.5, play=kDrwPlayClamped}
	local beam1 = NewObject{subobject=beam, movie=pMovie}

	NewMovie()	
	Translation{min=eye2}
	Scale{min=0, max=1, range=0.5, play=kDrwPlayClamped}
	local beam2 = NewObject{subobject=beam, movie=pMovie}

	Smoke{particles=22, velocity={5,0,6}, time=3, gravity={-8,0,1}, color1 = smokecolor2, color2 = smokecolor1, colorplay=0}
	Scale{min=1}
	Scale{min=0, max=1, start=0.5, range=0.5, play=kDrwPlayClamped}
	local smoke = NewObject{billboard=flics.smoke, movie=pMovie}

	NewMovie(13)
	Throw{particles=13, velocity={0,0,6}, time=5}
	Burst{particles=13, time=5}--, velocity={1,0,5}}
	Scale{min=0.1}
	--FadeScale{}
	local fountain = NewObject{billboard=flics.hypno[4], movie=pMovie}

	NewMovie()
	Translation{min=smokeoffset}
	Scale{min={1,1,0}, max=1, start=0, range=1, play=kDrwPlayClamped}
	local weld = NewObject{subobject={smoke, fountain}, movie=pMovie}

	if (weldonly ~=nil) then
		return weld
	end

	return NewObject{subobject={beam1, beam2, weld}, boundingradius=5}
end


MonumentClaim{banner1 = {2.9,-4.4,4.2}, banner2 = {-2.9,-4.4,4.2}}
EffectSave("HumanMonumentClaimed")
MonumentActive{}
EffectSave("HumanMonumentActive")

MonumentActive{eyecolor={1,1,1,0}, eye1={0,0,-1}, eye2={0,0,-1}}
EffectSave("BindstoneActive")

MonumentClaim{banner=flics.banner_elf, banner1 = {1.85,-3.2,2.45}, banner2 = {-1.9,-3.2,2.45}, eye1={0.3,1.9+0.15,6.65-0.9}, eye2={0.05,1.9+0.15,6.65-0.9}, eyecolor={0.6,0.8,0.3,0.15}}
EffectSave("ElfMonumentClaimed")
MonumentActive{angle=155, eye1={0.3,1.9+0.15,6.65-0.9}, eye2={0.05,1.9+0.15,6.65-0.9}, eyecolor={0.6,0.8,0.3,0.65}, smokecolor1={0.6,0.8,0.3,0}, smokecolor2={0.6,0.8,0.3,0.5}, smokeoffset={0,-1,0}}
EffectSave("ElfMonumentActive")

MonumentClaim{banner=flics.banner_orc, banner1 = {1.85,-3.2,2.55}, banner2 = {-1.9,-3.2,2.55}, eye1={0.21,2.5+0.85,4.65}, eye2={-0.18,2.5+0.90,4.65}, eyecolor={1,0.6,0.3,0.2}}
EffectSave("OrcMonumentClaimed")
MonumentActive{angle=140, smokeoffset={0,0,0}, eye1={0.21,2.5+0.85,4.65}, eye2={-0.18,2.5+0.90,4.65}, eyecolor={1,0.6,0.3,0.6}, smokecolor1={1,0.6,0.3,0}, smokecolor2={1,0.6,0.3,0.6}}
EffectSave("OrcMonumentActive")

MonumentClaim{banner=flics.banner_dwarf, banner1 = {1.45,-3.45,1.45}, banner2 = {-1.3,-3.45,1.45}, eye1={0.15,1.9-0.2,6.65-2.7}, eyecolor={0.3,0.8,0.8,0.15}}
EffectSave("DwarfMonumentClaimed")
MonumentActive{angle=140, smokeoffset={0,-1.7,0}, eye1={0.15,1.9-0.2,6.65-2.7}, eyecolor={0.3,0.8,0.8,0.65}, smokecolor1={0.3,0.8,0.8,0}, smokecolor2={0.3,0.8,0.8,0.7}}
EffectSave("DwarfMonumentActive")

MonumentClaim{banner=flics.banner_troll, bannerscale =0.8, banner1 = {1.92,-3,1.95}, banner2 = {-1.75,-3.2,1.95}, eye1={0.3,1.9-1.2,6.65-2.6}, eye2={-0.1,1.9-1.2,6.65-2.6}, eyecolor={1,0.2,0.1,0.25}}
EffectSave("TrollMonumentClaimed")
MonumentActive{angle=157, smokeoffset={0,-1.1,0}, eye1={0.3,1.9-1.2,6.65-2.6}, eye2={-0.1,1.9-1.2,6.65-2.6}, eyecolor={1,0.2,0.1,0.65}, smokecolor1={1,0.3,0.3,0}, smokecolor2={1,0.30,0.30,0.7}}
EffectSave("TrollMonumentActive")

MonumentClaim{banner=flics.banner_darkelf, bannerscale=0.8, banner1 = {2,-4,2.65}, banner2 = {-2,-4,2.65}, eye1={0,1.55,5.1}, eye2={-0.2,1.55,5.1}, eyecolor={1,0.2,1,0.15}}
EffectSave("DarkelfMonumentClaimed")
MonumentActive{angle=147, smokeoffset={0,-2,0}, eye1={0,1.55,5.1}, eye2={-0.2,1.55,5.1}, eyecolor={1,0.2,1,0.65}, smokecolor1={1,0.3,1,0}, smokecolor2={1,0.3, 1,0.4}}
EffectSave("DarkelfMonumentActive")


local hero1 = MonumentActive{angle=145, angle2=-10, smokeoffset={0.3,-1,0}, eye1={0.9,4.2,7.35}, eye2={1.2,4.2,7.35}, eyecolor={1,1,1,0.8}, smokecolor1={1,1,1,0}, smokecolor2={1,1,1,0.4}}
local hero2 = MonumentActive{angle=145, angle2=10, smokeoffset={-0.3,-1,0}, eye1={-0.9,4.5,7.3}, eye2={-1.17,4.5,7.3}, eyecolor={1,1,1,0.8}, smokecolor1={1,1,1,0}, smokecolor2={1,1,1,0.4}}
NewObject{subobject={hero1, hero2}, boundingradius=5}
EffectSave("HeroMonumentActive")


local particle = CombineParticles{ratio=0.4, flic1=flics.smoke, color1={1,0.3,0,0.8}, color2={1,0.8,0.6,1}}
Fire{size=0.5, path=kDrwPathParabola, particles=11, color1=0.8, color2=0, ground=0.2, width=0.3, top=0.2, size1=3.5, size2=0.5, height=3}
--Fire{ground=0, size1=3, path=kDrwPathParabola}
local MonumentFire = NewObject{subobject=particle, movie=pMovie}

local MonFire = {}
NewMovie()
Translation{min={3.9,0.9,1}}
MonFire[1] = NewObject{subobject=MonumentFire, movie=pMovie}
NewMovie()
Translation{min={3.5,2.1,1.2}}
MonFire[2] = NewObject{subobject=MonumentFire, movie=pMovie}
NewMovie()
Translation{min={2.5,3.1,1.4}}
MonFire[3] = NewObject{subobject=MonumentFire, movie=pMovie}
NewMovie()
Translation{min={-3.8,0.9,1}}
MonFire[4] = NewObject{subobject=MonumentFire, movie=pMovie}
NewMovie()
Translation{min={-3.4,2.1,1.2}}
MonFire[5] = NewObject{subobject=MonumentFire, movie=pMovie}
NewMovie()
Translation{min={-2.4,3.1,1.4}}
MonFire[6] = NewObject{subobject=MonumentFire, movie=pMovie}

MonFire[7] = MonumentClaim{banner=flics.banner_hero, banner1 = {3.1,-4, 3.7}, banner2 = {-2.95,-4, 3.7}, eye1={0.9,4.2,7.35}, eye2={1.2,4.2,7.35}, eyecolor={1,1,1,0.15}}
MonFire[8] = MonumentClaim{banner=0, eye1={-0.9,4.2,7.2}, eye2={-1.17,4.2,7.2}, eyecolor={1,1,1,0.1}}

NewObject{subobject=MonFire, boundingradius=5}
EffectSave("HeroMonumentClaimed")



NewMovie(6)
Rotation{axis="y", dim=kDrwDimParticle}
Translation{min={0.5,0,0}}
Rotation{axis="y", dim=kDrwDimParticle, path=kDrwPathRandom}
Scale{min=0.3, max=1.2, path=kDrwPathCosine, play=kDrwPlayBounce, trail=1, range=2}
Color{min={1,1,0.3,0.1}, max={1,0.5,0.4,0.2}, dim=kDrwDimRandom}
local star = NewObject{mesh=flics.star_halo, movie=pMovie}

NewMovie()
Rotation{axis="y", dim=kDrwDimParticle}
--Translation{min={0.4,0,0}}
Rotation{axis="y",min=45, direction=0}
Color{min={1,1,0.3,0.2}, max={1,0.5,0.4,0.4}, path=kDrwPathRandom, range=0.2}
local square = NewObject{mesh=flics.diamond, movie=pMovie}

NewMovie(4)
Translation{min={0.48,0,1.4}}
Rotation{min=43, direction=0}
Scale{min={0.85, 1, 1.2}}
Rotation{dim=kDrwDimParticle}
Translation{min={0.67, 0,0}}
Rotation{min=90, direction=0}
Scale{min=0.7}
NewObject{subobject={square, star}, movie=pMovie}
EffectSave("MonumentBind")



local spawnpoint = MonumentActive{smokeoffset={0,0,0.6}, smokecolor1={1,0,0,0}, smokecolor2={1,1,1,0.3}, weldonly=1}
EffectSave("SpawnPointActive")


---------------------------------------------------- Titan spawn
NewMovie()
Translation{min={0,0,-2}}
Scale{min=1.5}
spawnpoint = NewObject{subobject=spawnpoint, movie=pMovie}

NewMovie()
Animation{file="figure_titan_human_idle", range=6}
Color{min={0,0,0,0.3}}
Translation{min={0,0,-2}}
Rotation{range=16}
local titan = NewObject{skin=flics.titan_human, movie=pMovie}

NewMovie()
Translation{min={2,0,5}}
local fig = NewObject{subobject={titan, spawnpoint}, movie=pMovie}

NewObject{subobject=fig, mesh="building_human_main3"}
EffectSave("HumanTitan")


NewMovie()
Animation{file="figure_titan_dwarf_walk", range=6}
Color{min={0,0,0,0.2}}
Rotation{range=16}
local titan = NewObject{skin=flics.titan_dwarf, movie=pMovie}

NewMovie()
Translation{min={0,1,5.3}}
local fig = NewObject{subobject={titan, spawnpoint}, movie=pMovie}
EffectSave("DwarfTitan")

--NewObject{subobject=fig, mesh="building_dwarf_headquarter_large"}



NewMovie()
Animation{file="figure_titan_elf_attackspecial1", range=6}
Color{min={0,0,0,0.5}}
Rotation{range=16}
local titan = NewObject{skin=flics.titan_elf, movie=pMovie}

NewMovie()
Translation{min={-2.8,0.6,2}}
local fig = NewObject{subobject={titan, spawnpoint}, movie=pMovie}
EffectSave("ElfTitan")

--NewObject{subobject=fig, mesh="building_elf_headquarter_large"}



NewMovie()
Animation{file="figure_titan_darkelf_walk", range=6}
Color{min={0,0,0,0.2}}
Rotation{range=16}
local titan = NewObject{skin=flics.titan_darkelf, movie=pMovie}

NewMovie()
Translation{min={0,0,5}}
local fig = NewObject{subobject={titan, spawnpoint}, movie=pMovie}
EffectSave("DarkelfTitan")

--NewObject{subobject=fig, mesh="building_darkelf_headquarter_large"}



NewMovie()
Animation{file="figure_titan_orc_idle", range=6}
Color{min={0,0,0,0.2}}
Rotation{range=16}
local titan = NewObject{skin=flics.titan_orc, movie=pMovie}

NewMovie()
Translation{min={0.3,-1.3,5}}
local fig = NewObject{subobject={titan, spawnpoint}, movie=pMovie}
EffectSave("OrcTitan")

--NewObject{subobject=fig, mesh="building_orc_headquarter_large"}



NewMovie()
Animation{file="figure_titan_troll_walk", range=6}
Color{min={0,0,0,0.2}}
Rotation{range=16}
local titan = NewObject{skin=flics.titan_troll, movie=pMovie}

NewMovie()
Translation{min={0.3,-1.3,4}}
local fig = NewObject{subobject={titan, spawnpoint}, movie=pMovie}
EffectSave("TrollTitan")

--NewObject{subobject=fig, mesh="building_troll_headquarter_large"}



------------------------- Addon2 Heads

local head = NewObject{mesh=flics.head_small}

NewMovie()
Translation{min={0,-0.6,0.6}, max={0,-0.4,0.6}, play=kDrwPlayBounce, path=kDrwPathCosine, range=2.2}
Rotation{min=-15, max=15, play=kDrwPlayBounce, path=kDrwPathCosine, direction=-0, range = 0.9}
Animation{file="effect_tongue", range=2.3, trail=1}
local tongue = NewObject{skin=flics.head_tongue, movie=pMovie}

NewObject{subobject = {head, tongue}}
EffectSave("Tongue")


local head = NewObject{mesh=flics.head_large}
local light = NewObject{light=NewLight(gNoMove, {Att1 = 0, Att2 = 2.5})}

NewMovie(3)
Translation{min={0,1,0}}
Rotation{axis="x", min=-15, max=15, play=kDrwPlayBounce, path=kDrwPathCosine, direction=-0, range = 0.9}
Rotation{range=0.3, trail=1, range=100, dim=kDrwDimRandom}--min=-15, max=15, play=kDrwPlayBounce, path=kDrwPathCosine, direction=-0, range = 0.9}
Translation{min={2,0,3.5}}
Color{min={1,0,0,1}}
--Animation{file="effect_tongue", range=2.3, trail=1}
local lighting = NewObject{ subobject=light, movie=pMovie}

NewMovie()
Translation{min={0.8,-1.4,3.8}}
Scale{min=0.3}
Color{min={1,0,0,1}}
local eye1 = NewObject{subobject=starburst, movie=pMovie}

NewMovie()
Translation{min={-0.8,-1.4,3.8}}
Scale{min=0.3}
Color{min={1,0,0,1}}
local eye2 = NewObject{subobject=starburst, movie=pMovie}

NewObject{subobject = {head, lighting, eye1, eye2}}
EffectSave("Head")
