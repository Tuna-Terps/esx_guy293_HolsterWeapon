----------------------------------------------------------------
-- Copyright © 2019 by Guy Shefer
-- Made By: Guy293
-- GitHub: https://github.com/Guy293
-- Fivem Forum: https://forum.fivem.net/u/guy293/
-- Tweaked by: Campinchris & Jougito
----------------------------------------------------------------

--- DO NOT EDIT THIS --
local ESX      	 = nil
local holstered  = true
local blocked	 = false
local PlayerData = {}
------------------------

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
	AddEventHandler('esx:setJob', function(job)
  		PlayerData.job = job
	end)


 Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		loadAnimDict("rcmjosh4")
		loadAnimDict("reaction@intimidation@cop@unarmed")
		loadAnimDict("reaction@intimidation@1h")
		local ped = PlayerPedId()

		if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
			if not IsPedInAnyVehicle(ped, false) then
				if GetVehiclePedIsTryingToEnter (ped) == 0 and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) and not IsPedInParachuteFreeFall(ped) then
					if CheckWeapon(ped) then
						--if IsPedArmed(ped, 4) then
						if holstered then
							-- tuna terps
							TriggerEvent('esx_skin:setLastSkin', function(skin)
								LastSkin = skin
								print(LastSkin)
							end)
							blocked   = true
								SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
								TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "intro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 ) -- Change 50 to 30 if you want to stand still when removing weapon
								--TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "intro", 8.0, 2.0, -1, 30, 2.0, 0, 0, 0 ) Use this line if you want to stand still when removing weapon
									Citizen.Wait(Config.CooldownPolice)
								SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
								TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
								TriggerEvent('skinchanger:getSkin', function(skin)
									print('block 1')
									--
									-- f -> e
									--
									--if GetHashKey(GetEntityModel(PlayerPedId())) == Male then
									if skin.sex == 1 then
										-- female
										if skin.chain_1 == 47  then
											local clothesSkin = {
												['chain_1']  = 48,   ['chain_2']  = 0,
											}
											
										elseif skin.chain_1 == 45  then
											local clothesSkin = {
												['chain_1']  = 46,   ['chain_2']  = 0,
											}

										elseif skin.chain_1 == 49  then
											local clothesSkin = {
												['chain_1']  = 50,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 88  then
											local clothesSkin = {
												['chain_1']  = 80,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 31  then
											local clothesSkin = {
												['chain_1']  = 30,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 1  then
											local clothesSkin = {
												['chain_1']  = 3,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 8  then
											local clothesSkin = {
												['chain_1']  = 2,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 9  then
											local clothesSkin = {
												['chain_1']  = 2,   ['chain_2']  = 0,
											}
										end
										TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
									else
										-- male 
										if skin.chain_1 == 66  then
											local clothesSkin = {
												['chain_1']  = 67,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 68  then
											local clothesSkin = {
												['chain_1']  = 69,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 70  then
											local clothesSkin = {
												['chain_1']  = 71,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 125  then
											local clothesSkin = {
												['chain_1']  = 126,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 64  then
											local clothesSkin = {
												['chain_1']  = 65,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 62  then
											local clothesSkin = {
												['chain_1']  = 63,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 49  then
											local clothesSkin = {
												['chain_1']  = 50,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 9  then
											local clothesSkin = {
												['chain_1']  = 67,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 8  then
											local clothesSkin = {
												['chain_1']  = 67,   ['chain_2']  = 0,
											}
										elseif skin.tshirt_1 == 18  then
											local clothesSkin = {
												['chain_1']  = 20,   ['chain_2']  = 0,
											}										
										end
										TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
									end
									-- end of tuna
								end)
									Citizen.Wait(400)
								ClearPedTasks(ped)
							holstered = false
						else
							blocked = false
						end
					else
					--elseif not IsPedArmed(ped, 4) then
						if not holstered then
								-- tuna terpS							
								TriggerEvent('esx_skin:setLastSkin', function(skin)
									LastSkin = skin
								end)
								TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
									Citizen.Wait(500)
								TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "outro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 ) -- Change 50 to 30 if you want to stand still when holstering weapon
								--TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "outro", 8.0, 2.0, -1, 30, 2.0, 0, 0, 0 ) Use this line if you want to stand still when holstering weapon
								-- tuna terps
								TriggerEvent('skinchanger:getSkin', function(skin)
									-- FEMALE
									-- E -> F  
									--
								--	if GetHashKey(GetEntityModel(PlayerPedId())) == Male then
									if skin.sex == 1 then
										if skin.chain_1 == 48  then
											local clothesSkin = {
												['chain_1']  = 47,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 46  then
											local clothesSkin = {
												['chain_1']  = 45,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 50  then
											local clothesSkin = {
												['chain_1']  = 49,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 89  then
											local clothesSkin = {
												['chain_1']  = 88,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 30  then
											local clothesSkin = {
												['chain_1']  = 31,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 3  then
											local clothesSkin = {
												['chain_1']  = 1,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 2  then
											local clothesSkin = {
												['chain_1']  = 8,   ['chain_2']  = 0,
											}
										end
										TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)											
									else
										--
										--print(' ... :127')
										-- MALE -> E -> F
										if skin.chain_1 == 67  then
											local clothesSkin = {
											['chain_1']  = 66,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 69  then
											local clothesSkin = {
											['chain_1']  = 68,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 71  then
											local clothesSkin = {
											['chain_1']  = 70,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 126  then
											local clothesSkin = {
											['chain_1']  = 125,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 65  then
											local clothesSkin = {
											['chain_1']  = 64,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 63  then
											local clothesSkin = {
											['chain_1']  = 62,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 50  then
											local clothesSkin = {
											['chain_1']  = 49,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 9  then
											local clothesSkin = {
											['chain_1']  = 9,   ['chain_2']  = 0,
											}
										elseif skin.chain_1 == 8  then
											local clothesSkin = {
											['chain_1']  = 67,   ['chain_2']  = 0,
											}
										elseif skin.tshirt_1 == 20  then
											local clothesSkin = {
											['chain_1']  = 18,   ['chain_2']  = 0,
											}
										end
										TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
									end
								end)
									Citizen.Wait(60)
								ClearPedTasks(ped)
							holstered = true
						end
					end
				else
					SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
				end
			else
				holstered = true
			end
		else
			if not IsPedInAnyVehicle(ped, false) then
				if GetVehiclePedIsTryingToEnter (ped) == 0 and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) and not IsPedInParachuteFreeFall(ped) then
					if CheckWeapon(ped) then
						--if IsPedArmed(ped, 4) then
						if holstered then
							blocked   = true
								SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
								TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 5.0, 1.0, -1, 50, 0, 0, 0, 0 )
								--TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 5.0, 1.0, -1, 30, 0, 0, 0, 0 ) Use this line if you want to stand still when removing weapon
									Citizen.Wait(1250)
								SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
									Citizen.Wait(Config.cooldown)
								ClearPedTasks(ped)
							holstered = false
						else
							blocked = false
						end
					else
					--elseif not IsPedArmed(ped, 4) then
						if not holstered then
								TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, 3.0, -1, 50, 0, 0, 0.125, 0 ) -- Change 50 to 30 if you want to stand still when holstering weapon
								--TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, 3.0, -1, 30, 0, 0, 0.125, 0 ) Use this line if you want to stand still when holstering weapon
									Citizen.Wait(1700)
								ClearPedTasks(ped)
							holstered = true
						end
					end
				else
					SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
				end
			else
				holstered = true
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if blocked then
			DisableControlAction(1, 25, true )
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(1, 23, true)
			DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
			DisablePlayerFiring(ped, true) -- Disable weapon firing
		end
	end
end)


function CheckWeapon(ped)
	--[[if IsPedArmed(ped, 4) then
		return true
	end]]
	if IsEntityDead(ped) then
		blocked = false
			return false
		else
			for i = 1, #Config.Weapons do
				if GetHashKey(Config.Weapons[i]) == GetSelectedPedWeapon(ped) then
					return true
				end
			end
		return false
	end
end


function loadAnimDict(dict)
	while ( not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end
