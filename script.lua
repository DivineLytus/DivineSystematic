task.spawn(function()
-- ══════════════════════════════════════
-- DIVINE SYSTEMATIC  — Loading Screen
-- ══════════════════════════════════════
local Players      = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer  = Players.LocalPlayer
local PlayerGui    = LocalPlayer:WaitForChild("PlayerGui")

local HUB_NAME     = "Divine Systematic"
local HUB_VERSION  = "v1.0"
local HUB_SUBTITLE = "Blox Fruits Edition"
local LOAD_STEPS   = {
    "Iniciando sistema...",
    "Cargando datos...",
    "Verificando conexion...",
    "Preparando funciones...",
    "Listo.",
}

local C = {
    BG    = Color3.fromRGB(5,   5,  16),
    CYAN  = Color3.fromRGB(0,  255, 255),
    PINK  = Color3.fromRGB(255,  0, 144),
    GREEN = Color3.fromRGB(0,  255,  80),
    DIM   = Color3.fromRGB(0,  160, 160),
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name           = "CyberpunkHub"
ScreenGui.ResetOnSpawn   = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() ScreenGui.IgnoreGuiInset = true end)
ScreenGui.Parent         = PlayerGui

local Overlay = Instance.new("Frame")
Overlay.Size                   = UDim2.fromScale(1, 1)
Overlay.Position               = UDim2.fromScale(0, 0)
Overlay.BackgroundColor3       = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.25
Overlay.BorderSizePixel        = 0
Overlay.ZIndex                 = 1
Overlay.Parent                 = ScreenGui

local Panel = Instance.new("Frame")
Panel.Size             = UDim2.new(0, 340, 0, 300)
Panel.AnchorPoint      = Vector2.new(0.5, 0.5)
Panel.Position         = UDim2.new(0.5, 0, 1.6, 0)
Panel.BackgroundColor3 = C.BG
Panel.BorderSizePixel  = 0
Panel.ZIndex           = 2
Panel.Parent           = Overlay

local PanelStroke = Instance.new("UIStroke")
PanelStroke.Color        = C.CYAN
PanelStroke.Thickness    = 1.5
PanelStroke.Transparency = 0.3
PanelStroke.Parent       = Panel

local function MkLabel(t)
    local l = Instance.new("TextLabel")
    l.BackgroundTransparency = 1
    l.BorderSizePixel        = 0
    l.TextColor3   = t.color  or C.CYAN
    l.Font         = t.font   or Enum.Font.Code
    l.TextSize     = t.size   or 13
    l.Text         = t.text   or ""
    l.Size         = t.sz     or UDim2.new(1, 0, 0, 22)
    l.Position     = t.pos    or UDim2.new(0, 0, 0, 0)
    l.TextXAlignment = t.align or Enum.TextXAlignment.Center
    l.ZIndex       = 3
    l.Parent       = t.parent or Panel
    return l
end

local function MkCornerLoad(pos, rot)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(0, 14, 0, 14); f.Position = pos
    f.BackgroundTransparency = 1; f.BorderSizePixel = 0
    f.Rotation = rot; f.ZIndex = 3; f.Parent = Panel
    local h = Instance.new("Frame")
    h.Size = UDim2.new(1,0,0,2); h.BackgroundColor3 = C.CYAN
    h.BorderSizePixel = 0; h.ZIndex = 4; h.Parent = f
    local v = Instance.new("Frame")
    v.Size = UDim2.new(0,2,1,0); v.BackgroundColor3 = C.CYAN
    v.BorderSizePixel = 0; v.ZIndex = 4; v.Parent = f
end
MkCornerLoad(UDim2.new(0, 8,  0, 8),    0)
MkCornerLoad(UDim2.new(1,-22, 0, 8),   90)
MkCornerLoad(UDim2.new(0, 8,  1,-22), -90)
MkCornerLoad(UDim2.new(1,-22, 1,-22), 180)

MkLabel({ text="  "..HUB_NAME.."  ", color=C.CYAN,
    font=Enum.Font.GothamBold, size=22,
    sz=UDim2.new(1,0,0,34), pos=UDim2.new(0,0,0,22) })
MkLabel({ text="--  "..HUB_SUBTITLE.."  --", color=C.PINK, size=11,
    sz=UDim2.new(1,0,0,16), pos=UDim2.new(0,0,0,58) })

local Line = Instance.new("Frame")
Line.Size=UDim2.new(0,260,0,1); Line.AnchorPoint=Vector2.new(0.5,0)
Line.Position=UDim2.new(0.5,0,0,82); Line.BackgroundColor3=C.CYAN
Line.BorderSizePixel=0; Line.ZIndex=3; Line.Parent=Panel

local function MkStat(val, lbl, xOffset)
    local vl = Instance.new("TextLabel")
    vl.Size=UDim2.new(0,60,0,22); vl.AnchorPoint=Vector2.new(0.5,0)
    vl.Position=UDim2.new(0.5,xOffset,0,96); vl.BackgroundTransparency=1
    vl.BorderSizePixel=0; vl.Text=val; vl.TextColor3=C.PINK
    vl.Font=Enum.Font.GothamBold; vl.TextSize=15
    vl.TextXAlignment=Enum.TextXAlignment.Center; vl.ZIndex=3; vl.Parent=Panel
    local ll = Instance.new("TextLabel")
    ll.Size=UDim2.new(0,60,0,14); ll.AnchorPoint=Vector2.new(0.5,0)
    ll.Position=UDim2.new(0.5,xOffset,0,118); ll.BackgroundTransparency=1
    ll.BorderSizePixel=0; ll.Text=lbl; ll.TextColor3=C.DIM
    ll.Font=Enum.Font.Code; ll.TextSize=9
    ll.TextXAlignment=Enum.TextXAlignment.Center; ll.ZIndex=3; ll.Parent=Panel
end
MkStat(HUB_VERSION,"VERSION",-90)
MkStat("ON","STATUS",0)
MkStat("INF","UPTIME",90)

local StatusText = MkLabel({
    text="Iniciando sistema...", color=C.DIM, size=11,
    sz=UDim2.new(1,-40,0,16), pos=UDim2.new(0,20,0,148),
    align=Enum.TextXAlignment.Left })

local BarBG = Instance.new("Frame")
BarBG.Size=UDim2.new(0,280,0,6); BarBG.AnchorPoint=Vector2.new(0.5,0)
BarBG.Position=UDim2.new(0.5,0,0,172)
BarBG.BackgroundColor3=Color3.fromRGB(0,25,25)
BarBG.BorderSizePixel=0; BarBG.ZIndex=3; BarBG.Parent=Panel
Instance.new("UICorner",BarBG).CornerRadius=UDim.new(1,0)
local BarStroke=Instance.new("UIStroke"); BarStroke.Color=C.CYAN
BarStroke.Thickness=1; BarStroke.Transparency=0.5; BarStroke.Parent=BarBG

local Bar = Instance.new("Frame")
Bar.Size=UDim2.new(0,0,1,0); Bar.BackgroundColor3=C.CYAN
Bar.BorderSizePixel=0; Bar.ZIndex=4; Bar.Parent=BarBG
Instance.new("UICorner",Bar).CornerRadius=UDim.new(1,0)

local Btn = Instance.new("TextButton")
Btn.Size=UDim2.new(0,180,0,36); Btn.AnchorPoint=Vector2.new(0.5,0)
Btn.Position=UDim2.new(0.5,0,0,196); Btn.BackgroundTransparency=1
Btn.BorderSizePixel=0; Btn.Text="> EJECUTAR <"; Btn.TextColor3=C.CYAN
Btn.Font=Enum.Font.GothamBold; Btn.TextSize=13
Btn.AutoButtonColor=false; Btn.ZIndex=3; Btn.Parent=Panel
local BtnStroke=Instance.new("UIStroke"); BtnStroke.Color=C.CYAN
BtnStroke.Thickness=1; BtnStroke.Parent=Btn

MkLabel({ text="SYS // "..LocalPlayer.Name:upper(),
    color=Color3.fromRGB(0,60,60), size=9,
    sz=UDim2.new(1,0,0,14), pos=UDim2.new(0,0,1,-18) })

Btn.MouseEnter:Connect(function() Btn.TextColor3=C.PINK; BtnStroke.Color=C.PINK end)
Btn.MouseLeave:Connect(function() Btn.TextColor3=C.CYAN; BtnStroke.Color=C.CYAN end)

local function AnimateLoad(callback)
    for i, step in ipairs(LOAD_STEPS) do
        StatusText.Text = step
        TweenService:Create(Bar, TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
            { Size=UDim2.new(i/#LOAD_STEPS,0,1,0),
              BackgroundColor3=(i==#LOAD_STEPS) and C.GREEN or C.CYAN }):Play()
        task.wait(0.5)
    end
    StatusText.Text = "Sistema listo."
    task.wait(0.4)
    if callback then callback() end
end

TweenService:Create(Panel, TweenInfo.new(0.45,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    { Position=UDim2.new(0.5,0,0.5,0) }):Play()
task.wait(0.5)

AnimateLoad(function()
    Btn.MouseButton1Click:Connect(function()
        TweenService:Create(Panel, TweenInfo.new(0.35,Enum.EasingStyle.Sine,Enum.EasingDirection.In),
            { Position=UDim2.new(0.5,0,-0.6,0) }):Play()
        TweenService:Create(Overlay, TweenInfo.new(0.35,Enum.EasingStyle.Sine,Enum.EasingDirection.In),
            { BackgroundTransparency=1 }):Play()
        task.wait(0.38)
        ScreenGui:Destroy()

-- ══════════════════════════════════════
-- MAIN HUB
-- ══════════════════════════════════════
local Players2         = game:GetService("Players")
local TweenService2    = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer2     = Players2.LocalPlayer
local PlayerGui2       = LocalPlayer2:WaitForChild("PlayerGui")

local C2 = {
    BG      = Color3.fromRGB(5,   5,  16),
    BG2     = Color3.fromRGB(6,   6,  26),
    SIDEBAR = Color3.fromRGB(6,   6,  22),
    CYAN    = Color3.fromRGB(0,  255, 255),
    PINK    = Color3.fromRGB(255,  0, 144),
    GREEN   = Color3.fromRGB(0,  220,  80),
    DIM     = Color3.fromRGB(0,  140, 140),
    DIMTXT  = Color3.fromRGB(0,   80,  80),
    ACTIVE  = Color3.fromRGB(5,   5,  16),
    DBLUE   = Color3.fromRGB(80, 180, 255),
    SPURP   = Color3.fromRGB(160, 60, 200),
}

-- CAMBIO 1: Perfil añadido al inicio
local TAB_NAMES = { "PERFIL", "FARM", "PVP", "SHOP", "VISUALS" }
local TAB_KEYS  = { "Perfil", "Farm", "PvP", "Shop", "Visuals" }

local WIN_W  = 420
local WIN_H  = 285
local TOP_H  = 30
local SIDE_W = 92
local CONT_W = WIN_W - SIDE_W
local CONT_H = WIN_H - TOP_H
-- Con 5 tabs de 42px = 210px, cabe en CONT_H=255px

local ScreenGui2 = Instance.new("ScreenGui")
ScreenGui2.Name           = "CyberpunkMain"
ScreenGui2.ResetOnSpawn   = false
ScreenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() ScreenGui2.IgnoreGuiInset = true end)
ScreenGui2.Parent         = PlayerGui2

-- CAMBIO 2: Mini botón DS (aparece al cerrar con X)
local DSMini = Instance.new("Frame")
DSMini.Size             = UDim2.new(0,64,0,64)
DSMini.Position         = UDim2.new(0,16,1,-80)
DSMini.BackgroundColor3 = C2.BG
DSMini.BorderSizePixel  = 0
DSMini.Visible          = false
DSMini.ZIndex           = 30
DSMini.Parent           = ScreenGui2
local DSMiniStroke = Instance.new("UIStroke")
DSMiniStroke.Color=C2.CYAN; DSMiniStroke.Thickness=1.5
DSMiniStroke.Transparency=0.3; DSMiniStroke.Parent=DSMini

local MiniD = Instance.new("TextLabel")
MiniD.Size=UDim2.new(0,28,0,40); MiniD.Position=UDim2.new(0,5,0.5,-20)
MiniD.BackgroundTransparency=1; MiniD.BorderSizePixel=0
MiniD.Text="D"; MiniD.TextColor3=C2.DBLUE
MiniD.Font=Enum.Font.GothamBold; MiniD.TextSize=30
MiniD.ZIndex=31; MiniD.Parent=DSMini

local MiniS = Instance.new("TextLabel")
MiniS.Size=UDim2.new(0,28,0,40); MiniS.Position=UDim2.new(0,31,0.5,-20)
MiniS.BackgroundTransparency=1; MiniS.BorderSizePixel=0
MiniS.Text="S"; MiniS.TextColor3=C2.SPURP
MiniS.Font=Enum.Font.GothamBold; MiniS.TextSize=30
MiniS.ZIndex=31; MiniS.Parent=DSMini

local DSMiniBtn = Instance.new("TextButton")
DSMiniBtn.Size=UDim2.fromScale(1,1); DSMiniBtn.BackgroundTransparency=1
DSMiniBtn.Text=""; DSMiniBtn.ZIndex=35; DSMiniBtn.Parent=DSMini

-- Drag del mini DS
local miniDrag,miniDragStart,miniStartPos,miniMoved=false,nil,nil,false
DSMini.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1
    or i.UserInputType==Enum.UserInputType.Touch then
        miniDrag=true; miniMoved=false
        miniDragStart=i.Position; miniStartPos=DSMini.Position
    end
end)
DSMini.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1
    or i.UserInputType==Enum.UserInputType.Touch then
        miniDrag=false
    end
end)

local Win = Instance.new("Frame")
Win.Name             = "Window"
Win.Size             = UDim2.new(0, WIN_W, 0, WIN_H)
Win.Position         = UDim2.new(0.5, -WIN_W/2, 0.5, -WIN_H/2)
Win.BackgroundColor3 = C2.BG
Win.BorderSizePixel  = 0
Win.ZIndex           = 10
Win.Parent           = ScreenGui2

local WinStroke = Instance.new("UIStroke")
WinStroke.Color=C2.CYAN; WinStroke.Thickness=1.5
WinStroke.Transparency=0.55; WinStroke.Parent=Win

local function MkCorner2(parent, pos, rot, zi)
    zi = zi or 12
    local f = Instance.new("Frame")
    f.Size=UDim2.new(0,12,0,12); f.Position=pos
    f.BackgroundTransparency=1; f.BorderSizePixel=0
    f.Rotation=rot; f.ZIndex=zi; f.Parent=parent
    local h=Instance.new("Frame"); h.Size=UDim2.new(1,0,0,2)
    h.BackgroundColor3=C2.CYAN; h.BorderSizePixel=0; h.ZIndex=zi+1; h.Parent=f
    local v=Instance.new("Frame"); v.Size=UDim2.new(0,2,1,0)
    v.BackgroundColor3=C2.CYAN; v.BorderSizePixel=0; v.ZIndex=zi+1; v.Parent=f
end
MkCorner2(Win,UDim2.new(0,4,0,4),0)
MkCorner2(Win,UDim2.new(1,-16,0,4),90)
MkCorner2(Win,UDim2.new(0,4,1,-16),-90)
MkCorner2(Win,UDim2.new(1,-16,1,-16),180)

local TopBar = Instance.new("Frame")
TopBar.Name=TopBar ~= nil and "TopBar" or "TopBar"
TopBar.Name="TopBar"; TopBar.Size=UDim2.new(1,0,0,TOP_H)
TopBar.BackgroundColor3=C2.BG2; TopBar.BorderSizePixel=0
TopBar.ZIndex=12; TopBar.Parent=Win

local TopSep=Instance.new("Frame"); TopSep.Size=UDim2.new(1,0,0,1)
TopSep.Position=UDim2.new(0,0,1,-1); TopSep.BackgroundColor3=C2.CYAN
TopSep.BackgroundTransparency=0.6; TopSep.BorderSizePixel=0
TopSep.ZIndex=13; TopSep.Parent=TopBar

local Badge=Instance.new("TextLabel"); Badge.Size=UDim2.new(0,70,1,0)
Badge.Position=UDim2.new(0,10,0,0); Badge.BackgroundTransparency=1
Badge.BorderSizePixel=0; Badge.Text="section //"
Badge.TextColor3=Color3.fromRGB(0,80,80); Badge.Font=Enum.Font.Code
Badge.TextSize=9; Badge.TextXAlignment=Enum.TextXAlignment.Left
Badge.ZIndex=13; Badge.Parent=TopBar

local TabTitle=Instance.new("TextLabel"); TabTitle.Name="TabTitle"
TabTitle.Size=UDim2.new(0,180,1,0); TabTitle.Position=UDim2.new(0,76,0,0)
TabTitle.BackgroundTransparency=1; TabTitle.BorderSizePixel=0
TabTitle.Text="PERFIL"; TabTitle.TextColor3=C2.CYAN
TabTitle.Font=Enum.Font.GothamBold; TabTitle.TextSize=11
TabTitle.TextXAlignment=Enum.TextXAlignment.Left; TabTitle.ZIndex=13; TabTitle.Parent=TopBar

local BtnMin=Instance.new("TextButton"); BtnMin.Size=UDim2.new(0,22,0,22)
BtnMin.AnchorPoint=Vector2.new(1,0.5); BtnMin.Position=UDim2.new(1,-30,0.5,0)
BtnMin.BackgroundColor3=C2.BG; BtnMin.BorderSizePixel=0; BtnMin.Text="-"
BtnMin.TextColor3=C2.DIM; BtnMin.Font=Enum.Font.GothamBold; BtnMin.TextSize=14
BtnMin.AutoButtonColor=false; BtnMin.ZIndex=13; BtnMin.Parent=TopBar
Instance.new("UIStroke",BtnMin).Color=C2.DIM

local BtnClose=Instance.new("TextButton"); BtnClose.Size=UDim2.new(0,22,0,22)
BtnClose.AnchorPoint=Vector2.new(1,0.5); BtnClose.Position=UDim2.new(1,-4,0.5,0)
BtnClose.BackgroundColor3=C2.BG; BtnClose.BorderSizePixel=0; BtnClose.Text="X"
BtnClose.TextColor3=C2.PINK; BtnClose.Font=Enum.Font.GothamBold; BtnClose.TextSize=12
BtnClose.AutoButtonColor=false; BtnClose.ZIndex=13; BtnClose.Parent=TopBar
Instance.new("UIStroke",BtnClose).Color=C2.PINK

local Sidebar=Instance.new("Frame"); Sidebar.Name="Sidebar"
Sidebar.Size=UDim2.new(0,SIDE_W,0,CONT_H); Sidebar.Position=UDim2.new(0,0,0,TOP_H)
Sidebar.BackgroundColor3=C2.SIDEBAR; Sidebar.BorderSizePixel=0
Sidebar.ZIndex=12; Sidebar.Parent=Win

local SideSep=Instance.new("Frame"); SideSep.Size=UDim2.new(0,1,1,0)
SideSep.Position=UDim2.new(1,-1,0,0); SideSep.BackgroundColor3=C2.CYAN
SideSep.BackgroundTransparency=0.7; SideSep.BorderSizePixel=0
SideSep.ZIndex=13; SideSep.Parent=Sidebar

-- CAMBIO 3: barra de acento única fuera de los botones (FIX del bug rojo)
local TabAccent=Instance.new("Frame"); TabAccent.Name="TabAccent"
TabAccent.Size=UDim2.new(0,3,0,42); TabAccent.Position=UDim2.new(0,0,0,0)
TabAccent.BackgroundColor3=C2.PINK; TabAccent.BorderSizePixel=0
TabAccent.ZIndex=16; TabAccent.Parent=Sidebar

local Content=Instance.new("ScrollingFrame"); Content.Name="Content"
Content.Size=UDim2.new(0,CONT_W,0,CONT_H); Content.Position=UDim2.new(0,SIDE_W,0,TOP_H)
Content.BackgroundColor3=C2.BG; Content.BorderSizePixel=0
Content.ScrollBarThickness=3; Content.ScrollBarImageColor3=C2.CYAN
Content.ScrollBarImageTransparency=0.4; Content.CanvasSize=UDim2.new(0,0,0,0)
Content.AutomaticCanvasSize=Enum.AutomaticSize.Y
Content.ScrollingDirection=Enum.ScrollingDirection.Y
Content.ElasticBehavior=Enum.ElasticBehavior.Always
Content.ZIndex=12; Content.Parent=Win

local function MakePage(name)
    local p=Instance.new("Frame"); p.Name=name
    p.Size=UDim2.new(1,-8,0,0); p.AutomaticSize=Enum.AutomaticSize.Y
    p.Position=UDim2.new(0,4,0,6); p.BackgroundTransparency=1
    p.BorderSizePixel=0; p.Visible=false; p.ZIndex=13; p.Parent=Content
    local ul=Instance.new("UIListLayout"); ul.SortOrder=Enum.SortOrder.LayoutOrder
    ul.Padding=UDim.new(0,6); ul.Parent=p
    return p
end

local function MkSecHeader(parent, text, order)
    local lbl=Instance.new("TextLabel"); lbl.Size=UDim2.new(1,0,0,18)
    lbl.BackgroundTransparency=1; lbl.BorderSizePixel=0
    lbl.Text="-- "..text.." --"; lbl.TextColor3=C2.PINK
    lbl.Font=Enum.Font.Code; lbl.TextSize=9
    lbl.TextXAlignment=Enum.TextXAlignment.Left
    lbl.LayoutOrder=order or 0; lbl.ZIndex=14; lbl.Parent=parent
    local sep=Instance.new("Frame"); sep.Size=UDim2.new(1,0,0,1)
    sep.BackgroundColor3=C2.PINK; sep.BackgroundTransparency=0.7
    sep.BorderSizePixel=0; sep.LayoutOrder=(order or 0)+1; sep.ZIndex=14; sep.Parent=parent
end

local function MkBlock(parent, text, order)
    local f=Instance.new("Frame"); f.Size=UDim2.new(1,0,0,32)
    f.BackgroundColor3=Color3.fromRGB(0,18,18); f.BorderSizePixel=0
    f.LayoutOrder=order or 0; f.ZIndex=14; f.Parent=parent
    Instance.new("UIStroke",f).Color=Color3.fromRGB(0,60,60)
    Instance.new("UICorner",f).CornerRadius=UDim.new(0,2)
    local lbl=Instance.new("TextLabel"); lbl.Size=UDim2.fromScale(1,1)
    lbl.BackgroundTransparency=1; lbl.BorderSizePixel=0; lbl.Text=text
    lbl.TextColor3=Color3.fromRGB(0,100,100); lbl.Font=Enum.Font.Code
    lbl.TextSize=10; lbl.ZIndex=15; lbl.Parent=f
    return f
end

-- CAMBIO 4: Helper de toggle reutilizable
local function MkToggle(parent, label, desc, order, onEnable, onDisable)
    local togState = false
    local card=Instance.new("Frame"); card.Size=UDim2.new(1,0,0,52)
    card.BackgroundColor3=Color3.fromRGB(0,14,14); card.BorderSizePixel=0
    card.LayoutOrder=order; card.ZIndex=14; card.Parent=parent
    Instance.new("UIStroke",card).Color=Color3.fromRGB(0,45,45)
    Instance.new("UICorner",card).CornerRadius=UDim.new(0,3)

    local nl=Instance.new("TextLabel"); nl.Size=UDim2.new(1,-62,0,20)
    nl.Position=UDim2.new(0,8,0,6); nl.BackgroundTransparency=1; nl.BorderSizePixel=0
    nl.Text=label; nl.TextColor3=C2.CYAN; nl.Font=Enum.Font.GothamBold; nl.TextSize=11
    nl.TextXAlignment=Enum.TextXAlignment.Left; nl.ZIndex=15; nl.Parent=card

    local dl=Instance.new("TextLabel"); dl.Size=UDim2.new(1,-62,0,16)
    dl.Position=UDim2.new(0,8,0,28); dl.BackgroundTransparency=1; dl.BorderSizePixel=0
    dl.Text=desc; dl.TextColor3=C2.DIMTXT; dl.Font=Enum.Font.Code; dl.TextSize=9
    dl.TextXAlignment=Enum.TextXAlignment.Left; dl.ZIndex=15; dl.Parent=card

    local cap=Instance.new("Frame"); cap.Size=UDim2.new(0,46,0,24)
    cap.AnchorPoint=Vector2.new(1,0.5); cap.Position=UDim2.new(1,-8,0.5,0)
    cap.BackgroundColor3=Color3.fromRGB(0,28,28); cap.BorderSizePixel=0
    cap.ZIndex=15; cap.Parent=card
    Instance.new("UICorner",cap).CornerRadius=UDim.new(1,0)
    local capStroke=Instance.new("UIStroke"); capStroke.Color=Color3.fromRGB(0,70,70)
    capStroke.Thickness=1; capStroke.Parent=cap

    local cir=Instance.new("Frame"); cir.Size=UDim2.new(0,18,0,18)
    cir.AnchorPoint=Vector2.new(0,0.5); cir.Position=UDim2.new(0,3,0.5,0)
    cir.BackgroundColor3=Color3.fromRGB(0,70,70); cir.BorderSizePixel=0
    cir.ZIndex=16; cir.Parent=cap
    Instance.new("UICorner",cir).CornerRadius=UDim.new(1,0)

    local stLbl=Instance.new("TextLabel"); stLbl.Size=UDim2.fromScale(1,1)
    stLbl.BackgroundTransparency=1; stLbl.BorderSizePixel=0; stLbl.Text="OFF"
    stLbl.TextColor3=Color3.fromRGB(0,70,70); stLbl.Font=Enum.Font.GothamBold
    stLbl.TextSize=8; stLbl.ZIndex=16; stLbl.Parent=cap

    local hit=Instance.new("TextButton"); hit.Size=UDim2.fromScale(1,1)
    hit.BackgroundTransparency=1; hit.Text=""; hit.ZIndex=17; hit.Parent=card

    hit.MouseButton1Click:Connect(function()
        togState = not togState
        if togState then
            TweenService2:Create(cir,TweenInfo.new(0.2),
                {Position=UDim2.new(0,25,0.5,0),BackgroundColor3=C2.CYAN}):Play()
            TweenService2:Create(cap,TweenInfo.new(0.2),
                {BackgroundColor3=Color3.fromRGB(0,38,38)}):Play()
            capStroke.Color=C2.CYAN; stLbl.Text="ON"; stLbl.TextColor3=C2.CYAN
            if onEnable then onEnable() end
        else
            TweenService2:Create(cir,TweenInfo.new(0.2),
                {Position=UDim2.new(0,3,0.5,0),BackgroundColor3=Color3.fromRGB(0,70,70)}):Play()
            TweenService2:Create(cap,TweenInfo.new(0.2),
                {BackgroundColor3=Color3.fromRGB(0,28,28)}):Play()
            capStroke.Color=Color3.fromRGB(0,70,70)
            stLbl.Text="OFF"; stLbl.TextColor3=Color3.fromRGB(0,70,70)
            if onDisable then onDisable() end
        end
    end)
    return card
end

-- ══════════════════════════════════════
-- PÁGINAS
-- ══════════════════════════════════════
local Pages = {}
local startTime = os.clock()

-- CAMBIO 5: Página Perfil
local PgPerfil = MakePage("Perfil")

local AvatarCard=Instance.new("Frame"); AvatarCard.Size=UDim2.new(1,0,0,80)
AvatarCard.BackgroundColor3=Color3.fromRGB(0,14,14); AvatarCard.BorderSizePixel=0
AvatarCard.LayoutOrder=1; AvatarCard.ZIndex=14; AvatarCard.Parent=PgPerfil
Instance.new("UIStroke",AvatarCard).Color=Color3.fromRGB(0,45,45)
Instance.new("UICorner",AvatarCard).CornerRadius=UDim.new(0,3)

local AvatarImg=Instance.new("ImageLabel"); AvatarImg.Size=UDim2.new(0,60,0,60)
AvatarImg.AnchorPoint=Vector2.new(0,0.5); AvatarImg.Position=UDim2.new(0,10,0.5,0)
AvatarImg.BackgroundColor3=Color3.fromRGB(0,10,10); AvatarImg.BorderSizePixel=0
AvatarImg.ZIndex=15; AvatarImg.Parent=AvatarCard
Instance.new("UICorner",AvatarImg).CornerRadius=UDim.new(0,4)
Instance.new("UIStroke",AvatarImg).Color=C2.CYAN
AvatarImg.Image="rbxthumb://type=AvatarHeadShot&id="..LocalPlayer2.UserId.."&w=60&h=60"

local NameLbl=Instance.new("TextLabel"); NameLbl.Size=UDim2.new(0,170,0,22)
NameLbl.Position=UDim2.new(0,80,0,10); NameLbl.BackgroundTransparency=1
NameLbl.BorderSizePixel=0; NameLbl.Text=LocalPlayer2.DisplayName
NameLbl.TextColor3=C2.CYAN; NameLbl.Font=Enum.Font.GothamBold; NameLbl.TextSize=13
NameLbl.TextXAlignment=Enum.TextXAlignment.Left; NameLbl.ZIndex=15; NameLbl.Parent=AvatarCard

local UserLbl=Instance.new("TextLabel"); UserLbl.Size=UDim2.new(0,170,0,16)
UserLbl.Position=UDim2.new(0,80,0,34); UserLbl.BackgroundTransparency=1
UserLbl.BorderSizePixel=0; UserLbl.Text="@"..LocalPlayer2.Name
UserLbl.TextColor3=C2.DIM; UserLbl.Font=Enum.Font.Code; UserLbl.TextSize=10
UserLbl.TextXAlignment=Enum.TextXAlignment.Left; UserLbl.ZIndex=15; UserLbl.Parent=AvatarCard

local IdLbl=Instance.new("TextLabel"); IdLbl.Size=UDim2.new(0,170,0,14)
IdLbl.Position=UDim2.new(0,80,0,52); IdLbl.BackgroundTransparency=1
IdLbl.BorderSizePixel=0; IdLbl.Text="ID: "..tostring(LocalPlayer2.UserId)
IdLbl.TextColor3=C2.DIMTXT; IdLbl.Font=Enum.Font.Code; IdLbl.TextSize=9
IdLbl.TextXAlignment=Enum.TextXAlignment.Left; IdLbl.ZIndex=15; IdLbl.Parent=AvatarCard

MkSecHeader(PgPerfil,"Tiempo de uso",2)
local TimeCard=Instance.new("Frame"); TimeCard.Size=UDim2.new(1,0,0,30)
TimeCard.BackgroundColor3=Color3.fromRGB(0,14,14); TimeCard.BorderSizePixel=0
TimeCard.LayoutOrder=4; TimeCard.ZIndex=14; TimeCard.Parent=PgPerfil
Instance.new("UIStroke",TimeCard).Color=Color3.fromRGB(0,45,45)
Instance.new("UICorner",TimeCard).CornerRadius=UDim.new(0,2)
local TimeLbl=Instance.new("TextLabel"); TimeLbl.Size=UDim2.fromScale(1,1)
TimeLbl.BackgroundTransparency=1; TimeLbl.BorderSizePixel=0; TimeLbl.Text="[T]  00:00:00"
TimeLbl.TextColor3=C2.CYAN; TimeLbl.Font=Enum.Font.Code; TimeLbl.TextSize=11
TimeLbl.ZIndex=15; TimeLbl.Parent=TimeCard
task.spawn(function()
    while task.wait(1) do
        if not TimeLbl.Parent then break end
        local e=math.floor(os.clock()-startTime)
        TimeLbl.Text=string.format("[T]  %02d:%02d:%02d",
            math.floor(e/3600),math.floor((e%3600)/60),e%60)
    end
end)

MkSecHeader(PgPerfil,"Ping",5)
local PingBlock=MkBlock(PgPerfil,"Calculando...",7)
task.spawn(function()
    while task.wait(3) do
        if not PingBlock.Parent then break end
        local ok,ping=pcall(function()
            return math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
        end)
        local pl=PingBlock:FindFirstChildOfClass("TextLabel")
        if pl then
            pl.Text = ok and ("Ping: "..ping.." ms") or "Ping: N/D"
            pl.TextColor3 = (ok and ping<100) and C2.GREEN
                         or (ok and ping<200) and C2.CYAN or C2.PINK
        end
    end
end)
Pages["Perfil"] = PgPerfil

-- Farm
local PgFarm = MakePage("Farm")
MkSecHeader(PgFarm,"Auto Farm",1); MkBlock(PgFarm,"Botones de farm iran aqui",3)
MkSecHeader(PgFarm,"Mobs",4);      MkBlock(PgFarm,"Seleccion de mobs",6)
MkSecHeader(PgFarm,"Boss",7);      MkBlock(PgFarm,"Auto boss",9)
Pages["Farm"] = PgFarm

-- PvP
local PgPvP = MakePage("PvP")
MkSecHeader(PgPvP,"Aimbot",1);  MkBlock(PgPvP,"Toggles de aimbot",3)
MkSecHeader(PgPvP,"Combat",4);  MkBlock(PgPvP,"Opciones de combate",6)
MkSecHeader(PgPvP,"Defense",7); MkBlock(PgPvP,"Anti-stun / God mode",9)
Pages["PvP"] = PgPvP

-- Shop
local PgShop = MakePage("Shop")
MkSecHeader(PgShop,"Auto Buy",1); MkBlock(PgShop,"Compra automatica",3)
MkSecHeader(PgShop,"Frutas",4);   MkBlock(PgShop,"Lista de frutas",6)
Pages["Shop"] = PgShop

-- Visuals — CAMBIO 6: toggle Fast Flags real
local PgVisuals = MakePage("Visuals")
MkSecHeader(PgVisuals,"Fast Flags",1)

local FAST_FLAGS={
  "DFIntTaskSchedulerTargetFps": 240,
  "FFlagHandleAltEnterFullscreenManually": true,
  "FIntQualityLevel": 1,
  "FFlagGraphicsQualityAutoLevel": false,
  "FFlagFixGraphicsQualityChange": true,
  "FFlagFixGraphicsQualityReset": true,
  "FFlagDebugDisableScriptingGC": true,
  "FFlagDisableShadowRender": true,
  "FFlagRenderShadow": false,
  "FFlagTerrainSkipTextures": true,
  "FFlagUserDisableCoreScriptTexturePreload": true,
  "FFlagSkipFrameForSlowLoadingAssets": true,
  "FFlagDoNotUploadRecentlyUsedAssets": true,
  "FFlagEnableNewLoadingScreen": false,
  "FFlagEnableNewVRSystem": false,
  "FFlagNetworkCdnBypass": true,
  "FFlagNetworkBypassUdpThrottling": true,
  "FFlagReducePacketLoss": true,
  "FFlagEnableFastGameJoin": true
}

local function CleanFlag(z)
    return z:gsub("^DFInt",""):gsub("^DFFlag",""):gsub("FString","")
            :gsub("FLog",""):gsub("^FFlag",""):gsub("^DFint",""):gsub("^FInt","")
end

MkToggle(PgVisuals,"Fast Flags (Better FPS)","Optimiza telemetria y graficos",3,
    function() -- ON
        if setfflag then
            task.spawn(function()
                for k,v in pairs(FAST_FLAGS) do
                    local clean=CleanFlag(k)
                    if not pcall(function() if getfflag(clean) then setfflag(clean,v) end end) then
                        pcall(function() if getfflag(k) then setfflag(k,v) end end)
                    end
                end
            end)
        end
    end)

MkSecHeader(PgVisuals,"ESP",5);     MkBlock(PgVisuals,"Opciones de ESP",7)
MkSecHeader(PgVisuals,"Effects",8); MkBlock(PgVisuals,"Efectos visuales",10)
Pages["Visuals"] = PgVisuals

-- ══════════════════════════════════════
-- TABS — usa TabAccent deslizante
-- ══════════════════════════════════════
local TabButtons = {}
local CurrentTab = "Perfil"

local function SetTab(key)
    CurrentTab = key
    local idx = table.find(TAB_KEYS, key)
    TabTitle.Text = TAB_NAMES[idx]
    -- Desliza el acento
    TweenService2:Create(TabAccent, TweenInfo.new(0.15,Enum.EasingStyle.Quad),
        { Position=UDim2.new(0,0,0,(idx-1)*42) }):Play()
    for _, k in ipairs(TAB_KEYS) do
        local btn=TabButtons[k]; local pg=Pages[k]
        if not btn or not pg then continue end
        if k==key then
            btn.BackgroundColor3=Color3.fromRGB(0,20,20); btn.TextColor3=C2.CYAN
            pg.Visible=true
        else
            btn.BackgroundColor3=C2.SIDEBAR; btn.TextColor3=C2.DIMTXT
            pg.Visible=false
        end
    end
    Content.CanvasPosition=Vector2.new(0,0)
end

for i, key in ipairs(TAB_KEYS) do
    local btn=Instance.new("TextButton"); btn.Name=key
    btn.Size=UDim2.new(1,-3,0,42); btn.Position=UDim2.new(0,3,0,(i-1)*42)
    btn.BackgroundColor3=C2.SIDEBAR; btn.BorderSizePixel=0
    btn.Text=TAB_NAMES[i]; btn.TextColor3=C2.DIMTXT
    btn.Font=Enum.Font.Code; btn.TextSize=10
    btn.TextXAlignment=Enum.TextXAlignment.Left; btn.AutoButtonColor=false
    btn.ZIndex=13; btn.Parent=Sidebar
    local pad=Instance.new("UIPadding"); pad.PaddingLeft=UDim.new(0,8); pad.Parent=btn
    local sep=Instance.new("Frame"); sep.Size=UDim2.new(1,0,0,1)
    sep.Position=UDim2.new(0,0,1,-1); sep.BackgroundColor3=Color3.fromRGB(0,20,20)
    sep.BorderSizePixel=0; sep.ZIndex=14; sep.Parent=btn
    btn.MouseButton1Click:Connect(function() SetTab(key) end)
    btn.MouseEnter:Connect(function() if CurrentTab~=key then btn.TextColor3=C2.DIM end end)
    btn.MouseLeave:Connect(function() if CurrentTab~=key then btn.TextColor3=C2.DIMTXT end end)
    TabButtons[key] = btn
end

SetTab("Perfil")

-- Drag ventana
local dragging2,dragStart2,winStart2=false,nil,nil
TopBar.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1
    or i.UserInputType==Enum.UserInputType.Touch then
        dragging2=true; dragStart2=i.Position; winStart2=Win.Position
    end
end)
TopBar.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1
    or i.UserInputType==Enum.UserInputType.Touch then dragging2=false end
end)
UserInputService.InputChanged:Connect(function(i)
    if i.UserInputType~=Enum.UserInputType.MouseMovement
    and i.UserInputType~=Enum.UserInputType.Touch then return end
    if dragging2 and dragStart2 then
        local d=i.Position-dragStart2
        Win.Position=UDim2.new(winStart2.X.Scale,winStart2.X.Offset+d.X,
                               winStart2.Y.Scale,winStart2.Y.Offset+d.Y)
    end
    if miniDrag and miniDragStart then
        local d=i.Position-miniDragStart
        if d.Magnitude>4 then miniMoved=true end
        DSMini.Position=UDim2.new(miniStartPos.X.Scale,miniStartPos.X.Offset+d.X,
                                  miniStartPos.Y.Scale,miniStartPos.Y.Offset+d.Y)
    end
end)

-- Minimizar (-)
local minimized2=false
BtnMin.MouseButton1Click:Connect(function()
    minimized2=not minimized2
    Sidebar.Visible=not minimized2; Content.Visible=not minimized2
    Win.Size=minimized2 and UDim2.new(0,WIN_W,0,TOP_H) or UDim2.new(0,WIN_W,0,WIN_H)
    BtnMin.Text=minimized2 and "[]" or "-"
end)

-- CAMBIO 7: X → muestra mini DS (no destruye)
BtnClose.MouseButton1Click:Connect(function()
    DSMini.Position=UDim2.new(0,Win.Position.X.Offset,0,Win.Position.Y.Offset+WIN_H/2)
    TweenService2:Create(Win, TweenInfo.new(0.22,Enum.EasingStyle.Sine,Enum.EasingDirection.In),
        { Size=UDim2.new(0,0,0,0),
          Position=UDim2.new(0,Win.Position.X.Offset+WIN_W/2,
                               0,Win.Position.Y.Offset+WIN_H/2) }):Play()
    task.wait(0.25); Win.Visible=false
    DSMini.Size=UDim2.new(0,0,0,0); DSMini.Visible=true
    TweenService2:Create(DSMini, TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
        { Size=UDim2.new(0,64,0,64) }):Play()
end)

-- Mini DS → restaurar
DSMiniBtn.MouseButton1Click:Connect(function()
    if miniMoved then miniMoved=false; return end
    TweenService2:Create(DSMini, TweenInfo.new(0.16,Enum.EasingStyle.Sine,Enum.EasingDirection.In),
        { Size=UDim2.new(0,0,0,0) }):Play()
    task.wait(0.18); DSMini.Visible=false
    Win.Size=UDim2.new(0,0,0,0); Win.Position=UDim2.new(0.5,-WIN_W/2,0.5,-WIN_H/2); Win.Visible=true
    TweenService2:Create(Win, TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
        { Size=UDim2.new(0,WIN_W,0,WIN_H) }):Play()
end)

-- Entrada del hub
Win.Position=UDim2.new(Win.Position.X.Scale,Win.Position.X.Offset,
    Win.Position.Y.Scale-0.1,Win.Position.Y.Offset)
Win.BackgroundTransparency=1
TweenService2:Create(Win, TweenInfo.new(0.35,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
    { Position=UDim2.new(0.5,-WIN_W/2,0.5,-WIN_H/2), BackgroundTransparency=0 }):Play()

-- ► AQUÍ AGREGA TU LÓGICA DE SCRIPT ◄

    end) -- fin Btn click
end)     -- fin AnimateLoad

end) -- fin task.spawn