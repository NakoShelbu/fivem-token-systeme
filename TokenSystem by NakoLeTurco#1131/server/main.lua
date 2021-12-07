local CHARACTERS = {[1] = 'A',[2] = 'B',[3] = 'C',[4] = 'D',[5] = 'E',[6] = 'F',[7] = 'G',[8] = 'H',[9] = 'I',[10] = 'J',[11] = 'K',[12] = 'L',[13] = 'M',[14] = 'N',[15] = 'O',[16] = 'P',[17] = 'Q',[18] = 'R',[19] = 'S',[20] = 'T',[21] = 'U',[22] = 'V',[23] = 'W',[24] = 'X',[25] = 'Y',[26] = 'Z'}
local SPECIALCHARACTERS = {[1] = "/", [2] = "*", [3] = "-", [4] = "+",[5] = "*",[6] = "ù",[7] = "%"}

local TOKEN = {}

RegisterServerEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(source, xPlayer)
    local numbers1 = math.random (9500, 15000)
    local numbers2 = math.random(7850, 27000)
    local numbers3 = math.random(500, 1000)
    local numbers4 = math.random(50000, 100000)
    local CharSpecialRandom1 = math.random(1,7)
    local CharSpecialRandom2 = math.random(1,7)
    local lettersrandom1 = math.random(1,26)
    TOKEN[source] = {}
    TOKEN[source].token = SPECIALCHARACTERS[CharSpecialRandom1]..''..numbers4..''..numbers1..''..numbers4..''..SPECIALCHARACTERS[CharSpecialRandom2]..''..CHARACTERS[lettersrandom1]..'TOKENADASTRA!!!!4/*-+'..numbers4..''..numbers3..''..numbers2
    TriggerClientEvent('jToken:RetrieveToken', source, TOKEN[source].token)
    TriggerEvent('jToken:RetrieveToken', TOKEN)
    print('[^4CONNECTION^0] Génération du Token de '..GetPlayerName(source)..' [^4'..TOKEN[source].token..'^0]')
end)

function VerifyToken(source, tokenReceive, onAccepted, onRefused)
    if TOKEN[source].token == tokenReceive then
        onAccepted();
    else
        onRefused();
        DropPlayer(source, 'Désynchronisation avec le serveur ou detection de Cheat')
    end
end