-- @Date:   2017-06-13T14:30:46+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-13T15:26:11+02:00
-- @License: GNU General Public License v3.0

local blips = {}

function Add(name, data)
  Citizen.CreateThread(function()

    blips[name] = Blip(data)

    if blips[name].show then
      blips[name]:Show()
    end

  end)
end

function Remove(name)
  Citizen.CreateThread(function()

    if blips[name] ~= nil then
    	blips[name]:Hide()
      blips[name] = nil
    end

  end)
end

function Show(name)
  Citizen.CreateThread(function()

    if blips[name] ~= nil then
  	 blips[name]:Show()
    end

  end)
end

function Hide(name)
  Citizen.CreateThread(function()

    if blips[name] ~= nil then
  	 blips[name]:Hide()
    end

  end)
end

function BlipGenerator(blips)
  Citizen.CreateThread(function()

    for name, data in pairs(blips) do
      Add(name, data)
    end

  end)
end
