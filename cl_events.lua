-- @Date:   2017-06-13T14:50:56+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-13T15:05:45+02:00
-- @License: GNU General Public License v3.0

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

RegisterNetEvent('ft_blips:ClBlipGenerator')
AddEventHandler('ft_blips:ClHide', function(blips)
  BlipGenerator(blips)
end)
