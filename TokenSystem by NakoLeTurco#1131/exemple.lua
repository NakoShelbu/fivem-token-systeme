-- A UTILISER DANS L'EVENT SERVER SIDE !
-- BY NakoLeTurco#1131
-- CECI EST UN EXEMPLE DE TRIGGERS UTILISANT LA VERIFICATION DE TOKEN ! ( SERVER SIDE )
RegisterServerEvent('::{korioz#0110}::esx_shops:pickUp')
AddEventHandler('::{korioz#0110}::esx_shops:pickUp', function(store, token)
    VerifyToken(source, token, function()
		local xPlayer = ESX.GetPlayerFromId(source)
		local sCoords = BraquageSuperette.Zones[store].coords
		local pCoords = xPlayer.getCoords(true)
		local pDst = #(sCoords - pCoords)
	
		if BraquageSuperette.Zones[store].robbed then
			if not BraquageSuperette.Zones[store].takedPickUp then
				local reward = math.random(BraquageSuperette.Zones[store].reward[1], BraquageSuperette.Zones[store].reward[2]) --BraquageSuperette.Zones[store].reward
	
				if pDst < 10.0 then
					xPlayer.addAccountMoney('dirtycash', reward)
					TriggerClientEvent('::{korioz#0110}::esx:showNotification', source, 'Braquage terminé, Vous avez reçu.. ~r~' .. reward .. '$')
					TriggerClientEvent('::{korioz#0110}::esx_shops:removePickup', -1, store)
					BraquageSuperette.Zones[store].takedPickUp = true
				else
					DropPlayer(source, 'Problème de synchronisation avec les braquages de superettes')
				end
			else
				DropPlayer(source, 'Problème de synchronisation avec les braquages de superettes')
			end
		end
    end, function()

    end)
end)

-- LA FUNCTION SERVER SIDE

VerifyToken(source, token, function()
    -- Si le token est bien alors sa execute le code ici 
end, function()
    -- Si le token est pas bon sa va kick le joueur automatiquement
end)

--CLIENT SIDE

-- VOICI UN EXEMPLE DE TRIGGERS

TriggerServerEvent('::{korioz#0110}::esx_shops:pickUp', store, token)

-- Il faut que vous mettiez sa dans tous vos script ou vous utilisez le token :

-- COTER CLIENT : 

token = nil

RegisterNetEvent('jToken:RetrieveToken')
AddEventHandler('jToken:RetrieveToken', function(TokenReceive)
    token = TokenReceive
end)