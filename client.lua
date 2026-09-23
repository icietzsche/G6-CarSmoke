local CONFIG = {
    size = 0.2,          -- normal drift duman boyutu
    dens = 7,            -- yoğunluk
    burnout_size = 0.2,  -- burnout dumanı boyutu
    multiplayer = true,  -- yakın arabalar da duman göstersin
    distance = 35.0,     -- dumanın kaç metre mesafede gözükeceği
}

local bone_list = { "wheel_lr", "wheel_rr" }
local activeSmokes = {} 
local nearbyVehicles = {}

Citizen.CreateThread(function()
    local base = "scr_recartheft"
    local base2 = "core"

    RequestNamedPtfxAsset(base)
    while not HasNamedPtfxAssetLoaded(base) do Wait(10) end
    RequestNamedPtfxAsset(base2)
    while not HasNamedPtfxAssetLoaded(base2) do Wait(10) end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        
        local ped = PlayerPedId()
        local selfPos = GetEntityCoords(ped)
        local allVehicles = GetGamePool('CVehicle')
        local tempVehicles = {}

        if CONFIG.multiplayer then
            for i = 1, #allVehicles do
                local veh = allVehicles[i]
                if veh ~= 0 and DoesEntityExist(veh) then
                    local vehPos = GetEntityCoords(veh)
                    if #(selfPos - vehPos) < CONFIG.distance then
                        if IsThisModelACar(GetEntityModel(veh)) then
                            tempVehicles[#tempVehicles + 1] = veh
                        end
                    end
                end
            end
        else
            local myCar = GetVehiclePedIsIn(ped, false)
            if myCar ~= 0 and IsThisModelACar(GetEntityModel(myCar)) then
                tempVehicles[1] = myCar
            end
        end

        nearbyVehicles = tempVehicles
    end
end)

Citizen.CreateThread(function()
    local base = "scr_recartheft"
    local base2 = "core"

    while true do 
        Citizen.Wait(150)

        if #nearbyVehicles > 0 then
            for i = 1, #nearbyVehicles do
                local vehicle = nearbyVehicles[i]
                
                if DoesEntityExist(vehicle) and not activeSmokes[vehicle] then
                    local speed = GetEntitySpeed(vehicle)
                    
                    if speed < 1.0 then
                        if IsVehicleInBurnout(vehicle) then
                            DriftSmoke(base2, "exp_grd_bzgas_smoke", vehicle, 3, CONFIG.burnout_size)
                        end
                    elseif speed >= 3.0 then
                        if GetVehicleCurrentGear(vehicle) ~= 0 then
                            local ang = getAngle(vehicle)
                            if ang ~= 0 then
                                DriftSmoke(base, "scr_wheel_burnout", vehicle, CONFIG.dens, CONFIG.size)
                            end
                        end
                    end
                end
            end
        else
            Citizen.Wait(500)
        end
    end
end)

function DriftSmoke(base, sub, car, dens, size)
    activeSmokes[car] = true 
    
    Citizen.CreateThread(function()
        local all_part = {}
        local boneLeft = GetEntityBoneIndexByName(car, bone_list[1])
        local boneRight = GetEntityBoneIndexByName(car, bone_list[2])

        for i = 1, dens do
            UseParticleFxAssetNextCall(base)
            local W1 = StartParticleFxLoopedOnEntityBone(sub, car, 0.05, 0.0, 0.0, 0.0, 0.0, 0.0, boneLeft, size, false, false, false)
            UseParticleFxAssetNextCall(base)
            local W2 = StartParticleFxLoopedOnEntityBone(sub, car, 0.05, 0.0, 0.0, 0.0, 0.0, 0.0, boneRight, size, false, false, false)
            all_part[#all_part + 1] = W1
            all_part[#all_part + 1] = W2
        end
        
        Citizen.Wait(1000)
        
        for i = 1, #all_part do
            StopParticleFxLooped(all_part[i], true)
        end
        
        activeSmokes[car] = nil 
    end)
end

function getAngle(veh)
    local vel = GetEntityVelocity(veh)
    local modV = math.sqrt(vel.x * vel.x + vel.y * vel.y) 
    
    if modV == 0 then return 0 end
    
    local rot = GetEntityRotation(veh, 0)
    local rzRad = math.rad(rot.z)
    local sn, cs = -math.sin(rzRad), math.cos(rzRad)
    
    local cosX = (sn * vel.x + cs * vel.y) / modV
    if cosX > 0.966 or cosX < 0 then 
        return 0 
    end
    
    return math.deg(math.acos(cosX)) * 0.5
end