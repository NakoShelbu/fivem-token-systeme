token = nil

RegisterNetEvent('jToken:RetrieveToken')
AddEventHandler('jToken:RetrieveToken', function(TokenReceive)
    token = TokenReceive
end)