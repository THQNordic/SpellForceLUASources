gWeaponEffect = 0
bWeaponMove = 0

function WeaponEffect(weapon, effect, offset)
	WeaponEffects = {"WeaponStaticGlow", "WeaponTrail", "WeaponIceBlade", "WeaponSparkBlade", "WeaponFireBlade", "WeaponFlashBlade", "WeaponBlackBlade"}

	if weapon then
		Weapon(weapon)
	end

	if type(effect) == "string" then
		AttachEffect(660, effect, offset)
		return
	end

	if (effect ~= nil) then
		gWeaponEffect = effect
		bWeaponMove = not bWeaponMove
		if bWeaponMove then
			DrwSetTestJob(kGdJobStrike)
		else
			DrwSetTestJob(-1)
		end
	else
		if gWeaponEffect == nil then gWeaponEffect=0 end
		gWeaponEffect = gWeaponEffect + 1
	end

	if ((gWeaponEffect > getn(WeaponEffects)) or (gWeaponEffect < 1)) then
		gWeaponEffect = 1
	end

	AttachEffect(660, WeaponEffects[gWeaponEffect], offset)
end


----------------------------------------------------------------- Fire Dragon Hammer
Fire{time=1, buffer=0.2, particles=22, size1=1, size2=0.4, ground=0, width=0.3, top=0.1, size=0.2, height=2, color1={1,0.7,0.2,0.8}, color2={1,0.1,0.2,0.1}, path=kDrwPathParabola}
local fire = NewObject{billboard=flics.solar, movie=pMovie, restriction=kDrwCsWorld}

NewMovie()
Rotation{min=90, direction=0}
local hammer = NewObject{mesh="equipment_weapon_hammer_flame", movie=pMovie}

NewMovie(2)
Translation{min={-0.05,0,0.5}}
Rotation{dim=kDrwDimParticle}
Translation{min={0,0.11,0}}
local flames = NewObject{subobject=fire, movie=pMovie}
EffectSave("WeaponDragonHammer")

NewObject{subobject={flames, hammer}}

----------------------------------------------------------------- FireSword
Fire{time=1, particles=22, size1=1, size2=0, ground=0, width=0.03, top=0, height=1, color1={1,0.7,0.2,0.8}, color2={1,0.1,0.2,0.8}, path=kDrwPathParabola}
GlobalTrail{range=0.05, trail=-2}
local flame = NewObject{billboard=flics.fire, movie=pMovie}

LightMovie{offset={0,0,0.5}, color={0.5,0.3,0,0.1}, size=1.5}
local radiosity = Radiosity{movie=pMovie}
NewObject{subobject={flame, radiosity}}

EffectSave("WeaponFireSword")

Fire{time=1, particles=22, size1=0.25, size2=0.1, ground=0, width=0.03, top=0, height=1, color1={1,0.7,0.2,0.8}, color2={1,0.1,0.2,0.8}, path=kDrwPathParabola}
GlobalTrail{buffer=0.1, range=1, trail=1}
local flame = NewObject{billboard=flics.smoke, movie=pMovie}

NewObject{subobject={flame, radiosity}}
EffectSave("WeaponFireSword2")

NewMovie()
Scale{min=3}
NewObject{subobject={flame, radiosity}, movie=pMovie}
EffectSave("WeaponFireSwordZhuul")

----------------------------------------------------------------- hypnotize
NewMovie(14)
GlobalTrail{buffer=0.3, range=0.3,trail=1}
Burst{particles=14, radius1=0.1, radius2=0.1}
Color{min={1,0.5,0,0.8}, max={1,0.1,1,0.8}, play=kDrwPlayBounce, trail=4.42}
Rotation{range=3, dim=kDrwDimTimeAbsolute}
Rotation{axis="y", range=2, trail=13.6, dim=kDrwDimTimeAbsolute}
Rotation{axis="z", range=3, trail=17, dim=kDrwDimTimeAbsolute}
Translation{min={0.1,0.1,0.1}}
Scale{min={0.1,0.1,0.1}}
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
 
