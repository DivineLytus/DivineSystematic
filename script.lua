task.spawn(function()
-- ══════════════════════════════════════
-- DIVINE SYSTEMATIC  — Loading Screen
-- ══════════════════════════════════════
local Players      = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer  = Players.LocalPlayer
local PlayerGui    = LocalPlayer:WaitForChild("PlayerGui")
local HUB_NAME="Divine Systematic"; local HUB_VERSION="v4"; local HUB_SUBTITLE="Blox Fruits Edition"
local LOAD_STEPS={"Iniciando sistema...","Cargando datos...","Verificando conexion...","Preparando funciones...","Listo."}
local C={BG=Color3.fromRGB(5,5,16),CYAN=Color3.fromRGB(0,255,255),PINK=Color3.fromRGB(255,0,144),GREEN=Color3.fromRGB(0,255,80),DIM=Color3.fromRGB(0,160,160)}
 
local ScreenGui=Instance.new("ScreenGui"); ScreenGui.Name="CyberpunkHub"; ScreenGui.ResetOnSpawn=false
ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling; pcall(function() ScreenGui.IgnoreGuiInset=true end); ScreenGui.Parent=PlayerGui
local Overlay=Instance.new("Frame"); Overlay.Size=UDim2.fromScale(1,1); Overlay.BackgroundColor3=Color3.fromRGB(0,0,0)
Overlay.BackgroundTransparency=0.25; Overlay.BorderSizePixel=0; Overlay.ZIndex=1; Overlay.Parent=ScreenGui
local Panel=Instance.new("Frame"); Panel.Size=UDim2.new(0,340,0,300); Panel.AnchorPoint=Vector2.new(0.5,0.5)
Panel.Position=UDim2.new(0.5,0,1.6,0); Panel.BackgroundColor3=C.BG; Panel.BorderSizePixel=0; Panel.ZIndex=2; Panel.Parent=Overlay
Instance.new("UICorner",Panel).CornerRadius=UDim.new(0,8)
local PS=Instance.new("UIStroke"); PS.Color=C.CYAN; PS.Thickness=1.5; PS.Transparency=0.3; PS.Parent=Panel
 
local function MkLabel(t)
    local l=Instance.new("TextLabel"); l.BackgroundTransparency=1; l.BorderSizePixel=0
    l.TextColor3=t.color or C.CYAN; l.Font=t.font or Enum.Font.Code; l.TextSize=t.size or 13
    l.Text=t.text or ""; l.Size=t.sz or UDim2.new(1,0,0,22); l.Position=t.pos or UDim2.new(0,0,0,0)
    l.TextXAlignment=t.align or Enum.TextXAlignment.Center; l.ZIndex=3; l.Parent=t.parent or Panel; return l
end
local function MkCornerLoad(pos,rot)
    local f=Instance.new("Frame"); f.Size=UDim2.new(0,14,0,14); f.Position=pos; f.BackgroundTransparency=1
    f.BorderSizePixel=0; f.Rotation=rot; f.ZIndex=3; f.Parent=Panel
    local h=Instance.new("Frame"); h.Size=UDim2.new(1,0,0,2); h.BackgroundColor3=C.CYAN; h.BorderSizePixel=0; h.ZIndex=4; h.Parent=f
    local v=Instance.new("Frame"); v.Size=UDim2.new(0,2,1,0); v.BackgroundColor3=C.CYAN; v.BorderSizePixel=0; v.ZIndex=4; v.Parent=f
end
MkCornerLoad(UDim2.new(0,8,0,8),0); MkCornerLoad(UDim2.new(1,-22,0,8),90)
MkCornerLoad(UDim2.new(0,8,1,-22),-90); MkCornerLoad(UDim2.new(1,-22,1,-22),180)
MkLabel({text="  "..HUB_NAME.."  ",color=C.CYAN,font=Enum.Font.GothamBold,size=22,sz=UDim2.new(1,0,0,34),pos=UDim2.new(0,0,0,22)})
MkLabel({text="--  "..HUB_SUBTITLE.."  --",color=C.PINK,size=11,sz=UDim2.new(1,0,0,16),pos=UDim2.new(0,0,0,58)})
local Line=Instance.new("Frame"); Line.Size=UDim2.new(0,260,0,1); Line.AnchorPoint=Vector2.new(0.5,0)
Line.Position=UDim2.new(0.5,0,0,82); Line.BackgroundColor3=C.CYAN; Line.BorderSizePixel=0; Line.ZIndex=3; Line.Parent=Panel
local function MkStat(val,lbl,xOffset)
    local vl=Instance.new("TextLabel"); vl.Size=UDim2.new(0,60,0,22); vl.AnchorPoint=Vector2.new(0.5,0)
    vl.Position=UDim2.new(0.5,xOffset,0,96); vl.BackgroundTransparency=1; vl.BorderSizePixel=0
    vl.Text=val; vl.TextColor3=C.PINK; vl.Font=Enum.Font.GothamBold; vl.TextSize=15; vl.TextXAlignment=Enum.TextXAlignment.Center; vl.ZIndex=3; vl.Parent=Panel
    local ll=Instance.new("TextLabel"); ll.Size=UDim2.new(0,60,0,14); ll.AnchorPoint=Vector2.new(0.5,0)
    ll.Position=UDim2.new(0.5,xOffset,0,118); ll.BackgroundTransparency=1; ll.BorderSizePixel=0
    ll.Text=lbl; ll.TextColor3=C.DIM; ll.Font=Enum.Font.Code; ll.TextSize=9; ll.TextXAlignment=Enum.TextXAlignment.Center; ll.ZIndex=3; ll.Parent=Panel
end
MkStat(HUB_VERSION,"VERSION",-90); MkStat("ON","STATUS",0); MkStat("INF","UPTIME",90)
local StatusText=MkLabel({text="Iniciando sistema...",color=C.DIM,size=11,sz=UDim2.new(1,-40,0,16),pos=UDim2.new(0,20,0,148),align=Enum.TextXAlignment.Left})
local BarBG=Instance.new("Frame"); BarBG.Size=UDim2.new(0,280,0,6); BarBG.AnchorPoint=Vector2.new(0.5,0)
BarBG.Position=UDim2.new(0.5,0,0,172); BarBG.BackgroundColor3=Color3.fromRGB(0,25,25); BarBG.BorderSizePixel=0; BarBG.ZIndex=3; BarBG.Parent=Panel
Instance.new("UICorner",BarBG).CornerRadius=UDim.new(1,0)
local BSt=Instance.new("UIStroke"); BSt.Color=C.CYAN; BSt.Thickness=1; BSt.Transparency=0.5; BSt.Parent=BarBG
local Bar=Instance.new("Frame"); Bar.Size=UDim2.new(0,0,1,0); Bar.BackgroundColor3=C.CYAN; Bar.BorderSizePixel=0; Bar.ZIndex=4; Bar.Parent=BarBG
Instance.new("UICorner",Bar).CornerRadius=UDim.new(1,0)
local Btn=Instance.new("TextButton"); Btn.Size=UDim2.new(0,180,0,36); Btn.AnchorPoint=Vector2.new(0.5,0)
Btn.Position=UDim2.new(0.5,0,0,196); Btn.BackgroundTransparency=1; Btn.BorderSizePixel=0
Btn.Text="> EJECUTAR <"; Btn.TextColor3=C.CYAN; Btn.Font=Enum.Font.GothamBold; Btn.TextSize=13
Btn.AutoButtonColor=false; Btn.ZIndex=3; Btn.Parent=Panel
Instance.new("UICorner",Btn).CornerRadius=UDim.new(0,4)
local BtnStroke=Instance.new("UIStroke"); BtnStroke.Color=C.CYAN; BtnStroke.Thickness=1; BtnStroke.Parent=Btn
MkLabel({text="SYS // "..LocalPlayer.Name:upper(),color=Color3.fromRGB(0,60,60),size=9,sz=UDim2.new(1,0,0,14),pos=UDim2.new(0,0,1,-18)})
Btn.MouseEnter:Connect(function() Btn.TextColor3=C.PINK; BtnStroke.Color=C.PINK end)
Btn.MouseLeave:Connect(function() Btn.TextColor3=C.CYAN; BtnStroke.Color=C.CYAN end)
 
local function AnimateLoad(cb)
    for i,step in ipairs(LOAD_STEPS) do StatusText.Text=step
        TweenService:Create(Bar,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
            {Size=UDim2.new(i/#LOAD_STEPS,0,1,0),BackgroundColor3=(i==#LOAD_STEPS) and C.GREEN or C.CYAN}):Play()
        task.wait(0.5) end
    StatusText.Text="Sistema listo."; task.wait(0.4); if cb then cb() end
end
 
TweenService:Create(Panel,TweenInfo.new(0.45,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,0)}):Play()
task.wait(0.5)
 
AnimateLoad(function()
Btn.MouseButton1Click:Connect(function()
    TweenService:Create(Panel,TweenInfo.new(0.35,Enum.EasingStyle.Sine,Enum.EasingDirection.In),{Position=UDim2.new(0.5,0,-0.6,0)}):Play()
    TweenService:Create(Overlay,TweenInfo.new(0.35,Enum.EasingStyle.Sine,Enum.EasingDirection.In),{BackgroundTransparency=1}):Play()
    task.wait(0.38); ScreenGui:Destroy()
 
-- ══════════════════════════════════════════════════════════════
-- LÓGICA
-- ══════════════════════════════════════════════════════════════
local RS=game:GetService("RunService"); local UIS=game:GetService("UserInputService")
local VIM=game:GetService("VirtualInputManager"); local RepSto=game:GetService("ReplicatedStorage")
local TS2=game:GetService("TweenService"); local P2=game:GetService("Players")
local TPService=game:GetService("TeleportService"); local HttpService=game:GetService("HttpService")
local LP=P2.LocalPlayer; local Cam=workspace.CurrentCamera
 
local MasterEnabled=false; local AutoSkillEnabled=false; local MaxDist=500; local FOV=150
local FastAtk=false; local FastAtkRange=12000; local FruitAtk=false
local InfJump=false; local InstakillActive=false; local FastAtkV2=false; local FastAtkV2Range=3000
local ESP_On=false; local Noclip=false; local NoclipConn=nil
local SpaceHeld=false; local AttSpd=0.0; local LastAtk=0
_G.WSVal=40; _G.WSOn=false; _G.autoV4=false; _G.Unbreakable=false
local AutoBusoEnabled=false
local AutoClickEnabled=false; local AutoClickDelay=0.08
local BringNPCEnabled=false; local BringNPCRange=300
local AutoFarmNearestEnabled=false; local AutoFarmBossEnabled=false; local AutoFarmAllBossesEnabled=false
local AutoStatsEnabled=false; local AutoSkillsEnabled=false
local ActiveStats={}
 
local FaConn=nil; local FrConn=nil; local Fr1=nil; local Fr12=nil; local Fr166=nil; local Fr3=nil; local FastV2Conn=nil
local SelectedPlayer=nil
 
-- Automatizaciones (subir nivel + cofres)
local CommF=nil
local AutoLevelEnabled=false; local AutoChestEnabled=false
local AutoFarmState="IDLE"; local AutoFarmTarget=nil
local AutoTeleportTweenSpeed=300; local AutoFarmPlatName="AutoFarmPlatMerged"
local AutoFarmPullRadius=350; local AutoFarmYOffset=30
local ChestCache={}; local LastChestScan=0
local SelectedBossToFarm="Gorilla King"; local BossCycleIndex=1
 
-- Referencia global al label del selector de boss (se asigna al construir la UI)
local BossSelectedLbl=nil
 
local SPECIAL={"Leviathan","Tail","Segment","Tongue","Sea Beast","TerrorShark","Piranha","Ghost Ship","Fishman","Boss"}
 
local RegHit,RegAtk
pcall(function()
    local Net=RepSto:WaitForChild("Modules",5):WaitForChild("Net",5)
    RegHit=Net["RE/RegisterHit"]; RegAtk=Net["RE/RegisterAttack"]
end)
pcall(function()
    local Rm=RepSto:FindFirstChild("Remotes")
    if Rm then CommF=Rm:FindFirstChild("CommF_") end
end)
 
-- Bypasses
task.spawn(function() pcall(function()
    repeat task.wait() until RepSto:FindFirstChild("Util")
    local ss=require(RepSto.Util.CameraShaker.Main); local xx=function() return nil end
    ss.StartShake=xx;ss.ShakeOnce=xx;ss.ShakeSustain=xx;ss.Shake=xx;ss.Start=xx end) end)
task.spawn(function() pcall(function()
    local TS=game:GetService("TeleportService"); local GS=game:GetService("GuiService")
    local function Rejoin()
        if #P2:GetPlayers()<=1 then TS:Teleport(game.PlaceId,LP)
        else TS:TeleportToPlaceInstance(game.PlaceId,game.JobId,LP) end
    end
    local ONC; ONC=hookmetamethod(game,"__namecall",newcclosure(function(s,...)
        local m=getnamecallmethod()
        if (m=="Kick" or m=="kick") and s==LP then task.spawn(Rejoin); return nil end
        return ONC(s,...) end))
    GS.ErrorMessageChanged:Connect(function() if GS:GetErrorMessage()~="" then Rejoin() end end)
end) end)
 
local function ServerHop()
    local placeId=game.PlaceId; local cursor=""; local servers={}
    for _=1,4 do
        local url="https://games.roblox.com/v1/games/"..placeId.."/servers/Public?sortOrder=Asc&limit=100"..((cursor~="" and "&cursor="..cursor) or "")
        local ok,res=pcall(function() return HttpService:JSONDecode(game:HttpGet(url)) end)
        if not ok or not res or not res.data then break end
        for _,sv in ipairs(res.data) do
            if type(sv)=="table" and sv.id and sv.playing and sv.maxPlayers and sv.playing<sv.maxPlayers and sv.id~=game.JobId then
                table.insert(servers,sv.id) end end
        cursor=res.nextPageCursor or ""
        if cursor=="" then break end
    end
    if #servers>0 then TPService:TeleportToPlaceInstance(placeId,servers[math.random(1,#servers)],LP) end
end
 
local function BuyKenVision()
    local data=LP:FindFirstChild("Data")
    local lvl=data and data:FindFirstChild("Level") and data.Level.Value or 1
    if lvl<300 then warn("Necesitas nivel 300 para Ken Haki (Vision).") return end
    if CommF then pcall(function() CommF:InvokeServer("KenTalk","Buy") end) end
end
 
-- ══════════════════════════════════════
-- TABLAS DE QUESTS — SEA 1, 2 Y 3
-- ══════════════════════════════════════
local LevelQuestsAuto={
    -- ═══ SEA 1 ═══
    {lvl=1,   q="BanditQuest1",    ql=1, name="Bandit",               giver="Bandit Quest Giver",            island="Town"},
    {lvl=10,  q="JungleQuest",     ql=1, name="Monkey",               giver="Adventurer",                    island="Jungle"},
    {lvl=15,  q="JungleQuest",     ql=2, name="Gorilla",              giver="Adventurer",                    island="Jungle"},
    {lvl=30,  q="BuggyQuest1",     ql=1, name="Pirate",               giver="Pirate Adventurer",             island="Pirate"},
    {lvl=40,  q="BuggyQuest1",     ql=2, name="Brute",                giver="Pirate Adventurer",             island="Pirate"},
    {lvl=60,  q="DesertQuest",     ql=1, name="Desert Bandit",        giver="Desert Adventurer",             island="Desert"},
    {lvl=75,  q="DesertQuest",     ql=2, name="Desert Officer",       giver="Desert Adventurer",             island="Desert"},
    {lvl=90,  q="SnowQuest",       ql=1, name="Snow Bandit",          giver="Villager",                      island="Snow"},
    {lvl=100, q="SnowQuest",       ql=2, name="Snowman",              giver="Villager",                      island="Snow"},
    {lvl=120, q="MarineQuest2",    ql=1, name="Chief Petty Officer",  giver="Marine",                        island="Marine"},
    {lvl=130, q="MarineQuest2",    ql=2, name="Vice Admiral",         giver="Marine",                        island="Marine", isBoss=true},
    {lvl=150, q="SkyQuest",        ql=1, name="Sky Bandit",           giver="Sky Adventurer",                island="Sky"},
    {lvl=175, q="SkyQuest",        ql=2, name="Dark Master",          giver="Sky Adventurer",                island="Sky"},
    {lvl=190, q="PrisonerQuest",   ql=1, name="Prisoner",             giver="Jail Keeper",                   island="Prison"},
    {lvl=210, q="PrisonerQuest",   ql=2, name="Dangerous Prisoner",   giver="Jail Keeper",                   island="Prison"},
    {lvl=250, q="ColosseumQuest",  ql=1, name="Toga Warrior",         giver="Colosseum Quest Giver",         island="Colosseum"},
    {lvl=275, q="ColosseumQuest",  ql=2, name="Gladiator",            giver="Colosseum Quest Giver",         island="Colosseum"},
    {lvl=300, q="MagmaQuest",      ql=1, name="Military Soldier",     giver="Volcano Adventurer",            island="Magma"},
    {lvl=325, q="MagmaQuest",      ql=2, name="Military Spy",         giver="Volcano Adventurer",            island="Magma"},
    {lvl=375, q="FishmanQuest",    ql=1, name="Fishman Warrior",      giver="Fishman Quest Giver",           island="Fishman"},
    {lvl=400, q="FishmanQuest",    ql=2, name="Fishman Commando",     giver="Fishman Quest Giver",           island="Fishman"},
    {lvl=450, q="SkyExp1Quest",    ql=1, name="God's Guard",          giver="Sky Adventurer",                island="Sky"},
    {lvl=475, q="SkyExp1Quest",    ql=2, name="Shanda",               giver="Sky Adventurer",                island="Sky"},
    {lvl=525, q="SkyExp2Quest",    ql=1, name="Royal Squad",          giver="Sky Adventurer",                island="Sky"},
    {lvl=550, q="SkyExp2Quest",    ql=2, name="Royal Soldier",        giver="Sky Adventurer",                island="Sky"},
    {lvl=625, q="FountainQuest",   ql=1, name="Galley Pirate",        giver="Fountain Quest Giver",          island="Fountain"},
    {lvl=650, q="FountainQuest",   ql=2, name="Galley Captain",       giver="Fountain Quest Giver",          island="Fountain"},
    -- ═══ SEA 2 ═══
    -- Kingdom of Rose — Area 1
    {lvl=700, q="KingdomQuest1",   ql=1, name="Raiders",              giver="Area 1 Quest Giver",            island="Kingdom"},
    {lvl=725, q="KingdomQuest1",   ql=2, name="Mercenaries",          giver="Area 1 Quest Giver",            island="Kingdom"},
    {lvl=750, q="KingdomQuest1",   ql=3, name="Diamond",              giver="Area 1 Quest Giver",            island="Kingdom", isBoss=true},
    -- Kingdom of Rose — Area 2
    {lvl=775, q="KingdomQuest2",   ql=1, name="Swan Pirates",         giver="Area 2 Quest Giver",            island="Kingdom"},
    {lvl=800, q="KingdomQuest2",   ql=2, name="Factory Staff",        giver="Area 2 Quest Giver",            island="Kingdom"},
    {lvl=850, q="KingdomQuest2",   ql=3, name="Jeremy",               giver="Area 2 Quest Giver",            island="Kingdom", isBoss=true},
    -- Green Zone
    {lvl=875, q="GreenZoneQuest",  ql=1, name="Marines",              giver="Marine Quest Giver",            island="Green"},
    {lvl=900, q="GreenZoneQuest",  ql=2, name="Marine Captains",      giver="Marine Quest Giver",            island="Green"},
    {lvl=925, q="GreenZoneQuest",  ql=3, name="Fajita",               giver="Marine Quest Giver",            island="Green",  isBoss=true},
    -- Graveyard
    {lvl=950, q="GraveyardQuest",  ql=1, name="Zombies",              giver="Graveyard Quest Giver",         island="Graveyard"},
    {lvl=975, q="GraveyardQuest",  ql=2, name="Vampires",             giver="Graveyard Quest Giver",         island="Graveyard"},
    -- Snow Mountain
    {lvl=1000,q="SnowMtnQuest",    ql=1, name="Snow Troopers",        giver="Snow Mountain Quest Giver",     island="Snow Mountain"},
    {lvl=1050,q="SnowMtnQuest",    ql=2, name="Winter Warriors",      giver="Snow Mountain Quest Giver",     island="Snow Mountain"},
    -- Hot & Cold — Cold Side
    {lvl=1100,q="ColdSideQuest",   ql=1, name="Lab Subordinates",     giver="Cold Side Quest Giver",         island="Cold"},
    {lvl=1125,q="ColdSideQuest",   ql=2, name="Horned Warriors",      giver="Cold Side Quest Giver",         island="Cold"},
    {lvl=1150,q="ColdSideQuest",   ql=3, name="Smoke Admiral",        giver="Cold Side Quest Giver",         island="Cold",   isBoss=true},
    -- Hot & Cold — Hot Side
    {lvl=1175,q="HotSideQuest",    ql=1, name="Magma Ninjas",         giver="Hot Side Quest Giver",          island="Hot"},
    {lvl=1200,q="HotSideQuest",    ql=2, name="Lava Pirates",         giver="Hot Side Quest Giver",          island="Hot"},
    -- Cursed Ship
    {lvl=1250,q="CursedShipQuest", ql=1, name="Ship Deckhands",       giver="Cursed Captain Quest Giver",    island="Cursed"},
    {lvl=1275,q="CursedShipQuest", ql=2, name="Ship Engineers",       giver="Cursed Captain Quest Giver",    island="Cursed"},
    {lvl=1300,q="CursedShipQuest", ql=3, name="Ship Stewards",        giver="Cursed Captain Quest Giver",    island="Cursed"},
    {lvl=1325,q="CursedShipQuest", ql=4, name="Ship Officers",        giver="Cursed Captain Quest Giver",    island="Cursed"},
    -- Ice Castle
    {lvl=1350,q="IceCastleQuest",  ql=1, name="Arctic Warriors",      giver="Ice Castle Quest Giver",        island="Ice Castle"},
    {lvl=1375,q="IceCastleQuest",  ql=2, name="Snow Lurkers",         giver="Ice Castle Quest Giver",        island="Ice Castle"},
    -- Forgotten Island
    {lvl=1425,q="ForgottenQuest",  ql=1, name="Sea Soldiers",         giver="Forgotten Quest Giver",         island="Forgotten"},
    {lvl=1450,q="ForgottenQuest",  ql=2, name="Water Fighters",       giver="Forgotten Quest Giver",         island="Forgotten"},
    {lvl=1475,q="ForgottenQuest",  ql=3, name="Tide Keeper",          giver="Forgotten Quest Giver",         island="Forgotten", isBoss=true},
    -- ═══ SEA 3 ═══
    -- Port Town
    {lvl=1500,q="PortQuest",       ql=1, name="Pirate Millionaires",  giver="Port Quest Giver",              island="Port"},
    {lvl=1525,q="PortQuest",       ql=2, name="Pistol Billionaires",  giver="Port Quest Giver",              island="Port"},
    -- Hydra Island
    {lvl=1575,q="HydraQuest",      ql=1, name="Dragon Crew Warriors", giver="Hydra Quest Giver",             island="Hydra"},
    {lvl=1600,q="HydraQuest",      ql=2, name="Dragon Crew Archers",  giver="Hydra Quest Giver",             island="Hydra"},
    {lvl=1625,q="HydraQuest",      ql=3, name="Female Islanders",     giver="Hydra Quest Giver",             island="Hydra"},
    {lvl=1650,q="HydraQuest",      ql=4, name="Giant Islanders",      giver="Hydra Quest Giver",             island="Hydra"},
    -- Great Tree
    {lvl=1700,q="GreatTreeQuest",  ql=1, name="Marine Commodores",    giver="Marine Tree Quest Giver",       island="Great Tree"},
    {lvl=1725,q="GreatTreeQuest",  ql=2, name="Marine Rear Admirals", giver="Marine Tree Quest Giver",       island="Great Tree"},
    {lvl=1750,q="GreatTreeQuest",  ql=3, name="Kilo Admiral",         giver="Marine Tree Quest Giver",       island="Great Tree", isBoss=true},
    -- Floating Turtle — Forest
    {lvl=1775,q="ForestPirateQ",   ql=1, name="Fishman Raiders",      giver="Forest Pirate Quest Giver",     island="Floating Turtle"},
    {lvl=1800,q="ForestPirateQ",   ql=2, name="Fishman Captains",     giver="Forest Pirate Quest Giver",     island="Floating Turtle"},
    -- Floating Turtle — Jungle
    {lvl=1825,q="JunglePirateQ",   ql=1, name="Forest Pirates",       giver="Deep Forest Quest Giver",       island="Floating Turtle"},
    {lvl=1850,q="JunglePirateQ",   ql=2, name="Mythological Pirates", giver="Deep Forest Quest Giver",       island="Floating Turtle"},
    -- Floating Turtle — Musketeer
    {lvl=1900,q="MusketeersQ",     ql=1, name="Jungle Pirates",       giver="Musketeer Pirate Quest Giver",  island="Floating Turtle"},
    {lvl=1925,q="MusketeersQ",     ql=2, name="Musketeer Pirates",    giver="Musketeer Pirate Quest Giver",  island="Floating Turtle"},
    -- Haunted Castle
    {lvl=1975,q="HauntedQuest",    ql=1, name="Reborn Skeletons",     giver="Haunted Quest Giver",           island="Haunted"},
    {lvl=2000,q="HauntedQuest",    ql=2, name="Living Zombies",       giver="Haunted Quest Giver",           island="Haunted"},
    {lvl=2025,q="HauntedQuest",    ql=3, name="Demonic Souls",        giver="Haunted Quest Giver",           island="Haunted"},
    {lvl=2050,q="HauntedQuest",    ql=4, name="Posessed Mummies",     giver="Haunted Quest Giver",           island="Haunted"},
    -- Sea of Treats — Peanut
    {lvl=2075,q="PeanutQuest",     ql=1, name="Peanut Scouts",        giver="Peanut Quest Giver",            island="Peanut"},
    {lvl=2100,q="PeanutQuest",     ql=2, name="Peanut Presidents",    giver="Peanut Quest Giver",            island="Peanut"},
    -- Sea of Treats — Ice Cream
    {lvl=2125,q="IceCreamQuest",   ql=1, name="Ice Cream Chefs",      giver="Ice Cream Quest Giver",         island="Ice Cream"},
    {lvl=2150,q="IceCreamQuest",   ql=2, name="Ice Cream Commanders", giver="Ice Cream Quest Giver",         island="Ice Cream"},
    -- Sea of Treats — Cake
    {lvl=2200,q="CakeQuest",       ql=1, name="Cookie Crafters",      giver="Cake Quest Giver",              island="Cake"},
    {lvl=2225,q="CakeQuest",       ql=2, name="Cake Guards",          giver="Cake Quest Giver",              island="Cake"},
    {lvl=2250,q="CakeQuest",       ql=3, name="Cake Queen",           giver="Cake Quest Giver",              island="Cake",  isBoss=true},
    -- Sea of Treats — Chocolate
    {lvl=2300,q="ChocolateQuest",  ql=1, name="Cocoa Warriors",       giver="Chocolate Quest Giver",         island="Chocolate"},
    {lvl=2325,q="ChocolateQuest",  ql=2, name="Chocolate Bar Battlers",giver="Chocolate Quest Giver",        island="Chocolate"},
    -- Sea of Treats — Candy
    {lvl=2350,q="CandyQuest",      ql=1, name="Sweet Thieves",        giver="Candy Quest Giver",             island="Candy"},
    {lvl=2375,q="CandyQuest",      ql=2, name="Candy Rebels",         giver="Candy Quest Giver",             island="Candy"},
    -- Tiki Outpost
    {lvl=2400,q="TikiQuest",       ql=1, name="Islanders",            giver="Tiki Quest Giver",              island="Tiki"},
    {lvl=2425,q="TikiQuest",       ql=2, name="Sun-kissed Warriors",  giver="Tiki Quest Giver",              island="Tiki"},
    -- Submerged Island
    {lvl=2450,q="SubmergedQuest",  ql=1, name="Drowned Warriors",     giver="Submerged Quest Giver",         island="Submerged"},
    {lvl=2475,q="SubmergedQuest",  ql=2, name="Tidekeepers",          giver="Submerged Quest Giver",         island="Submerged"},
    {lvl=2525,q="SubmergedQuest",  ql=3, name="High Disciples",       giver="Submerged Quest Giver",         island="Submerged"},
    {lvl=2550,q="SubmergedQuest",  ql=4, name="Grand Devotees",       giver="Submerged Quest Giver",         island="Submerged"},
}
 
-- ══════════════════════════════════════
-- TABLA DE BOSSES — TODOS LOS MARES
-- ══════════════════════════════════════
local Sea1BossesAuto={
    -- Sea 1
    {name="Gorilla King",  sea=1}, {name="Bobby",          sea=1}, {name="Yeti",           sea=1},
    {name="Mob Leader",    sea=1}, {name="Vice Admiral",   sea=1}, {name="Warden",         sea=1},
    {name="Chief Warden",  sea=1}, {name="Swan",           sea=1}, {name="Magma Admiral",  sea=1},
    {name="Fishman Lord",  sea=1}, {name="Wysper",         sea=1}, {name="Thunder God",    sea=1},
    {name="Cyborg",        sea=1}, {name="Saber Expert",   sea=1}, {name="The Saw",        sea=1},
    {name="Greybeard",     sea=1},
    -- Sea 2
    {name="Diamond",              sea=2}, {name="Jeremy",               sea=2},
    {name="Fajita",               sea=2}, {name="Awakened Ice Admiral", sea=2},
    {name="Smoke Admiral",        sea=2}, {name="Tide Keeper",          sea=2},
    -- Sea 3
    {name="Kilo Admiral",         sea=3}, {name="Cake Queen",           sea=3},
}
 
local function AutoTeleport(cf)
    local c=LP.Character; local hrp=c and c:FindFirstChild("HumanoidRootPart")
    if not c or not hrp or not cf then return end
    local d=(hrp.Position-cf.Position).Magnitude
    if d<50 then c:PivotTo(cf); return end
    local tw=TS2:Create(hrp,TweenInfo.new(d/AutoTeleportTweenSpeed,Enum.EasingStyle.Linear),{CFrame=cf})
    local bv=Instance.new("BodyVelocity"); bv.MaxForce=Vector3.new(math.huge,math.huge,math.huge); bv.Velocity=Vector3.new(0,0,0); bv.Parent=hrp
    local nc=RS.Stepped:Connect(function()
        for _,v in ipairs(c:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end
    end)
    tw:Play(); tw.Completed:Wait(); bv:Destroy(); nc:Disconnect()
end
 
local function HasQuestAuto()
    local pgui=LP:FindFirstChild("PlayerGui")
    return pgui and pgui:FindFirstChild("Main") and pgui.Main:FindFirstChild("Quest") and pgui.Main.Quest.Visible or false
end
 
local function MatchEnemyNameAuto(npcName,targetName)
    if not npcName or not targetName then return false end
    if npcName==targetName then return true end
    local n=string.lower(npcName); local t=string.lower(targetName)
    if string.find(n,t) then
        if t=="gorilla" and string.find(n,"king") then return false end
        if t=="bandit" and (string.find(n,"desert") or string.find(n,"snow") or string.find(n,"sky")) then return false end
        return true
    end
    return false
end
 
local function GetTargetEnemyNameFromQuestAuto()
    local pgui=LP:FindFirstChild("PlayerGui")
    local main=pgui and pgui:FindFirstChild("Main")
    local quest=main and main:FindFirstChild("Quest")
    if not quest or not quest.Visible then return nil end
    local title=quest:FindFirstChild("Container") and quest.Container:FindFirstChild("QuestTitle") and quest.Container.QuestTitle:FindFirstChild("Title")
    if not title or not title.Text then return nil end
    local questText=title.Text; local best=nil; local bestLen=0
    for _,q in ipairs(LevelQuestsAuto) do
        if string.find(string.lower(questText),string.lower(q.name)) and #q.name>bestLen then best=q.name; bestLen=#q.name end
    end
    local en=workspace:FindFirstChild("Enemies")
    if en then
        for _,npc in ipairs(en:GetChildren()) do
            if string.find(string.lower(questText),string.lower(npc.Name)) and #npc.Name>bestLen then best=npc.Name; bestLen=#npc.Name end
        end
    end
    return best
end
 
local function IsEnemyAliveAuto(enemyName)
    local en=workspace:FindFirstChild("Enemies")
    if not en then return false end
    for _,npc in ipairs(en:GetChildren()) do
        local hm=npc:FindFirstChildOfClass("Humanoid")
        if MatchEnemyNameAuto(npc.Name,enemyName) and hm and hm.Health>0 then return true end
    end
    return false
end
 
local function GetBestQuestDataAuto()
    local data=LP:FindFirstChild("Data")
    local lvl=data and data:FindFirstChild("Level") and data.Level.Value or 1
    local best=LevelQuestsAuto[1]
    for i=1,#LevelQuestsAuto do
        local q=LevelQuestsAuto[i]
        if lvl>=q.lvl then
            if q.isBoss then if IsEnemyAliveAuto(q.name) then best=q end
            else best=q end
        else break end
    end
    return best
end
 
local function GetIslandPositionAuto(keyword)
    local wo=workspace:FindFirstChild("_WorldOrigin")
    local locs=wo and wo:FindFirstChild("Locations")
    if not locs then return nil end
    for _,v in ipairs(locs:GetChildren()) do if string.find(string.lower(v.Name),string.lower(keyword)) then return v.Position end end
    return nil
end
 
local CachedSpawnsAuto={}
local function GetEnemySpawnPositionAuto(enemyName)
    if CachedSpawnsAuto[enemyName] and CachedSpawnsAuto[enemyName].Y>0 then return CachedSpawnsAuto[enemyName] end
    local wo=workspace:FindFirstChild("_WorldOrigin")
    local spawns=wo and wo:FindFirstChild("EnemySpawns")
    if spawns then
        local best=nil; local diffBest=math.huge
        for _,sp in ipairs(spawns:GetChildren()) do
            if string.find(string.lower(sp.Name),string.lower(enemyName)) and sp.Position.Y>0 then
                local diff=math.abs(#sp.Name-#enemyName)
                if diff<diffBest then diffBest=diff; best=sp.Position end
            end
        end
        if best then CachedSpawnsAuto[enemyName]=best; return best end
    end
    local en=workspace:FindFirstChild("Enemies")
    if en then
        for _,npc in ipairs(en:GetChildren()) do
            local hrp=npc:FindFirstChild("HumanoidRootPart")
            if hrp and MatchEnemyNameAuto(npc.Name,enemyName) and hrp.Position.Y>0 then
                CachedSpawnsAuto[enemyName]=hrp.Position; return hrp.Position
            end
        end
    end
    return nil
end
 
local function GetQuestGiverPositionAuto(qData)
    if not qData or not qData.giver then return nil end
    local npcs=workspace:FindFirstChild("NPCs"); if not npcs then return nil end
    local spawnPos=GetEnemySpawnPositionAuto(qData.name) or GetIslandPositionAuto(qData.island)
    local best=nil; local minDist=math.huge
    for _,npc in ipairs(npcs:GetChildren()) do
        local hrp=npc:FindFirstChild("HumanoidRootPart")
        if hrp and string.find(string.lower(npc.Name),string.lower(qData.giver)) then
            local d=spawnPos and (hrp.Position-spawnPos).Magnitude or 0
            if d<minDist then minDist=d; best=hrp.CFrame end
        end
    end
    return best
end
 
local function GatherTargetsAuto(myHRP,targetName,maxR)
    local t={}; local en=workspace:FindFirstChild("Enemies")
    if not en or not myHRP or not targetName then return t end
    for _,npc in ipairs(en:GetChildren()) do
        local hm=npc:FindFirstChildOfClass("Humanoid"); local hrp=npc:FindFirstChild("HumanoidRootPart")
        if hm and hrp and hm.Health>0 and MatchEnemyNameAuto(npc.Name,targetName) and (hrp.Position-myHRP.Position).Magnitude<=maxR then
            table.insert(t,{npc,npc:FindFirstChild("Head") or hrp}); if #t>=8 then break end
        end
    end
    return t
end
 
local function GetNearestEnemyNameAuto(myHRP)
    local en=workspace:FindFirstChild("Enemies")
    if not en or not myHRP then return nil end
    local nearName=nil; local nearDist=math.huge
    for _,npc in ipairs(en:GetChildren()) do
        local hm=npc:FindFirstChildOfClass("Humanoid"); local hrp=npc:FindFirstChild("HumanoidRootPart")
        if hm and hrp and hm.Health>0 and hrp.Position.Y>0 then
            local d=(hrp.Position-myHRP.Position).Magnitude
            if d<nearDist then nearDist=d; nearName=npc.Name end
        end
    end
    return nearName
end
 
local function GetCurrentFarmTargetAuto(myHRP)
    if AutoFarmAllBossesEnabled then
        for _,b in ipairs(Sea1BossesAuto) do if IsEnemyAliveAuto(b.name) then return b.name,nil,true end end
        if #Sea1BossesAuto>0 then
            local b=Sea1BossesAuto[BossCycleIndex] or Sea1BossesAuto[1]
            BossCycleIndex=(BossCycleIndex % #Sea1BossesAuto)+1
            return b.name,nil,true
        end
    end
    if AutoFarmBossEnabled then return SelectedBossToFarm,nil,true end
    if AutoFarmNearestEnabled then return GetNearestEnemyNameAuto(myHRP),nil,true end
    local qData=GetBestQuestDataAuto()
    return (qData and (GetTargetEnemyNameFromQuestAuto() or qData.name) or nil),qData,false
end
 
-- ══════════════════════════════════════
-- COMBATE
-- ══════════════════════════════════════
local function FireAtk(t) if not RegAtk or not RegHit or #t==0 then return end
    pcall(function() RegAtk:FireServer(0); RegHit:FireServer(t[1][2],t) end) end
 
local function GetNearest()
    local n,d=nil,math.huge; local myHRP=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end
    for _,v in pairs(P2:GetPlayers()) do
        if v~=LP and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local dist=(myHRP.Position-v.Character.HumanoidRootPart.Position).Magnitude
            if dist<d then d=dist; n=v end end end; return n
end
 
local function GetAimTarget()
    local T,SD=nil,FOV; local myHRP=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end
    for _,p in pairs(P2:GetPlayers()) do
        if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local hrp=p.Character.HumanoidRootPart
            if (myHRP.Position-hrp.Position).Magnitude<=MaxDist then
                local pos,os=Cam:WorldToViewportPoint(hrp.Position)
                if os then local dc=(Vector2.new(pos.X,pos.Y)-Vector2.new(Cam.ViewportSize.X/2,Cam.ViewportSize.Y/2)).Magnitude
                    if dc<SD then T=hrp; SD=dc end end end end end; return T
end
 
local function MkVec(x,y,z) if vector and vector.create then return vector.create(x,y,z) end; return Vector3.new(x,y,z) end
local function GetFrRemote(n) local c=LP.Character; local h=c and c:FindFirstChild("HumanoidRootPart"); local t=c and c:FindFirstChild(n); local r=t and t:FindFirstChild("LeftClickRemote"); return c,h,r end
local function GetNTRoot() local t=GetNearest(); return t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") end
 
local function StartFastAtk()
    if FaConn then FaConn:Disconnect() end
    FaConn=RS.Heartbeat:Connect(function()
        if not FastAtk then return end; local c=LP.Character; local hrp=c and c:FindFirstChild("HumanoidRootPart"); if not hrp then return end
        local targets={}
        for _,plr in ipairs(P2:GetPlayers()) do if plr~=LP then local ch=plr.Character; local hm=ch and ch:FindFirstChildOfClass("Humanoid"); local r=ch and ch:FindFirstChild("HumanoidRootPart")
            if hm and hm.Health>0 and r and (r.Position-hrp.Position).Magnitude<=FastAtkRange then table.insert(targets,{ch,ch:FindFirstChild("Head") or r}) end end end
        local en=workspace:FindFirstChild("Enemies")
        if en then for _,npc in ipairs(en:GetChildren()) do local hm=npc:FindFirstChildOfClass("Humanoid"); local r=npc:FindFirstChild("HumanoidRootPart")
            if hm and hm.Health>0 and r and (r.Position-hrp.Position).Magnitude<=FastAtkRange then table.insert(targets,{npc,npc:FindFirstChild("Head") or r}) end end end
        for _,obj in ipairs(workspace:GetChildren()) do for _,nm in ipairs(SPECIAL) do if string.find(obj.Name,nm) then
            local hm=obj:FindFirstChildOfClass("Humanoid"); local r=obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("LowerTorso")
            if hm and hm.Health>0 and r and (r.Position-hrp.Position).Magnitude<=FastAtkRange then table.insert(targets,{obj,r}) end; break end end end
        if #targets>0 then FireAtk(targets) end end)
end
 
local function StartFastAtkV2()
    if FastV2Conn then FastV2Conn:Disconnect() end
    FastV2Conn=RS.Heartbeat:Connect(function()
        if not FastAtkV2 then return end; if tick()-LastAtk<AttSpd then return end
        local c=LP.Character; local hrp=c and c:FindFirstChild("HumanoidRootPart"); if not hrp then return end
        local targets={}
        for _,v in ipairs(workspace:GetChildren()) do local iT=false
            for _,nm in ipairs(SPECIAL) do if string.find(v.Name,nm) then iT=true; break end end
            if iT or (v:FindFirstChildOfClass("Humanoid") and v.Name~=LP.Name) then
                local hm=v:FindFirstChildOfClass("Humanoid"); local tr=v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Head")
                if hm and hm.Health>0 and tr and (hrp.Position-tr.Position).Magnitude<=FastAtkV2Range then
                    table.insert(targets,{v,tr}); if #targets>=5 then break end end end end
        if #targets>0 then LastAtk=tick(); FireAtk(targets) end end)
end
 
local function SetNoclip(s) Noclip=s
    if Noclip then NoclipConn=RS.Stepped:Connect(function() local c=LP.Character
        if c and Noclip then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end end end)
    else if NoclipConn then NoclipConn:Disconnect(); NoclipConn=nil end
        local c=LP.Character; if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=true end end end end
end
 
-- ══════════════════════════════════════
-- LOOPS GLOBALES
-- ══════════════════════════════════════
RS.RenderStepped:Connect(function()
    if _G.WSOn then pcall(function() local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid"); if h then h.WalkSpeed=_G.WSVal end end) end
    if MasterEnabled and UIS.MouseBehavior==Enum.MouseBehavior.LockCenter then
        local t=GetAimTarget(); if t then Cam.CFrame=CFrame.new(Cam.CFrame.Position,t.Position) end end
end)
UIS.JumpRequest:Connect(function() if InfJump then local c=LP.Character; local hrp=c and c:FindFirstChild("HumanoidRootPart"); local hm=c and c:FindFirstChildOfClass("Humanoid")
    if hrp and hm then hrp.Velocity=Vector3.new(hrp.Velocity.X,hm.JumpPower,hrp.Velocity.Z) end end end)
UIS.InputBegan:Connect(function(input,gp) if gp then return end
    if input.KeyCode==Enum.KeyCode.Space then SpaceHeld=true end
    if input.KeyCode==Enum.KeyCode.R and AutoSkillEnabled and UIS.MouseBehavior==Enum.MouseBehavior.LockCenter then
        task.spawn(function()
            VIM:SendKeyEvent(true,Enum.KeyCode.X,false,game); task.wait(0.05); VIM:SendKeyEvent(false,Enum.KeyCode.X,false,game)
            task.wait(0.1); VIM:SendKeyEvent(true,Enum.KeyCode.Z,false,game); task.wait(0.05); VIM:SendKeyEvent(false,Enum.KeyCode.Z,false,game)
        end) end end)
UIS.InputEnded:Connect(function(i) if i.KeyCode==Enum.KeyCode.Space then SpaceHeld=false end end)
RS.Heartbeat:Connect(function() if InfJump and SpaceHeld then local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if hrp then hrp.Velocity=Vector3.new(hrp.Velocity.X,50,hrp.Velocity.Z) end end end)
 
task.spawn(function()
    while task.wait(0.5) do
        if AutoBusoEnabled and CommF then
            local c=LP.Character
            if c and not c:FindFirstChild("HasBuso") then pcall(function() CommF:InvokeServer("Buso") end) end
        end
    end
end)
 
task.spawn(function()
    while task.wait(1) do
        if AutoStatsEnabled and CommF and #ActiveStats>0 then
            local data=LP:FindFirstChild("Data")
            local ptsObj=data and data:FindFirstChild("Points")
            local pts=ptsObj and ptsObj.Value or 0
            if pts>0 then
                local n=#ActiveStats; local base=math.floor(pts/n); local rem=pts%n
                for i,stat in ipairs(ActiveStats) do
                    local add=base + ((i<=rem) and 1 or 0)
                    if add>0 then pcall(function() CommF:InvokeServer("AddPoint",stat,add) end); task.wait(0.15) end
                end
            end
        end
    end
end)
 
task.spawn(function()
    local keys={Enum.KeyCode.Z,Enum.KeyCode.X,Enum.KeyCode.C,Enum.KeyCode.V,Enum.KeyCode.F}
    while task.wait(0.45) do
        local anyFarm=AutoLevelEnabled or AutoFarmNearestEnabled or AutoFarmBossEnabled or AutoFarmAllBossesEnabled
        if AutoSkillsEnabled and anyFarm then
            for _,k in ipairs(keys) do
                VIM:SendKeyEvent(true,k,false,game); task.wait(0.03); VIM:SendKeyEvent(false,k,false,game); task.wait(0.06)
            end
        end
    end
end)
 
task.spawn(function()
    while true do
        task.wait(math.max(0.01,AutoClickDelay))
        if AutoClickEnabled then
            pcall(function()
                VIM:SendMouseButtonEvent(0,0,0,true,game,0)
                task.wait(0.01)
                VIM:SendMouseButtonEvent(0,0,0,false,game,0)
            end)
        end
    end
end)
 
-- ══════════════════════════════════════
-- BRING NPC (MEJORADO)
-- ══════════════════════════════════════
task.spawn(function()
    while task.wait(0.05) do
        if not BringNPCEnabled then continue end
        local c=LP.Character; local myHRP=c and c:FindFirstChild("HumanoidRootPart")
        local en=workspace:FindFirstChild("Enemies")
        if not myHRP or not en then continue end
        local i=0
        for _,npc in ipairs(en:GetChildren()) do
            local hm=npc:FindFirstChildOfClass("Humanoid"); local hrp=npc:FindFirstChild("HumanoidRootPart")
            if not (hm and hrp and hm.Health>0) then continue end
            if (hrp.Position-myHRP.Position).Magnitude>BringNPCRange then continue end
            i=i+1
            -- Disposicion en espiral por anillos de 8
            local ring=math.ceil(i/8); local radius=ring*6
            local angle=math.rad(((i-1)*(360/8))%360)
            local offset=Vector3.new(math.cos(angle)*radius,-1,math.sin(angle)*radius)
            -- Anclar junto al jugador
            hrp.CFrame=CFrame.new(myHRP.Position+offset)
            -- Anular toda fisica
            hrp.AssemblyLinearVelocity=Vector3.new(0,0,0)
            hrp.AssemblyAngularVelocity=Vector3.new(0,0,0)
            hrp.CanCollide=false
            -- Desactivar IA de movimiento
            hm.WalkSpeed=0; hm.JumpPower=0; hm.PlatformStand=true
            -- Eliminar BodyMovers internos del NPC
            for _,bm in ipairs(hrp:GetChildren()) do
                if bm:IsA("BodyMover") then bm:Destroy() end
            end
        end
    end
end)
 
-- ══════════════════════════════════════
-- AUTO SUBIR NIVEL
-- ══════════════════════════════════════
task.spawn(function()
    while task.wait(0.15) do
        local anyFarmMode=AutoLevelEnabled or AutoFarmNearestEnabled or AutoFarmBossEnabled or AutoFarmAllBossesEnabled
        if not anyFarmMode then
            AutoFarmState="IDLE"; AutoFarmTarget=nil
            local oldPlat=workspace:FindFirstChild(AutoFarmPlatName); if oldPlat then oldPlat:Destroy() end
            continue
        end
 
        local c=LP.Character; local hrp=c and c:FindFirstChild("HumanoidRootPart"); local hm=c and c:FindFirstChildOfClass("Humanoid")
        if not c or not hrp or not hm or hm.Health<=0 then continue end
 
        local plat=workspace:FindFirstChild(AutoFarmPlatName)
        if not plat then
            plat=Instance.new("Part"); plat.Name=AutoFarmPlatName; plat.Anchored=true; plat.CanCollide=false; plat.Transparency=1
            plat.Size=Vector3.new(15,1,15); plat.CFrame=hrp.CFrame*CFrame.new(0,-3.5,0); plat.Parent=workspace
        end
 
        local targetEnemyName,qData,forceNoQuest=GetCurrentFarmTargetAuto(hrp)
        if not targetEnemyName then AutoFarmState="WAITING"; continue end
        AutoFarmTarget=targetEnemyName
 
        local needsQuest=AutoLevelEnabled and not forceNoQuest
        if needsQuest and not HasQuestAuto() then
            AutoFarmState="GETTING_QUEST"
            local giverCF=GetQuestGiverPositionAuto(qData)
            if giverCF then
                if (hrp.Position-giverCF.Position).Magnitude>15 then AutoTeleport(giverCF)
                else
                    hrp.CFrame=giverCF; task.wait(0.2)
                    if CommF then pcall(function() CommF:InvokeServer("StartQuest",qData.q,qData.ql) end) end
                end
            else
                local islandPos=GetIslandPositionAuto(qData.island)
                if islandPos then AutoTeleport(CFrame.new(islandPos)*CFrame.new(0,30,0)) end
            end
            continue
        end
 
        AutoFarmState="FARMING"
        local en=workspace:FindFirstChild("Enemies"); local firstNPC=nil; local minDist=math.huge
        if en then
            for _,npc in ipairs(en:GetChildren()) do
                if MatchEnemyNameAuto(npc.Name,targetEnemyName) then
                    local nHrp=npc:FindFirstChild("HumanoidRootPart"); local nHm=npc:FindFirstChildOfClass("Humanoid")
                    if nHrp and nHm and nHm.Health>0 and nHrp.Position.Y>0 then
                        local d=(nHrp.Position-hrp.Position).Magnitude
                        if d<minDist then minDist=d; firstNPC=npc end
                    end
                end
            end
        end
 
        if firstNPC then
            local nHrp=firstNPC:FindFirstChild("HumanoidRootPart")
            if nHrp then
                local targetCF=CFrame.new(nHrp.Position.X,nHrp.Position.Y+AutoFarmYOffset,nHrp.Position.Z)
                plat.CFrame=targetCF
                if (hrp.Position-plat.Position).Magnitude>15 then AutoTeleport(plat.CFrame*CFrame.new(0,3.5,0))
                else hrp.CFrame=plat.CFrame*CFrame.new(0,3.5,0) end
                hrp.AssemblyLinearVelocity=Vector3.new(0,0,0)
                local pullCF=plat.CFrame*CFrame.new(0,-30,0)
                if en then
                    for _,npc in ipairs(en:GetChildren()) do
                        if MatchEnemyNameAuto(npc.Name,targetEnemyName) then
                            local oHrp=npc:FindFirstChild("HumanoidRootPart"); local oHm=npc:FindFirstChildOfClass("Humanoid")
                            if oHrp and oHm and oHm.Health>0 and (oHrp.Position-pullCF.Position).Magnitude<AutoFarmPullRadius then
                                oHrp.CFrame=pullCF; oHrp.CanCollide=false; oHrp.AssemblyLinearVelocity=Vector3.new(0,0,0)
                                oHm.WalkSpeed=0; oHm.JumpPower=0
                            end
                        end
                    end
                end
                local targets=GatherTargetsAuto(hrp,targetEnemyName,FastAtkRange)
                if #targets>0 then FireAtk(targets) end
            end
        else
            AutoFarmState="WAITING"
            local spawnPos=GetEnemySpawnPositionAuto(targetEnemyName) or (qData and GetIslandPositionAuto(qData.island) or nil)
            if spawnPos then
                local hoverCF=CFrame.new(spawnPos)*CFrame.new(0,30,0)
                plat.CFrame=hoverCF
                if (hrp.Position-hoverCF.Position).Magnitude>20 then AutoTeleport(hoverCF*CFrame.new(0,3.5,0))
                else hrp.CFrame=hoverCF*CFrame.new(0,3.5,0) end
                hrp.AssemblyLinearVelocity=Vector3.new(0,0,0)
            end
        end
    end
end)
 
-- ══════════════════════════════════════
-- AUTO COFRES
-- ══════════════════════════════════════
local function GetChestsAuto()
    if tick()-LastChestScan>15 or #ChestCache==0 then
        LastChestScan=tick(); table.clear(ChestCache)
        pcall(function()
            for _,v in ipairs(workspace:GetDescendants()) do
                if string.find(v.Name,"Chest") and v:IsA("BasePart") then table.insert(ChestCache,v) end
            end
        end)
    end
    local active={}
    for _,ch in ipairs(ChestCache) do if ch and ch.Parent and ch:FindFirstChild("TouchInterest") then table.insert(active,ch) end end
    return active
end
 
task.spawn(function()
    while task.wait(1) do
        if not AutoChestEnabled then continue end
        local c=LP.Character; local hrp=c and c:FindFirstChild("HumanoidRootPart"); if not hrp then continue end
        local chests=GetChestsAuto(); if #chests==0 then continue end
        table.sort(chests,function(a,b) return (hrp.Position-a.Position).Magnitude<(hrp.Position-b.Position).Magnitude end)
        for _,ch in ipairs(chests) do
            if not AutoChestEnabled then break end
            if ch and ch.Parent and ch:FindFirstChild("TouchInterest") then
                local cf=ch.CFrame
                if (hrp.Position-cf.Position).Magnitude>15 then AutoTeleport(cf) else hrp.CFrame=cf end
                task.wait(0.2)
                if firetouchinterest and ch:FindFirstChild("TouchInterest") then
                    firetouchinterest(hrp,ch,0); task.wait(0.01); firetouchinterest(hrp,ch,1)
                end
                task.wait(0.2)
            end
        end
    end
end)
 
-- ══════════════════════════════════════
-- ESP
-- ══════════════════════════════════════
local ESP_Obj={}
local function MkESP(p) if p==LP then return end
    local B=Drawing.new("Square"); B.Visible=false; B.Color=Color3.fromRGB(0,162,255); B.Thickness=1.5; B.Filled=false
    local N=Drawing.new("Text"); N.Visible=false; N.Color=Color3.new(1,1,1); N.Size=14; N.Center=true; N.Outline=true
    ESP_Obj[p]={Box=B,Name=N} end
RS.RenderStepped:Connect(function()
    for _,p in pairs(P2:GetPlayers()) do if p==LP then continue end
        if not ESP_Obj[p] then MkESP(p) end; local d=ESP_Obj[p]; if not d then continue end
        local c=p.Character; local hrp=c and c:FindFirstChild("HumanoidRootPart"); local hm=c and c:FindFirstChild("Humanoid")
        if ESP_On and hrp and hm and hm.Health>0 then
            local hp,os=Cam:WorldToViewportPoint(hrp.Position)
            if os then local hd=Cam:WorldToViewportPoint(hrp.Position+Vector3.new(0,3,0)); local lg=Cam:WorldToViewportPoint(hrp.Position+Vector3.new(0,-3.5,0))
                local h=math.abs(hd.Y-lg.Y); local w=h/2
                d.Box.Visible=true; d.Box.Size=Vector2.new(w,h); d.Box.Position=Vector2.new(hp.X-w/2,hp.Y-h/2)
                d.Name.Visible=true; d.Name.Text=p.Name; d.Name.Position=Vector2.new(hp.X,hp.Y-h/2-15)
            else d.Box.Visible=false; d.Name.Visible=false end
        else d.Box.Visible=false; d.Name.Visible=false end end end)
P2.PlayerAdded:Connect(function(p) MkESP(p) end)
P2.PlayerRemoving:Connect(function(p) if ESP_Obj[p] then ESP_Obj[p].Box:Remove(); ESP_Obj[p].Name:Remove(); ESP_Obj[p]=nil end end)
 
-- ══════════════════════════════════════
-- MAIN HUB GUI
-- ══════════════════════════════════════
local PGui2=LP:WaitForChild("PlayerGui")
local C2={BG=Color3.fromRGB(5,5,16),BG2=Color3.fromRGB(6,6,26),SIDEBAR=Color3.fromRGB(6,6,22),
    CYAN=Color3.fromRGB(0,255,255),PINK=Color3.fromRGB(255,0,144),GREEN=Color3.fromRGB(0,220,80),
    DIM=Color3.fromRGB(0,140,140),DIMTXT=Color3.fromRGB(0,80,80)}
local TAB_NAMES={"PERFIL","FARM","PVP","TP","SHOP","VISUALS"}; local TAB_KEYS={"Perfil","Farm","PvP","TP","Shop","Visuals"}
local WIN_W=420; local WIN_H=285; local TOP_H=30; local SIDE_W=92; local CONT_W=WIN_W-SIDE_W; local CONT_H=WIN_H-TOP_H
 
local SG2=Instance.new("ScreenGui"); SG2.Name="CyberpunkMain"; SG2.ResetOnSpawn=false
SG2.ZIndexBehavior=Enum.ZIndexBehavior.Sibling; pcall(function() SG2.IgnoreGuiInset=true end); SG2.Parent=PGui2
 
-- DS quick toggle
local DSQuick=Instance.new("Frame"); DSQuick.Size=UDim2.new(0,56,0,56); DSQuick.Position=UDim2.new(0,14,1,-74)
DSQuick.BackgroundColor3=C2.BG; DSQuick.BorderSizePixel=0; DSQuick.ZIndex=40; DSQuick.Parent=SG2
Instance.new("UICorner",DSQuick).CornerRadius=UDim.new(0,6)
local DSQSt=Instance.new("UIStroke"); DSQSt.Color=C2.CYAN; DSQSt.Thickness=1.3; DSQSt.Transparency=0.25; DSQSt.Parent=DSQuick
local DSQLabel=Instance.new("TextLabel"); DSQLabel.Size=UDim2.fromScale(1,1); DSQLabel.BackgroundTransparency=1
DSQLabel.BorderSizePixel=0; DSQLabel.Text="DS"; DSQLabel.TextColor3=C2.CYAN; DSQLabel.Font=Enum.Font.GothamBold
DSQLabel.TextSize=23; DSQLabel.TextXAlignment=Enum.TextXAlignment.Center; DSQLabel.TextYAlignment=Enum.TextYAlignment.Center
DSQLabel.ZIndex=41; DSQLabel.Parent=DSQuick
local DSQBtn=Instance.new("TextButton"); DSQBtn.Size=UDim2.fromScale(1,1); DSQBtn.BackgroundTransparency=1
DSQBtn.Text=""; DSQBtn.AutoButtonColor=false; DSQBtn.Active=true; DSQBtn.ZIndex=42; DSQBtn.Parent=DSQuick
local HUDHidden=false
local DSQDragging=false; local DSQDragStart=nil; local DSQStartPos=nil; local DSQMoved=false
DSQBtn.MouseEnter:Connect(function() if not HUDHidden then DSQSt.Color=C2.PINK; DSQLabel.TextColor3=C2.PINK end end)
DSQBtn.MouseLeave:Connect(function() if not HUDHidden then DSQSt.Color=C2.CYAN; DSQLabel.TextColor3=C2.CYAN end end)
DSQBtn.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        DSQDragging=true; DSQMoved=false; DSQDragStart=i.Position; DSQStartPos=DSQuick.Position
        i.Changed:Connect(function()
            if i.UserInputState==Enum.UserInputState.End then DSQDragging=false end
        end)
    end
end)
 
-- Ventana principal
local Win=Instance.new("Frame"); Win.Name="Window"; Win.Size=UDim2.new(0,WIN_W,0,WIN_H)
Win.Position=UDim2.new(0.5,-WIN_W/2,0.5,-WIN_H/2); Win.BackgroundColor3=C2.BG
Win.BorderSizePixel=0; Win.ZIndex=10; Win.ClipsDescendants=true; Win.Parent=SG2
Instance.new("UICorner",Win).CornerRadius=UDim.new(0,8)
local WinSt=Instance.new("UIStroke"); WinSt.Color=C2.CYAN; WinSt.Thickness=1.5; WinSt.Transparency=0.5; WinSt.Parent=Win
 
local function MkC2(parent,pos,rot,zi)
    zi=zi or 12; local f=Instance.new("Frame"); f.Size=UDim2.new(0,12,0,12); f.Position=pos
    f.BackgroundTransparency=1; f.BorderSizePixel=0; f.Rotation=rot; f.ZIndex=zi; f.Parent=parent
    local h=Instance.new("Frame"); h.Size=UDim2.new(1,0,0,2); h.BackgroundColor3=C2.CYAN; h.BorderSizePixel=0; h.ZIndex=zi+1; h.Parent=f
    local v=Instance.new("Frame"); v.Size=UDim2.new(0,2,1,0); v.BackgroundColor3=C2.CYAN; v.BorderSizePixel=0; v.ZIndex=zi+1; v.Parent=f
end
MkC2(Win,UDim2.new(0,4,0,4),0); MkC2(Win,UDim2.new(1,-16,0,4),90); MkC2(Win,UDim2.new(0,4,1,-16),-90); MkC2(Win,UDim2.new(1,-16,1,-16),180)
 
-- TopBar
local TB=Instance.new("Frame"); TB.Name="TopBar"; TB.Size=UDim2.new(1,0,0,TOP_H)
TB.BackgroundColor3=C2.BG2; TB.BorderSizePixel=0; TB.ZIndex=12; TB.Parent=Win
local TBSep=Instance.new("Frame"); TBSep.Size=UDim2.new(1,0,0,1); TBSep.Position=UDim2.new(0,0,1,-1)
TBSep.BackgroundColor3=C2.CYAN; TBSep.BackgroundTransparency=0.6; TBSep.BorderSizePixel=0; TBSep.ZIndex=13; TBSep.Parent=TB
local Bdg=Instance.new("TextLabel"); Bdg.Size=UDim2.new(0,70,1,0); Bdg.Position=UDim2.new(0,10,0,0)
Bdg.BackgroundTransparency=1; Bdg.BorderSizePixel=0; Bdg.Text="section //"; Bdg.TextColor3=Color3.fromRGB(0,80,80)
Bdg.Font=Enum.Font.Code; Bdg.TextSize=9; Bdg.TextXAlignment=Enum.TextXAlignment.Left; Bdg.ZIndex=13; Bdg.Parent=TB
local TT=Instance.new("TextLabel"); TT.Name="TabTitle"; TT.Size=UDim2.new(0,180,1,0); TT.Position=UDim2.new(0,76,0,0)
TT.BackgroundTransparency=1; TT.BorderSizePixel=0; TT.Text="PERFIL"; TT.TextColor3=C2.CYAN
TT.Font=Enum.Font.GothamBold; TT.TextSize=11; TT.TextXAlignment=Enum.TextXAlignment.Left; TT.ZIndex=13; TT.Parent=TB
local function MkTBtn(xOff,lbl,col)
    local b=Instance.new("TextButton"); b.Size=UDim2.new(0,22,0,22); b.AnchorPoint=Vector2.new(1,0.5)
    b.Position=UDim2.new(1,xOff,0.5,0); b.BackgroundColor3=C2.BG; b.BorderSizePixel=0; b.Text=lbl; b.TextColor3=col
    b.Font=Enum.Font.GothamBold; b.TextSize=12; b.AutoButtonColor=false; b.ZIndex=13; b.Parent=TB
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,4)
    Instance.new("UIStroke",b).Color=col; return b
end
local BtnClose=MkTBtn(-4,"X",C2.PINK)
 
-- Sidebar
local SB=Instance.new("Frame"); SB.Name="Sidebar"; SB.Size=UDim2.new(0,SIDE_W,0,CONT_H)
SB.Position=UDim2.new(0,0,0,TOP_H); SB.BackgroundColor3=C2.SIDEBAR; SB.BorderSizePixel=0; SB.ZIndex=12; SB.Parent=Win
local SBSep=Instance.new("Frame"); SBSep.Size=UDim2.new(0,1,1,0); SBSep.Position=UDim2.new(1,-1,0,0)
SBSep.BackgroundColor3=C2.CYAN; SBSep.BackgroundTransparency=0.7; SBSep.BorderSizePixel=0; SBSep.ZIndex=13; SBSep.Parent=SB
local TabAcc=Instance.new("Frame"); TabAcc.Size=UDim2.new(0,3,0,42); TabAcc.Position=UDim2.new(0,0,0,0)
TabAcc.BackgroundColor3=C2.PINK; TabAcc.BorderSizePixel=0; TabAcc.ZIndex=16; TabAcc.Parent=SB
 
-- Content
local Cont=Instance.new("ScrollingFrame"); Cont.Name="Content"; Cont.Size=UDim2.new(0,CONT_W,0,CONT_H)
Cont.Position=UDim2.new(0,SIDE_W,0,TOP_H); Cont.BackgroundColor3=C2.BG; Cont.BorderSizePixel=0
Cont.ScrollBarThickness=3; Cont.ScrollBarImageColor3=C2.CYAN; Cont.ScrollBarImageTransparency=0.4
Cont.CanvasSize=UDim2.new(0,0,0,0); Cont.AutomaticCanvasSize=Enum.AutomaticSize.Y
Cont.ScrollingDirection=Enum.ScrollingDirection.Y; Cont.ElasticBehavior=Enum.ElasticBehavior.Always; Cont.ZIndex=12; Cont.Parent=Win
 
-- ══════════════════════════════════════
-- HELPERS DE UI
-- ══════════════════════════════════════
local function MkPage(name)
    local p=Instance.new("Frame"); p.Name=name; p.Size=UDim2.new(1,-8,0,0); p.AutomaticSize=Enum.AutomaticSize.Y
    p.Position=UDim2.new(0,4,0,6); p.BackgroundTransparency=1; p.BorderSizePixel=0; p.Visible=false; p.ZIndex=13; p.Parent=Cont
    local ul=Instance.new("UIListLayout"); ul.SortOrder=Enum.SortOrder.LayoutOrder; ul.Padding=UDim.new(0,6); ul.Parent=p; return p
end
local function MkSec(parent,text,order)
    local lbl=Instance.new("TextLabel"); lbl.Size=UDim2.new(1,0,0,18); lbl.BackgroundTransparency=1; lbl.BorderSizePixel=0
    lbl.Text="-- "..text.." --"; lbl.TextColor3=C2.PINK; lbl.Font=Enum.Font.Code; lbl.TextSize=9
    lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.LayoutOrder=order or 0; lbl.ZIndex=14; lbl.Parent=parent
    local sep=Instance.new("Frame"); sep.Size=UDim2.new(1,0,0,1); sep.BackgroundColor3=C2.PINK
    sep.BackgroundTransparency=0.7; sep.BorderSizePixel=0; sep.LayoutOrder=(order or 0)+1; sep.ZIndex=14; sep.Parent=parent
end
local function MkBlock(parent,text,order)
    local f=Instance.new("Frame"); f.Size=UDim2.new(1,0,0,32); f.BackgroundColor3=Color3.fromRGB(0,18,18)
    f.BorderSizePixel=0; f.LayoutOrder=order or 0; f.ZIndex=14; f.Parent=parent
    Instance.new("UIStroke",f).Color=Color3.fromRGB(0,60,60); Instance.new("UICorner",f).CornerRadius=UDim.new(0,4)
    local lbl=Instance.new("TextLabel"); lbl.Size=UDim2.fromScale(1,1); lbl.BackgroundTransparency=1
    lbl.BorderSizePixel=0; lbl.Text=text; lbl.TextColor3=Color3.fromRGB(0,100,100)
    lbl.Font=Enum.Font.Code; lbl.TextSize=10; lbl.ZIndex=15; lbl.Parent=f; return f
end
local function MkToggle(parent,label,desc,order,onOn,onOff)
    local tog=false
    local card=Instance.new("Frame"); card.Size=UDim2.new(1,0,0,52); card.BackgroundColor3=Color3.fromRGB(0,14,14)
    card.BorderSizePixel=0; card.LayoutOrder=order; card.ZIndex=14; card.Parent=parent
    Instance.new("UIStroke",card).Color=Color3.fromRGB(0,45,45); Instance.new("UICorner",card).CornerRadius=UDim.new(0,5)
    local nl=Instance.new("TextLabel"); nl.Size=UDim2.new(1,-62,0,20); nl.Position=UDim2.new(0,8,0,6)
    nl.BackgroundTransparency=1; nl.BorderSizePixel=0; nl.Text=label; nl.TextColor3=C2.CYAN
    nl.Font=Enum.Font.GothamBold; nl.TextSize=11; nl.TextXAlignment=Enum.TextXAlignment.Left; nl.ZIndex=15; nl.Parent=card
    local dl=Instance.new("TextLabel"); dl.Size=UDim2.new(1,-62,0,16); dl.Position=UDim2.new(0,8,0,28)
    dl.BackgroundTransparency=1; dl.BorderSizePixel=0; dl.Text=desc; dl.TextColor3=C2.DIMTXT
    dl.Font=Enum.Font.Code; dl.TextSize=9; dl.TextXAlignment=Enum.TextXAlignment.Left; dl.ZIndex=15; dl.Parent=card
    local cap=Instance.new("Frame"); cap.Size=UDim2.new(0,46,0,24); cap.AnchorPoint=Vector2.new(1,0.5)
    cap.Position=UDim2.new(1,-8,0.5,0); cap.BackgroundColor3=Color3.fromRGB(0,28,28); cap.BorderSizePixel=0; cap.ZIndex=15; cap.Parent=card
    Instance.new("UICorner",cap).CornerRadius=UDim.new(1,0)
    local cSt=Instance.new("UIStroke"); cSt.Color=Color3.fromRGB(0,70,70); cSt.Thickness=1; cSt.Parent=cap
    local cir=Instance.new("Frame"); cir.Size=UDim2.new(0,18,0,18); cir.AnchorPoint=Vector2.new(0,0.5)
    cir.Position=UDim2.new(0,3,0.5,0); cir.BackgroundColor3=Color3.fromRGB(0,70,70); cir.BorderSizePixel=0; cir.ZIndex=16; cir.Parent=cap
    Instance.new("UICorner",cir).CornerRadius=UDim.new(1,0)
    local sLbl=Instance.new("TextLabel"); sLbl.Size=UDim2.fromScale(1,1); sLbl.BackgroundTransparency=1
    sLbl.BorderSizePixel=0; sLbl.Text="OFF"; sLbl.TextColor3=Color3.fromRGB(0,70,70)
    sLbl.Font=Enum.Font.GothamBold; sLbl.TextSize=8; sLbl.ZIndex=16; sLbl.Parent=cap
    local hit=Instance.new("TextButton"); hit.Size=UDim2.fromScale(1,1); hit.BackgroundTransparency=1; hit.Text=""; hit.ZIndex=17; hit.Parent=card
    hit.MouseButton1Click:Connect(function()
        tog=not tog
        if tog then
            TS2:Create(cir,TweenInfo.new(0.2),{Position=UDim2.new(0,25,0.5,0),BackgroundColor3=C2.CYAN}):Play()
            TS2:Create(cap,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(0,38,38)}):Play()
            cSt.Color=C2.CYAN; sLbl.Text="ON"; sLbl.TextColor3=C2.CYAN; if onOn then onOn() end
        else
            TS2:Create(cir,TweenInfo.new(0.2),{Position=UDim2.new(0,3,0.5,0),BackgroundColor3=Color3.fromRGB(0,70,70)}):Play()
            TS2:Create(cap,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(0,28,28)}):Play()
            cSt.Color=Color3.fromRGB(0,70,70); sLbl.Text="OFF"; sLbl.TextColor3=Color3.fromRGB(0,70,70); if onOff then onOff() end
        end end); return card
end
 
local function MkSlider(parent,label,desc,order,minV,maxV,defV,step,onChange)
    local val=defV
    local card=Instance.new("Frame"); card.Size=UDim2.new(1,0,0,56); card.BackgroundColor3=Color3.fromRGB(0,14,14)
    card.BorderSizePixel=0; card.LayoutOrder=order; card.ZIndex=14; card.Parent=parent
    Instance.new("UIStroke",card).Color=Color3.fromRGB(0,45,45); Instance.new("UICorner",card).CornerRadius=UDim.new(0,5)
    local nl=Instance.new("TextLabel"); nl.Size=UDim2.new(1,-4,0,18); nl.Position=UDim2.new(0,8,0,4)
    nl.BackgroundTransparency=1; nl.BorderSizePixel=0; nl.Text=label; nl.TextColor3=C2.CYAN
    nl.Font=Enum.Font.GothamBold; nl.TextSize=11; nl.TextXAlignment=Enum.TextXAlignment.Left; nl.ZIndex=15; nl.Parent=card
    local dl=Instance.new("TextLabel"); dl.Size=UDim2.new(0,160,0,14); dl.Position=UDim2.new(0,8,0,22)
    dl.BackgroundTransparency=1; dl.BorderSizePixel=0; dl.Text=desc; dl.TextColor3=C2.DIMTXT
    dl.Font=Enum.Font.Code; dl.TextSize=9; dl.TextXAlignment=Enum.TextXAlignment.Left; dl.ZIndex=15; dl.Parent=card
    local barBG=Instance.new("Frame"); barBG.Size=UDim2.new(0,100,0,5); barBG.AnchorPoint=Vector2.new(1,0)
    barBG.Position=UDim2.new(1,-8,0,38); barBG.BackgroundColor3=Color3.fromRGB(0,25,25); barBG.BorderSizePixel=0; barBG.ZIndex=15; barBG.Parent=card
    Instance.new("UICorner",barBG).CornerRadius=UDim.new(1,0)
    local barFill=Instance.new("Frame"); barFill.Size=UDim2.new((defV-minV)/(maxV-minV),0,1,0); barFill.BackgroundColor3=C2.CYAN
    barFill.BorderSizePixel=0; barFill.ZIndex=16; barFill.Parent=barBG; Instance.new("UICorner",barFill).CornerRadius=UDim.new(1,0)
    local function MkCtrlBtn(xOff,txt)
        local b=Instance.new("TextButton"); b.Size=UDim2.new(0,22,0,22); b.AnchorPoint=Vector2.new(1,0)
        b.Position=UDim2.new(1,xOff,0,28); b.BackgroundColor3=Color3.fromRGB(0,20,20); b.BorderSizePixel=0
        b.Text=txt; b.TextColor3=C2.CYAN; b.Font=Enum.Font.GothamBold; b.TextSize=14
        b.AutoButtonColor=false; b.ZIndex=15; b.Parent=card
        Instance.new("UICorner",b).CornerRadius=UDim.new(0,4); Instance.new("UIStroke",b).Color=C2.CYAN; return b
    end
    local valLbl=Instance.new("TextLabel"); valLbl.Size=UDim2.new(0,40,0,22); valLbl.AnchorPoint=Vector2.new(1,0)
    valLbl.Position=UDim2.new(1,-56,0,28); valLbl.BackgroundTransparency=1; valLbl.BorderSizePixel=0
    valLbl.Text=tostring(val); valLbl.TextColor3=C2.PINK; valLbl.Font=Enum.Font.GothamBold; valLbl.TextSize=11
    valLbl.TextXAlignment=Enum.TextXAlignment.Center; valLbl.ZIndex=15; valLbl.Parent=card
    local bMinus=MkCtrlBtn(-102,"-"); local bPlus=MkCtrlBtn(-8,"+")
    local function Update(newVal)
        val=math.clamp(newVal,minV,maxV); valLbl.Text=tostring(val)
        barFill.Size=UDim2.new((val-minV)/(maxV-minV),0,1,0); if onChange then onChange(val) end
    end
    bMinus.MouseButton1Click:Connect(function() Update(val-step) end)
    bPlus.MouseButton1Click:Connect(function() Update(val+step) end)
    local function HoldBtn(btn,dir)
        local holding=false
        btn.MouseButton1Down:Connect(function() holding=true; task.spawn(function()
            task.wait(0.4); while holding do Update(val+(dir*step)); task.wait(0.1) end end) end)
        btn.MouseButton1Up:Connect(function() holding=false end)
    end
    HoldBtn(bMinus,-1); HoldBtn(bPlus,1)
    return card
end
 
local function SetAutoStat(statName,enabled)
    if enabled then
        if not table.find(ActiveStats,statName) then table.insert(ActiveStats,statName) end
    else
        local idx=table.find(ActiveStats,statName); if idx then table.remove(ActiveStats,idx) end
    end
end
 
local function MkPlayerSelector(parent,order)
    local card=Instance.new("Frame"); card.Size=UDim2.new(1,0,0,36); card.BackgroundColor3=Color3.fromRGB(0,14,14)
    card.BorderSizePixel=0; card.LayoutOrder=order; card.ZIndex=14; card.Parent=parent
    Instance.new("UIStroke",card).Color=Color3.fromRGB(0,45,45); Instance.new("UICorner",card).CornerRadius=UDim.new(0,5)
    local lbl=Instance.new("TextLabel"); lbl.Size=UDim2.new(1,-60,1,0); lbl.Position=UDim2.new(0,8,0,0)
    lbl.BackgroundTransparency=1; lbl.BorderSizePixel=0; lbl.Text="Jugador: Ninguno"; lbl.TextColor3=C2.DIM
    lbl.Font=Enum.Font.Code; lbl.TextSize=10; lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.ZIndex=15; lbl.Parent=card
    local refreshBtn=Instance.new("TextButton"); refreshBtn.Size=UDim2.new(0,50,0,24); refreshBtn.AnchorPoint=Vector2.new(1,0.5)
    refreshBtn.Position=UDim2.new(1,-6,0.5,0); refreshBtn.BackgroundColor3=Color3.fromRGB(0,20,20); refreshBtn.BorderSizePixel=0
    refreshBtn.Text="Lista"; refreshBtn.TextColor3=C2.CYAN; refreshBtn.Font=Enum.Font.Code; refreshBtn.TextSize=10
    refreshBtn.AutoButtonColor=false; refreshBtn.ZIndex=15; refreshBtn.Parent=card
    Instance.new("UICorner",refreshBtn).CornerRadius=UDim.new(0,4); Instance.new("UIStroke",refreshBtn).Color=C2.CYAN
    local listPanel=Instance.new("Frame"); listPanel.Size=UDim2.new(1,0,0,0); listPanel.AutomaticSize=Enum.AutomaticSize.Y
    listPanel.BackgroundColor3=Color3.fromRGB(0,10,10); listPanel.BorderSizePixel=0; listPanel.LayoutOrder=order+1
    listPanel.Visible=false; listPanel.ZIndex=20; listPanel.Parent=parent
    Instance.new("UICorner",listPanel).CornerRadius=UDim.new(0,4); Instance.new("UIStroke",listPanel).Color=Color3.fromRGB(0,50,50)
    local listLayout=Instance.new("UIListLayout"); listLayout.SortOrder=Enum.SortOrder.LayoutOrder; listLayout.Parent=listPanel
    local listOpen=false
    refreshBtn.MouseButton1Click:Connect(function()
        listOpen=not listOpen
        if listOpen then
            for _,c in pairs(listPanel:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
            local idx=0
            for _,p in pairs(P2:GetPlayers()) do if p~=LP then
                local pb=Instance.new("TextButton"); pb.Size=UDim2.new(1,0,0,26); pb.BackgroundTransparency=1
                pb.BorderSizePixel=0; pb.Text=p.Name; pb.TextColor3=C2.CYAN; pb.Font=Enum.Font.Code; pb.TextSize=10
                pb.TextXAlignment=Enum.TextXAlignment.Left; pb.LayoutOrder=idx; pb.ZIndex=21; pb.Parent=listPanel
                local pp=Instance.new("UIPadding"); pp.PaddingLeft=UDim.new(0,8); pp.Parent=pb
                pb.MouseButton1Click:Connect(function()
                    SelectedPlayer=p.Name; lbl.Text="Jugador: "..p.Name; lbl.TextColor3=C2.CYAN
                    listPanel.Visible=false; listOpen=false end)
                idx=idx+1 end end
            listPanel.Visible=#listPanel:GetChildren()>1
        else listPanel.Visible=false end end)
    return card
end
 
-- ══════════════════════════════════════
-- BOSS SELECTOR (NUEVO — reutilizable)
-- ══════════════════════════════════════
-- Agrupa los bosses por mar para la UI
local BOSS_SEA_LABELS={[1]="SEA 1",[2]="SEA 2",[3]="SEA 3"}
 
local function MkBossSelector(parent, orderBase)
    -- Header con boss seleccionado actualmente
    local headerCard=Instance.new("Frame"); headerCard.Size=UDim2.new(1,0,0,36)
    headerCard.BackgroundColor3=Color3.fromRGB(0,14,14); headerCard.BorderSizePixel=0
    headerCard.LayoutOrder=orderBase; headerCard.ZIndex=14; headerCard.Parent=parent
    Instance.new("UIStroke",headerCard).Color=Color3.fromRGB(0,60,60)
    Instance.new("UICorner",headerCard).CornerRadius=UDim.new(0,5)
 
    -- Icono de boss
    local bossIcon=Instance.new("TextLabel"); bossIcon.Size=UDim2.new(0,20,1,0)
    bossIcon.Position=UDim2.new(0,6,0,0); bossIcon.BackgroundTransparency=1; bossIcon.BorderSizePixel=0
    bossIcon.Text="⚔"; bossIcon.TextColor3=C2.PINK; bossIcon.Font=Enum.Font.GothamBold
    bossIcon.TextSize=16; bossIcon.ZIndex=15; bossIcon.Parent=headerCard
 
    -- Nombre del boss seleccionado
    local selLbl=Instance.new("TextLabel"); selLbl.Size=UDim2.new(1,-80,1,0)
    selLbl.Position=UDim2.new(0,30,0,0); selLbl.BackgroundTransparency=1; selLbl.BorderSizePixel=0
    selLbl.Text=SelectedBossToFarm; selLbl.TextColor3=C2.CYAN; selLbl.Font=Enum.Font.GothamBold
    selLbl.TextSize=11; selLbl.TextXAlignment=Enum.TextXAlignment.Left; selLbl.ZIndex=15; selLbl.Parent=headerCard
    BossSelectedLbl=selLbl  -- referencia global
 
    -- Boton de abrir/cerrar lista
    local toggleBtn=Instance.new("TextButton"); toggleBtn.Size=UDim2.new(0,44,0,26)
    toggleBtn.AnchorPoint=Vector2.new(1,0.5); toggleBtn.Position=UDim2.new(1,-6,0.5,0)
    toggleBtn.BackgroundColor3=Color3.fromRGB(0,20,20); toggleBtn.BorderSizePixel=0
    toggleBtn.Text="▼ VER"; toggleBtn.TextColor3=C2.CYAN; toggleBtn.Font=Enum.Font.Code; toggleBtn.TextSize=9
    toggleBtn.AutoButtonColor=false; toggleBtn.ZIndex=15; toggleBtn.Parent=headerCard
    Instance.new("UICorner",toggleBtn).CornerRadius=UDim.new(0,4)
    Instance.new("UIStroke",toggleBtn).Color=C2.CYAN
 
    -- Panel de lista (scrollable, con separadores por mar)
    local listWrap=Instance.new("Frame"); listWrap.Size=UDim2.new(1,0,0,0)
    listWrap.AutomaticSize=Enum.AutomaticSize.Y; listWrap.BackgroundColor3=Color3.fromRGB(0,9,9)
    listWrap.BorderSizePixel=0; listWrap.LayoutOrder=orderBase+1
    listWrap.Visible=false; listWrap.ZIndex=18; listWrap.Parent=parent
    Instance.new("UICorner",listWrap).CornerRadius=UDim.new(0,5)
    Instance.new("UIStroke",listWrap).Color=Color3.fromRGB(0,50,50)
    local listLayout=Instance.new("UIListLayout"); listLayout.SortOrder=Enum.SortOrder.LayoutOrder
    listLayout.Padding=UDim.new(0,1); listLayout.Parent=listWrap
    local listPad=Instance.new("UIPadding"); listPad.PaddingTop=UDim.new(0,4); listPad.PaddingBottom=UDim.new(0,4)
    listPad.PaddingLeft=UDim.new(0,4); listPad.PaddingRight=UDim.new(0,4); listPad.Parent=listWrap
 
    -- Construir la lista agrupada por mar
    local currentSea=0; local rowIdx=0
    for _,b in ipairs(Sea1BossesAuto) do
        local sea=b.sea or 1
        -- Separador de mar
        if sea~=currentSea then
            currentSea=sea
            local seaLbl=Instance.new("TextLabel"); seaLbl.Size=UDim2.new(1,0,0,18)
            seaLbl.BackgroundTransparency=1; seaLbl.BorderSizePixel=0
            seaLbl.Text="── "..( BOSS_SEA_LABELS[sea] or ("SEA "..sea) ).." ──"
            seaLbl.TextColor3=C2.PINK; seaLbl.Font=Enum.Font.Code; seaLbl.TextSize=9
            seaLbl.TextXAlignment=Enum.TextXAlignment.Center; seaLbl.LayoutOrder=rowIdx; seaLbl.ZIndex=19; seaLbl.Parent=listWrap
            rowIdx=rowIdx+1
        end
        -- Fila de boss
        local bossName=b.name
        local row=Instance.new("TextButton"); row.Size=UDim2.new(1,0,0,26)
        row.BackgroundColor3=Color3.fromRGB(0,14,14); row.BorderSizePixel=0
        row.AutoButtonColor=false; row.LayoutOrder=rowIdx; row.ZIndex=19; row.Parent=listWrap
        Instance.new("UICorner",row).CornerRadius=UDim.new(0,4)
 
        local rowPad=Instance.new("UIPadding"); rowPad.PaddingLeft=UDim.new(0,8); rowPad.Parent=row
        local rowLbl=Instance.new("TextLabel"); rowLbl.Size=UDim2.new(1,-10,1,0); rowLbl.Position=UDim2.new(0,0,0,0)
        rowLbl.BackgroundTransparency=1; rowLbl.BorderSizePixel=0; rowLbl.Text=bossName
        rowLbl.TextColor3=(bossName==SelectedBossToFarm) and C2.GREEN or C2.DIM
        rowLbl.Font=Enum.Font.Code; rowLbl.TextSize=10; rowLbl.TextXAlignment=Enum.TextXAlignment.Left
        rowLbl.ZIndex=20; rowLbl.Parent=row
 
        -- Check activo
        local checkLbl=Instance.new("TextLabel"); checkLbl.Size=UDim2.new(0,16,1,0)
        checkLbl.AnchorPoint=Vector2.new(1,0.5); checkLbl.Position=UDim2.new(1,-4,0.5,0)
        checkLbl.BackgroundTransparency=1; checkLbl.BorderSizePixel=0
        checkLbl.Text=(bossName==SelectedBossToFarm) and "✓" or ""
        checkLbl.TextColor3=C2.GREEN; checkLbl.Font=Enum.Font.GothamBold; checkLbl.TextSize=11
        checkLbl.ZIndex=20; checkLbl.Parent=row
 
        row.MouseEnter:Connect(function() if bossName~=SelectedBossToFarm then row.BackgroundColor3=Color3.fromRGB(0,22,22) end end)
        row.MouseLeave:Connect(function() if bossName~=SelectedBossToFarm then row.BackgroundColor3=Color3.fromRGB(0,14,14) end end)
 
        row.MouseButton1Click:Connect(function()
            -- Deseleccionar todos visualmente
            for _,child in ipairs(listWrap:GetChildren()) do
                if child:IsA("TextButton") then
                    local lbl2=child:FindFirstChildOfClass("TextLabel")
                    local chk=child:FindFirstChild("TextLabel",true)  -- no funciona igual, mejor buscar por orden
                    for _,lc in ipairs(child:GetChildren()) do
                        if lc:IsA("TextLabel") then
                            if lc.TextSize==10 then lc.TextColor3=C2.DIM end
                            if lc.TextSize==11 then lc.Text="" end
                        end
                    end
                    child.BackgroundColor3=Color3.fromRGB(0,14,14)
                end
            end
            -- Seleccionar este
            SelectedBossToFarm=bossName
            if BossSelectedLbl then BossSelectedLbl.Text=bossName end
            rowLbl.TextColor3=C2.GREEN; checkLbl.Text="✓"
            row.BackgroundColor3=Color3.fromRGB(0,25,14)
        end)
        rowIdx=rowIdx+1
    end
 
    local listOpen=false
    toggleBtn.MouseButton1Click:Connect(function()
        listOpen=not listOpen
        listWrap.Visible=listOpen
        toggleBtn.Text=listOpen and "▲ OCL" or "▼ VER"
        toggleBtn.TextColor3=listOpen and C2.PINK or C2.CYAN
        local st=Instance.new("UIStroke"); st.Color=listOpen and C2.PINK or C2.CYAN
        -- reemplazar stroke del boton
        for _,ch in ipairs(toggleBtn:GetChildren()) do if ch:IsA("UIStroke") then ch.Color=listOpen and C2.PINK or C2.CYAN end end
    end)
 
    return headerCard, listWrap
end
 
-- ══════════════════════════════════════
-- PÁGINAS
-- ══════════════════════════════════════
local Pages={}; local startTime=os.clock()
 
-- PERFIL
local PgP=MkPage("Perfil")
local ACard=Instance.new("Frame"); ACard.Size=UDim2.new(1,0,0,80); ACard.BackgroundColor3=Color3.fromRGB(0,14,14)
ACard.BorderSizePixel=0; ACard.LayoutOrder=1; ACard.ZIndex=14; ACard.Parent=PgP
Instance.new("UIStroke",ACard).Color=Color3.fromRGB(0,45,45); Instance.new("UICorner",ACard).CornerRadius=UDim.new(0,5)
local AImg=Instance.new("ImageLabel"); AImg.Size=UDim2.new(0,60,0,60); AImg.AnchorPoint=Vector2.new(0,0.5)
AImg.Position=UDim2.new(0,10,0.5,0); AImg.BackgroundColor3=Color3.fromRGB(0,10,10); AImg.BorderSizePixel=0; AImg.ZIndex=15; AImg.Parent=ACard
Instance.new("UICorner",AImg).CornerRadius=UDim.new(0,4); Instance.new("UIStroke",AImg).Color=C2.CYAN
AImg.Image="rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=60&h=60"
local NLbl=Instance.new("TextLabel"); NLbl.Size=UDim2.new(0,170,0,22); NLbl.Position=UDim2.new(0,80,0,10)
NLbl.BackgroundTransparency=1; NLbl.BorderSizePixel=0; NLbl.Text=LP.DisplayName; NLbl.TextColor3=C2.CYAN
NLbl.Font=Enum.Font.GothamBold; NLbl.TextSize=13; NLbl.TextXAlignment=Enum.TextXAlignment.Left; NLbl.ZIndex=15; NLbl.Parent=ACard
local ULbl=Instance.new("TextLabel"); ULbl.Size=UDim2.new(0,170,0,16); ULbl.Position=UDim2.new(0,80,0,34)
ULbl.BackgroundTransparency=1; ULbl.BorderSizePixel=0; ULbl.Text="@"..LP.Name; ULbl.TextColor3=C2.DIM
ULbl.Font=Enum.Font.Code; ULbl.TextSize=10; ULbl.TextXAlignment=Enum.TextXAlignment.Left; ULbl.ZIndex=15; ULbl.Parent=ACard
local ILbl=Instance.new("TextLabel"); ILbl.Size=UDim2.new(0,170,0,14); ILbl.Position=UDim2.new(0,80,0,52)
ILbl.BackgroundTransparency=1; ILbl.BorderSizePixel=0; ILbl.Text="ID: "..tostring(LP.UserId); ILbl.TextColor3=C2.DIMTXT
ILbl.Font=Enum.Font.Code; ILbl.TextSize=9; ILbl.TextXAlignment=Enum.TextXAlignment.Left; ILbl.ZIndex=15; ILbl.Parent=ACard
MkSec(PgP,"Tiempo de uso",2)
local TCard=Instance.new("Frame"); TCard.Size=UDim2.new(1,0,0,30); TCard.BackgroundColor3=Color3.fromRGB(0,14,14)
TCard.BorderSizePixel=0; TCard.LayoutOrder=4; TCard.ZIndex=14; TCard.Parent=PgP
Instance.new("UIStroke",TCard).Color=Color3.fromRGB(0,45,45); Instance.new("UICorner",TCard).CornerRadius=UDim.new(0,4)
local TLbl=Instance.new("TextLabel"); TLbl.Size=UDim2.fromScale(1,1); TLbl.BackgroundTransparency=1
TLbl.BorderSizePixel=0; TLbl.Text="[T]  00:00:00"; TLbl.TextColor3=C2.CYAN; TLbl.Font=Enum.Font.Code; TLbl.TextSize=11; TLbl.ZIndex=15; TLbl.Parent=TCard
task.spawn(function() while task.wait(1) do if not TLbl.Parent then break end
    local e=math.floor(os.clock()-startTime); TLbl.Text=string.format("[T]  %02d:%02d:%02d",math.floor(e/3600),math.floor((e%3600)/60),e%60) end end)
MkSec(PgP,"Ping",5); local PBlock=MkBlock(PgP,"Calculando...",7)
task.spawn(function() while task.wait(3) do if not PBlock.Parent then break end
    local ok,ping=pcall(function() return math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()) end)
    local pl=PBlock:FindFirstChildOfClass("TextLabel"); if pl then
        pl.Text=ok and ("Ping: "..ping.." ms") or "Ping: N/D"
        pl.TextColor3=(ok and ping<100) and C2.GREEN or (ok and ping<200) and C2.CYAN or C2.PINK end end end)
Pages["Perfil"]=PgP
 
-- ══════════════════════════════════════
-- FARM
-- ══════════════════════════════════════
local PgF=MkPage("Farm")
MkSec(PgF,"Auto Farm (Sea 1-3)",1)
MkToggle(PgF,"Auto Farm Nivel","Sube nivel automatico con quests (Sea 1-3)",3,
    function() AutoLevelEnabled=true end,
    function()
        AutoLevelEnabled=false; AutoFarmState="IDLE"; AutoFarmTarget=nil
        local p=workspace:FindFirstChild(AutoFarmPlatName); if p then p:Destroy() end
    end)
MkToggle(PgF,"Auto Farm Nearest","Farmea el NPC mas cercano",5,
    function() AutoFarmNearestEnabled=true end, function() AutoFarmNearestEnabled=false end)
MkToggle(PgF,"Recoleccion de Cofres","Farm de cajas (Beli)",7,
    function() AutoChestEnabled=true end,
    function() AutoChestEnabled=false end)
MkSlider(PgF,"Velocidad de Traslado","Velocidad de TP del auto farm/cajas",9,120,800,300,20,function(v) AutoTeleportTweenSpeed=v end)
 
-- ══════════════════════════════════════
-- BOSS HUNTER — con selector completo
-- ══════════════════════════════════════
MkSec(PgF,"Boss Hunter",11)
 
-- Selector de boss (Sea 1, 2 y 3)
local bSelectorHeader, bSelectorList = MkBossSelector(PgF, 13)
 
MkToggle(PgF,"Auto Farm Boss","Farmea el boss seleccionado arriba",16,
    function() AutoFarmBossEnabled=true end, function() AutoFarmBossEnabled=false end)
MkToggle(PgF,"Auto Farm All Bosses","Rota entre TODOS los jefes automaticamente",18,
    function() AutoFarmAllBossesEnabled=true; BossCycleIndex=1 end,
    function() AutoFarmAllBossesEnabled=false end)
 
MkSec(PgF,"Haki",20)
MkToggle(PgF,"Auto Haki (Buso)","Activa aura automaticamente",22,
    function() AutoBusoEnabled=true end, function() AutoBusoEnabled=false end)
 
MkSec(PgF,"Progreso",24)
MkToggle(PgF,"Auto Skills","Usa Z/X/C/V/F durante el farm",26,
    function() AutoSkillsEnabled=true end, function() AutoSkillsEnabled=false end)
MkToggle(PgF,"Auto Stats","Reparte puntos automaticamente",28,
    function() AutoStatsEnabled=true end, function() AutoStatsEnabled=false end)
MkToggle(PgF,"Melee Stat","Incluye Melee en Auto Stats",30, function() SetAutoStat("Melee",true) end, function() SetAutoStat("Melee",false) end)
MkToggle(PgF,"Defense Stat","Incluye Defense en Auto Stats",32, function() SetAutoStat("Defense",true) end, function() SetAutoStat("Defense",false) end)
MkToggle(PgF,"Sword Stat","Incluye Sword en Auto Stats",34, function() SetAutoStat("Sword",true) end, function() SetAutoStat("Sword",false) end)
MkToggle(PgF,"Gun Stat","Incluye Gun en Auto Stats",36, function() SetAutoStat("Gun",true) end, function() SetAutoStat("Gun",false) end)
MkToggle(PgF,"Fruit Stat","Incluye Demon Fruit en Auto Stats",38, function() SetAutoStat("Demon Fruit",true) end, function() SetAutoStat("Demon Fruit",false) end)
 
MkSec(PgF,"Ataques",40)
MkToggle(PgF,"Ataque Rapido V3","Instakill al enemigo",42,
    function() InstakillActive=true; task.spawn(function() while InstakillActive do
        local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then hrp.CFrame=CFrame.new(hrp.Position.X,hrp.Position.Y-1e15,hrp.Position.Z) end; task.wait(0.01) end end) end,
    function() InstakillActive=false end)
MkToggle(PgF,"Ataque Rapido V2","NPCs, Leviathan, Sea Events",44,
    function() FastAtkV2=true; StartFastAtkV2() end, function() FastAtkV2=false end)
MkToggle(PgF,"Ataque Rapido V1","Multi-target rapido",46,
    function() FastAtk=true; StartFastAtk() end,
    function() FastAtk=false; if FaConn then FaConn:Disconnect() end end)
MkSlider(PgF,"Rango Ataque V1","Rango del Ataque Rapido V1",48,100,20000,12000,500,function(v) FastAtkRange=v end)
MkSlider(PgF,"Rango Ataque V2","Rango del Ataque Rapido V2",50,100,10000,3000,250,function(v) FastAtkV2Range=v end)
 
MkSec(PgF,"Frutas",52)
MkToggle(PgF,"Pain-Pain","Auto click Pain",54,
    function() FruitAtk=true; Fr1=task.spawn(function() while FruitAtk do task.wait(0.01)
        local _,a,r=GetFrRemote("Pain-Pain"); local b=GetNTRoot()
        if a and b and r then local d=(b.Position-a.Position).Unit; pcall(function() r:FireServer(MkVec(d.X,0,d.Z),1,true) end) end end end) end,
    function() FruitAtk=false; if Fr1 then task.cancel(Fr1); Fr1=nil end end)
MkToggle(PgF,"Dragon-Dragon","Auto click Dragon",56,
    function() FruitAtk=true; Fr12=task.spawn(function() while FruitAtk do task.wait(0.01)
        local _,a,r=GetFrRemote("Dragon-Dragon"); local b=GetNTRoot()
        if a and b and r then local d=(b.Position-a.Position).Unit; pcall(function() r:FireServer(MkVec(d.X,d.Y,d.Z),1) end) end end end) end,
    function() FruitAtk=false; if Fr12 then task.cancel(Fr12); Fr12=nil end end)
MkToggle(PgF,"Tiger-Tiger","Auto click Tiger",58,
    function() FruitAtk=true; Fr166=task.spawn(function() while FruitAtk do task.wait(0.01)
        local _,a,r=GetFrRemote("Tiger-Tiger"); local b=GetNTRoot()
        if a and b and r then local d=(b.Position-a.Position).Unit; pcall(function() r:FireServer(MkVec(d.X,d.Y,d.Z),3) end) end end end) end,
    function() FruitAtk=false; if Fr166 then task.cancel(Fr166); Fr166=nil end end)
MkToggle(PgF,"T-Rex-T-Rex","Auto click T-Rex",60,
    function() FruitAtk=true; Fr3=task.spawn(function() while FruitAtk do task.wait(0)
        local _,a,r=GetFrRemote("T-Rex-T-Rex"); local b=GetNTRoot()
        if a and b and r then local d=(b.Position-a.Position).Unit; pcall(function() r:FireServer(MkVec(d.X,d.Y,d.Z),1) end) end end end) end,
    function() FruitAtk=false; if Fr3 then task.cancel(Fr3); Fr3=nil end end)
MkToggle(PgF,"Kitsune-Kitsune","Auto click Kitsune",62,
    function() FruitAtk=true; FrConn=task.spawn(function() while FruitAtk do task.wait(0.001)
        local _,a,r=GetFrRemote("Kitsune-Kitsune"); local b=GetNTRoot()
        if a and b and r then local d=(b.Position-a.Position).Unit; pcall(function() r:FireServer(d,1,true) end) end end end) end,
    function() FruitAtk=false; if FrConn then task.cancel(FrConn); FrConn=nil end end)
 
MkSec(PgF,"Utilidades de Combate",64)
MkToggle(PgF,"Auto Click","Click izquierdo automatico",66,
    function() AutoClickEnabled=true end, function() AutoClickEnabled=false end)
MkSlider(PgF,"Delay Click","Tiempo entre clicks",68,1,30,8,1,function(v) AutoClickDelay=v/100 end)
MkToggle(PgF,"Bring NPC","Trae NPCs cercanos hacia ti",70,
    function() BringNPCEnabled=true end, function() BringNPCEnabled=false end)
MkSlider(PgF,"Rango Bring NPC","Distancia para traer NPCs",72,50,1000,300,25,function(v) BringNPCRange=v end)
 
MkSec(PgF,"Movimiento",74)
MkToggle(PgF,"Infinite Jump","Salta sin limite",76, function() InfJump=true end, function() InfJump=false end)
MkToggle(PgF,"WalkSpeed","Velocidad personalizada",78, function() _G.WSOn=true end, function() _G.WSOn=false end)
MkSlider(PgF,"Velocidad","WalkSpeed actual",80,16,500,40,5,function(v) _G.WSVal=v end)
Pages["Farm"]=PgF
 
-- PVP
local PgV=MkPage("PvP")
MkSec(PgV,"Aimbot",1)
MkToggle(PgV,"Aimbot ShiftLock","Apunta al mas cercano (ShiftLock)",3, function() MasterEnabled=true end, function() MasterEnabled=false end)
MkToggle(PgV,"Macro XZ","Presiona R → ejecuta X+Z",5, function() AutoSkillEnabled=true end, function() AutoSkillEnabled=false end)
MkSlider(PgV,"Distancia Max","Rango del aimbot",7,50,1500,500,50,function(v) MaxDist=v end)
MkSlider(PgV,"Radio FOV","Campo de deteccion",9,50,800,150,10,function(v) FOV=v end)
MkSec(PgV,"Combate",11)
MkToggle(PgV,"Noclip","Atraviesa paredes",13, function() SetNoclip(true) end, function() SetNoclip(false) end)
MkToggle(PgV,"Hitbox Expander","Expande hitbox del personaje",15,
    function() getgenv().HitboxExpander=true end, function() getgenv().HitboxExpander=false end)
MkSec(PgV,"Jugadores",17)
MkToggle(PgV,"ESP Jugadores","Cajas y nombres visibles",19, function() ESP_On=true end, function() ESP_On=false end)
MkSec(PgV,"Defensa",21)
MkToggle(PgV,"Anti Stun","Evita el stun",23,
    function() local function f(c) if not c:FindFirstChild("AntiMover") then Instance.new("Folder",c).Name="AntiMover" end end
        if LP.Character then f(LP.Character) end; _G.ASC=LP.CharacterAdded:Connect(f) end,
    function() if _G.ASC then _G.ASC:Disconnect() end
        if LP.Character and LP.Character:FindFirstChild("AntiMover") then LP.Character.AntiMover:Destroy() end end)
MkToggle(PgV,"Unbreakable","Atributo invulnerable",25,
    function() _G.Unbreakable=true; task.spawn(function() while _G.Unbreakable do task.wait(0.1)
        if LP.Character then LP.Character:SetAttribute("UnbreakableAll",true) end end end) end,
    function() _G.Unbreakable=false end)
Pages["PvP"]=PgV
 
-- TP
local PgTP=MkPage("TP")
MkSec(PgTP,"Seleccion de Jugador",1)
MkPlayerSelector(PgTP,3)
MkSec(PgTP,"Teleport",6)
local TpCard=MkBlock(PgTP,"[Click] TP al jugador seleccionado",8)
local TpHit=Instance.new("TextButton"); TpHit.Size=UDim2.fromScale(1,1); TpHit.BackgroundTransparency=1; TpHit.Text=""; TpHit.ZIndex=17; TpHit.Parent=TpCard
TpHit.MouseButton1Click:Connect(function()
    if not SelectedPlayer then return end
    local t=P2:FindFirstChild(SelectedPlayer); if t and t.Character then
        local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        local tHRP=t.Character:FindFirstChild("HumanoidRootPart")
        if hrp and tHRP then hrp.CFrame=tHRP.CFrame*CFrame.new(0,0,3) end end end)
 
MkToggle(PgTP,"Tween TP","Se mueve hacia el jugador (vel 200)",10,
    function()
        _G.TweenTPOn=true
        local TwTPConn=RS.Heartbeat:Connect(function()
            if not _G.TweenTPOn or not SelectedPlayer then return end
            local t=P2:FindFirstChild(SelectedPlayer)
            if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                local myHRP=LP.Character.HumanoidRootPart; local tHRP=t.Character.HumanoidRootPart
                local dist=(myHRP.Position-tHRP.Position).Magnitude
                if dist>2 then local spd=200; local time=dist/spd
                    if _G.TwTPActiveTween then _G.TwTPActiveTween:Cancel() end
                    _G.TwTPActiveTween=TS2:Create(myHRP,TweenInfo.new(time,Enum.EasingStyle.Linear),{CFrame=CFrame.new(tHRP.Position)}); _G.TwTPActiveTween:Play() end end end)
        _G.TwTPConn=TwTPConn end,
    function() _G.TweenTPOn=false; if _G.TwTPConn then _G.TwTPConn:Disconnect() end; if _G.TwTPActiveTween then _G.TwTPActiveTween:Cancel() end end)
 
MkToggle(PgTP,"Spectate","Ver camara del jugador seleccionado",12,
    function() _G.SpecOn=true; _G.SpecConn=RS.RenderStepped:Connect(function()
        if _G.SpecOn and SelectedPlayer then local t=P2:FindFirstChild(SelectedPlayer)
            if t and t.Character then workspace.CurrentCamera.CameraSubject=t.Character.Humanoid end end end) end,
    function() _G.SpecOn=false; if _G.SpecConn then _G.SpecConn:Disconnect() end
        if LP.Character then workspace.CurrentCamera.CameraSubject=LP.Character.Humanoid end end)
 
MkSec(PgTP,"Rutas",14)
local BcCard=MkBlock(PgTP,"[Click] TP Barco Embrujado Sea 2",16)
local BcHit=Instance.new("TextButton"); BcHit.Size=UDim2.fromScale(1,1); BcHit.BackgroundTransparency=1; BcHit.Text=""; BcHit.ZIndex=17; BcHit.Parent=BcCard
BcHit.MouseButton1Click:Connect(function() local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart"); if hrp then hrp.CFrame=CFrame.new(938.212,125.103,32852.832) end end)
MkSec(PgTP,"Servidor",18)
local HopCard=MkBlock(PgTP,"[Click] Server Hop",20)
local HopHit=Instance.new("TextButton"); HopHit.Size=UDim2.fromScale(1,1); HopHit.BackgroundTransparency=1; HopHit.Text=""; HopHit.ZIndex=17; HopHit.Parent=HopCard
HopHit.MouseButton1Click:Connect(function() task.spawn(ServerHop) end)
Pages["TP"]=PgTP
 
-- SHOP
local PgSh=MkPage("Shop")
MkSec(PgSh,"Haki y Compras",1)
local KenCard=MkBlock(PgSh,"[Click] Comprar Ken Haki (Vision) - Nivel 300",3)
local KenHit=Instance.new("TextButton"); KenHit.Size=UDim2.fromScale(1,1); KenHit.BackgroundTransparency=1; KenHit.Text=""; KenHit.ZIndex=17; KenHit.Parent=KenCard
KenHit.MouseButton1Click:Connect(function() BuyKenVision() end)
MkToggle(PgSh,"Auto V4","Invoca V4 automaticamente",5,
    function() _G.autoV4=true; task.spawn(function() while _G.autoV4 do task.wait(0.5)
        pcall(function() LP.Backpack.Awakening.RemoteFunction:InvokeServer(true) end) end end) end,
    function() _G.autoV4=false end)
MkSec(PgSh,"Sistema",7)
local RmvCard=MkBlock(PgSh,"[Click] Remove TouchInterest",9)
local RmvHit=Instance.new("TextButton"); RmvHit.Size=UDim2.fromScale(1,1); RmvHit.BackgroundTransparency=1; RmvHit.Text=""; RmvHit.ZIndex=17; RmvHit.Parent=RmvCard
RmvHit.MouseButton1Click:Connect(function() for _,d in pairs(game:GetDescendants()) do if d:IsA("TouchTransmitter") then d:Destroy() end end end)
Pages["Shop"]=PgSh
 
-- VISUALS
local PgVis=MkPage("Visuals")
MkSec(PgVis,"Fast Flags",1)
local FF={
    ["FFlagDisablePostFx"]="True",
    ["DFFlagTextureQualityOverrideEnabled"]="True"
}
local function CF(z) return z:gsub("^DFInt",""):gsub("^DFFlag",""):gsub("FString",""):gsub("FLog",""):gsub("^FFlag",""):gsub("^DFint",""):gsub("^FInt","") end
MkToggle(PgVis,"Fast Flags (Modo Seguro)","Optimiza solo visuales para reducir riesgos",3,
    function() if setfflag then task.spawn(function() for k,v in pairs(FF) do local c=CF(k)
        if not pcall(function() if getfflag(c) then setfflag(c,v) end end) then
            pcall(function() if getfflag(k) then setfflag(k,v) end end) end end end) end end)
Pages["Visuals"]=PgVis
 
-- ══════════════════════════════════════
-- TABS
-- ══════════════════════════════════════
local Tabs={}; local CurTab="Perfil"
local function SetTab(key)
    CurTab=key; local idx=table.find(TAB_KEYS,key); TT.Text=TAB_NAMES[idx]
    TS2:Create(TabAcc,TweenInfo.new(0.15,Enum.EasingStyle.Quad),{Position=UDim2.new(0,0,0,(idx-1)*42)}):Play()
    for _,k in ipairs(TAB_KEYS) do local b=Tabs[k]; local p=Pages[k]; if not b or not p then continue end
        if k==key then b.BackgroundColor3=Color3.fromRGB(0,20,20); b.TextColor3=C2.CYAN; p.Visible=true
        else b.BackgroundColor3=C2.SIDEBAR; b.TextColor3=C2.DIMTXT; p.Visible=false end end
    Cont.CanvasPosition=Vector2.new(0,0) end
for i,key in ipairs(TAB_KEYS) do
    local b=Instance.new("TextButton"); b.Name=key; b.Size=UDim2.new(1,-3,0,42)
    b.Position=UDim2.new(0,3,0,(i-1)*42); b.BackgroundColor3=C2.SIDEBAR; b.BorderSizePixel=0
    b.Text=TAB_NAMES[i]; b.TextColor3=C2.DIMTXT; b.Font=Enum.Font.Code; b.TextSize=10
    b.TextXAlignment=Enum.TextXAlignment.Left; b.AutoButtonColor=false; b.ZIndex=13; b.Parent=SB
    local pad=Instance.new("UIPadding"); pad.PaddingLeft=UDim.new(0,8); pad.Parent=b
    local sep=Instance.new("Frame"); sep.Size=UDim2.new(1,0,0,1); sep.Position=UDim2.new(0,0,1,-1)
    sep.BackgroundColor3=Color3.fromRGB(0,20,20); sep.BorderSizePixel=0; sep.ZIndex=14; sep.Parent=b
    b.MouseButton1Click:Connect(function() SetTab(key) end)
    b.MouseEnter:Connect(function() if CurTab~=key then b.TextColor3=C2.DIM end end)
    b.MouseLeave:Connect(function() if CurTab~=key then b.TextColor3=C2.DIMTXT end end)
    Tabs[key]=b end
SetTab("Perfil")
 
-- Drag ventana
local d2,dS2,wS2=false,nil,nil
TB.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then d2=true;dS2=i.Position;wS2=Win.Position end end)
TB.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then d2=false end end)
UIS.InputChanged:Connect(function(i)
    if i.UserInputType~=Enum.UserInputType.MouseMovement and i.UserInputType~=Enum.UserInputType.Touch then return end
    if d2 and dS2 then local dv=i.Position-dS2; Win.Position=UDim2.new(wS2.X.Scale,wS2.X.Offset+dv.X,wS2.Y.Scale,wS2.Y.Offset+dv.Y) end
    if DSQDragging and DSQDragStart and DSQStartPos then
        local dv=i.Position-DSQDragStart
        if dv.Magnitude>4 then DSQMoved=true end
        local vp=workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920,1080)
        local nx=math.clamp(DSQStartPos.X.Offset+dv.X,0,vp.X-DSQuick.AbsoluteSize.X)
        local ny=math.clamp(DSQStartPos.Y.Offset+dv.Y,0,vp.Y-DSQuick.AbsoluteSize.Y)
        DSQuick.Position=UDim2.new(0,nx,0,ny)
    end
end)
UIS.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        DSQDragging=false
    end
end)
 
-- Apagado total
local function ShutdownAll()
    MasterEnabled=false; AutoSkillEnabled=false; FastAtk=false; FruitAtk=false
    InfJump=false; InstakillActive=false; FastAtkV2=false; ESP_On=false
    AutoLevelEnabled=false; AutoChestEnabled=false; AutoFarmState="IDLE"; AutoFarmTarget=nil
    AutoFarmNearestEnabled=false; AutoFarmBossEnabled=false; AutoFarmAllBossesEnabled=false
    AutoBusoEnabled=false
    AutoClickEnabled=false; BringNPCEnabled=false
    AutoStatsEnabled=false; AutoSkillsEnabled=false; table.clear(ActiveStats)
    SpaceHeld=false; _G.WSOn=false; _G.autoV4=false; _G.Unbreakable=false
    _G.TweenTPOn=false; _G.SpecOn=false
    pcall(function() getgenv().HitboxExpander=false end)
    if FaConn then FaConn:Disconnect(); FaConn=nil end
    if FastV2Conn then FastV2Conn:Disconnect(); FastV2Conn=nil end
    if NoclipConn then NoclipConn:Disconnect(); NoclipConn=nil end
    SetNoclip(false)
    if _G.ASC then _G.ASC:Disconnect(); _G.ASC=nil end
    if _G.SpecConn then _G.SpecConn:Disconnect(); _G.SpecConn=nil end
    if _G.TwTPConn then _G.TwTPConn:Disconnect(); _G.TwTPConn=nil end
    if _G.TwTPActiveTween then _G.TwTPActiveTween:Cancel(); _G.TwTPActiveTween=nil end
    if Fr1 then task.cancel(Fr1); Fr1=nil end
    if Fr12 then task.cancel(Fr12); Fr12=nil end
    if Fr166 then task.cancel(Fr166); Fr166=nil end
    if Fr3 then task.cancel(Fr3); Fr3=nil end
    if FrConn then task.cancel(FrConn); FrConn=nil end
    local p=workspace:FindFirstChild(AutoFarmPlatName); if p then p:Destroy() end
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then workspace.CurrentCamera.CameraSubject=LP.Character.Humanoid end
    for _,d in pairs(ESP_Obj) do pcall(function() d.Box:Remove() end); pcall(function() d.Name:Remove() end) end
    table.clear(ESP_Obj)
    if SG2 and SG2.Parent then SG2:Destroy() end
end
 
-- DS toggle HUD
DSQBtn.MouseButton1Click:Connect(function()
    if DSQMoved then DSQMoved=false; return end
    HUDHidden=not HUDHidden
    Win.Visible=not HUDHidden; Win.Active=not HUDHidden
    DSQSt.Color=HUDHidden and C2.PINK or C2.CYAN
    DSQLabel.TextColor3=HUDHidden and C2.PINK or C2.CYAN
end)
 
BtnClose.MouseButton1Click:Connect(function() ShutdownAll() end)
 
-- Entrada animada
Win.Position=UDim2.new(Win.Position.X.Scale,Win.Position.X.Offset,Win.Position.Y.Scale-0.1,Win.Position.Y.Offset)
Win.BackgroundTransparency=1
TS2:Create(Win,TweenInfo.new(0.35,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {Position=UDim2.new(0.5,-WIN_W/2,0.5,-WIN_H/2),BackgroundTransparency=0}):Play()
 
    end) -- fin Btn click
end)     -- fin AnimateLoad
end) -- fin task.spawn
 