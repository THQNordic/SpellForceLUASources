-------------------------------------------------------- PowerScale
function PowerScale(powerscale)
	if (powerscale ~= nil) then
		local min = 0
		local max = powerscale   -- if number

		if (type(powerscale) == "table") then
			min = powerscale[1]
			max = powerscale[2]
		end	

		Scale{min=min, max=max, start=0, range=1, dim=kDrwDimPower, play=kDrwPlayClamped, path=kDrwPathLinear}
	end
end

-------------------------------------------------------- FigureScale
function FigureScale(figurescale)
	if (figurescale ~= nil) then
		Scale{min=0, max=figurescale, start=0, range=10, dim=kDrwDimTargetSize, play=kDrwPlayClamped, path=kDrwPathLinear}
	end
end


-------------------------------------------------------- Combine Particle Billboards
function CombineParticles(params)
	local color1	=	params.color1 or {1,0,0,1}
	local color2	=	params.color2 or {1,1,1,1}
	local ratio		=	params.ratio or 0.5
	local flic1		=	params.flic1 or flics.circle
	local flic2		=	params.flic2 or flic1

	NewMovie()
	Color{min=color1}
	local outer = NewObject{billboard=flic1, movie=pMovie}
	
	NewMovie()
	Scale{min=ratio}
	Color{min=color2}
	local inner = NewObject{billboard=flic2, movie=pMovie}

	return NewObject{subobject={outer, inner}}
end


-------------------------------------------------------- Tube
function Tube(params)
	local time		= params.time or 3
	local trail		= params.trail or 0.1
	local radius	= params.radius or 0.5
	local height	= params.height or 2
	
	Rotation{range=10}
	Rotation{trail=trail}
	Translation{min={radius,0,-height/2}, max={radius,0,height/2}, range=time, trail=trail/3, play=kDrwPlayBounce, path=kDrwPathCosine}
end

-------------------------------------------------------- Sparkling Sphere
function Sphere(params)
	local time		= params.time or 1
	local trail		= params.trail or 1
	local radius	= params.radius or 1
	local radius2	= params.radius2 or radius
	
	Rotation{axis="y", dim=kDrwDimParticle, range=time}
	Rotation{trail=trail}
	Translation{min={radius,0,0}, max={radius2,0,0}, play=kDrwPlayBounce, path=kDrwPathCosine}
end

-------------------------------------------------------- Randomburst
function Burst(params)
	local time		= params.time or 1
	local trail		= params.trail or 1
	local radius1	= params.radius1 or 0
	local radius2	= params.radius2 or 1
	local path		= params.path or kDrwPathLinear

	Rotation{axis="y", dim=kDrwDimParticle}
	Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
	Translation{min={radius1,0,0}, max={radius2,0,0}, range=time, trail=trail}
end

-------------------------------------------------------- Throw
function Throw(params)
	local velocity	= params.velocity or {0,0,5}
	local gravity	= params.gravity or {0,0,-5}
	local time		= params.time or 1
	local trail		= params.trail or 1
	
	Translation{max=velocity, range=time, trail=trail}
	Translation{max=gravity, range=time, trail=trail, path=kDrwPathParabola}
end


-------------------------------------------------------- FadeScale
function FadeScale(params)
	local path		= params.path or kDrwPathCosine
	local min		= params.min or 0
	local max		= params.max or 1
	
	if path == kDrwPathCosine then
		Scale{min=min, max=max, dim=kDrwDimTimeScaled, range=0.5, play=kDrwPlayBounce, path=kDrwPathCosine}
		return
	end

	local fadein = (params.fadein or 1)
	local fadeout = (params.fadeout or fadein)

	if (fadein > 0) then
		Scale{min=min, max=max, range=fadein, play=kDrwPlayClamped, path=path}
	else
		Scale{min=max}
	end

	if (fadeout <= 0) then fadeout = 0.001 end
	Scale{min=1, max=0, start=-fadeout, range=fadeout, play=kDrwPlayClamped, dim=kDrwDimTimeToEnd, path=path}
end

