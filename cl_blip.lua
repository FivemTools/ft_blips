-- @Date:   2017-06-13T14:54:37+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-24T19:16:14+02:00
-- @License: GNU General Public License v3.0

-- Constructor
Blip = {}
Blip.__index = Blip

-- Meta table for users
setmetatable(Blip, {
  __call = function(self,data)
    local p = {}
    p.blip = nil
    p.x = data.x or 0
    p.y = data.y or 0
    p.z = data.z or 0
    p.text = data.text or "Blip"
    p.imageId = data.imageId or 416
    p.colorId = data.colorId or 0
    p.shortRange = data.shortRange or true
    p.show = show or true
    return setmetatable(p, Blip)
  end
})

function Blip:Show()
  Citizen.CreateThread(function()

    if self.x ~= nil and self.y ~= nil and self.z ~= nil and self.blip == nil then
      self.blip = AddBlipForCoord(self.x, self.y, self.z)
      SetBlipSprite(self.blip, self.imageId)
      SetBlipAsShortRange(self.blip, self.shortRange)
      SetBlipColour(self.blip, self.colorId)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(self.text)
      EndTextCommandSetBlipName(self.blip)
    end

  end)
end

function Blip:Hide()
  Citizen.CreateThread(function()

    if self.blip ~= nil then
      RemoveBlip(self.blip)
    end

  end)
end
