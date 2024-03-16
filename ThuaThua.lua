  local Module = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)

    local CombatFramework = debug.getupvalues(Module)[2]

    local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)

    

    task.spawn(function()

        while true do task.wait()

            if true then -- skidded

                pcall(function()

                    CameraShakerR:Stop()


                    CombatFramework.activeController.hitboxMagnitude = 100

                end)

            end

        end

    end)
local a=debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework")))[2]local b=require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))local c=getupvalues(b)[2]local d=require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)local e=getupvalues(d)[2]local f=require(game.ReplicatedStorage.CombatFramework.RigLib)local g=tick();function CurrentWeapon()local i=c.activeController;local j=i.blades[1]if not j then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end;pcall(function()while j.Parent~=game.Players.LocalPlayer.Character do j=j.Parent end end)if not j then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end;return j end;function getAllBladeHitsPlayers(k)Hits={}local l=game.Players.LocalPlayer;local m=game:GetService("Workspace").Characters:GetChildren()for n=1,#m do local o=m[n]Human=o:FindFirstChildOfClass("Humanoid")if o.Name~=game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health>0 and l:DistanceFromCharacter(Human.RootPart.Position)<k+5 then table.insert(Hits,Human.RootPart)end end;return Hits end;function getAllBladeHits(k)Hits={}local l=game.Players.LocalPlayer;local p=game:GetService("Workspace").Enemies:GetChildren()for n=1,#p do local o=p[n]Human=o:FindFirstChildOfClass("Humanoid")if Human and Human.RootPart and Human.Health>0 and l:DistanceFromCharacter(Human.RootPart.Position)<k+5 then table.insert(Hits,Human.RootPart)end end;return Hits end;ReturnFunctions={}function CurrentWeapon()local i=c.activeController;local j=i.blades[1]if not j then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end;pcall(function()while j.Parent~=game.Players.LocalPlayer.Character do j=j.Parent end end)if not j then return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name end;return j end;function getAllBladeHitsPlayers(k)Hits={}local l=game.Players.LocalPlayer;local m=game:GetService("Workspace").Characters:GetChildren()for n=1,#m do local o=m[n]Human=o:FindFirstChildOfClass("Humanoid")if o.Name~=game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health>0 and l:DistanceFromCharacter(Human.RootPart.Position)<k+5 then table.insert(Hits,Human.RootPart)end end;return Hits end;function lonmemaytofff(k)Hits={}local l=game.Players.LocalPlayer;local p=game:GetService("Workspace").Enemies:GetChildren()for n=1,#p do local o=p[n]Human=o:FindFirstChildOfClass("Humanoid")if Human and Human.RootPart and Human.Health>0 and Human.Health~=Human.MaxHealth and l:DistanceFromCharacter(Human.RootPart.Position)<k+5 then table.insert(Hits,Human.RootPart)end end;return Hits end;getgenv().click = function() pcall(function()if game.Players.LocalPlayer.Character.Stun.Value~=0 then return nil end;local i=c.activeController;i.hitboxMagnitude=55;if i and i.equipped then for q=1,1 do local r=require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(game.Players.LocalPlayer.Character,{game.Players.LocalPlayer.Character.HumanoidRootPart},60)if#r>0 then local s=debug.getupvalue(i.attack,5)local t=debug.getupvalue(i.attack,6)local u=debug.getupvalue(i.attack,4)local v=debug.getupvalue(i.attack,7)local w=(s*798405+u*727595)%t;local x=u*798405(function()w=(w*t+x)%1099511627776;s=math.floor(w/t)u=w-s*t end)()v=v+1;debug.setupvalue(i.attack,5,s)debug.setupvalue(i.attack,6,t)debug.setupvalue(i.attack,4,u)debug.setupvalue(i.attack,7,v)for y,o in pairs(i.animator.anims.basic)do o:Play()end;if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")and i.blades and i.blades[1]then game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(CurrentWeapon()))game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(w/1099511627776*16777215),v+1)game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit",r,2,"")end end end end end)end
return getgenv().click