function Clamp(params)
	local range		= params.range or 1
	local fadein	= (params.fadein or 0)
	local fadeout	= (params.fadeout or fadein)
	local pathin	= params.pathin or kDrwPathLinear
	local pathout	= params.pathout or pathin
	local dimin		= params.dimin or kDrwDimTime

	local dimout	
	if (range==0) then 	dimout	= params.dimout or kDrwDimTimeToEnd end
	dimout = params.dimout or dimin

	if (params.mode == "bounce") then
		Clamp{dimin=kDrwDimTimeScaled, dimout=kDrwDimTimeScaled, fadein=0.5, fadeout=0.5, pathin=kDrwPathCosine, pathout=kDrwPathCosine}
		return
	end

	if (params.mode == "parabola") then
		Clamp{dimin=kDrwDimTimeScaled, dimout=kDrwDimTimeScaled, fadein=0.5, fadeout=0.5, pathin=kDrwPathNegParabola, pathout=kDrwPathParabola}
		return
	end

	if (fadein > 0) then
		Scale{min=0, max=1, range=fadein, play=kDrwPlayClamped, path=pathin, dim=dimin}
	end

	if (fadeout <= 0) then fadeout = 0.001 end
	Scale{min=1, max=0, range=fadeout, start=range-fadeout, play=kDrwPlayClamped, path=pathout, dim=dimout}
end

---------------------------------------------------- generate startmovies with time offsets
function MoviesTimedScaleIn(params)
	local time=(params.time or 1)
	local scaletime=(params.scaletime or 1)
	local steps=(params.steps or 1)

	local start = 0
	local movies={}

	for i = 0,steps-1 do
		movies[i] = NewMovie()
		Scale{min=0, max=1, start=i*time/steps, play=kDrwPlayClamped, range=scaletime}
	end

	return movies
end	

-------------------------------------------------------- Fire
function Fire(params)
	local size			= params.size or 1			-- overall size factor
	local height		= params.height or 3		-- height of flame
	local particles		= params.particles or 11	-- number of particles per flame
	local time			= params.time or 1			-- lifetime of particle ->(burnspeed)
	local ground		= params.ground or 0.5		-- ground radius of flame
	local top			= params.top or 0.2			-- top radius of flame
	local width			= params.width or 0.3		-- maximum width of flame

	local color1		= params.color1 or {1,0.4,0.2,0.7}
	local color2		= params.color2 or {0.1,0,0,0.3}	
	local trail			= 1 

	local size1			= params.size1 or 1			-- particle size at the ground
	local size2			= params.size2 or 1			-- particle size at the top
	local path			= params.path or kDrwPathLinear		--kDrwPathParabola for more "firepressure"
	local noplopp		= params.noplopp or 0
	local spintime		= params.spintime or 5.5
	
	NewMovie(particles)

	if (params.buffer ~= nil) then 
		GlobalTrail{buffer=params.buffer, range=time, trail=1, path=kDrwPathParabola}
	end

	PowerScale(params.powerscale)
	FigureScale(params.figurescale)

	Scale{min=size}
	Rotation{range=spintime, dim=kDrwDimTimeAbsolute} --keep turning to show different sides
	Translation{min={0,0,0}, max={0,0,height}, trail=trail, range=time, path=path}
	Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
	Translation{min={ground,0,0}, max={top,0,0}, range=time, trail=trail}
	Translation{max={width - (ground + top)/2,0,0}, range=time/2, play=kDrwPlayBounce, path=kDrwPathCosine, trail=2*trail}
	Color{min=color1, max=color2, trail=trail, range=time}
	Scale{min=size1, max=size2, trail=trail, range=time}
	Scale{min=0.9, max=1.1, dim=kDrwDimParticle, path=kDrwPathRandom}
	if (path ~= kDrwPathLinear) then
		Scale{min=0, max=1, trail=trail, range=time, path=kDrwPathNegParabola}
	end

	if (noplopp == 1) then
		path=Path{{0,0},{0.1,1}, {1,1}}
		Scale{min=0, max=1, trail=trail, range=time, path=path}
	end
end

