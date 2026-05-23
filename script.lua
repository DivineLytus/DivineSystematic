task.spawn(function()
-- ══════════════════════════════════════
-- DIVINE SYSTEMATIC  — Loading Screen
-- ══════════════════════════════════════
local Players      = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer  = Players.LocalPlayer
local PlayerGui    = LocalPlayer:WaitForChild("PlayerGui")
local HUB_NAME="Divine Systematic"; local HUB_VERSION="v2.0"; local HUB_SUBTITLE="Blox Fruits Edition"
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
local LP=P2.LocalPlayer; local Cam=workspace.CurrentCamera

local MasterEnabled=false; local AutoSkillEnabled=false; local MaxDist=500; local FOV=150
local FastAtk=false; local FastAtkRange=12000; local FruitAtk=false
local InfJump=false; local InstakillActive=false; local KrazyAtk2=false; local KrazyRange=3000
local ESP_On=false; local Noclip=false; local NoclipConn=nil
local SpaceHeld=false; local AttSpd=0.0; local LastAtk=0
_G.WSVal=40; _G.WSOn=false; _G.autoV4=false; _G.Unbreakable=false

local FaConn=nil; local FrConn=nil; local Fr1=nil; local Fr12=nil; local Fr166=nil; local Fr3=nil; local KA2Conn=nil
local SelectedPlayer=nil

-- XS HUB merge (subir nivel + cajas)
local CommF=nil
local XSAutoLevelEnabled=false; local XSAutoChestEnabled=false
local XSFarmState="IDLE"; local XSFarmTarget=nil
local XSTeleportTweenSpeed=300; local XSFarmPlatName="XSFarmPlatMerged"
local XSFarmPullRadius=350; local XSFarmYOffset=30
local XSChestCache={}; local XSLastChestScan=0

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

-- XS HUB quest data (Sea 1)
local XSLevelQuests={
    {lvl=1,q="BanditQuest1",ql=1,name="Bandit",giver="Bandit Quest Giver",island="Town"},
    {lvl=10,q="JungleQuest",ql=1,name="Monkey",giver="Adventurer",island="Jungle"},
    {lvl=15,q="JungleQuest",ql=2,name="Gorilla",giver="Adventurer",island="Jungle"},
    {lvl=30,q="BuggyQuest1",ql=1,name="Pirate",giver="Pirate Adventurer",island="Pirate"},
    {lvl=40,q="BuggyQuest1",ql=2,name="Brute",giver="Pirate Adventurer",island="Pirate"},
    {lvl=60,q="DesertQuest",ql=1,name="Desert Bandit",giver="Desert Adventurer",island="Desert"},
    {lvl=75,q="DesertQuest",ql=2,name="Desert Officer",giver="Desert Adventurer",island="Desert"},
    {lvl=90,q="SnowQuest",ql=1,name="Snow Bandit",giver="Villager",island="Snow"},
    {lvl=100,q="SnowQuest",ql=2,name="Snowman",giver="Villager",island="Snow"},
    {lvl=120,q="MarineQuest2",ql=1,name="Chief Petty Officer",giver="Marine",island="Marine"},
    {lvl=130,q="MarineQuest2",ql=2,name="Vice Admiral",giver="Marine",island="Marine",isBoss=true},
    {lvl=150,q="SkyQuest",ql=1,name="Sky Bandit",giver="Sky Adventurer",island="Sky"},
    {lvl=175,q="SkyQuest",ql=2,name="Dark Master",giver="Sky Adventurer",island="Sky"},
    {lvl=190,q="PrisonerQuest",ql=1,name="Prisoner",giver="Jail Keeper",island="Prison"},
    {lvl=210,q="PrisonerQuest",ql=2,name="Dangerous Prisoner",giver="Jail Keeper",island="Prison"},
    {lvl=250,q="ColosseumQuest",ql=1,name="Toga Warrior",giver="Colosseum Quest Giver",island="Colosseum"},
    {lvl=275,q="ColosseumQuest",ql=2,name="Gladiator",giver="Colosseum Quest Giver",island="Colosseum"},
    {lvl=300,q="MagmaQuest",ql=1,name="Military Soldier",giver="Volcano Adventurer",island="Magma"},
    {lvl=325,q="MagmaQuest",ql=2,name="Military Spy",giver="Volcano Adventurer",island="Magma"},
    {lvl=375,q="FishmanQuest",ql=1,name="Fishman Warrior",giver="Fishman Quest Giver",island="Fishman"},
    {lvl=400,q="FishmanQuest",ql=2,name="Fishman Commando",giver="Fishman Quest Giver",island="Fishman"},
    {lvl=450,q="SkyExp1Quest",ql=1,name="God's Guard",giver="Sky Adventurer",island="Sky"},
    {lvl=475,q="SkyExp1Quest",ql=2,name="Shanda",giver="Sky Adventurer",island="Sky"},
    {lvl=525,q="SkyExp2Quest",ql=1,name="Royal Squad",giver="Sky Adventurer",island="Sky"},
    {lvl=550,q="SkyExp2Quest",ql=2,name="Royal Soldier",giver="Sky Adventurer",island="Sky"},
    {lvl=625,q="FountainQuest",ql=1,name="Galley Pirate",giver="Fountain Quest Giver",island="Fountain"},
    {lvl=650,q="FountainQuest",ql=2,name="Galley Captain",giver="Fountain Quest Giver",island="Fountain"}
}

local function XSTeleport(cf)
    local c=LP.Character; local hrp=c and c:FindFirstChild("HumanoidRootPart")
    if not c or not hrp or not cf then return end
    local d=(hrp.Position-cf.Position).Magnitude
    if d<50 then c:PivotTo(cf); return end
    local tw=TS2:Create(hrp,TweenInfo.new(d/XSTeleportTweenSpeed,Enum.EasingStyle.Linear),{CFrame=cf})
    local bv=Instance.new("BodyVelocity"); bv.MaxForce=Vector3.new(math.huge,math.huge,math.huge); bv.Velocity=Vector3.new(0,0,0); bv.Parent=hrp
    local nc=RS.Stepped:Connect(function()
        for _,v in ipairs(c:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end
    end)
    tw:Play(); tw.Completed:Wait(); bv:Destroy(); nc:Disconnect()
end

local function XSHasQuest()
    local pgui=LP:FindFirstChild("PlayerGui")
    return pgui and pgui:FindFirstChild("Main") and pgui.Main:FindFirstChild("Quest") and pgui.Main.Quest.Visible or false
end

local function XSMatchEnemyName(npcName,targetName)
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

local function XSGetTargetEnemyNameFromQuest()
    local pgui=LP:FindFirstChild("PlayerGui")
    local main=pgui and pgui:FindFirstChild("Main")
    local quest=main and main:FindFirstChild("Quest")
    if not quest or not quest.Visible then return nil end
    local title=quest:FindFirstChild("Container") and quest.Container:FindFirstChild("QuestTitle") and quest.Container.QuestTitle:FindFirstChild("Title")
    if not title or not title.Text then return nil end
    local questText=title.Text; local best=nil; local bestLen=0
    for _,q in ipairs(XSLevelQuests) do
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

local function XSIsEnemyAlive(enemyName)
    local en=workspace:FindFirstChild("Enemies")
    if not en then return false end
    for _,npc in ipairs(en:GetChildren()) do
        local hm=npc:FindFirstChildOfClass("Humanoid")
        if XSMatchEnemyName(npc.Name,enemyName) and hm and hm.Health>0 then return true end
    end
    return false
end

local function XSGetBestQuestData()
    local data=LP:FindFirstChild("Data")
    local lvl=data and data:FindFirstChild("Level") and data.Level.Value or 1
    local best=XSLevelQuests[1]
    for i=1,#XSLevelQuests do
        local q=XSLevelQuests[i]
        if lvl>=q.lvl then
            if q.isBoss then if XSIsEnemyAlive(q.name) then best=q end
            else best=q end
        else break end
    end
    return best
end

local function XSGetIslandPosition(keyword)
    local wo=workspace:FindFirstChild("_WorldOrigin")
    local locs=wo and wo:FindFirstChild("Locations")
    if not locs then return nil end
    for _,v in ipairs(locs:GetChildren()) do if string.find(string.lower(v.Name),string.lower(keyword)) then return v.Position end end
    return nil
end

local XSCachedSpawns={}
local function XSGetEnemySpawnPosition(enemyName)
    if XSCachedSpawns[enemyName] and XSCachedSpawns[enemyName].Y>0 then return XSCachedSpawns[enemyName] end
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
        if best then XSCachedSpawns[enemyName]=best; return best end
    end
    local en=workspace:FindFirstChild("Enemies")
    if en then
        for _,npc in ipairs(en:GetChildren()) do
            local hrp=npc:FindFirstChild("HumanoidRootPart")
            if hrp and XSMatchEnemyName(npc.Name,enemyName) and hrp.Position.Y>0 then
                XSCachedSpawns[enemyName]=hrp.Position; return hrp.Position
            end
        end
    end
    return nil
end

local function XSGetQuestGiverPosition(qData)
    if not qData or not qData.giver then return nil end
    local npcs=workspace:FindFirstChild("NPCs"); if not npcs then return nil end
    local spawnPos=XSGetEnemySpawnPosition(qData.name) or XSGetIslandPosition(qData.island)
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

local function XSGatherTargets(myHRP,targetName,maxR)
    local t={}; local en=workspace:FindFirstChild("Enemies")
    if not en or not myHRP or not targetName then return t end
    for _,npc in ipairs(en:GetChildren()) do
        local hm=npc:FindFirstChildOfClass("Humanoid"); local hrp=npc:FindFirstChild("HumanoidRootPart")
        if hm and hrp and hm.Health>0 and XSMatchEnemyName(npc.Name,targetName) and (hrp.Position-myHRP.Position).Magnitude<=maxR then
            table.insert(t,{npc,npc:FindFirstChild("Head") or hrp}); if #t>=8 then break end
        end
    end
    return t
end

-- Funciones combate
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

local function StartKA2()
    if KA2Conn then KA2Conn:Disconnect() end
    KA2Conn=RS.Heartbeat:Connect(function()
        if not KrazyAtk2 then return end; if tick()-LastAtk<AttSpd then return end
        local c=LP.Character; local hrp=c and c:FindFirstChild("HumanoidRootPart"); if not hrp then return end
        local targets={}
        for _,v in ipairs(workspace:GetChildren()) do local iT=false
            for _,nm in ipairs(SPECIAL) do if string.find(v.Name,nm) then iT=true; break end end
            if iT or (v:FindFirstChildOfClass("Humanoid") and v.Name~=LP.Name) then
                local hm=v:FindFirstChildOfClass("Humanoid"); local tr=v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Head")
                if hm and hm.Health>0 and tr and (hrp.Position-tr.Position).Magnitude<=KrazyRange then
                    table.insert(targets,{v,tr}); if #targets>=5 then break end end end end
        if #targets>0 then LastAtk=tick(); FireAtk(targets) end end)
end

local function SetNoclip(s) Noclip=s
    if Noclip then NoclipConn=RS.Stepped:Connect(function() local c=LP.Character
        if c and Noclip then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end end end)
    else if NoclipConn then NoclipConn:Disconnect(); NoclipConn=nil end
        local c=LP.Character; if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=true end end end end
end

-- Loops globales
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

-- XS HUB merge: auto subir nivel
task.spawn(function()
    while task.wait(0.15) do
        if not XSAutoLevelEnabled then
            XSFarmState="IDLE"; XSFarmTarget=nil
            local oldPlat=workspace:FindFirstChild(XSFarmPlatName); if oldPlat then oldPlat:Destroy() end
            continue
        end

        local c=LP.Character; local hrp=c and c:FindFirstChild("HumanoidRootPart"); local hm=c and c:FindFirstChildOfClass("Humanoid")
        if not c or not hrp or not hm or hm.Health<=0 then continue end

        local plat=workspace:FindFirstChild(XSFarmPlatName)
        if not plat then
            plat=Instance.new("Part"); plat.Name=XSFarmPlatName; plat.Anchored=true; plat.CanCollide=false; plat.Transparency=1
            plat.Size=Vector3.new(15,1,15); plat.CFrame=hrp.CFrame*CFrame.new(0,-3.5,0); plat.Parent=workspace
        end

        local qData=XSGetBestQuestData(); if not qData then continue end
        local targetEnemyName=XSGetTargetEnemyNameFromQuest() or qData.name
        XSFarmTarget=targetEnemyName

        if not XSHasQuest() then
            XSFarmState="GETTING_QUEST"
            local giverCF=XSGetQuestGiverPosition(qData)
            if giverCF then
                if (hrp.Position-giverCF.Position).Magnitude>15 then XSTeleport(giverCF)
                else
                    hrp.CFrame=giverCF; task.wait(0.2)
                    if CommF then pcall(function() CommF:InvokeServer("StartQuest",qData.q,qData.ql) end) end
                end
            else
                local islandPos=XSGetIslandPosition(qData.island)
                if islandPos then XSTeleport(CFrame.new(islandPos)*CFrame.new(0,30,0)) end
            end
            continue
        end

        XSFarmState="FARMING"
        local en=workspace:FindFirstChild("Enemies"); local firstNPC=nil; local minDist=math.huge
        if en then
            for _,npc in ipairs(en:GetChildren()) do
                if XSMatchEnemyName(npc.Name,targetEnemyName) then
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
                local targetCF=CFrame.new(nHrp.Position.X,nHrp.Position.Y+XSFarmYOffset,nHrp.Position.Z)
                plat.CFrame=targetCF
                if (hrp.Position-plat.Position).Magnitude>15 then XSTeleport(plat.CFrame*CFrame.new(0,3.5,0))
                else hrp.CFrame=plat.CFrame*CFrame.new(0,3.5,0) end
                hrp.AssemblyLinearVelocity=Vector3.new(0,0,0)
                local pullCF=plat.CFrame*CFrame.new(0,-30,0)
                if en then
                    for _,npc in ipairs(en:GetChildren()) do
                        if XSMatchEnemyName(npc.Name,targetEnemyName) then
                            local oHrp=npc:FindFirstChild("HumanoidRootPart"); local oHm=npc:FindFirstChildOfClass("Humanoid")
                            if oHrp and oHm and oHm.Health>0 and (oHrp.Position-pullCF.Position).Magnitude<XSFarmPullRadius then
                                oHrp.CFrame=pullCF; oHrp.CanCollide=false; oHrp.AssemblyLinearVelocity=Vector3.new(0,0,0)
                                oHm.WalkSpeed=0; oHm.JumpPower=0
                            end
                        end
                    end
                end
                local targets=XSGatherTargets(hrp,targetEnemyName,FastAtkRange)
                if #targets>0 then FireAtk(targets) end
            end
        else
            XSFarmState="WAITING"
            local spawnPos=XSGetEnemySpawnPosition(targetEnemyName) or XSGetIslandPosition(qData.island)
            if spawnPos then
                local hoverCF=CFrame.new(spawnPos)*CFrame.new(0,30,0)
                plat.CFrame=hoverCF
                if (hrp.Position-hoverCF.Position).Magnitude>20 then XSTeleport(hoverCF*CFrame.new(0,3.5,0))
                else hrp.CFrame=hoverCF*CFrame.new(0,3.5,0) end
                hrp.AssemblyLinearVelocity=Vector3.new(0,0,0)
            end
        end
    end
end)

-- XS HUB merge: auto cajas
local function XSGetChests()
    if tick()-XSLastChestScan>15 or #XSChestCache==0 then
        XSLastChestScan=tick(); table.clear(XSChestCache)
        pcall(function()
            for _,v in ipairs(workspace:GetDescendants()) do
                if string.find(v.Name,"Chest") and v:IsA("BasePart") then table.insert(XSChestCache,v) end
            end
        end)
    end
    local active={}
    for _,ch in ipairs(XSChestCache) do if ch and ch.Parent and ch:FindFirstChild("TouchInterest") then table.insert(active,ch) end end
    return active
end

task.spawn(function()
    while task.wait(1) do
        if not XSAutoChestEnabled then continue end
        local c=LP.Character; local hrp=c and c:FindFirstChild("HumanoidRootPart"); if not hrp then continue end
        local chests=XSGetChests(); if #chests==0 then continue end
        table.sort(chests,function(a,b) return (hrp.Position-a.Position).Magnitude<(hrp.Position-b.Position).Magnitude end)
        for _,ch in ipairs(chests) do
            if not XSAutoChestEnabled then break end
            if ch and ch.Parent and ch:FindFirstChild("TouchInterest") then
                local cf=ch.CFrame
                if (hrp.Position-cf.Position).Magnitude>15 then XSTeleport(cf) else hrp.CFrame=cf end
                task.wait(0.2)
                if firetouchinterest and ch:FindFirstChild("TouchInterest") then
                    firetouchinterest(hrp,ch,0); task.wait(0.01); firetouchinterest(hrp,ch,1)
                end
                task.wait(0.2)
            end
        end
    end
end)

-- ESP
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
local TAB_NAMES={"PERFIL","FARM","PVP","SHOP","VISUALS"}; local TAB_KEYS={"Perfil","Farm","PvP","Shop","Visuals"}
local WIN_W=420; local WIN_H=285; local TOP_H=30; local SIDE_W=92; local CONT_W=WIN_W-SIDE_W; local CONT_H=WIN_H-TOP_H

local SG2=Instance.new("ScreenGui"); SG2.Name="CyberpunkMain"; SG2.ResetOnSpawn=false
SG2.ZIndexBehavior=Enum.ZIndexBehavior.Sibling; pcall(function() SG2.IgnoreGuiInset=true end); SG2.Parent=PGui2

-- DS quick toggle (mostrar/ocultar HUD)
local DSQuick=Instance.new("Frame"); DSQuick.Size=UDim2.new(0,56,0,56); DSQuick.Position=UDim2.new(0,14,1,-74)
DSQuick.BackgroundColor3=C2.BG; DSQuick.BorderSizePixel=0; DSQuick.ZIndex=40; DSQuick.Parent=SG2
Instance.new("UICorner",DSQuick).CornerRadius=UDim.new(0,6)
local DSQSt=Instance.new("UIStroke"); DSQSt.Color=C2.CYAN; DSQSt.Thickness=1.3; DSQSt.Transparency=0.25; DSQSt.Parent=DSQuick
local DSQLabel=Instance.new("TextLabel"); DSQLabel.Size=UDim2.fromScale(1,1); DSQLabel.BackgroundTransparency=1
DSQLabel.BorderSizePixel=0; DSQLabel.Text="DS"; DSQLabel.TextColor3=C2.CYAN; DSQLabel.Font=Enum.Font.GothamBold
DSQLabel.TextSize=23; DSQLabel.TextXAlignment=Enum.TextXAlignment.Center; DSQLabel.TextYAlignment=Enum.TextYAlignment.Center
DSQLabel.ZIndex=41; DSQLabel.Parent=DSQuick
local DSQBtn=Instance.new("TextButton"); DSQBtn.Size=UDim2.fromScale(1,1); DSQBtn.BackgroundTransparency=1
DSQBtn.Text=""; DSQBtn.AutoButtonColor=false; DSQBtn.ZIndex=42; DSQBtn.Parent=DSQuick
local HUDHidden=false
DSQBtn.MouseEnter:Connect(function() if not HUDHidden then DSQSt.Color=C2.PINK; DSQLabel.TextColor3=C2.PINK end end)
DSQBtn.MouseLeave:Connect(function() if not HUDHidden then DSQSt.Color=C2.CYAN; DSQLabel.TextColor3=C2.CYAN end end)

-- Ventana principal
local Win=Instance.new("Frame"); Win.Name="Window"; Win.Size=UDim2.new(0,WIN_W,0,WIN_H)
Win.Position=UDim2.new(0.5,-WIN_W/2,0.5,-WIN_H/2); Win.BackgroundColor3=C2.BG
Win.BorderSizePixel=0; Win.ZIndex=10; Win.ClipsDescendants=true; Win.Parent=SG2
Instance.new("UICorner",Win).CornerRadius=UDim.new(0,8)  -- BORDES REDONDEADOS
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

-- ── Helpers de UI ────────────────────────────────────────────
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

-- SLIDER con + y -
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
    -- barra de valor
    local barBG=Instance.new("Frame"); barBG.Size=UDim2.new(0,100,0,5); barBG.AnchorPoint=Vector2.new(1,0)
    barBG.Position=UDim2.new(1,-8,0,38); barBG.BackgroundColor3=Color3.fromRGB(0,25,25); barBG.BorderSizePixel=0; barBG.ZIndex=15; barBG.Parent=card
    Instance.new("UICorner",barBG).CornerRadius=UDim.new(1,0)
    local barFill=Instance.new("Frame"); barFill.Size=UDim2.new((defV-minV)/(maxV-minV),0,1,0); barFill.BackgroundColor3=C2.CYAN
    barFill.BorderSizePixel=0; barFill.ZIndex=16; barFill.Parent=barBG; Instance.new("UICorner",barFill).CornerRadius=UDim.new(1,0)
    -- botones
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
    -- hold to repeat
    local function HoldBtn(btn, dir)
        local holding=false
        btn.MouseButton1Down:Connect(function() holding=true; task.spawn(function()
            task.wait(0.4); while holding do Update(val+(dir*step)); task.wait(0.1) end end) end)
        btn.MouseButton1Up:Connect(function() holding=false end)
    end
    HoldBtn(bMinus,-1); HoldBtn(bPlus,1)
    return card
end

-- Selector de jugador simple
local PlayerListFrame=nil
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
    -- Panel de lista (aparece al hacer click)
    local listPanel=Instance.new("Frame"); listPanel.Size=UDim2.new(1,0,0,0); listPanel.AutomaticSize=Enum.AutomaticSize.Y
    listPanel.BackgroundColor3=Color3.fromRGB(0,10,10); listPanel.BorderSizePixel=0; listPanel.LayoutOrder=order+1
    listPanel.Visible=false; listPanel.ZIndex=20; listPanel.Parent=parent
    Instance.new("UICorner",listPanel).CornerRadius=UDim.new(0,4); Instance.new("UIStroke",listPanel).Color=Color3.fromRGB(0,50,50)
    local listLayout=Instance.new("UIListLayout"); listLayout.SortOrder=Enum.SortOrder.LayoutOrder; listLayout.Parent=listPanel
    local listOpen=false
    refreshBtn.MouseButton1Click:Connect(function()
        listOpen=not listOpen
        if listOpen then
            -- limpiar lista
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

-- FARM
local PgF=MkPage("Farm")
MkSec(PgF,"Krazy Kill",1)
MkToggle(PgF,"Krazy Kill","Instakill al enemigo",3,
    function() InstakillActive=true; task.spawn(function() while InstakillActive do
        local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then hrp.CFrame=CFrame.new(hrp.Position.X,hrp.Position.Y-1e15,hrp.Position.Z) end; task.wait(0.01) end end) end,
    function() InstakillActive=false end)
MkToggle(PgF,"Krazy Attack 2","NPCs, Leviathan, Sea Events",5,
    function() KrazyAtk2=true; StartKA2() end, function() KrazyAtk2=false end)
MkToggle(PgF,"Fast Attack","Multi-target rapido",7,
    function() FastAtk=true; StartFastAtk() end,
    function() FastAtk=false; if FaConn then FaConn:Disconnect() end end)
MkSlider(PgF,"Attack Range","Rango del Fast Attack",9,100,20000,12000,500,function(v) FastAtkRange=v end)
MkSlider(PgF,"Krazy Range","Rango del Krazy Attack 2",11,100,10000,3000,250,function(v) KrazyRange=v end)
MkSec(PgF,"Frutas",13)
MkToggle(PgF,"Pain-Pain","Auto click Pain",15,
    function() FruitAtk=true; Fr1=task.spawn(function() while FruitAtk do task.wait(0.01)
        local _,a,r=GetFrRemote("Pain-Pain"); local b=GetNTRoot()
        if a and b and r then local d=(b.Position-a.Position).Unit; pcall(function() r:FireServer(MkVec(d.X,0,d.Z),1,true) end) end end end) end,
    function() FruitAtk=false; if Fr1 then task.cancel(Fr1); Fr1=nil end end)
MkToggle(PgF,"Dragon-Dragon","Auto click Dragon",17,
    function() FruitAtk=true; Fr12=task.spawn(function() while FruitAtk do task.wait(0.01)
        local _,a,r=GetFrRemote("Dragon-Dragon"); local b=GetNTRoot()
        if a and b and r then local d=(b.Position-a.Position).Unit; pcall(function() r:FireServer(MkVec(d.X,d.Y,d.Z),1) end) end end end) end,
    function() FruitAtk=false; if Fr12 then task.cancel(Fr12); Fr12=nil end end)
MkToggle(PgF,"Tiger-Tiger","Auto click Tiger",19,
    function() FruitAtk=true; Fr166=task.spawn(function() while FruitAtk do task.wait(0.01)
        local _,a,r=GetFrRemote("Tiger-Tiger"); local b=GetNTRoot()
        if a and b and r then local d=(b.Position-a.Position).Unit; pcall(function() r:FireServer(MkVec(d.X,d.Y,d.Z),3) end) end end end) end,
    function() FruitAtk=false; if Fr166 then task.cancel(Fr166); Fr166=nil end end)
MkToggle(PgF,"T-Rex-T-Rex","Auto click T-Rex",21,
    function() FruitAtk=true; Fr3=task.spawn(function() while FruitAtk do task.wait(0)
        local _,a,r=GetFrRemote("T-Rex-T-Rex"); local b=GetNTRoot()
        if a and b and r then local d=(b.Position-a.Position).Unit; pcall(function() r:FireServer(MkVec(d.X,d.Y,d.Z),1) end) end end end) end,
    function() FruitAtk=false; if Fr3 then task.cancel(Fr3); Fr3=nil end end)
MkToggle(PgF,"Kitsune-Kitsune","Auto click Kitsune",23,
    function() FruitAtk=true; FrConn=task.spawn(function() while FruitAtk do task.wait(0.001)
        local _,a,r=GetFrRemote("Kitsune-Kitsune"); local b=GetNTRoot()
        if a and b and r then local d=(b.Position-a.Position).Unit; pcall(function() r:FireServer(d,1,true) end) end end end) end,
    function() FruitAtk=false; if FrConn then task.cancel(FrConn); FrConn=nil end end)
MkSec(PgF,"Movimiento",25)
MkToggle(PgF,"Infinite Jump","Salta sin limite",27, function() InfJump=true end, function() InfJump=false end)
MkToggle(PgF,"WalkSpeed","Velocidad personalizada",29, function() _G.WSOn=true end, function() _G.WSOn=false end)
MkSlider(PgF,"Velocidad","WalkSpeed actual",31,16,500,40,5,function(v) _G.WSVal=v end)
MkSec(PgF,"XS HUB Merge",33)
MkToggle(PgF,"Auto Farm Nivel (XS)","Sube nivel automatico con quests (Sea 1)",35,
    function() XSAutoLevelEnabled=true end,
    function()
        XSAutoLevelEnabled=false; XSFarmState="IDLE"; XSFarmTarget=nil
        local p=workspace:FindFirstChild(XSFarmPlatName); if p then p:Destroy() end
    end)
MkToggle(PgF,"Auto Chest (XS)","Farm de cajas (Beli)",37,
    function() XSAutoChestEnabled=true end,
    function() XSAutoChestEnabled=false end)
MkSlider(PgF,"Tween Speed XS","Velocidad de TP del auto farm/cajas",39,120,800,300,20,function(v) XSTeleportTweenSpeed=v end)
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
MkSec(PgV,"Defensa",17)
MkToggle(PgV,"Anti Stun","Evita el stun",19,
    function() local function f(c) if not c:FindFirstChild("AntiMover") then Instance.new("Folder",c).Name="AntiMover" end end
        if LP.Character then f(LP.Character) end; _G.ASC=LP.CharacterAdded:Connect(f) end,
    function() if _G.ASC then _G.ASC:Disconnect() end
        if LP.Character and LP.Character:FindFirstChild("AntiMover") then LP.Character.AntiMover:Destroy() end end)
MkToggle(PgV,"Unbreakable","Atributo invulnerable",21,
    function() _G.Unbreakable=true; task.spawn(function() while _G.Unbreakable do task.wait(0.1)
        if LP.Character then LP.Character:SetAttribute("UnbreakableAll",true) end end end) end,
    function() _G.Unbreakable=false end)
Pages["PvP"]=PgV

-- SHOP / TELEPORTS
local PgSh=MkPage("Shop")
MkSec(PgSh,"Seleccion de Jugador",1)
MkPlayerSelector(PgSh,3)
MkSec(PgSh,"Teleport",6)
local TpCard=MkBlock(PgSh,"[Click] TP al jugador seleccionado",8)
local TpHit=Instance.new("TextButton"); TpHit.Size=UDim2.fromScale(1,1); TpHit.BackgroundTransparency=1; TpHit.Text=""; TpHit.ZIndex=17; TpHit.Parent=TpCard
TpHit.MouseButton1Click:Connect(function()
    if not SelectedPlayer then return end
    local t=P2:FindFirstChild(SelectedPlayer); if t and t.Character then
        local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        local tHRP=t.Character:FindFirstChild("HumanoidRootPart")
        if hrp and tHRP then hrp.CFrame=tHRP.CFrame*CFrame.new(0,0,3) end end end)

MkToggle(PgSh,"Tween TP","Se mueve hacia el jugador (vel 200)",10,
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

MkToggle(PgSh,"Spectate","Ver camara del jugador seleccionado",12,
    function() _G.SpecOn=true; _G.SpecConn=RS.RenderStepped:Connect(function()
        if _G.SpecOn and SelectedPlayer then local t=P2:FindFirstChild(SelectedPlayer)
            if t and t.Character then workspace.CurrentCamera.CameraSubject=t.Character.Humanoid end end end) end,
    function() _G.SpecOn=false; if _G.SpecConn then _G.SpecConn:Disconnect() end
        if LP.Character then workspace.CurrentCamera.CameraSubject=LP.Character.Humanoid end end)

MkSec(PgSh,"Misc",14)
local BcCard=MkBlock(PgSh,"[Click] TP Barco Embrujado Sea 2",16)
local BcHit=Instance.new("TextButton"); BcHit.Size=UDim2.fromScale(1,1); BcHit.BackgroundTransparency=1; BcHit.Text=""; BcHit.ZIndex=17; BcHit.Parent=BcCard
BcHit.MouseButton1Click:Connect(function() local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart"); if hrp then hrp.CFrame=CFrame.new(938.212,125.103,32852.832) end end)
MkToggle(PgSh,"Auto V4","Invoca V4 automaticamente",18,
    function() _G.autoV4=true; task.spawn(function() while _G.autoV4 do task.wait(0.5)
        pcall(function() LP.Backpack.Awakening.RemoteFunction:InvokeServer(true) end) end end) end,
    function() _G.autoV4=false end)
local RmvCard=MkBlock(PgSh,"[Click] Remove TouchInterest",20)
local RmvHit=Instance.new("TextButton"); RmvHit.Size=UDim2.fromScale(1,1); RmvHit.BackgroundTransparency=1; RmvHit.Text=""; RmvHit.ZIndex=17; RmvHit.Parent=RmvCard
RmvHit.MouseButton1Click:Connect(function() for _,d in pairs(game:GetDescendants()) do if d:IsA("TouchTransmitter") then d:Destroy() end end end)
Pages["Shop"]=PgSh

-- VISUALS
local PgVis=MkPage("Visuals")
MkSec(PgVis,"Fast Flags",1)
local FF={["DFIntMaxActiveAnimationTracks"]="0",["DFIntReplicatorAnimationTrackLimitPerAnimator"]="-1",
    ["DFIntAnimationLodFacsDistanceMin"]="0",["DFIntAnimationLodFacsDistanceMax"]="0",
    ["TextureCompositorActiveJobs"]="0",["RenderShadowmapBias"]="75",
    ["CSGLevelOfDetailSwitchingDistanceL34"]="0",["CSGLevelOfDetailSwitchingDistanceL23"]="0",
    ["CSGLevelOfDetailSwitchingDistance"]="0",["PerformanceControlTextureQualityBestUtility"]="-1",
    ["IncludePowerSaverMode"]="True",["DebugForceFSMCPULightCulling"]="True",
    ["TextureQualityOverride"]="0",["TextureQualityOverrideEnabled"]="True",
    ["DisablePostFx"]="True",["TaskSchedulerTargetFps"]="9999999",["DebugDisplayFPS"]="True",
    ["FFlagFastGPULightCulling3"]="True",["FFlagGpuGeometryManager7"]="True",
    ["FFlagRenderCheckThreading"]="True",["FFlagGraphicsEnableD3D10Compute"]="True",
    ["DFIntS2PhysicsSenderRate"]="250"}
local function CF(z) return z:gsub("^DFInt",""):gsub("^DFFlag",""):gsub("FString",""):gsub("FLog",""):gsub("^FFlag",""):gsub("^DFint",""):gsub("^FInt","") end
MkToggle(PgVis,"Fast Flags (Better FPS)","Optimiza graficos, red y telemetria",3,
    function() if setfflag then task.spawn(function() for k,v in pairs(FF) do local c=CF(k)
        if not pcall(function() if getfflag(c) then setfflag(c,v) end end) then
            pcall(function() if getfflag(k) then setfflag(k,v) end end) end end end) end end)
MkSec(PgVis,"ESP",5)
MkToggle(PgVis,"ESP Jugadores","Cajas y nombres visibles",7, function() ESP_On=true end, function() ESP_On=false end)
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

-- Drag
local d2,dS2,wS2=false,nil,nil
TB.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then d2=true;dS2=i.Position;wS2=Win.Position end end)
TB.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then d2=false end end)
UIS.InputChanged:Connect(function(i)
    if i.UserInputType~=Enum.UserInputType.MouseMovement and i.UserInputType~=Enum.UserInputType.Touch then return end
    if d2 and dS2 then local dv=i.Position-dS2; Win.Position=UDim2.new(wS2.X.Scale,wS2.X.Offset+dv.X,wS2.Y.Scale,wS2.Y.Offset+dv.Y) end
end)

-- Apagado total
local function ShutdownAll()
    MasterEnabled=false; AutoSkillEnabled=false; FastAtk=false; FruitAtk=false
    InfJump=false; InstakillActive=false; KrazyAtk2=false; ESP_On=false
    XSAutoLevelEnabled=false; XSAutoChestEnabled=false; XSFarmState="IDLE"; XSFarmTarget=nil
    SpaceHeld=false; _G.WSOn=false; _G.autoV4=false; _G.Unbreakable=false
    _G.TweenTPOn=false; _G.SpecOn=false
    pcall(function() getgenv().HitboxExpander=false end)
    if FaConn then FaConn:Disconnect(); FaConn=nil end
    if KA2Conn then KA2Conn:Disconnect(); KA2Conn=nil end
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
    local p=workspace:FindFirstChild(XSFarmPlatName); if p then p:Destroy() end
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then workspace.CurrentCamera.CameraSubject=LP.Character.Humanoid end
    for _,d in pairs(ESP_Obj) do pcall(function() d.Box:Remove() end); pcall(function() d.Name:Remove() end) end
    table.clear(ESP_Obj)
    if SG2 and SG2.Parent then SG2:Destroy() end
end

-- DS toggle HUD
DSQBtn.MouseButton1Click:Connect(function()
    HUDHidden=not HUDHidden
    Win.Visible=not HUDHidden; Win.Active=not HUDHidden
    DSQSt.Color=HUDHidden and C2.PINK or C2.CYAN
    DSQLabel.TextColor3=HUDHidden and C2.PINK or C2.CYAN
end)

-- X = apagar todo + destruir hub
BtnClose.MouseButton1Click:Connect(function() ShutdownAll() end)

-- Entrada
Win.Position=UDim2.new(Win.Position.X.Scale,Win.Position.X.Offset,Win.Position.Y.Scale-0.1,Win.Position.Y.Offset)
Win.BackgroundTransparency=1
TS2:Create(Win,TweenInfo.new(0.35,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    {Position=UDim2.new(0.5,-WIN_W/2,0.5,-WIN_H/2),BackgroundTransparency=0}):Play()

    end) -- fin Btn click
end)     -- fin AnimateLoad
end) -- fin task.spawn
