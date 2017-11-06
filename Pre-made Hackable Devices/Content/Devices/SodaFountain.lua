device = {
	-- Stock --
  canAccess = function()
    return true
  end,
	gui = {
		type = "ncurses",
		header = [[~ Soda Fountain Interface v2.1 ~ ]],
		backgroundColour = {0.29, 0.69, 0.77},
		highlightColour = {0.0, 0.0, 1.0},
		buttons = {

        --button one
        system = {
				name = "System Settings",
				onClick = function()
					print("Button clicked!")
				end,
				    subButtons = {

                             social = {
						                 name = "Social media integration \[OFF\]",
                             desc = "Control social media integration",
						                       onClick = function()
                                     --  Particles.Play("Printer",true)
                                     ToggleSocial()
						                             end,
                                       },

				                  },
                  },

      --button 2
      users = {

        name = "User History",
        onClick = function ()

        end,
        subButtons = {

             name = "UserDocs.docx",
             name = "UserDocs2.docx",

			               },
		          },
            },
	 }
 }


social = false
function ToggleSocial()
	social = not social
	if social then
		device.gui.buttons.system.subButtons.social.name = "Social media integration \[ON\]"
		print("Switching social on " .. DeviceName .. " on.")
    Particles.Play("SodaFountain_01",true)
	else
		device.gui.buttons.system.subButtons.social.name = "Social media integration \[OFF\]"
		print("Switching social on " .. DeviceName .. " off.")
    Particles.Stop("SodaFountain_01",true)
	end

	RefreshUI()
end
