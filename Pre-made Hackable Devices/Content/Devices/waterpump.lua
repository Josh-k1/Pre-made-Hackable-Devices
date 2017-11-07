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
					pressure = {
						name = "Pressure level:" .. pressure,
					},
					Temperature =
					{
						name = "Water Temperature:",
					},
				},
			},



      Settings ={
				name = "Modify Settings",
        onClick = function ()

        end,
				subButtons = {

					increase = {

						name = "Increase pressure",
						onClick = function ()
							pressure = pressure +1
							CheckUpdates()
					end,
					},

					Decrease ={
						name = "Decrease pressure",
            onClick = function ()
            pressure = pressure -1
							CheckUpdates()
              print(pressure)
          end,

						},
        	},
      	},
    	},
  	},
	}

function CheckUpdates()
device.gui.buttons.Diagnostics.subButtons.pressure.name = "Pressure level:" .. pressure
end
