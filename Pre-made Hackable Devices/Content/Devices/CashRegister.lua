names 	= {"Rich", "Pontus", "Harry", "Jonas", "David", "Diane", "Tom", "Terrence", "Rob", "Toby", "Marc", "James", "Graham"}
states 	= {"Used today", "Not used today"}
usedNames = {}

function randName()
	unique 	= false
	name 	= ""
	while unique == false do
		name = names[math.random(1, #names)]
		if(usedNames[name] == nil) then
			unique = true
			usedNames[name] = true
		end
	end
	return name
end

function randState()
	return states[math.random(1, #states)]
end


device = {
	canAccess = function()
	 return Player.HasDataFile("PlayerPGPKey")
	end,
	gui = {
		type = "ncurses",
		header = [[DryTec™ personal hand airer with social integration console]],
		backgroundColour = {0.64, 0.14, 0.001},
		highlightColour = {0.0, 0.0, 1.0},
		buttons = {
		 	Social = {
				name = "Social - Users",
				subButtons =
				{
					{
		 				name = "<color=white>Name: " .. randName() .. "</color>"
		 			},
		 			{
		 				name = "Status: " .. randState(),
		 			},
					{
		 				name = "<color=white>Name: " .. randName() .. "</color>"
		 			},
		 			{
		 				name = "Status: " .. randState(),
		 			},
					{
		 				name = "<color=white>Name: " .. randName() .. "</color>"
		 			},
		 			{
		 				name = "Status: " .. randState(),
		 			},
					{
		 				name = "<color=white>Name: " .. randName() .. "</color>"
		 			},
		 			{
		 				name = "Status: " .. randState(),
		 			},
					{
		 				name = "<color=white>Name: " .. randName() .. "</color>"
		 			},
		 			{
		 				name = "Status: " .. randState(),
		 			},
				},
		 	},
    },
  },
}
