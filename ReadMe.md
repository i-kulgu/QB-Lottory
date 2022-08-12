Thanks for checking out my first script! 

How to install

1. Import the SQL file into your database, Itll create two tables, one for ticket submissions and one for the server to store its 
lotto pot in. 
2. In the serverLottory table, add one entry, you can set the pot to start at what ever youd like. 
3. Create a webhook on your discord for where you want the winning announcement to be made, I put mine right in my general chat for 
everyone to see ;) #BraggingRights :P
4. Create a webhook for where you want to log entries and get the updated POT value. Its totally upto you if you want players to see it or not. when it gets up there tho, more people tend to but the tickets!
5. Add the item to qb-core/shared/items.lua
6. copy the ticket image to qb-inventory/html/images
7. Restart your server and enjoy!

You can use /lottodraw for a forced draw. WARNING THOUGH! it will erase your ticket submissions as it counts as an official draw! This is for testing purposes to make sure its drawing and adding money to players correctly!

TODO:
-   Determine weather the player is online or offline, if offline than modify player data and add money to their account
-   fix the loop to check the day of the draw and check if draw has been made and save/reset timer to database

Default Config setup Just in Case
--------------------------------------------------------------------------------------------------

Config = {}

Config.Multiplier = 5 --The Ammount the total lottery pay out will be, based off total value tickets are sold
Config.TicketValue = 5000 --- The value the database goes up everytime a ticket is submitted. Best practice to use what the sales price you sell the tickets in stores for
Config.Webhook = "" --Webhook for announcing Lotto Pot Value everytime its updated
Config.WinHook = "" -- Webhook for where the winner will be posted
Config.DrawDay = 6 -- weekday the draw will be done, 1=sunday, 2 monday, 3 tuesday, 4 wednesday, 5 thursday, 6 friday, 7 saturday
Config.DrawTime = 19 --The hour it will be drawn at, 24HR Clock
Config.AlwaysNotify = false -- Should the server post new pot every ticket submission? if false, itll only post on server restart

--[[

Add the lotto.png to 
QB-Inventory/html/images


ADD THIS TO QB-Shops config, to the item stores you want to sell them in

        [13] = {                    --be sure to increment correctly
            name = "lotto",
            price = 5000,           -- I set the price of the tickets to the value above for more accurate lotto pots
            amount = 99999999,
            info = {},
            type = "item",
            slot = 13,              ----be sure to increment correctly
        },


Insert this item into QB-Core/Shared/items.lua

['lotto']  = {['name'] = 'lotto',	['label'] = 'Lottery Ticket',   ['weight'] = 0,     ['type'] = 'item',  ['image'] = 'lotto.png',    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Chance to Win Lottery!'},

]]