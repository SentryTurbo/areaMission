function start() -- clientside 
	outputChatBox ("Client: LOADED, giving WEAPONS TO ALL PEDS IN t-MINUS 1 second") -- this message is unnecessary
	
	setTimer(giveAllPedsGuns, 1000, 1)
	setTimer(update, 500, 0) -- update every half second, makes enemies a bit easier to fight and keeps performance somewhat stable
end

function giveAllPedsGuns()
	
	local peds = getElementsByType('ped')
	
	for index, ped in pairs(peds) do
		givePedWeapon ( ped, 31, 3000, true)
	end
end

local didntStart = true
function startStarter() -- start the start method ONCE, i have tried making the server call the start method, but my fantics didn't work
	if didntStart then
		start()
		didntStart = false
	end
end
addEventHandler ( "onClientRender", root, startStarter)

local engaged = false
function update() --update, works every half seocond
	
	local x,y,z = getElementPosition(localPlayer)
	
	local peds = getElementsByType('ped')
	
	for index, ped in pairs(peds) do
		local x, y, z = getElementPosition(localPlayer)
		local px,py,pz = getElementPosition(ped)
		angle = ( 360 - math.deg ( math.atan2 ( ( x - px ), ( y - py ) ) ) ) % 360 --stolen code, makes pedestrians look at the player
		setPedRotation( ped, angle)
		setPedAimTarget (ped, x, y, z)
		
		local distance = (getDistanceBetweenPoints3D (px, py, pz, x, y, z))
		
		local LOS = isLineOfSightClear ( px, py, pz, x, y, z, true, true, false)
		if LOS and (distance < 40) then
			setPedControlState(ped, "fire", true)
			setTimer(pedStopShooting, 4000, 1, ped)
		end
	end
	
end

function pedHit()
	setPedControlState(source, "fire", true)
	setTimer(pedStopShooting, 15000, 1, source)
end
addEventHandler ( "onClientPedDamage", getRootElement(), pedHit)

function onClientPlayerWeaponFireFunc()
	
	local peds = getElementsByType('ped')
	
	for index, ped in pairs(peds) do	
		local x,y,z = getElementPosition(localPlayer)
		local px,py,pz = getElementPosition(ped)
		local distance = (getDistanceBetweenPoints3D (px, py, pz, x, y, z))
		
		if(distance < 40) then
			setPedControlState(ped, "fire", true)
			setTimer(pedStopShooting, 15000, 1, ped)
		end
	end
end
addEventHandler("onClientPlayerWeaponFire", root, onClientPlayerWeaponFireFunc)

function pedStopShooting(ped)
	setPedControlState(ped, "fire", false)
end