-------------------------------------------------------- Cloud of Dust
function Cloud(params)
	local particles	=(params.particles or 11)			--number of smoke particles
	local time		=(params.time or 2)					--lifetime of smoke particle
	local offset	=(params.offset or {0,0,0})			--initial cloud particle disposition
	local velocity	=(params.velocity or {0,0,0})		--cloud travel speed
	local radius1	=(params.radius1 or {0.2,0,0})		--initial particle excentricity
	local radius2	=(params.radius2 or {0.5,0,0})		--final particle excentricity
	local size		=(params.size or 0.2)				--initial particle size, grows to 1.0, scale down after
	local color1	=(params.color1 or {1, 1, 1, 1})	--initial particle color
	local color2	=(params.color2 or {0.3,0.3,0.3,0})	--final particle color
	local axis		=(params.axis or "z")				--axis for intial rotation
	local rollaxis	=(params.rollaxis or "y")			--axis for intial rotation
	local rolltime	=(params.rolltime or 1)				--time for 1 particle rotation

	local rolltrail		=1
	
	NewMovie(particles)
	PowerScale(params.powerscale)
	FigureScale(params.figurescale)
	
	Rotation{axis="z", dim=kDrwDimParticle, path=kDrwPathRandom}
	Translation{min=offset}
	Translation{min={0,0,0}, max=velocity, range=time}--, path=kDrwPathParabola}
	Rotation{axis=rollaxis, range=rolltime, trail=rolltrail}
	Translation{min=radius1, max=radius2, range=time}
	Scale{min=size, max=1, range=time}
	Color{min=color1, max=color2, range=time}
end


------------------------------------------------ spark burst
function Sparks(params)
	local sparks=(params.sparks or 5)			--number of spark particles per burst
	local radius =(params.radius or 0.1)		--radius of sparkburst
	local lifetime=(params.lifetime or 0.3)		--spark lifetime
	local size=(params.size or 0.05)			--size of a single spark
	local flic=(params.flic or flics.star6point)--billboard for spark

	local bursts=(params.bursts or 10)			--number of bursts
	local inner=(params.inner or 0.1)			--min radius of burst
	local outer=(params.outer or 0.2)			--end radius of burst
	local innerscale=(params.innerscale or 0.5) --min scale of burst

	local colorstart=(params.colorstart or {1,1,1,1})
	local colorend=(params.colorend or {1,0.5,0,0.3})

	NewMovie(sparks)
	Burst{particles=sparks, radius1=0, radius2=radius, time=lifetime}
	Color{min=colorstart, max=colorend, range=lifetime, trail=1} 
	Scale{min=size}
	local burst = NewObject{billboard=flic, movie=pMovie}

	NewMovie(bursts)
	Rotation{dim=kDrwDimTimeAbsolute, range=10}
	Burst{particles=bursts, radius1=inner, radius2=outer, time=lifetime}
	Scale{min=innerscale, max={1,1,1}, range=lifetime, trail=1}
	
	return NewObject{subobject={burst}, movie=pMovie}
end


----------------------------------------------------------- flash sphere
function FlashSphere(params)
	local flashes = getn(flics.flashsphere)
	local time=(params.time or flashes/10)					--time to show all flashspheres
	local radius =(params.radius or 1)						--radius of sphere
	local flashcolor=(params.flashcolor or {0.5,0.8,1,1})	--flashcolor

	NewMovie()
	Choose{range=100 * time/flashes, path=kDrwPathRandom, play=kDrwPlayContinous}
	Color{min=flashcolor, max={flashcolor[1], flashcolor[2], flashcolor[3], -10}, range=time/flashes, path=kDrwPathParabola}
	Scale{min={radius,radius,radius}}
	return NewObject{mesh=flics.flashsphere, movie=pMovie}
end

-------------------------------------------------------- Smoke, hot and cold
function Smoke(params)
	local particles	=(params.particles or 11)			--number of smoke particles
	local time		=(params.time or 2)					--lifetime of smoke particle
	local offset	=(params.offset or {0,0,0})			--initial particle distance from center
	local velocity	=(params.velocity or {0.5,0,2})		--initial particle speed
	local gravity	=(params.gravity or {0,0,-4})		--acceleration, down: negative
	local growth	=(params.growth or 2)				--particle growth. scale down after
	local color1	=(params.color1 or {0.3,0.6,1,0.3}) --initial particle color
	local color2	=(params.color2 or color1)			--final particle color
	local axis		=(params.axis or "z")				--axis for intial rotation
	local random	=(params.random or 1)
	local colorplay =(params.colorplay or kDrwPlayBounce)
	local wind		=(params.wind or {0,0,0})

	local trail		= (params.trail or 1)
	--local moveable	= params.moveable

	NewMovie(particles)
	--if (moveable == 1) then GlobalTrail(trail) end
	PowerScale(params.powerscale)
	FigureScale(params.figurescale)

	Translation{min={0,0,0}, max=wind, range=time, trail=trail, path=kDrwPathParabola}
	
	if (random == 1) then
		Rotation{axis=axis, dim=kDrwDimParticle, path=kDrwPathRandom}
	else
		Rotation{axis=axis, dim=kDrwDimParticle}--, path=kDrwPathRandom}
	end
	
	if (colorplay == kDrwPlayBounce) then
		Color{min=color1, max=color2, range=time/2, trail=trail*2, play=kDrwPlayBounce}
	else
		Color{min=color1, max=color2, range=time, trail=trail}
	end

	Translation{min=offset}
	Translation{min={0,0,0}, max=velocity, range=time, trail=trail}
	Translation{min={0,0,0}, max=gravity, range=time, trail=trail, path=kDrwPathParabola}
	Scale{min=1, max=growth, range=time, trail=trail}
