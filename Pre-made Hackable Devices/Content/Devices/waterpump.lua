pressure = 10

device = {
	-- Stock --
	canAccess = function()
	 return true
	end,
	gui = {
		type = "ncurses",
		header = [[~ SHA Orga workstation v2.1 ~ ]],
		backgroundColour = {0.29, 0.69, 0.77},
		highlightColour = {0.0, 0.0, 1.0},
		buttons = {
			Diagnostics ={
				name = "Water Pump Diagnostics",
				subButtons = {
					{
						name = "Pressure level:" .. pressure,
					},
					{
						name = "Water Temperature:",
					},
        },
      },

      Settings ={
				name = "Modify Settings",
        onClick = function ()
          pressure = pressure +1
          print(pressure)
        end,
				subButtons = {
					{
						increase = {
						name = "Increase pressure",
						onClick = function ()
							CheckUpdates()
					end,
					},

					},
					{
						name = "Decrease pressure",
            onClick = function ()
            pressure = pressure -1
              print(pressure)
          end,

					},
        },
      },
    },
  },
}

function CheckUpdates()
device.gui.buttons.system.subButtons.increase.name = "No new updates."
end
