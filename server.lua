local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    local t = os.date("*t") -- Gets server date and time
    print('Time Test'..t.wday..' DAY @'..t.hour..' hour')
    --UpdatePayout(0)
    
  end)


QBCore.Functions.CreateUseableItem("lotto", function(source)
    local source = source
    local item = 'lotto'
    RegisterTicket(source, item)
end)

function RegisterTicket(source, item)
    local player = QBCore.Functions.GetPlayer(source)
    local playerID = player.PlayerData.citizenid
--    local ticket = item
    print("lotto system ", player.PlayerData.citizenid)

    if playerID ~= nil then
        MySQL.Async.insert("INSERT INTO lotterytickets (citizenid) VALUES (@citizen) ", {
            ["@citizen"] = playerID
        })
        player.Functions.RemoveItem('lotto', 1)
        TriggerClientEvent('QBCore:Notify', player, 'You are Now entered to win!', 'success')
        UpdatePayout(Config.TicketValue)
    end


end

function UpdatePayout(value)
        MySQL.Async.fetchAll("SELECT * FROM lotteryserver ORDER BY id DESC LIMIT 1", {}, function(result)
            local oldpayout = result[1].Payout
            local newPayout = oldpayout+value
            print ("payout:", newPayout)

            MySQL.Async.execute("UPDATE lotteryserver SET Payout = ? WHERE id = 1", {
                newPayout
            })
            PostToDiscord(newPayout)
            
            end) 
end

function ClearPayout()
    local value = 0
        MySQL.Async.execute("UPDATE lotteryserver SET Payout = ? WHERE id = 1", {
            value
        })
        ClearTickets()

end


function PostToDiscord(PayoutValue)
    MySQL.Async.fetchAll("SELECT * FROM lotterytickets ORDER BY id DESC LIMIT 1", {}, function(result)
        local submissions = result[1].id
        local MaxPayout = PayoutValue*Config.Multiplier
        local text = ("The Dead End Lottery Value today is $".. MaxPayout.." With "..submissions.." Tickets Submitted")
        PerformHttpRequest(Config.Webhook, function(err, text, header) end, 'POST', json.encode({content = text}), {["Content-Type"] = 'application/json'})
    
    end)
end

QBCore.Commands.Add('lotterydraw', 'Draw Lottery Winner Manually (Admin Only)', {}, false, function(source, args)
    TriggerEvent('Lottery:Server:Payout')
end, 'god')

-- Handler for the admin command to trigger early Payout
AddEventHandler("Lottery:Server:Payout", function(src)
    ChooseWinner()
end)


function ChooseWinner()
    MySQL.Async.fetchAll("SELECT * FROM lotterytickets ORDER BY id DESC LIMIT 1", {}, function(result)
    local totaltickets = result[1].id
    local winningticket = math.random(1, totaltickets)
        MySQL.Async.fetchSingle('SELECT citizenid FROM `lotterytickets` WHERE id = ?', {winningticket}, function(result)
            --
                local characterID = result.citizenid
                print(characterID)

                if characterID ~= nil then
                    MySQL.Async.fetchAll('SELECT * FROM players WHERE citizenid = ? ', {characterID}, function (result)
                        local pData = QBCore.Functions.GetPlayerByCitizenId(result[1].citizenid)
                        if pData ~= nil then
                        local FirstName = pData.PlayerData.charinfo.firstname
                        local LastName  = pData.PlayerData.charinfo.lastname
                        local Player = QBCore.Functions.GetPlayer(pData.PlayerData.id)
                            if Player == nil then
                                MySQL.Async.fetchSingle("SELECT Payout FROM lotteryserver WHERE 1", {}, function(result)
                                local text = ('The winner of the $'..lottopayout..' is! '..FirstName..' '..LastName..'')
                                print(text)
                                -- Player.Functions.AddMoney('bank', lottopayout)
                               -- ClearPayout()
                               -- PerformHttpRequest(Config.WinHook, function(err, text, header) end, 'POST', json.encode({content = text}), {["Content-Type"] = 'application/json'})
                                end)

                            end
                        print ('Player is NOT in the CITY')
                        Wait(10000)
                        ChooseWinner()
                            
                            
                            
                           
                        
                        
                        end
                    end)
                end
        end)
    end)
end

--Clears ALL Ticket Submissions

function ClearTickets()
    MySQL.Async.execute("TRUNCATE lotterytickets")
end




-- Checks what time it is and waits patiently for the draw
Citizen.CreateThread(function()
while true do
    Citizen.Wait(60000) -- Check every minute 
    local t = os.date("*t")
    if t.day == Config.DrawDay and t.hour == Config.DrawTime and t.min == 00 then
        print("Choosing winner.... Drum Roll!")
        ChooseWinner()
    else

    end
end
end)