end

--------------------------------------- explosion
function Explosion(params)
	local particles		=(params.particles or 4)				--number of explosion particles
	local time			=(params.time or 1)						--lifetime of explosion
	local startsizes	=(params.startsizes or {1.2,1.2,0.2})	--initial particle sizes for yellow, red and black
	local stopsizes		=(params.stopsizes or {1.2,1.2,2})		--final particle sizes for yellow, red and black
	local size			=(params.size or 0.2)					--initial explosion size
	local flic			=(params.flic or flics.fog)				--flic to use
	local rolltime		=(params.rolltime or 1)					--time for 1 particle rotation

	--yellow
	Cloud{particles=particles, rolltime=rolltime, time=time, size=startsizes[1], color1={1,1,1,1}, color2={1,1,0,0}, powerscale=params.powerscale}
	Scale{min=stopsizes[1]}
	local yellow = NewObject{billboard=flic, movie=pMovie}

	--red
	Cloud{particles=particles, rolltime=rolltime, time=time, size=startsizes[2], color1={1,0.5,0,1}, color2={1,0,0,0}, powerscale=params.powerscale}
	Scale{min=stopsizes[2]}
	local red = NewObject{billboard=flic, movie=pMovie}

	--black
	Cloud{particles=particles, offset={0.2,0,0}, rolltime=rolltime, time=time, size=startsizes[3], color1={0.3,0.3,0.3,0.8}, color2={0,0,0,0}, powerscale=params.powerscale}
	Scale{min=stopsizes[3]}
	local black = NewObject{billboard=flic, movie=pMovie}

	Cloud{particles=particles, time=time, size=size, powerscale=params.powerscale}
	local explosion = NewObject{subobject={red, black, yellow}, movie=pMovie}
	
	return explosion
end


---------------------------------------- circle trail
function CircleTrail(params)
	local particles		=(params.particles or 11)				--number of paticles
	local time			=(params.time or 1)						--time for one rotation
	local radius		=(params.radius or 1)					--radius of rotation
	local length		=(params.length or 0.5)					--length of trail (1=full circle)
	local startsize		=(params.startsize or 0.2)				--size of first particle
	local stopsize		=(params.stopsize or startsize)			--size of last particle
	local startcolor	=(params.startcolor or {1,1,1,1})		--color of first particle
	local stopcolor		=(params.stopcolor or {1,1,1,0})		--color of last particle
	local rolltime		=(params.rolltime or 3.5)				--time for horizontal roll
	local lightobject	= params.lightobject

	local trail = -length
	local light
	
	if (lightobject ~=nil) then
		NewMovie()
		Rotation{axis="y", range=rolltime}
		Rotation{range=time}
		Translation{min={radius,0,0}}
		light = NewObject{subobject=lightobject, movie=pMovie}
	end

	NewMovie(particles)

	if (params.powerparticles) then
		ChangeNumbers{dim=kDrwDimPower, play=kDrwPlayClamped}
	end
	if (params.powertrail) then
		trail = Trail{min=0, max=-length, dim=kDrwDimPower}
	end

	if (rolltime > 0) then	
		Rotation{axis="y", range=rolltime} 
	end

	Rotation{range=time, trail=trail}
	Translation{min={radius,0,0}}

	--following values reversed
	Scale{min=startsize, max=stopsize, dim=kDrwDimParticle}
	Color{min=startcolor, max=stopcolor, dim=kDrwDimParticle}

	return light
end

