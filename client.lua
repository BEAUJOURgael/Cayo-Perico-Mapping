local island = vector3(4840.57, -5174.42, 2.0)
local active = false


CreateThread(function()
    while true do
        local near = #(GetEntityCoords(PlayerPedId()) - island) < 2000.0
        if near ~= active then
            active = near
            SetIslandEnabled('HeistIsland', near)
            SetAiGlobalPathNodesType(near and 1 or 0)
            SetScenarioGroupEnabled('Heist_Island_Peds', near)
            SetAudioFlag('PlayerOnDLCHeist4Island', near)
            SetAmbientZoneListStatePersistent('AZL_DLC_Hei4_Island_Zones', near, near)
        end
        Wait(2000)
    end
end)

CreateThread(function()
    while true do
        if GetInteriorFromEntity(PlayerPedId()) == 0 then
            SetRadarAsExteriorThisFrame()
            SetRadarAsInteriorThisFrame(`h4_fake_islandx`, 4700.0, -5145.0, 0, 0)
        end
        Wait(0)
    end
end)