sendData = true
encrypted = true

characters = {
	"Joe",
	"Smedley",
}

begin = function()
	Send( {"Smedley", "Hey! welcome to the Device Museum "} )
	SendResponse( {"Thanks!",thanks},{"Not you again..please stop talking",stoptalking})
end
thanks = function()
	Send( {"Smedley", "So your interested in modding?"} )
	SendResponse( {"Yes...",modyes},{"No...",modno})

end
stoptalking = function()
	Send( {"Smedley", "ok...so you would not like any help ?"})
	SendResponse( {"Nope..",modno},{"ok maybe a little..",modyes})
end
-- player wants to play and not learn about modding
modno = function()
Send( {"Smedley", "Ok well enjoy the level!"})
End()
end
--player wants to learn about modding
modyes = function()
Send( {"Smedley", "Ok well this Museum was built to help Modders,like your self to get to grips with modding."})
Send( {"Smedley", "Within this Museum you will find many devices that are set up and ready to be put into your own mods!"})
Send( {"Smedley", "To download the source files for this level go to the Existing Mods page on the wiki !"})
SendResponse({"ok cool!"})
Send( {"Smedley", "Better yet you can use your DataUtil App to learn about each device !"})
Send( {"Smedley", "So make sure you use it!"})
SendResponse({"Will do !"})
Send( {"Smedley", "Ok, well Good Luck!"})
End()
end

finish = function()
	End()
end