-----------------------------------------whirlwind
function Whirlwind(params)
	local particles		=(params.particles or 3)				--particels in horizontal layer
	local layers		=(params.layers or 17)					--number of layers
	local time			=(params.time or 1)						--time for one rotation
	local radius		=(params.radius or 1)					--radius of layer
	local height		=(params.height or 8)					--height of whirlwind
	local startsize		=(params.startsize or 0.1)				--size of bottom layer
	local stopsize		=(params.stopsize or 5)					--size of top layer
	local startcolor	=(params.startcolor or {1,1,1,1})		--color of bottom layer
	local stopcolor		=(params.stopcolor or {1,1,1,0})		--color of top layer
	local tilt			=(params.tilt or 20)					--layer tilt
	local excentricity	=(params.excentricity or 0.2)			--layer offset to center
	local flic			=(params.flic or flics.smoke)
	local outward		=(params.outward or false)

	NewMovie(particles)
	Translation{min={excentricity,0,0}}
	Rotation{dim=kDrwDimParticle}
	Rotation{range=time}
	Translation{min={radius,0,0}}
	Translation{min={0,0,0}, max={0,0,1}, dim=kDrwDimParticle}
	local whirl=NewObject{billboard=flic, movie=pMovie}

	NewMovie(layers)
	Translation{min={0,0,0}, max={0,0,height}, dim=kDrwDimParticle}
	if (outward == true) then
		Rotation{dim=kDrwDimParticle, direction=-1, min=359, max=0}
	else
		Rotation{dim=kDrwDimParticle}
	end
	Rotation{axis="y", range=1, min=-tilt, max=tilt, direction=1, play=kDrwPlayBounce, path=kDrwPathCosine}
	Scale{min=2, max=1, dim=kDrwDimParticle, path=kDrwPathCosine}
	Scale{min=startsize, max=stopsize, dim=kDrwDimParticle, path=kDrwPathParabola}
	Color{min=startcolor, max=stopcolor, dim=kDrwDimParticle, path=kDrwPathParabola}
	local whirlwind=NewObject{subobject=whirl, movie=pMovie}

	return whirlwind
end

------------------------------------------------------------ bodyglow
function BodyGlow(params)
	local particles			=(params.particles or 5)			-- particles per joint
	local radius1			=(params.radius1 or 0)				-- inner hull distance
	local radius2			=(params.radius2 or 1)				-- outer hull distance
	local color1			=(params.color1 or {1,1,1,1})		-- inner color
	local color2			=(params.color2 or color1)			-- outer color
	local size1				=(params.size1 or 1)				-- inner particle size
	local size2				=(params.size2 or size1)			-- outer particle size
	local time				=(params.time or 1)					-- particle lifetime

	NewMovie(particles)
	PowerScale(params.powerscale)
	FigureScale(params.figurescale)

	Burst{particles=particles, radius1=radius1, radius2=radius2, time=time}
	Color{min=color1, max=color2, trail=1, path=kDrwPathLinear}
	Scale{min=size1, max=size2, trail=1}
end

------------------------------------------------------------ random sparkle
function Sparkle(params)
	local particles			=(params.particles or 5)			-- particles
	local radius1			=(params.radius1 or 0)				-- inner hull distance
	local radius2			=(params.radius2 or 1)				-- outer hull distance
	local color1			=(params.color1 or 0)				-- min color
	local color2			=(params.color2 or 1)				-- max color
	local size1				=(params.size1 or 1)				-- min particle size
	local size2				=(params.size2 or size1)			-- max particle size
	local time				=(params.time or 1)					-- particle lifetime
	local start				=(params.start or 0)				-- time offset

	NewMovie(1)
	Rotation{axis="x", path=kDrwPathRandom, range=time*100, start=start}
	Rotation{axis="z", path=kDrwPathRandom, range=time*200, start=start}
	Translation{min={radius1,0,0}, max={radius2,0,0}, path=kDrwPathRandom, range=time*300, start=start}
	Color{min=color1, max=color2, range=time*0.5, play=kDrwPlayBounce, start=start}
	Scale{min=size1, max=size2, range=time*0.5, play=kDrwPlayBounce, start=start}
	Scale{min=0, max=1, range=0.1, start=start, play=kDrwPlayClamped}
end