NewObject{billboard=flics.hypno, movie=pMovie}
EffectSave("WeaponHypnotize")

---------------------------------------------------------------------- test
gParams={particles=20, radius1=0.05, radius2=0.15,trail=3}
pMovie=NewMovie(gParams.particles)
Scale{min=0.3}
Sphere(gParams)
Color{min={0.5,0,0.5,1}} 
Scale{min=0.2}
local blackcircle = NewObject{billboard=flics.circle, movie=pMovie, restriction=kDrwCsResetRotation}

LightMovie{offset={0,0,0}, color={0.9,0,0,0.3}, size=1}
local radiosity = Radiosity{movie=pMovie}

NewObject{subobject={blackcircle, radiosity}}
EffectSave("WeaponBlackCircle")

--------------------------------------------------------------------- fire
Fire{time=1, buffer=0.2, particles=22, size1=0.5, size2=0.6, ground=0.2, width=0.6, top=0.2, size=0.4, height=2, color1={1,0.7,0.2,0.8}, color2={1,0.1,0.2,0.1}}
NewObject{billboard=flics.smoke, movie=pMovie, restriction=kDrwCsWorld}
EffectSave("WeaponFire")

-------------------------------------------------------------------- trail
NewMovie(16)
GlobalTrail{range=0.12, trail=1}
Color{min={1,1,1,0.5}, max={1,1,1,0.1}, range=0.08, trail=1, path=kDrwPathParabola}
Scale{min=0.95}
NewObject{mesh="equipment_weapon_katana", movie=pMovie}
EffectSave("WeaponTrail")


--------------------------------------------------------------------- glow
function WeaponGlow(params)
	particles		=	params.particles or 20
	color			=	params.color or {1,1,1,0.35}
	offset			=	params.offset or {0,0,0.2}
	length			=	params.length or {0,0,0.8}
	path			=	params.path or kDrwPathNegParabola
	size			=	params.size or 0.2

	NewMovie(particles)
	Color{min=color}
	Translation{min=offset, max=length, dim=kDrwDimParticle, path=path}
	Scale{min=size}
	Scale{min=1, max=0.1, dim=kDrwDimParticle, path=kDrwPathParabola}
	Scale{min=0.9, max=1.1, path=kDrwPathRandom, range=10, trail=-0.5}
end

WeaponGlow{particles=20, color=0.2}
NewObject{billboard=flics.circle, movie=pMovie}
EffectSave("WeaponStaticGlow")

-----------------------------------------------------------------------shield
NewMovie(3)
Choose{dim=kDrwDimParticle}
Color{min=1, max=0, range=1, trail=1}
Translation{min={0,0,0.6}}
Rotation{dim=kDrwDimParticle}
Scale{min={0,0,0.5}, max={0.3,0.3,0.5}, range=1, trail=1}
NewObject{mesh=flics.fireshield, movie=pMovie}
EffectSave("WeaponShield")


-------------------------------------------------------------- fire blade
Fire{time=1, particles=11, size=0.4, size1=0.3, size2=0.2, ground=0.1, width=0.2, top=0.1, height=1, color1={1,0.6,0.4,1}, color2={1,0.1,0,0.1}}
GlobalTrail{range=0.02, trail=1}
local flame = NewObject{billboard=flics.smoke, movie=pMovie, restriction=kDrwCsWorld}

NewMovie(4)
Translation{min={0,0,0.3}, max={0,0,1}, dim=kDrwDimParticle}
local flames = NewObject{subobject=flame, movie=pMovie}

WeaponGlow{particles=10, color={1,0.5,0,0.4}}
local glow = NewObject{billboard=flics.circle, movie=pMovie}

LightMovie{offset={0,0,0.5}, color={0.5,0.3,0,0.1}, size=1.5}
local radiosity = Radiosity{movie=pMovie}

