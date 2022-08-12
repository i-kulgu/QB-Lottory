local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    if Config.Debug then print('The resource ' .. resourceName .. ' has been started.') end
  end)