----------------bounce
function Bounce(params)
	local particles			=(params.particles or 1)			-- particles
	local height			=(params.height or 3)			-- height of first parabola
	local bounce			=(params.bounce or 3)				-- number of bounces
	local trail				=(params.trail or -0.2)				-- relative trail length
	local velocity			=(params.velocity or {1,0,0})
	local start				=(params.start or 0)
	local range				=params.range or 1

	NewMovie(particles)
	Translation{start=start, max=velocity, range=range, trail=trail, path=kDrwPathNegParabola}--, dim=kDrwDimTimeScaled}
	Scale{start=start, min=1, max={1,1,0}, range=range, trail=0}--, dim=kDrwDimTimeScaled}
	Translation{start=start, max={0,0,height}, range=range * 0.5/bounce, play=kDrwPlayBounce, path=kDrwPathNegParabola, trail=trail}--, dim=kDrwDimTimeScaled}
	Scale{start=start, min=1, max={0,0,1}, range=range, trail=0}--, dim=kDrwDimTimeScaled}
end

----------------------------------------- lightning
----------------------------------------- general lightning
function Lightning(params)
	local glowtime	= (params.range or 0.1)			-- glowtime of a single flash
	local flic		= (params.flic or flics.lightning)  -- mesh
	local mode		= (params.mode or 0)  -- 0=mix, 1=doublecross, 2=singlecross, 3=double, 4=single (+10 = no stop)

	NewMovie(1)
	Choose{range=glowtime * 100, path=kDrwPathRandom, play=kDrwPlayContinous}
	local single = NewObject{mesh=flic, movie=pMovie}

	NewMovie(2)
	Scale{min={1,1,1}, max={3,1,1}, dim=kDrwDimParticle}
	local double = NewObject{subobject={single, single}, movie=pMovie}
	
	NewMovie(2)
	Rotation{axis="z", min=0, max=180, dim=kDrwDimParticle}
	local doublecross = NewObject{subobject={double, double}, movie=pMovie}

	NewMovie(2)
	Rotation{axis="z", min=0, max=180, dim=kDrwDimParticle}
	local singlecross = NewObject{subobject={single, single}, movie=pMovie}


	NewMovie()
	Choose{range=glowtime*100, path=kDrwPathRandom, play=kDrwPlayContinous}
	Color{min=1, max=0, range=glowtime, path=kDrwPathParabola}

	local flashlightning
	if (mode == 0) then	flashlightning = NewObject{subobject={doublecross, singlecross, double, single, gNoEffect, gNoEffect, gNoEffect, gNoEffect, gNoEffect}, movie=pMovie} end
	if (mode == 1) then	flashlightning = NewObject{subobject={doublecross, gNoEffect, gNoEffect}, movie=pMovie} end
	if (mode == 2) then	flashlightning = NewObject{subobject={singlecross, gNoEffect, gNoEffect}, movie=pMovie} end
	if (mode == 3) then	flashlightning = NewObject{subobject={double, gNoEffect, gNoEffect}, movie=pMovie} end
	if (mode == 4) then	flashlightning = NewObject{subobject={single, gNoEffect, gNoEffect}, movie=pMovie} end

	if (mode == 10) then	flashlightning = NewObject{subobject={doublecross, singlecross, double, single}, movie=pMovie} end
	if (mode == 11) then	flashlightning = NewObject{subobject={doublecross}, movie=pMovie} end
	if (mode == 12) then	flashlightning = NewObject{subobject={singlecross}, movie=pMovie} end
	if (mode == 13) then	flashlightning = NewObject{subobject={double}, movie=pMovie} end
	if (mode == 14) then	flashlightning = NewObject{subobject={single}, movie=pMovie} end

	return flashlightning
end


----------------------------------------------------------------- radiosity
-- takes a given movie and generates a light object with a halo around
----------------------------------------------------------------------
function Radiosity(params)
	movie		=	params.movie or gNoMove
	billboard	=	params.billboard or flics.circle
	scale		= 	params.scale or 1

	local light = NewLight(gNoMove, {Att1 = 0, Att2 = 1})
	--local lightobject = NewObject{movie=movie, light=light, bone=params.bone, restriction=params.restriction}
	--local lightglow = NewObject{movie=movie, billboard=billboard, bone=params.bone, restriction=params.restriction}
	
	--if (scale ~= 1) then
		NewMovie()
		Scale{min=scale}
		local radiosity = NewObject{billboard=billboard, movie=pMovie}
		-- print(movie, pMovie)
		return NewObject{light=light, subobject=radiosity, movie=movie, bone=params.bone, restriction=params.restriction}
	--end

	--local lightobject = NewObject{movie=movie, light=light, bone=params.bone, restriction=params.restriction}
	--local lightglow = NewObject{movie=movie, billboard=billboard, bone=params.bone, restriction=params.restriction}
	--return NewObject{light=light, billboard=billboard, movie=movie, bone=params.bone, restriction=params.restriction}
	
	--return NewObject{subobject={lightobject, lightglow}}
