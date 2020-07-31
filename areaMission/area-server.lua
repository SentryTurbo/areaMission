function start (res)
	--upon starting the resource, start the event
	local resourceName = getResourceName(res)
	if(resourceName == "areaMission") then
		outputChatBox ( "Mission: start", getRootElement(), 255, 255, 255)
		spawnAllEnemies()
	end
end
addEventHandler ( "onResourceStart", getRootElement(), start)

function spawnAllEnemies()
	outputChatBox ( "Enemies: spawning", getRootElement(), 255, 255, 255)
	
	-- Spawn enemies in their corresponding positions, very messy, may or may not work with a FOR loop
	-- to make this process simpler, i've made a function which happens on a different resource :
	-- outputChatBox ("createPed(287,".. x .. "," .. y .. "," .. z .. ", 0.0, true)")
	
	createPed(287, 94.763671875, 1917.19921875, 18.07354927063, 0.0, true)
	createPed(287, 103.65625,1900.966796875,33.8984375, 0.0, true)
	createPed(287, 127.2587890625,1922.8037109375,19.150177001953, 0.0, true)
	createPed(287, 162.478515625,1933.4521484375,33.8984375, 0.0, true)
	createPed(287, 231.962890625,1935.05078125,25.498508453369, 0.0, true)
	createPed(287, 266.150390625,1895.05078125,25.498508453369, 0.0, true)
	createPed(287, 261.9443359375,1808.2236328125,25.498508453369, 0.0, true)
	createPed(287, 113.2939453125,1815.498046875,25.498508453369, 0.0, true)
	createPed(287, 205.7509765625,1873.1904296875,13.14695930481, 0.0, true)
	createPed(287, 221.0771484375,1858.115234375,13.14695930481, 0.0, true)
	createPed(287, 212.2421875,1855.7099609375,13.044891357422, 0.0, true)
	createPed(287,241.2705078125,1878.259765625,11.4609375, 0.0, true)
	createPed(287,239.375,1861.3984375,14.084012031555, 0.0, true)
	createPed(287,248.6337890625,1845.576171875,8.7724142074585, 0.0, true)
	createPed(287,252.107421875,1817.7421875,4.7174983024597, 0.0, true)
	createPed(287,278.185546875,1817.9892578125,4.703125, 0.0, true)
	createPed(287,285.0595703125,1823.8212890625,7.7340316772461, 0.0, true)
	createPed(287,297.81640625,1839.6044921875,7.828125, 0.0, true)
	createPed(287,329.86328125,1856.1318359375,7.828125, 0.0, true)
	createPed(287,298.5849609375,1845.6796875,7.7265625, 0.0, true)
	createPed(287,280.5908203125,1869.4609375,8.7578125, 0.0, true)
	createPed(287,275.3984375,1870.5029296875,8.7578125, 0.0, true)
	createPed(287,270.484375,1855.4873046875,8.7648944854736, 0.0, true)
	
	local pickup = createPickup(271.8388671875,1856.5859375,8.7578125, 3, 1247)  
	
	outputChatBox( "Enemies: spawned", getRootElement(), 255, 255, 255)
	
end

function pickupUse( thePlayer )
    outputChatBox( getPlayerName( thePlayer ) .. " completed the mission!" )
	
	if(getPickupType(source) == 3) then
		outputChatBox("Mission complete" )
		--stopResource ( rootResource) -- stop the resource when done with the mission, commented due to requiring access
	end
end
addEventHandler( "onPickupUse", root, pickupUse )