NewObject{subobject={glow, flames, radiosity}}
EffectSave("WeaponFireBlade")

NewMovie(6)
Translation{min={0,0,0.4}, max={0,0,1.6}, dim=kDrwDimParticle}
local flames = NewObject{subobject=flame, movie=pMovie}

NewObject{subobject={glow, flames, radiosity}}
EffectSave("WeaponFireBladeLong")

-------------------------------------------------------------- spark blade
gParams={particles=11, radius1=0, radius2=0.2, time=1}
NewMovie(11)
Burst(gParams)
Scale{min=0.05}
Color{min=0, max=0.5, range=gParams.time/2, path=kDrwPathCosine, play=kDrwPlayBounce, trail=2}
GlobalTrail{range=0.2, trail=1}
local burst = NewObject{billboard=flics.star6point, movie=pMovie, restriction=kDrwCsWorld}

NewMovie(3)
Translation{min={0,0,0.3}, max={0,0,1}, dim=kDrwDimParticle}
local bursts = NewObject{subobject=burst, movie=pMovie}


WeaponGlow{particles=5, color={0.5,0.5,0.6,0.6}}
local glow = NewObject{billboard=flics.star_halo, movie=pMovie}

LightMovie{offset={0,0,0.5}, color={0.7,0.7,0.8,0.1}, size=2}
local radiosity = Radiosity{movie=pMovie}

NewObject{subobject={glow, bursts, radiosity}}
EffectSave("WeaponSparkBlade")

-------------
LightMovie{color={0.7,0.7,0.8,0.3}, size=0.8, deviation=0.05}
local radiosity = Radiosity{movie=pMovie, billboard=flics.lightblend1}

gParams={particles=11, radius1=0.2, radius2=0.4, time=0.5, trail=1}
NewMovie(11)
Burst(gParams)
Scale{min=0.1}
Color{min=0.5, max=0, range=gParams.time, trail=1}
GlobalTrail{buffer=gParams.time, range=gParams.time, trail=1}
local burst = NewObject{billboard=flics.star6point, movie=pMovie, restriction=kDrwCsWorld}

NewObject{subobject={burst, radiosity}}
EffectSave("WeaponSparkStaff")

-------------------------------------------------------------- ice blade
gParams={particles=7, offset={0,0,0}, growth=3, time=1.5, velocity={0.3,0,0.7}, gravity={0,0,-1.5}, color1={0.2,0.5,1,0}, color2={0.6,0.8,1,0.5}}
Smoke(gParams)
Scale{min=0.1}
GlobalTrail{range=1.5, trail=1}--, path=kDrwPathParabola}
local smoke = NewObject{billboard=flics.circle, movie=pMovie, restriction=kDrwCsWorld}

NewMovie(3)
Translation{min={0,0,0.3}, max={0,0,1.2}, dim=kDrwDimParticle}
local smokes = NewObject{subobject=smoke, movie=pMovie}

WeaponGlow{particles=10, color={0,0.5,1,0.3}, length={0,0,1}}
local glow = NewObject{billboard=flics.circle, movie=pMovie}

gParams={particles=5, radius1=0.1, radius2=0.5, time=0.5, color2={0.2,0.5,1,0}, color1={0.6,0.8,1,1}}
NewMovie(5)
Rotation{range=6.5}
Burst(gParams)
Color{min=gParams.color1, max=gParams.color2, range=gParams.time, trail=1}
Scale{min=0.1}
GlobalTrail{range=gParams.time, trail=1}
local crystal = NewObject{billboard=flics.flare, movie=pMovie, restriction=kDrwCsWorld}

NewMovie()
Translation{min={0,0,0.2}, max={0,0,1}, play=kDrwPlayBounce, range=0.7}
local crystals = NewObject{subobject=crystal, movie=pMovie}