end

function LightMovie(params)
	local size			= params.size or 3				-- average light radius
	local deviation		= params.deviation or 0.1		-- maximum deviation from radius
	local flicker		= params.flicker or 1			-- time for 100 deviations
	local color			= params.color or 1
	local offset		= params.offset or {0,0,0}

	if (params.movie == nil) then NewMovie() end

	Translation{min = offset}
	Scale{min=size}
	
	if (flicker > 0) then
		Scale{min=size-deviation, max=size+deviation, range=flicker, dim=kDrwDimRandom}
	end

	Color{min=color}
end

------------------------------------------------------------------------------
-- setup standard lights -----------------------------------------------------
------------------------------------------------------------------------------

lights = {}

NewMovie()
Translation{min = {0,-0.2,1}}
Color{min={0.5,0.5,0.5,1}}
Scale{min=0.98, max=1.02, range=2, dim=kDrwDimRandom}--, play=kDrwPlayContinous}
FadeScale{path=kDrwPathLinear, fadein=0.2, fadeout=0.5}
lights.simple = NewLight(pMovie, {Att1 = 0, Att2 = 3})

NewMovie()
Translation{min = {0,0,4}}
Color{min={1,1,0.5,1}}
Scale{min=0.98, max=1.02, range=2, dim=kDrwDimRandom}--, play=kDrwPlayContinous}
--FadeScale{path=kDrwPathLinear, fadein=0.5, fadeout=0.5}
lights.highrotateyellow = NewLight(pMovie, {Att1 = 10, Att2 = 15})

NewMovie()
Translation{min = {0,0,1.3}}
Color{min={0,0,0,0}, max={1,1,1,1}, range=0.5, play=kDrwPlayBounce, dim=kDrwDimTimeScaled}
Scale{min=0.95, max=1.05, dim=kDrwDimRandom}
FadeScale{path=kDrwPathLinear, fadein=0.5, fadeout=0.5}
lights.midrotatewhite  = NewLight(pMovie, {Att1 = 0, Att2 = 3, Red=0,Green=0,Blue=0})

NewMovie()
Translation{min = {0,0,1.3}}
Color{min={0,0,0,0}, max={1,0.3,1,1}, range=0.5, play=kDrwPlayBounce, dim=kDrwDimTimeScaled}
Scale{min=0.95, max=1.05, dim=kDrwDimRandom}
FadeScale{path=kDrwPathLinear, fadein=0.5, fadeout=0.5}
lights.midrotatered  = NewLight(pMovie, {Att1 = 0, Att2 = 3, Red=0,Green=0,Blue=0})

NewMovie()
Translation{min = {0,0,0}}
Color{min={0,0,0,0}, max={0.9,0.9,0.9,1}, range=0.5, play=kDrwPlayBounce, dim=kDrwDimTimeScaled}
Scale{min=0.95, max=1.05, dim=kDrwDimRandom}
FadeScale{path=kDrwPathLinear, fadein=0.5, fadeout=0.5}
lights.lowrotatewhite = NewLight(pMovie, {Att1 = 0, Att2 = 2, Red = 0.9, Green = 0.9, Blue = 0.9 })


----------------------------------------------------------          default effects

------- CAST
----------------------------------------- lightning from sky
local lightning = Lightning{range=0.08,flic=flics.simplelightning, mode=0}
NewMovie()
Scale{min={2,2,20}}
Rotation{range=5}
Color{min={0.3,0.6,1,0.3}, max={0.4,0.7,1,0.2}, dim=kDrwDimRandom}
NewObject{subobject=lightning, movie=pMovie, bone=kDrwBoneChest}
EffectSave("Lightning")

------- HIT
--------------------------------------- regular dustcloud
Cloud{offset={0.3,0,1}, velocity={0,0,4}}
local standardhit = NewObject{billboard=flics.fog, movie=pMovie}
EffectSave("CloudOfDust")

NewMovie()
Color{min=0, max={1,0,0,1}, range=0.1, play=kDrwPlayBounce}
NewObject{billboard=flics.playerdecal, movie=pMovie, bone=kDrwBoneHead}
EffectSave("Default")

