comment = [[
this file is just an interface to useful functions i have in consteffeninit.lua
these functions or their behavior may change without notice
mostly, these functions are about making cool looking series of screenshots :)
]]
comment = nil

dofile('script\\!test\\consteffeninit.lua')

-- write 24 screenshots, one every hour
function DoHourShots()
	hourshots()
end

-- write a screenshot every 'step' angle and every 'step' * 2 angle at night
-- angle can be a float, but this might create an awful lot of screenshots
-- e.g. step == 0.25 creates over 1000 shots!
-- if step is omitted it defaults to 1 (270 shots)
function DoAngleShots(step)
	angleshots(step)
end

-- write 8 shots in 45° FOV for panorama views of the current camera position
-- Hour and Minute are optional, if omitted time will be set to default (18:30)
function DoPanoramaShots(Hour, Minute)
	panorama(Hour, Minute)
end


-- other useful functions you can call:
comment = [[
pause()		-- toggles pause on/off
lock()		-- toggles timelock on/off
fog()		-- toggles fog on/off
speed(mul)	-- set timemultiplier
hour(h,m)	-- set hour and minute (minute optional, defaults to 0)
psycho()	-- try it! ;)
]]
comment = nil