NewMovie()
Translation{min = {0,0,0.5}}
Color{min={0,0.3,0.5,1}}
Scale{min=0.99, max=1.01, range=1, path=kDrwPathRandom}
local light = NewLight(pMovie, {Att1 = 0, Att2 = 2.5})

local iceblade = NewObject{subobject={glow, smokes, crystals}, light=light}
EffectSave("WeaponIceBlade")


NewMovie(3)
Translation{min={0,0,0.3}, max={0,0,0.8}, dim=kDrwDimParticle}
local smokes = NewObject{subobject=smoke, movie=pMovie}

NewObject{subobject={smokes, crystals}, light=light}
EffectSave("WeaponIceClub")

NewMovie()
Scale{min=0.6}
NewObject{subobject=iceblade, movie=pMovie}
EffectSave("WeaponIceBladeShort")

NewMovie()
Scale{min=0.8}
local ice = NewObject{subobject={smoke, crystal}, light=light, movie=pMovie}
EffectSave("WeaponIceStaff")

NewObject{subobject={crystals}, light=light}
EffectSave("WeaponIceCrystals")
----------------------------------
LightMovie{offset={0,0,0}, color={0.5,0.3,0,0.5}, size=1.1}
local radiosity = Radiosity{movie=pMovie}

Fire{time=1, particles=11, size=0.8, size1=0.9, size2=0.5, ground=0.2, width=0.1, top=-0.1, height=0.5, color1={1,0.7,0.4,1}, color2={1,0.1,0,0.1}, path=kDrwPathParabola}
GlobalTrail{range=0.1, trail=2}
local flame = NewObject{billboard=flics.smoke, movie=pMovie, restriction=kDrwCsWorld}

NewObject{subobject={flame, radiosity}}
EffectSave("WeaponFireStaff")

----------------------------------
LightMovie{offset={0,0,0}, color={0.7,0,0,0.3}, size=0.8}
local radiosity = Radiosity{movie=pMovie}

Fire{time=1, particles=11, size=0.8, size1=0.9, size2=0.5, ground=0.2, width=0.1, top=-0.1, height=1, color1={1,0.6,0.1,1}, color2={1,0.1,0,0.1}, path=kDrwPathParabola}
GlobalTrail{range=0.1, trail=2}
local flame = NewObject{billboard=flics.smoke, movie=pMovie, restriction=kDrwCsWorld}

NewObject{subobject={flame, radiosity}}
EffectSave("WeaponFireHammer")

----------------------------------- Fire & Ice

Fire{time=1, particles=7, size=0.8, size1=0.9, size2=0.3, ground=0.1, width=0.1, top=-0, height=1, color1={1,0.6,0.1,1}, color2={1,0.1,0,0.1}, path=kDrwPathParabola}
GlobalTrail{buffer=0.2, range=1, trail=1}
local flame = NewObject{billboard=flics.smoke, movie=pMovie, restriction=kDrwCsWorld}


NewMovie(2)
Translation{max={-0.5,0,0}, dim=kDrwDimParticle}
Choose{dim=kDrwDimParticle}
NewObject{subobject={flame,ice}, movie=pMovie}
EffectSave("WeaponFireAndIce")

---------------------------------- IceFlame
LightMovie{offset={0,0,0}, color={0.5,0.5,0.7,0.3}, size=0.8}
local radiosity = Radiosity{movie=pMovie}

Fire{time=2, particles=11, size=0.8, size1=1.2, size2=0.1, ground=0.1, width=0.2, top=-0.1, height=-1, color1={0.2,0.3,1,1}, color2={0,0,0.5,0.1}, path=kDrwPathParabola}
GlobalTrail{buffer=0.1, range=2, trail=1}
local iceflame = NewObject{billboard=flics.sol_bg, movie=pMovie, restriction=kDrwCsWorld}

NewObject{subobject={iceflame, radiosity}}
EffectSave("WeaponIceFire")

