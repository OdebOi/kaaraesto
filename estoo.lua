ESX = nil

local PlayerData = {}
local sekunti = 5
local aika = sekunti * 1500
local cz = Citizen

cz.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		cz.Wait(0)
	end
end)

cz.CreateThread(function()
	while true do
		cz.Wait(1000)
		local auto = GetVehiclePedIsIn(PlayerPedId(), false)
		local auto2 = GetVehicleClass(auto)
		PlayerData = ESX.GetPlayerData()
		if auto2 == 18 and GetPedInVehicleSeat(auto, -1) == PlayerPedId() then
			if PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'ambulance' then

			ExecuteCommand('report Varastin hälytysajoneuvon!!')
			cz.Wait(2000)
				if IsPedInVehicle(PlayerPedId(), auto, false) then
					ExecuteCommand('report Varastin hälytysajoneuvon!!')

				end

			end

		end

	end

end)
