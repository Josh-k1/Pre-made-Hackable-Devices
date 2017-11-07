device = {
	-- Stock --
	gui = {
		type = "ncurses",
		header = [[~ Wireless Printer v2.1 ~ ]],
		backgroundColour = {0.29, 0.69, 0.77},
		highlightColour = {0.0, 0.0, 1.0},
		buttons = {
			{
        --button one
				name = "Printer Settings",
				onClick = function()
					print("Button clicked!")
				end,
				subButtons = {
					{
						name = "Print Test Page",
						onClick = function()

              Particles.Play("Printer",true)


						end,
					},
				},
      },
      --button 2
      {

        name = "User History",
        onClick = function ()

        end,
        subButtons = {
          {
             name = "UserDocs.docx",
             name = "UserDocs2.docx",
         },
			 },
		 },
	 }
 }
}
