local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('QBCore:Server:UpdateObject', function() if source ~= '' then return false end QBCore = exports['qb-core']:GetCoreObject() end)

AddEventHandler('onResourceStart', function(resource) if GetCurrentResourceName() ~= resource then return end
	for _, v in pairs(Config.ScrapItems) do if not QBCore.Shared.Items[v] then print("^5Debug^7: ^6ScrapItems^7: ^2Missing Item from ^4QBCore^7.^4Shared^7.^4Items^7: '^6"..v.."^7'") end end
end)

RegisterServerEvent('jim-recycle:Scrap:Reward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	for i = 1, math.random(1, 2) do
		local item = Config.ScrapItems[math.random(1, #Config.ScrapItems)]
		local amount = math.random(1, 4)
		Player.Functions.AddItem(item, amount)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
		Citizen.Wait(100)
	end
	--If two random numbers match, give reward
	if math.random(1, 3) == math.random(1, 3) then
		local random = math.random(1, 3)
		Player.Functions.AddItem("steel", random)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["steel"], 'add', random)
	end
end)