----------------------
NewMovie(2)
Translation{max={-0.5,0,0}, dim=kDrwDimParticle}
Choose{dim=kDrwDimParticle}
NewObject{subobject={flame,iceflame}, movie=pMovie}
EffectSave("WeaponFireAndIce")


-------------------------------------------------------------- lightning

function WeaponFlash(params)
	particles		=	params.particles or 20
	flashcolor		=	params.flashcolor or {0.3,1,0.6,0.6}
	glowcolor		=	params.glowcolor or {0,0.3,1,0.3}
	lightcolor		=	params.lightcolor or {0.2,0.3,0.5,0.1}
	offset			=	params.offset or {0.05,0,0.2}
	size			=	params.size or 0.3
	flashes			=	params.flashes or 3
	glowparticles	=	params.glowparticles or 10
	lightpos		=	params.lightpos or {0,0,0.5}
	lightsize		=	params.lightsize or 1.5


	local flash1 = Lightning{range=0.3, flic=flics.simplelightning, mode=3}

	NewMovie(flashes)
	Choose{range=3, path=kDrwPathRandom}
	Rotation{dim=kDrwDimParticle}
	Translation{min=offset}
	Scale{min=size}
	Color{min=flashcolor, max=0.1, dim=kDrwDimRandom}
	local flash = NewObject{subobject={flash1, gNoEffect, gNoEffect}, movie=pMovie}

	WeaponGlow{particles=glowparticles, color=glowcolor}
	Scale{min=0.5, max=1, range=10, path=kDrwPathRandom}
	local glow = NewObject{billboard=flics.circle, movie=pMovie}

	NewMovie()
	Translation{min = lightpos}
	Color{min=lightcolor}
	Scale{min=lightsize}
	Scale{min=0.3, max=1, range=20, path=kDrwPathRandom}
	local radiosity = Radiosity{movie=pMovie}

	return NewObject{subobject={glow, flash, radiosity}}
end

WeaponFlash{}
EffectSave("WeaponFlashBlade")

WeaponFlash{flashcolor={1,0.2,0.2,0.6}, glowcolor={1,0,0,0.3}, lightcolor={0.5,0.2,0.2,0.1}, size=0.4, offset={0.1,0,0.2}}
EffectSave("WeaponFlashHammer")

local hammer = WeaponFlash{flashes=4, size=0.3, lightcolor={0.2,0.3,0.5,0.5}, offset={0.21,0,-0.35}, glowparticles=0, lightsize=1, lightpos={0,0,0}}

NewMovie()
Translation{min={0,0,0.65}}
Rotation{axis="y", min=90, direction=0}
Rotation{min=45, direction=0}
NewObject{subobject=hammer, movie=pMovie}
EffectSave("WeaponTrollFlashHammer")


local flashes = WeaponFlash{size=0.3, offset={0,0,0.2}}

NewMovie()
Rotation{min=-100, axis="y", direction=0}
NewObject{subobject=flashes, movie=pMovie}
EffectSave("WeaponFlashPecker")

----------------------------------------------------------------------- BlackBlade
local flash = WeaponFlash{flashcolor={0.7,0.5,0,0.6}, glowcolor={0.5,0,0,0.4}, lightcolor={0.4,0.2,0,0.2}, lightsize=0.5}

gParams={particles=9, offset={0,0,-0.2}, growth=1.5, time=1, velocity={0.3,0,1}, gravity={0,0,-1}, color1={0,0,0,0}, color2={0,0,0,0.2}}
Smoke(gParams)
Scale{min=0.3}
GlobalTrail{range=1, trail=1}
local smoke = NewObject{billboard=flics.fog, movie=pMovie, restriction=kDrwCsWorld}

NewMovie()
Translation{min={0,0,0.6}}--, max={0,0,1}, dim=kDrwDimParticle}
local smokes = NewObject{subobject=smoke, movie=pMovie}

NewObject{subobject={smokes, flash}}
EffectSave("WeaponBlackBlade")
-----------------

