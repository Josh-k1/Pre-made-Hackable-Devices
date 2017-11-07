mission = {

-- Mission info
	startTime = {2009, 04, 27, 21, 13, 00},

-- Character definitions:
	characters = {
		joe = {
			displayName = "Joe Harman",
			internalName = "Joe",
			characterType = "player",
			prefab = "player",
			spawnpoint = "PlayerSpawn",
		},
	},

-- Inventory items:
	items = {
		 usbkey = {
			internalName = "USBDongle",
			displayName = "USB dongle",
	 	description = "Modified USB Bluetooth dongle given to you by the hackers",
		--[[This isn't really used, The UI uses internalName as class instead. Should change it to use image file name from this field.]]--
			uiSpriteName = "usbdongle.png",
		},
	},

--[[ Data files:
Available data types: generic, text, SMS, encrypted, audio, video, location, key, UUID
Table key is used as the internalName value on Unity side.
]]--
	data = {
		PlayerPGPKey = {
			internalName = "PlayerPGPKey",
			name = "Personal PGP encryption key",
			immutable = true,
			dataType = 7,
			creatorName = "Player",
			dataString = "PGP Fingerprint: 1d7d ef54 7a63 5756 63a7 cf14 fbd8 775c c39d 4e51",
			description = "AES 256-bit",
			dataColor = {0.0, 0.6, 1.0, 0.3},
		},
		Documents = {
			internalName ="ServerUsers",
			name = "Server_data_name",
			dataType = 3,
			creatorName = "ServerAdmin",
			dataString ="Bob",
			description = "text/plain,10kb",
			dataColor = {0.0,0.6,1.0,0.3},
		},

	},

-- Networks:
--[[ types: 0 = mobile, 1 = WiFi, 2 = mesh ]]--
	networks = {
		Semaeopus4G = {
			name = "Semaeopus4G",
			networkType = 0,
			allowPlayerDisconnect = false,
			userAccessKey = "user",
			adminAccessKey = "admin",
			rootAccessKey = "root",
		},

	ApostleWiFi = {
		name = "ApostleWiFi",
		networkType = 1,
		allowPlayerDisconnect = true,
		userAccessKey = "apostleuser",
		adminAccessKey = "apostlesecurity",
		rootAccessKey = "apostleroot",
	},
},
-- Mission objectives:
	objectives = {
		-- exampleObjective = {
		-- 	name = "Example",
		-- 	description = "This is an example objective",
		-- 	messages = {
		-- 	},
		-- 	onStart = function()
		-- 		print("Started Example objective")
		-- 	end,
		-- 	onCompleted = function()
		-- 		print("Completed Example objective")
		-- 	end,
		-- },
	},

	devices = {
		laptop = {
			internalName = "Laptop",
			script = "Content/Devices/Laptop.lua",
		},
		sodamachine ={
			internalName="Sodamachine",
			script = "SodaMachine.lua",
		},
		smartfridge ={
			internalName="SmartFridge",
			script = "SmartFridge.lua",
		},
		cctvdome ={
			internalName = "CCTVDome",
			script="CCTVDome.lua"
		},
		desklamp ={
			internalName= "iDeskLamp",
			script="iDeskLamp.lua",
		},
		printer ={
			internalName= "Printer",
			script="Content/Devices/Printer.lua",
		},
		computer ={
			internalName= "Computer-Monitor_01",
			script="Content/Devices/Computer.lua",
		},

		idcard_01 = {
			internalName = "IDcard_01",
			dataColor = {1.0, 0.5, 0.0, 1.0 },
		},

		sodafountain = {
			internalName= "SodaFountain_01",
			script="Content/Devices/SodaFountain.lua"
		},

		handdryer = {
			internalName="HandDryer_01",
			script="Content/Devices/HandDryer.lua"
		},
		cashregister ={
			internalName="CashRegister_01",
			script="Content/Devices/CashRegister.lua"
		},
		serverfull ={
			internalName="Server-Cabinet-Door_01",
			script="Content/Devices/Server_Full.lua"
		},
		waterpump ={
			internalName="Mod_WaterPumpDevice_01",
			script="Content/Devices/waterpump.lua"
		},
	},
}


--[[ Mission Setup ]]--
-- Is called every time the mission is loaded, set up characters, networks, devices etc.
-- Do not add to inventories, connect to networks etc this state is for StartMission
function SetupMission()

-- particles


	-- Add all characters:
	for k, character in pairs(mission.characters) do
		Mission.AddCharacter(character)
	end

	-- Add all networks:
	for k, network in pairs(mission.networks) do
	Mission.AddNetwork(network)
	end





	Mission.AddHackableDevice(mission.devices.laptop)
	Mission.AddHackableDevice(mission.devices.sodamachine)
	Mission.AddHackableDevice(mission.devices.desklamp)
	Mission.AddHackableDevice(mission.devices.cctvdome)
	Mission.AddHackableDevice(mission.devices.smartfridge)
	Mission.AddHackableDevice(mission.devices.printer)
	Mission.AddHackableDevice(mission.devices.computer)
	Mission.AddHackableDevice(mission.devices.sodafountain)
	Mission.AddHackableDevice(mission.devices.handdryer)
	Mission.AddHackableDevice(mission.devices.cashregister)
	Mission.AddHackableDevice(mission.devices.serverfull)
	Mission.AddHackableDevice(mission.devices.waterpump)
--Doors
	Mission.AddNetDevice(mission.devices.idcard_01)

	Doors.SetNetwork(mission.networks.ApostleWiFi)
	Doors.SetZoneKeys("Delivery", {"Maintenance"})

	Mission.MissionStarted()
end

--[[ Mission logic  ]]--
-- This function is only called when the mission is loaded with no save,
-- It should set up initial state for characters including their inventories and networks
function StartMission()
-- particles


-- Add items to player inventory:
	Player.ClearInventory()
	Player.AddItemToInventory(mission.items.usbkey)

	--  Add files to data inventory:
Player.ClearDataFiles()
Player.AddDataFile(mission.data.PlayerPGPKey)
	-- Set up player's network connections:
	Mission.ConnectToNetwork(mission.characters.joe, mission.networks.Semaeopus4G.name, mission.networks.Semaeopus4G.userAccessKey )
	Mission.ConnectToNetwork(mission.devices.laptop, mission.networks.Semaeopus4G.name, mission.networks.Semaeopus4G.userAccessKey )
	Mission.ConnectToNetwork(mission.devices.sodamachine, mission.networks.Semaeopus4G.name, mission.networks.Semaeopus4G.userAccessKey )
	Mission.ConnectToNetwork(mission.devices.desklamp, mission.networks.Semaeopus4G.name, mission.networks.Semaeopus4G.userAccessKey )
	Mission.ConnectToNetwork(mission.devices.cctvdome, mission.networks.Semaeopus4G.name, mission.networks.Semaeopus4G.userAccessKey )
  Mission.ConnectToNetwork(mission.devices.smartfridge, mission.networks.Semaeopus4G.name, mission.networks.Semaeopus4G.userAccessKey )
	Mission.ConnectToNetwork(mission.devices.printer, mission.networks.Semaeopus4G.name, mission.networks.Semaeopus4G.userAccessKey)
	Mission.ConnectToNetwork(mission.devices.computer,mission.networks.ApostleWiFi.name,mission.networks.ApostleWiFi.rootAccessKey)
	Mission.ConnectToNetwork(mission.devices.sodafountain, mission.networks.Semaeopus4G.name, mission.networks.Semaeopus4G.userAccessKey)
	Mission.ConnectToNetwork(mission.devices.handdryer, mission.networks.Semaeopus4G.name, mission.networks.Semaeopus4G.userAccessKey)
	Mission.ConnectToNetwork(mission.devices.cashregister, mission.networks.Semaeopus4G.name, mission.networks.Semaeopus4G.userAccessKey)
	Mission.ConnectToNetwork(mission.devices.serverfull, mission.networks.Semaeopus4G.name, mission.networks.Semaeopus4G.userAccessKey)
	Mission.ConnectToNetwork(mission.devices.waterpump, mission.networks.Semaeopus4G.name, mission.networks.Semaeopus4G.userAccessKey)
Doors.SetKeyOnDevice("Maintenance", mission.devices.idcard_01)
end


-- Triggers
MissionObjects["Computer-Tower_01"].OnPreInteract = function(name)
	local serverAccess = false
	print(name .. " holding item: " .. Player.ItemInQuickSlot())
	if name == Player.GetName() and Player.ItemInQuickSlot() == mission.items.usbkey.internalName then
		print("Holding USBDongle")
		serverAccess = true
		Mission.ConnectToNetwork(mission.devices.computer, mission.networks.Semaeopus4G.name, mission.networks.Semaeopus4G.userAccessKey )
	else
		Sound.TriggerEvent("Play_AccessDeniedSound")
		print("Not holding USBDongle, send hint...")
		Mission.SendHint("theapostle_obj_serveraccess_hint_usbKey", 20)
	end
	return serverAccess
end

MissionObjects["IDcard_01"].OnStartInteracting = function (name)
	if name == Player.GetName()then

	Doors.AssignKeyToCharacter("Maintenance", mission.characters.joe)

	end
end

on = false
MissionObjects["Gen_electricBox_throw"].OnStartInteracting = function (name)

	if name == Player.GetName()and on == false then
		Animator.SetBool("Gen_electricBox_throw","activate", true)
on = true
	else
	Animator.SetBool("Gen_electricBox_throw","activate", false)
	on = false
--end
end
end 
