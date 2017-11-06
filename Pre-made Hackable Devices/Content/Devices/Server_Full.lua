device = {
	canAccess = function()
	 return Player.HasDataFile("PlayerPGPKey")
	end,
	gui = {
		type = "ncurses",
		header = [[HostTec™ personal servers for You!]],
		backgroundColour = {0.64, 0.14, 0.001},
		highlightColour = {0.0, 0.0, 1.0},
		buttons = {
		 	Social = {
				name = "Control Panel",
				subButtons =
				{
          {
            name = "UsersHistory.txt",
            onClick = function()
                RunMissionCommand([[Mission.SendData(mission.devices.serverfull, mission.characters.joe, mission.data.Documents)]])
            end,
          },
				},
		 	},
    },
  },
}
