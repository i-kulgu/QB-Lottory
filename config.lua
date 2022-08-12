Config = {}

Config.Multiplier = 5 --The Ammount the total lottery pay out will be, based off total value tickets are sold
Config.TicketValue = 5000 --- The value the database goes up everytime a ticket is submitted. Best practice to use what the sales price you sell the tickets in stores for
Config.Webhook = "https://discord.com/api/webhooks/984989370765439096/vxFGGpEl2kNSCKk67DeirLaIMk2GeQolownM5UEtH85qqlA-QQEB4kAvLE1__3YUCRum"
Config.WinHook = "https://discord.com/api/webhooks/985573115365032017/IJGqak819AzrM_LXoVfKbBf78BDHHb_ROGnvVsgowYyJquYP1bQ0EiG_iBbdRksO8Cof" -- Webhook for where the winner will be posted
Config.DrawDay = 6 -- weekday the draw will be done, 1=sunday, 2 monday, 3 tuesday, 4 wednesday, 5 thursday, 6 friday, 7 saturday
Config.DrawTime = 19 --The hour it will be drawn at, 24HR Clock


-- Addded a comment
-- Kents  returned comment
--[[ To Do

admin triggered draw command, and auto draw by date ex, every friday at 1pm

Add the lotto.png to 
QB-Inventory/html/images


ADD THIS TO QB-Shops config, to the item stores you want to sell them in

        [13] = {                    --be sure to increment correctly
            name = "lotto",
            price = 5000,
            amount = 99999999,
            info = {},
            type = "item",
            slot = 13,              ----be sure to increment correctly
        },


Insert this item into QB-Core/Shared/items.lua

['lotto']  = {['name'] = 'lotto',	['label'] = 'Lottery Ticket',   ['weight'] = 0,     ['type'] = 'item',  ['image'] = 'lotto.png',    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Chance to Win Lottery!'},

]]