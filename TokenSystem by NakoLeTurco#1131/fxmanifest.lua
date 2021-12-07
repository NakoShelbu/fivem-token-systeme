fx_version "adamant"

game "gta5"

client_scripts {
    -- RAGEUI
    "client/*.lua"
}

server_scripts {
    "@async/async.lua",
    "@mysql-async/lib/MySQL.lua",
    "server/*.lua"
}