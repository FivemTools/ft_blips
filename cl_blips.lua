-- @Project: FiveM Tools
-- @License: GNU General Public License v3.0

local Blips = {}

function Add(name, data)
  Citizen.CreateThread(function()

    Blips[name] = Blip(data)

    if Blips[name].show then
      Blips[name].Show()
    end

  end)
end

function Remove(name)
  Citizen.CreateThread(function()

    if Blips[name] ~= nil then
    	Blips[name].Hide()
      Blips[name] = nil
    end

  end)
end

function Show(name)
  Citizen.CreateThread(function()

    if Blips[name] ~= nil then
  	 Blips[name].Show()
    end

  end)
end

function Hide(name)
  Citizen.CreateThread(function()

    if Blips[name] ~= nil then
  	 Blips[name].Hide()
    end

  end)
end

function Generator(data)
  Citizen.CreateThread(function()

    if type(data) == "table" then
      for name, blip in pairs(data) do
        Add(name, blip)
      end
    end

  end)
end

RegisterNetEvent('ft_blips:ClAdd')
AddEventHandler('ft_blips:ClAdd', function(data)
  Add(data)
end)

RegisterNetEvent('ft_blips:ClRemove')
AddEventHandler('ft_blips:ClRemove', function(name)
  Remove(name)
end)

RegisterNetEvent('ft_blips:ClShow')
AddEventHandler('ft_blips:ClShow', function(name)
  Show(name)
end)

RegisterNetEvent('ft_blips:ClHide')
AddEventHandler('ft_blips:ClHide', function(name)
  Hide(name)
end)

RegisterNetEvent('ft_blips:ClGenerator')
AddEventHandler('ft_blips:ClGenerator', function(data)
  Generator(data)
end)
