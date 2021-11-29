local params={range=2.1, particles=1, size=0.5}
NewMovie(params.particles)
Translation{min={0,0,0.1}}
Rotation{axis="x", min=-90, direction=0}
Scale{min={0,0,0}, max={params.size,params.size,params.size}, trail=1, range=params.range}
Color{min={1,1,1,0.6}, max={1,1,1,0}, trail=1, range=params.range}
Clamp{range=2}
local lakewave = NewObject{mesh=flics.groundwave, movie=pMovie}
EffectSave("LakeWave")

----------------------------------------------swamp
local range=4
NewMovie(1)
Translation{min={0,0,-0.4}, max={0,0,-0.1}, range=range, path=kDrwPathNegParabola}
--Rotation{axis="x", min=-90, direction=0}
Scale{min=0.3, max=0.4, range=range}
Color{min={0.6,0.55,0.4, 0.7}, max={0.6,0.55,0.4,0.6}, range=range}
Scale{min=0.5, max=1.2, dim=kDrwDimParticle, path=kDrwPathRandom}
Clamp{range=range}
local bubble = NewObject{mesh=flics.swampbubble, movie=pMovie}

local range=2
NewMovie(11)
Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
Translation{min={0,0,0}, max={0.2,0,0.5}, dim=kDrwDimParticle, path=kDrwPathRandom}
Throw{time=range, trail=0.3, velocity={0.2,0,1}, gravity={0,0,-0.5}}
Color{min={0.3,0.4,0.3,0.5}, max=0, range=range}
Scale{min=0.2}
local smoke = NewObject{billboard=flics.smoke, movie=pMovie}

NewMovie(10)
Throw{time=1, trail=0, velocity={0,0,0}, gravity={0,0,-0.5}}
Rotation{dim=kDrwDimParticle}
Rotation{dim=kDrwDimParticle, axis="y", min=-90, direction=1, path=kDrwPathRandom}
Translation{min={0.4,0,0}, max={0.4,0,0}, range=1, trail=0}
Rotation{axis="z", min=90, direction=0}
Color{min={0.35,0.3,0.2,0.3}, max=0, range=1, path=kDrwPathParabola}
Scale{min=0.15, max=0.05, range=1}
--Rotation{axis="y", range=10}
local splat = NewObject{mesh=flics.swamp, movie=pMovie}

NewMovie(1)
Scale{min=0, max=1, start=3.9, range=0.1, play=kDrwPlayClamped}
Scale{min=1, max=0, start=5.0, range=0.01, play=kDrwPlayClamped}
local splat2 = NewObject{subobject={splat, smoke}, movie=pMovie}

NewMovie(10)
Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
Translation{max={0.7,0,0}, dim=kDrwDimParticle}
Translation{min={0,0,-0.2}, max={0,0,0.-0.05}, range=range, trail=1}
Color{min={0.6,0.55,0.4, 0.7}, max={0.6,0.55,0.4,0.6}, range=range}
Scale{min=0.02, max=0.1, dim=kDrwDimParticle, path=kDrwPathRandom}
Clamp{range=6, fadeout=0.5}
local smallbubbles = NewObject{mesh=flics.swampbubble, movie=pMovie}


NewObject{subobject={smallbubbles, bubble}}--, splat2}}
EffectSave("SwampBlubb")



----------------------------------------------------------- lava fire
local fireparticle = CombineParticles{ratio=0.4, flic1=flics.smoke, color1={1,0.5,0,1}, color2={1,1,0.6,1}}

Fire{size1=2, size2=0.1, time=2, particles=17, color1={1,1,1,0.6}, color2={1,0,0,0}, ground=0.1, width=0.3, top=1, size=1, height=5, path=kDrwPathParabola}
local fire = NewObject{billboard=flics.solar, movie=pMovie, restriction=kDrwCsResetRotation}

--LightMovie{offset={0,0,0.5}, size=1.25, deviation=0.25, color={1,1,0,0}}
--local light = Radiosity{movie=pMovie}

NewMovie()
Translation{min={0,0,-0.5}, max={0,0,0.5}, range=1}
--Clamp{range=1, fadein=0.1, fadeout=0}
Color{min=1, max=0, path=kDrwPathParabola, play=kDrwPlayClamped}
fire = NewObject{subobject={fire}, movie=pMovie}

--Cloud{particles=7, color1={0.4,0.4,0.4,0.4}, color2={0,0,0,0}, radius1={0.1,0,0}, radius2={0.1,0,0}}
Smoke{time=4, velocity={0,0,3}, gravity={1,0,0}, color1={0.2,0.1,0.1,0}, color2={0.5,0.1,0.1,0.8}, growth=0.5}
local smoke = NewObject{billboard=flics.plasma, movie=pMovie, restriction=kDrwCsWorld}

NewMovie()
Translation{min={0,0,0}, max={0,0,1}, range=2, path=kDrwNegParabola}
Clamp{range=2, fadein=0.5, fadeout=0}
--Scale{max=2, range=3}
Color{min=1, max=0, range=2, path=kDrwPathParabola, play=kDrwPlayClmaped}
smoke = NewObject{subobject=smoke, movie=pMovie}

NewMovie()
Scale{min=0.4, max=1.5, range=4*100, path=kDrwPathRandom}
NewObject{subobject={smoke,fire}, movie=pMovie}
EffectSave("LavaFire")