local flash = WeaponFlash{flashes=4, offset={0.1,0,0.2}, flashcolor={0.7,0.5,0,0.6}, glowcolor={0.5,0,0,0.4}, lightcolor={0.4,0.2,0,0.2}, lightsize=0.8}

NewMovie()
Translation{min={0,0,0.8}}
local axesmoke= NewObject{subobject=smoke, movie=pMovie}

NewObject{subobject={axesmoke, flash}}
EffectSave("WeaponBlackAxe")
----------------

local hammer = WeaponFlash{flashes=4, size=0.3, flashcolor={0.7,0.5,0,0.6}, lightcolor={0.8,0.2,0,0.5}, offset={0.16,0,-0.25}, glowparticles=0, lightsize=1, lightpos={0,0,0}}

NewMovie()
Translation{min={0,0,0.75}}
Rotation{axis="y", min=90, direction=0}
Rotation{min=45, direction=0}
local hammer = NewObject{subobject=hammer, movie=pMovie}

NewObject{subobject={smokes, hammer,}}
EffectSave("WeaponDarkElfHammer")

NewMovie()
Scale{min=0.6}
NewObject{subobject={smokes, hammer,}, movie=pMovie}
EffectSave("WeaponDarkHammer")


local sceptre = WeaponFlash{flashes=4, size=0.2, flashcolor={0.7,0.5,0,0.6}, lightcolor={0.8,0.2,0,0.5}, offset={0.05,0,-0.3}, glowparticles=0, lightsize=0.6, lightpos={0,0,0}}
NewObject{subobject={smoke, sceptre}}
EffectSave("WeaponBlackSceptre")


------------------------------------------------------------------------ Poison Proc
gParams={particles=11, offset={0,0,0}, growth=1.5, time=1, velocity={0.3,0,0}, gravity={0,0,0.5}, color1={0,0,0,0}, color2={0,1,0,0.5}}
Smoke(gParams)
Scale{min=0.03}
GlobalTrail{range=1, trail=1}
local smoke = NewObject{billboard=flics.bubble, movie=pMovie, restriction=kDrwCsWorld}

NewMovie()
Translation{min={0,0,0.8}}
local bubbles = NewObject{subobject=smoke, movie=pMovie}

WeaponGlow{particles=5, color={0.5,1,0.6,0.6}, length={0,0,0.85}}
local glow = NewObject{billboard=flics.circle, movie=pMovie}

local poison = NewObject{subobject={bubbles, glow}}
EffectSave("WeaponPoison")

NewMovie()
Scale{min=0.7}
NewObject{subobject=poison, movie=pMovie}
EffectSave("WeaponPoisonShort")


LightMovie{offset={0,0,0.5}, color={0.5,1,0.5,0.2}, size=1}
local radiosity = Radiosity{movie=pMovie}

NewMovie()
Scale{min=0.6}
NewObject{subobject={poison, radiosity}, movie=pMovie}
EffectSave("WeaponPoisonAxe")

------------------------------------------------------------------------ weapon amok
CircleTrail{particles=22, radius=0.25, time=0.6, startsize=0.3, stopsize=0, length=0.9, startcolor={1,1,1,0.2}, stopcolor={1,1,1,0}}
local trail = NewObject{billboard=flics.sol_br, movie=pMovie}

BodyGlow{particles=3, size1=1.5, size2=0, radius2=0.3, color1={1,1,1,0}, color2={1,1,1,0.6}}
local glow = NewObject{billboard=flics.sol_pb, movie=pMovie}

NewObject{subobject={trail, glow}}
EffectSave("WeaponAmok")

------------------------------------------------------------------------weapon mana

local flash = Lightning{range=0.1, flic=flics.simplelightning, mode=2}
NewMovie()
Color{min={0,0.8,1,0.4}, max=0.1, dim=kDrwDimRandom}
local flashcolored = NewObject{subobject=flash, movie=pMovie}


