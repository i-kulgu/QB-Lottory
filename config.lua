Config = {}

Config.Multiplier = 5 --The Ammount the total lottery pay out will be, based off total value tickets are sold
Config.TicketValue = 5000 --- The value the database goes up everytime a ticket is submitted. Best practice to use what the sales price you sell the tickets in stores for
Config.Webhook = "" --Webhook for announcing Lotto Pot Value everytime its updated
Config.WinHook = "" -- Webhook for where the winner will be posted
Config.DrawDay = 6 -- weekday the draw will be done, 1=sunday, 2 monday, 3 tuesday, 4 wednesday, 5 thursday, 6 friday, 7 saturday
Config.DrawTime = 19 --The hour it will be drawn at, 24HR Clock
Config.AlwaysNotify = false -- Should the server post new pot every ticket submission? if false, itll only post on server restart

---------------------------------- READ THE README FILE FOR SETUP INSTRUCTIONS -----------------------------------------