NewMovie(2)
Translation{min={0,0,2}}
Rotation{axis="x", min=90, max=450, direction=-1, dim=kDrwDimParticle}
Scale{min=0.3, max=0.6, path=kDrwPathRandom}
Color{min={0,1,0,0.5}, max={0,0.8,1,1}, path=kDrwPathRandom}
local spot = NewObject{mesh=flics.circle, movie=pMovie}

NewMovie()
FigureScale(2)
local spotflash = NewObject{subobject={flashcolored,spot}, movie=pMovie}


NewMovie(5)
Scale{min={0.3,0.3,0.15}}
Rotation{axis="z", dim=kDrwDimParticle, path=kDrwPathRandom}
Rotation{axis="y", range=6, trail=1}
Rotation{axis="x", range=7, trail=1.5}--, dim=kDrwDimParticle}
local flashball = NewObject{subobject=spotflash, movie=pMovie}

LightMovie{offset={0,0,0}, color={0.5,1,0.5,0.2}, size=0.8}
local radiosity = Radiosity{movie=pMovie}


NewObject{subobject={flashball, radiosity}}
EffectSave("WeaponMana")


-----------------------------------
NewMovie()
Scale{min=0.2}
Rotation{range=3}
Translation{max={0,0,0.5}, play=kDrwPlayBounce, path=kDrwPathNegParabola, range=0.3}
Animation{file="figure_npc_skeleton_walk", range=6}
Color{min=0.8}
NewObject{skin=flics.skeleton, movie=pMovie, restriction=kDrwCsWorld}
EffectSave("Skeleton")


------------------------------------------------------- starburst
NewMovie(11)
Rotation{axis="x", range=20}
Burst{radius2=0, particles=11}
Scale{min=0.2, max={0.2,0.2,2}, trail=1}
Scale{min=0.22}
Color{min=1, max=0, trail=1, path=kDrwPathSine}
local starburst = NewObject{billboard=flics.circle, movie=pMovie}

LightMovie{offset={0,0,0}, size=0.7, deviation=0.05, color={0.5,0.5,0.5,0.5}}
local radiosity = Radiosity{movie=pMovie}

local starburst = NewObject{subobject={starburst, radiosity}}
EffectSave("WeaponStarBurst")

--------------------------------------------------------- Pestilence
BodyGlow{size1=0, size2=0.5, radius1=0.1, radius2=0.2, color1={1,1,1,0.3}, color2={1,1,1,0}}
GlobalTrail{range=1, trail=1}
local glow = NewObject{billboard=flics.sol_bg, movie=pMovie}

NewMovie(2)
Translation{min={0,0,0.2}, max={0,0,0.7}, dim=kDrwDimParticle}
NewObject{subobject=glow, movie=pMovie}
EffectSave("WeaponPestilence")


---------------------------------------------------------- Pain
BodyGlow{particles=3, size1=0.2, size2=0.5, radius1=0, radius2=0.1, color1={1,0,0.5,1}, color2={1,1,0,0}, time=1}
local flash = NewObject{billboard=flics.flash, movie=pMovie}

LightMovie{offset={0,0,0}, size=0.7, deviation=0.05, color={1,0.5,1,0.4}}
local radiosity = Radiosity{movie=pMovie}

NewObject{subobject={flash, radiosity}}
EffectSave("WeaponPain")

--------------------------------------------------------- Suffocation
BodyGlow{size1=0, size2=0.5, radius1=0, radius2=0.1, color1={1,1,0.5,0.5}, color2={1,1,0.5,0}}
GlobalTrail{buffer=0.2, range=1, trail=-1}
local glow = NewObject{billboard=flics.plasma, movie=pMovie}

NewMovie(2)
Translation{min={0,0,0.2}, max={0,0,0.7}, dim=kDrwDimParticle}
NewObject{subobject=glow, movie=pMovie}
EffectSave("WeaponSuffocation")


