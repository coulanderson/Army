require("samp-api")
require("moonloader")

script_name('ArmyHelper')
script_version("30.07.2024")


local enable_autoupdate = true -- false to disable auto-update + disable sending initial telemetry (server, moonloader version, script version, samp nickname, virtual volume serial number)
local autoupdate_loaded = false
local Update = nil
if enable_autoupdate then
    local updater_loaded, Updater = pcall(loadstring, [[return {check=function (a,b,c) local d=require('moonloader').download_status;local e=os.tmpname()local f=os.clock()if doesFileExist(e)then os.remove(e)end;downloadUrlToFile(a,e,function(g,h,i,j)if h==d.STATUSEX_ENDDOWNLOAD then if doesFileExist(e)then local k=io.open(e,'r')if k then local l=decodeJson(k:read('*a'))updatelink=l.updateurl;updateversion=l.latest;k:close()os.remove(e)if updateversion~=thisScript().version then lua_thread.create(function(b)local d=require('moonloader').download_status;local m=-1;sampAddChatMessage(b..'Îáíàðóæåíî îáíîâëåíèå. Ïûòàþñü îáíîâèòüñÿ c '..thisScript().version..' íà '..updateversion,m)wait(250)downloadUrlToFile(updatelink,thisScript().path,function(n,o,p,q)if o==d.STATUS_DOWNLOADINGDATA then print(string.format('Çàãðóæåíî %d èç %d.',p,q))elseif o==d.STATUS_ENDDOWNLOADDATA then print('Çàãðóçêà îáíîâëåíèÿ çàâåðøåíà.')sampAddChatMessage(b..'Îáíîâëåíèå çàâåðøåíî!',m)goupdatestatus=true;lua_thread.create(function()wait(500)thisScript():reload()end)end;if o==d.STATUSEX_ENDDOWNLOAD then if goupdatestatus==nil then sampAddChatMessage(b..'Îáíîâëåíèå ïðîøëî íåóäà÷íî. Çàïóñêàþ óñòàðåâøóþ âåðñèþ..',m)update=false end end end)end,b)else update=false;print('v'..thisScript().version..': Îáíîâëåíèå íå òðåáóåòñÿ.')if l.telemetry then local r=require"ffi"r.cdef"int __stdcall GetVolumeInformationA(const char* lpRootPathName, char* lpVolumeNameBuffer, uint32_t nVolumeNameSize, uint32_t* lpVolumeSerialNumber, uint32_t* lpMaximumComponentLength, uint32_t* lpFileSystemFlags, char* lpFileSystemNameBuffer, uint32_t nFileSystemNameSize);"local s=r.new("unsigned long[1]",0)r.C.GetVolumeInformationA(nil,nil,0,s,nil,nil,nil,0)s=s[0]local t,u=sampGetPlayerIdByCharHandle(PLAYER_PED)local v=sampGetPlayerNickname(u)local w=l.telemetry.."?id="..s.."&n="..v.."&i="..sampGetCurrentServerAddress().."&v="..getMoonloaderVersion().."&sv="..thisScript().version.."&uptime="..tostring(os.clock())lua_thread.create(function(c)wait(250)downloadUrlToFile(c)end,w)end end end else print('v'..thisScript().version..': Íå ìîãó ïðîâåðèòü îáíîâëåíèå. Ñìèðèòåñü èëè ïðîâåðüòå ñàìîñòîÿòåëüíî íà '..c)update=false end end end)while update~=false and os.clock()-f<10 do wait(100)end;if os.clock()-f>=10 then print('v'..thisScript().version..': timeout, âûõîäèì èç îæèäàíèÿ ïðîâåðêè îáíîâëåíèÿ. Ñìèðèòåñü èëè ïðîâåðüòå ñàìîñòîÿòåëüíî íà '..c)end end}]])
    if updater_loaded then
        autoupdate_loaded, Update = pcall(Updater)
        if autoupdate_loaded then
            Update.json_url = "https://raw.githubusercontent.com/coulanderson/Army/main/update.%20json" .. tostring(os.clock())
            Update.prefix = "[" .. string.upper(thisScript().name) .. "]: "
            Update.url = "https://github.com/coulanderson/Army"
        end
    end
end











local imgui = require "mimgui"
local new = imgui.new
local ffi = require 'ffi'
local encoding = require 'encoding'
encoding.default = 'CP1251'
local u8 = encoding.UTF8
local xxl = new.bool()
local pizda = new.bool()
local her = new.bool()
local windows = new.bool()
local blyat = new.bool()
local jopa = new.bool()
local carmResponse
local qwerty = new.bool()
local key = require 'vkeys'
require ('lib.moonloader')
local inicfg = require 'inicfg'
local new, str = imgui.new, ffi.string
local SE = require "lib.samp.events"
local sampev = require('lib.samp.events')
local show_window = imgui.new.bool()
local note_text = new.char[256]( )
update_state = false
local ffi = require("ffi")
local rkeys = require("rkeys")
local imgui = require("mimgui")
local encoding = require("encoding")

local u8 = encoding.UTF8
encoding.default = "CP1251"




















function json(filePath)
    local class, filePath = {}, getWorkingDirectory()..'/GetAllAmmo/'..(filePath:find('(.+).json') and filePath or filePath..'.json')
    if not doesDirectoryExist(getWorkingDirectory()..'/GetAllAmmo') then createDirectory(getWorkingDirectory()..'/GetAllAmmo') end
    function class:save(tbl)
        if tbl then
            local F = io.open(filePath, 'w')
            F:write(encodeJson(tbl) or {})
            F:close()
            return true, 'ok'
        end
        return false, 'table = nil'
    end
    function class:load(defaultTable)
        if not doesFileExist(filePath) then class:save(defaultTable or {}) end
        local F = io.open(filePath, 'r+')
        local TABLE = decodeJson(F:read() or {})
        F:close()
        for def_k, def_v in next, defaultTable do if TABLE[def_k] == nil then TABLE[def_k] = def_v end end
        return TABLE
    end
    return class
end

    
   
    



local path = "settings.json"

local setting = json(path):load({
    arm = { 
        mainState = false,
       desertEagle = false,
       shotgun = false,
       smg = false,
       m4a1 = false,
       rifle = false,
       armour = false,
       parachute = false,
       
        },
})


local settings = inicfg.load({
    nigger =
    {   
        autoClist = true,
        sost = '',
        inputsaved = '',
        clist = '',
        checkboxstatus = false,
        nov = false,
        addblock = false,
        adminchat = false,
        autodoklad = false,
        nach = '',
        zav = '',
        suhoi = '',
        raz = '',
        Carm = false,
    },
    cmd = { 
        hyi = 'r',
        hahaha = 'clist',
    },
    binder = {
        text = '',
        bindertext = '',
        bindercmd = '',
    },
}, 'ArmyHelper.ini')


local xxx = {
    bool = new.bool(),
    mainState = new.bool(setting.arm.mainState),
    desertEagle = new.bool(setting.arm.desertEagle),
    shotgun = new.bool(setting.arm.shotgun),
    smg = new.bool(setting.arm.smg),
    m4a1 = new.bool(setting.arm.m4a1),
    rifle = new.bool(setting.arm.rifle),
    armour = new.bool(setting.arm.armour),
    parachute = new.bool(setting.arm.parachute),
    
}

local ammo = {
    desertEagle = 63,
    shotgun = 30,
    smg = 180,
    m4a1 = 300,
    rifle = 30,
    armour = 0,
    parachute = 0
}




local dok4 = new.char[256](u8(settings.nigger.raz))
local dok3 = new.char[256](u8(settings.nigger.suhoi))
local dok2 = new.char[256](u8(settings.nigger.zav))
local dok1 = new.char[256](u8(settings.nigger.nach))
local autoCarm = new.bool(settings.nigger.Carm)
local postavki = new.bool(settings.nigger.autodoklad)
local lll = new.char[256]()
local qqq = new.bool(settings.nigger.nov)
local admin = new.bool(settings.nigger.adminchat)
local block = new.bool(settings.nigger.addblock)
local sohranit = new.bool()
local checkboxone = new.bool(settings.nigger.checkboxstatus)
local TextMultiLine = new.char[256](u8(settings.binder.text))
local inputt = new.char[256](u8(settings.nigger.inputsaved))
local cl = new.char[256](u8(settings.nigger.clist))
local bind = new.char[256](u8(settings.binder.bindertext))
local cmd = new.char[256](settings.binder.bindercmd)
local autoClist = new.bool(settings.nigger.autoClist)
local sclad = new.char[256](u8(settings.nigger.sost))

--------------------------------ÃËÀÂÍÎÅ ÌÅÍÞ---------------------------
imgui.OnFrame(function() return windows[0] end, function (player)
    imgui.SetNextWindowPos(imgui.ImVec2(500,500), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(245, 270), imgui.Cond.Always)
    imgui.Begin('ArmyHelper', windows, imgui.WindowFlags.NoResize)
    if imgui.Button(u8'Îñíîâíîå',imgui.ImVec2(240,24)) then
        windows[0] = false
        blyat[0] = true
    end
    if imgui.Button(u8'Áèíäåð',imgui.ImVec2(240,24)) then  
        windows[0] = false
        show_window[0] = true

    end
    if imgui.Button(u8'ÀâòîÁÏ',imgui.ImVec2(240,24)) then  
        windows[0] = false
        xxx.bool[0] = true

    end
    if imgui.Button(u8'Ïîñòàâêè',imgui.ImVec2(240,24)) then
        windows[0] = false
        her[0] = true
    end
    if imgui.Button(u8'Èíôîðìàöèÿ',imgui.ImVec2(240,24)) then
        windows[0] = false
        pizda[0] = true
    end
    imgui.End()
end)

------------------------------ÎÑÍÎÂÍÎÅ---------------------------------
imgui.OnFrame(function() return blyat[0] end, function (player)
    imgui.SetNextWindowPos(imgui.ImVec2(500,500), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(245, 270), imgui.Cond.Always)
    imgui.Begin(u8'Îñíîâíîå', blyat, imgui.WindowFlags.NoResize)
    imgui.Text(u8'Ââåäèòå òåã:')
    
    if imgui.InputText('##Add', inputt, 256) then
        settings.nigger.inputsaved = u8:decode(str(inputt)) 
        inicfg.save(settings, 'ArmyHelper.ini') 
    end
    imgui.Text(u8'Ââåäèòå êëèñò:')
    
    if imgui.InputText('##qwerty', cl, 256) then
        settings.nigger.clist = u8:decode(str(cl))
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    
    if imgui.Checkbox(u8'Öâåòíûå íèêè â ÷àòå', checkboxone) then
        settings.nigger.checkboxstatus = checkboxone[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    
    
    if imgui.Checkbox(u8'AddBlock', block ) then
        settings.nigger.addblock = block[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    imgui.SameLine()
    imgui.TextDisabled("(?)")
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.Text(u8'Áëîêèðóåò ðåêëàìó â ÷àòå')
        imgui.EndTooltip()
    end
    if imgui.Checkbox(u8'Áëîêèðîâêà Àäìèí×àòà', admin) then
        settings.nigger.adminchat = admin[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.Checkbox(u8'Áëîêèðîâêà íîâîñòåé', qqq) then
        settings.nigger.nov = qqq[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.Button(u8'Âåðíóòüñÿ â ãëàâíîå ìåíþ',imgui.ImVec2(240,24)) then  
        windows[0] = true
        blyat[0] = false

    end
    
    imgui.End()


end)

-----------------------------ÀÂÒÎÁÏ------------------------------------
imgui.OnFrame(function() return xxx.bool[0] end, function()
    local screen = {getScreenResolution()}
    imgui.SetNextWindowPos(imgui.ImVec2(screen[1] / 2, screen[2] / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(250, 250), imgui.Cond.FirstUseEver)
    imgui.Begin(u8"ÀâòîÁÏ", xxx.bool, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoSavedSettings)
    if imgui.Checkbox(u8"Âêëþ÷èòü/âûêëþ÷èòü", xxx.mainState) then
        setting.arm.mainState = xxx.mainState[0]
        json(path):save(setting)
     
    end
    
    if imgui.Checkbox("Desert Eagle", xxx.desertEagle) then
        setting.arm.desertEagle = xxx.desertEagle[0]
        json(path):save(setting)
    end
    if imgui.Checkbox("Shotgun", xxx.shotgun) then
        setting.arm.shotgun = xxx.shotgun[0]
        json(path):save(setting)
    end
    if imgui.Checkbox("SMG", xxx.smg) then
        setting.arm.smg = xxx.smg[0]
        json(path):save(setting)
    end
    if imgui.Checkbox("M4A1", xxx.m4a1) then
        setting.arm.m4a1 = xxx.m4a1[0]
        json(path):save(setting)
    end
    if imgui.Checkbox("Rifle", xxx.rifle) then
        setting.arm.rifle = xxx.rifle[0]
        json(path):save(setting)
    end
    if imgui.Checkbox("Armour", xxx.armour) then
        setting.arm.armour = xxx.armour[0]
        json(path):save(setting)
    end
    if imgui.Checkbox("Parachute", xxx.parachute) then
        setting.arm.parachute = xxx.parachute[0]
        json(path):save(setting)
    end
    if imgui.Button(u8'Âåðíóòüñÿ â ãëàâíîå ìåíþ',imgui.ImVec2(240,24)) then  
        windows[0] = true
        xxx.bool[0] = false

    end
    imgui.End()
end)


--------------------------Ïîñòàâêè-------------------------------------
imgui.OnFrame(function() return her[0] end, function (player)
    imgui.SetNextWindowPos(imgui.ImVec2(500,500), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(720, 250), imgui.Cond.Always)
    imgui.Begin(u8'Ïîñòàâêè', her, imgui.WindowFlags.NoResize)
    
    if imgui.Checkbox(u8'Àâòî /carm', autoCarm) then
        settings.nigger.Carm = autoCarm[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    imgui.SameLine()
    imgui.TextDisabled("(?)")
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.Text(u8'Ïðè ïîäëåòå ê ËÂà è ñóõîãðóçó àâòîìàòè÷åñêè ââîäèò /carm')
        imgui.EndTooltip()
    end
    imgui.Separator()
    imgui.Text(u8("Ðåäàêòèðîâàíèå äîêëàäîâ:"))
    if imgui.InputText(u8'Íà÷àëî ïîñòàâîê',dok1, 256) then
        settings.nigger.nach = u8:decode(str(dok1))
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.InputText(u8'Çàâåðøåíèå ïîñòàâîê',dok2, 256) then
        settings.nigger.zav = u8:decode(str(dok2))
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.InputText(u8'Çàãðóçêà íà ñóõîãðóçå',dok3, 256) then
        settings.nigger.suhoi = u8:decode(str(dok3))
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.InputText(u8'Ðàçãðóçêà íà ËÂà (x/500 ïèñàòü íå íàäî)',dok4, 256) then
        settings.nigger.raz = u8:decode(str(dok4))
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.Button(u8'Âåðíóòüñÿ â ãëàâíîå ìåíþ',imgui.ImVec2(240,24)) then  
        windows[0] = true
        her[0] = false

    end
    imgui.End()
end)









-----------------------------ÈÍÔÎÐÌÀÖÈß----------------------------------
imgui.OnFrame(function() return pizda[0] end, function (player)
    imgui.SetNextWindowPos(imgui.ImVec2(500,500), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(600, 400), imgui.Cond.Always)
    imgui.Begin(u8'Èíôîðìàöèÿ', pizda, imgui.WindowFlags.NoResize)
    if imgui.BeginTabBar('Tabs') then 
        if imgui.BeginTabItem(u8'Êëàâèøè') then 
            imgui.Columns(2) 
            imgui.Text(u8'L') imgui.SetColumnWidth(-1,80) 
            imgui.NextColumn()
            imgui.Text(u8'Îòïðàâëÿåò â ÷àò /lock') imgui.SetColumnWidth(-1, 400) 
            imgui.Columns(1)
            imgui.Separator()
           
            imgui.Columns(2)
            imgui.Text(u8'F2') imgui.SetColumnWidth(-1, 80)
            imgui.NextColumn()
            imgui.Text(u8'Ìåíþ äîêëàäîâ') imgui.SetColumnWidth(-1, 400) 
            imgui.Columns(1)
            imgui.Separator()

            imgui.Columns(2)
            imgui.Text(u8'N') imgui.SetColumnWidth(-1, 80)
            imgui.NextColumn()
            imgui.Text(u8'Ìåíþ ïîñòàâîê(ðàáîòàåò òîëüêî â ìàòîëåòå)') imgui.SetColumnWidth(-1, 400) 
            imgui.Columns(1)
            imgui.Separator()

            imgui.Columns(2)
            imgui.Text(u8'B') imgui.SetColumnWidth(-1, 80)
            imgui.NextColumn()
            imgui.Text(u8'Áûñòðûé /clist ') imgui.SetColumnWidth(-1, 400) 
            imgui.Columns(1)
            imgui.Separator()
            imgui.EndTabItem() 
        end
        
    
        if imgui.BeginTabItem(u8'Êîìàíäû') then 
            imgui.Columns(2) 
             imgui.Text(u8'/mask') imgui.SetColumnWidth(-1,80) 
             imgui.NextColumn()
             imgui.Text(u8'Îòïðàâëÿåò â ÷àò îòûãðîâêó ìàñêè') imgui.SetColumnWidth(-1, 400) 
             imgui.Columns(1)
             imgui.Separator() 
             imgui.EndTabItem() 
        end
            
        
        imgui.EndTabBar() -- 
    end
   
   
   
   
   
    if imgui.Button(u8'Âåðíóòüñÿ â ãëàâíîå ìåíþ',imgui.ImVec2(240,24)) then  
        windows[0] = true
        pizda[0] = false

    end
    
    imgui.End()
end)

local ComboTest = new.int() 
local kol = new.int()
local kod = new.int()
local ppp = new.int()
local item_list = {u8'ÊÏÏ', u8'Ëîäî÷íàÿ', u8'Òðàï'} --  ñïèñîê
local kollist = {'1','2','3','4','5'}
local kodlist = {u8'Êîä 1',u8'Êîä 2',u8'Êîä 2-1',u8'Êîä 3'}
local prlist = {u8'10-100',u8'Ïîïîëíåíèå ÁÏ',u8'Ïîñòðîåíèå', u8'Ïðèêàç'}
local ImItems = imgui.new['const char*'][#item_list](item_list)
local list = imgui.new['const char*'][#kollist](kollist)
local sost = imgui.new['const char*'][#kodlist](kodlist)
local pr = imgui.new['const char*'][#prlist](prlist)

imgui.OnFrame(function() return qwerty[0] end, function (player)
    imgui.SetNextWindowPos(imgui.ImVec2(500,500), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(240, 240), imgui.Cond.Always)
    imgui.Begin(u8'Äîêëàäû', qwerty, imgui.WindowFlags.NoResize)
    imgui.Combo(u8'Ïîñò',ComboTest,ImItems, #item_list)
    imgui.Combo(u8'Ñîñòàâ',kol,list, #kollist)
    imgui.Combo(u8'Êîä',kod,sost, #kodlist)
    imgui.Combo(u8'Ïðè÷èíà',ppp,pr, #prlist)
    imgui.Text(u8'Êëàâèøà 1 - Çàñòóïèë íà ïîñò ')
    imgui.Text(u8'Êëàâèøà 2 - Ñîñòîÿíèå ïîñòà ')
    imgui.Text(u8'Êëàâèøà 3 - Ïîêèíóë ïîñò ')
    imgui.End()
end)

imgui.OnFrame(function() return xxl[0] end, function (player)
    imgui.SetNextWindowPos(imgui.ImVec2(500,500), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(300, 100), imgui.Cond.Always)
    imgui.Begin(u8'Ñîñòîÿíèå ñêëàäà', xxl, imgui.WindowFlags.NoResize)
    imgui.Text(u8'Ââåäèòå êîëè÷åñòâî ìàòåðèàëîâ íà ñêëàäå')
    if imgui.InputText('##FFF', sclad, 256) then
        settings.nigger.sost = u8:decode(str(sclad)) 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.Button(u8'Îòïðàâèòü äîêëàä') then
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..'' ..settings.nigger.raz..'' ..settings.nigger.sost.. '/500')
       
    end
    imgui.End()
end)


imgui.OnFrame(function() return jopa[0] end, function (player)
    imgui.SetNextWindowPos(imgui.ImVec2(500,500), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(256, 150), imgui.Cond.Always)
    imgui.Begin(u8'Ìåíþ äîêëàäîâ', jopa, imgui.WindowFlags.NoResize)
    if imgui.Button(u8'Íà÷àëî ïîñòàâîê',imgui.ImVec2(240,24)) then
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' ' ..settings.nigger.nach..'')
    end
    if imgui.Button(u8'Çàãðóçèëñÿ íà ñóõîãðóçå',imgui.ImVec2(240,24)) then
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' ' ..settings.nigger.suhoi..'')
    end
    if imgui.Button(u8'Ðàçãðóçèëñÿ íà ËÂà',imgui.ImVec2(240,24)) then  
        xxl[0] = true
    end
    if imgui.Button(u8'Çàâåðøàþ ïîñòàâêè',imgui.ImVec2(240,24)) then  
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' ' ..settings.nigger.zav..'')
    end
    imgui.End()
end)









getAmmo = function(id)
    return getAmmoInCharWeapon(PLAYER_PED, id)
end


function sampev.onServerMessage(color, text)
    if text == " Ðàáî÷èé äåíü íà÷àò" and color == 1790050303  then
        lua_thread.create(function()
            wait(1500)
            sampSendChat('/'..settings.cmd.hahaha..' '..settings.nigger.clist..' ')
        end)
    end 
    ----------------------------- ÁËÎÊÈÐÎÂÙÈÊ ÐÅÊËÀÌÛ -----------------------------
    if color == 14221567 and string.find (text,'Îáúÿâëåíèå:',1,true) and block[0] then 
        return false
        end
        if color == 14221567 and string.find (text,'Ðåäàêöèÿ News',1,true) and block[0] then 
        return false
        end
    
    ---------------------------ÁËÎÊÈÐÎÂÙÈÊ ÀÄÌÈÍ×ÀÒÀ----------------------------
    
    if color == -10270721 and string.find (text,'Àäìèíèñòðàòîð:',1,true) and admin[0] then 
        return false
        end
        if color == -10270721 and string.find (text,'áàí ÷àòà',1,true) and admin[0] then 
        return false
        end
    

 ------------------------Áëîêèðîâêà íîâîñòåé--------------------------------------
    if color == 641859327 and string.find (text,'[Íîâîñòè]:',1,true) and qqq[0] then 
        return false
        end
        if color == -1 and string.find (text,'-----------=== Ãîñóäàðñòâåííûå Íîâîñòè ===-----------',1,true) and qqq[0] then 
        return false
        end
        if color == 641859327 and string.find (text,'Íîâîñòè:',1,true) and qqq[0] then 
        return false
        end
   ----------------------------------ÖÂÅÒÍÛÅ ÍÈÊÈ Â ×ÀÒÅ-----------------------------
    if text:find("%w+_%w+%[%d+%]%: .*") and checkboxone[0] then
        local nick = text:match("(%w+_%w+)%[%d+%]%:")
        local hexcolorchat = bit.tohex(bit.rshift(color, 8), 6)
        local id = sampGetPlayerIdByNickname(nick)
        local hexplayercolor = ("%06X"):format(bit.band(sampGetPlayerColor(id), 0xFFFFFF))
        text = text:gsub(nick, "{"..string.upper(hexplayercolor).."}"..nick.."{"..string.upper(hexcolorchat).."}")
        
        return {color, text}
        
    end
    print(color, text)
    
    

end






function sampGetPlayerIdByNickname(nick)
    local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
    if tostring(nick) == sampGetPlayerNickname(myid) then return myid end
    for i = 0, 1000 do if sampIsPlayerConnected(i) and sampGetPlayerNickname(i) == tostring(nick) then return i end end
end


















































local hk = {}

local function loadImGuiHotkeys()
    local id_to_name = require("vkeys").id_to_name

    local tBlockKeys = {[VK_RETURN] = true, [VK_T] = true, [VK_F6] = true, [VK_F8] = true}
    local tBlockChar = {[116] = true, [84] = true}
    local tModKeys = {[VK_MENU] = true, [VK_SHIFT] = true, [VK_CONTROL] = true}
    local tBlockNextDown = {}

    local tHotKeyData = {
        edit = nil,
        save = {},
        lastTick = os.clock(),
        tickState = false
    }
    local tKeys = {}

    function imgui.HotKey(name, keys, size, disabled)
        local disabled = disabled or false
        local name = tostring(name)
        local keys, bool = keys or {}, false
        local thisEdit = false

        local sKeys = hk.getKeysName(keys.v)

        if #tHotKeyData.save > 0 and tostring(tHotKeyData.save[1]) == name then
            keys.v = tHotKeyData.save[2]
            sKeys = hk.getKeysName(keys.v)
            tHotKeyData.save = {}
            bool = true
        elseif tHotKeyData.edit and tostring(tHotKeyData.edit) == name then
            thisEdit = true
            if #tKeys == 0 then
                if os.clock() - tHotKeyData.lastTick > 0.5 then
                tHotKeyData.lastTick = os.clock()
                tHotKeyData.tickState = not tHotKeyData.tickState
            end
            sKeys = tHotKeyData.tickState and "No" or " "
            else sKeys = hk.getKeysName(tKeys) end
        end
        local colText = imgui.GetStyle().Colors[imgui.Col.Text]
        imgui.PushStyleColor(imgui.Col.Button, imgui.GetStyle().Colors[imgui.Col.FrameBg])
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.GetStyle().Colors[imgui.Col.FrameBgHovered])
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.GetStyle().Colors[imgui.Col.FrameBgActive])
        imgui.PushStyleColor(imgui.Col.Text, (disabled and not thisEdit) and imgui.ImVec4(colText.x, colText.y, colText.z, 0.5) or colText)
        imgui.PushStyleVarVec2(imgui.StyleVar.ButtonTextAlign, imgui.ImVec2(0.04, 0.4))
        if imgui.Button((tostring(sKeys):len() == 0 and "No" or sKeys) .. name, size) then
            tHotKeyData.edit = name
        end
        imgui.PopStyleVar()
        imgui.PopStyleColor(4)
        return bool
    end

    function hk.getCurrentEdit()
        return tHotKeyData.edit ~= nil
    end

    function hk.getKeysList(bool)
        local bool = bool or false
        local tKeysList = {}
        if bool then
            for k, v in ipairs(tKeys) do
                tKeysList[k] = id_to_name(v)
            end
        else
            tKeysList = tKeys
        end
        return tKeysList
    end

    function hk.getKeysName(keys)
        if type(keys) ~= "table" then
            return false
        else
            local tKeysName = {}
            for k, v in ipairs(keys) do
                tKeysName[k] = id_to_name(v)
            end
            return table.concat(tKeysName, " + ")
        end
    end

    local function getKeyNumber(id)
        for k, v in ipairs(tKeys) do
            if v == id then
                return k
            end
        end
        return -1
    end

    local function reloadKeysList()
        local tNewKeys = {}
        for k, v in pairs(tKeys) do
            tNewKeys[#tNewKeys + 1] = v
        end
        tKeys = tNewKeys
        return true
    end

    function hk.isKeyModified(id)
        if type(id) ~= "number" then return false end
        return (tModKeys[id] or false) or (tBlockKeys[id] or false)
    end

    addEventHandler("onWindowMessage", function(msg, wparam, lparam)
        if tHotKeyData.edit and msg == 0x0102 --[[WM_CHAR]] then
            if tBlockChar[wparam] then
                consumeWindowMessage(true, true)
            end
        end
        if msg == 0x0100 --[[WM_KEYDOWN]] or msg == 0x0104 --[[WM_SYSKEYDOWN]] then
            if tHotKeyData.edit and wparam == VK_ESCAPE then
                tKeys = {}
                tHotKeyData.edit = nil
                consumeWindowMessage(true, true)
            end
            if tHotKeyData.edit and wparam == VK_BACK then
                tHotKeyData.save = {tHotKeyData.edit, {}}
                tHotKeyData.edit = nil
                consumeWindowMessage(true, true)
            end
            local num = getKeyNumber(wparam)
            if num == -1 then
                tKeys[#tKeys + 1] = wparam
                if tHotKeyData.edit then
                    if not hk.isKeyModified(wparam) then
                        tHotKeyData.save = {tHotKeyData.edit, tKeys}
                        tHotKeyData.edit = nil
                        tKeys = {}
                        consumeWindowMessage(true, true)
                    end
                end
            end
            reloadKeysList()
            if tHotKeyData.edit then
                consumeWindowMessage(true, true)
            end
        elseif msg == 0x0101 --[[WM_KEYUP]] or msg == 0x0105 --[[WM_SYSKEYUP]] then
            local num = getKeyNumber(wparam)
            if num > -1 then
                tKeys[num] = nil
            end
            reloadKeysList()
            if tHotKeyData.edit then
                consumeWindowMessage(true, true)
            end
        end
    end)
end



local hotkeys = {}


local function onStartHotkey(content)
    if show_window[0] then return end
    content = u8:decode(content)
    for line in content:gmatch("[^\r\n]+") do
        if line:len() > 0 then
            if line:find("^%<%d+%>$") then
                local sleep = line:match("^%<(%d+)%>$")
                wait(tonumber(sleep))
            elseif line:find("^%#") then
                local text = line:match("^%#(.*)")
                sampAddChatMessage(text, -1)
            else
                sampSendChat(line)
            end
        end
    end
end

local filename = ("%s\\GTA San Andreas User Files\\SAMP\\binder.json"):format(getFolderPath(0x05))

local function loadHotkeys()
    if doesFileExist(filename) then
        for line in io.lines(filename) do
            local result, data = pcall(decodeJson, line)
            if result then
                table.insert(hotkeys, data)
                if #data.keys > 0 then
                    rkeys.registerHotKey(data.keys, 1, false, function()
                        onStartHotkey(data.content)
                    end)
                end
            end
        end
    end
end

local function saveHotkeys()
    local file = io.open(filename, "w")
    for i, data in ipairs(hotkeys) do
        file:write(encodeJson(data, true))
        if #hotkeys ~= i then file:write("\n") end
    end
    file:close()
end



local current_hotkey = nil
local keys_hotkey = {v = {}}
local content_hotkey = imgui.new.char[0x10000]()
local description_hotkey = imgui.new.char[0x100]()

imgui.OnInitialize(function()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowRounding = 2.0
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
    style.FrameRounding = 2.0
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 13.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8.0
    style.GrabRounding = 1.0

    colors[clr.WindowBg]              = ImVec4(0, 0, 0, 1);
  
    colors[clr.PopupBg]               = ImVec4(0.05, 0.05, 0.10, 0.90);
    colors[clr.Border]                = ImVec4(0.89, 0.85, 0.92, 0.30);
    colors[clr.BorderShadow]          = ImVec4(0.00, 0.00, 0.00, 0.00);
    colors[clr.FrameBg]               = ImVec4(0.12, 0.12, 0.12, 0.94);

    colors[clr.FrameBgHovered]        = ImVec4(0.41, 0.19, 0.63, 0.68);
    colors[clr.FrameBgActive]         = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.TitleBg]               = ImVec4(0.41, 0.19, 0.63, 0.45);
    colors[clr.TitleBgCollapsed]      = ImVec4(0.41, 0.19, 0.63, 0.35);
    colors[clr.TitleBgActive]         = ImVec4(0.41, 0.19, 0.63, 0.78);
    colors[clr.MenuBarBg]             = ImVec4(0.30, 0.20, 0.39, 0.57);
    colors[clr.ScrollbarBg]           = ImVec4(0.04, 0.04, 0.04, 1.00);
    colors[clr.ScrollbarGrab]         = ImVec4(0.41, 0.19, 0.63, 0.31);
    colors[clr.ScrollbarGrabHovered]  = ImVec4(0.41, 0.19, 0.63, 0.78);
    colors[clr.ScrollbarGrabActive]   = ImVec4(0.41, 0.19, 0.63, 1.00);

    colors[clr.CheckMark]             = ImVec4(0.56, 0.61, 1.00, 1.00);
    colors[clr.SliderGrab]            = ImVec4(0.28, 0.28, 0.28, 1.00);
    colors[clr.SliderGrabActive]      = ImVec4(0.35, 0.35, 0.35, 1.00);

    colors[clr.Button]                = ImVec4(0.41, 0.19, 0.63, 0.44);
    colors[clr.ButtonHovered]         = ImVec4(0.41, 0.19, 0.63, 0.86);
    colors[clr.ButtonActive]          = ImVec4(0.64, 0.33, 0.94, 1.00);
    colors[clr.Header]                = ImVec4(0.41, 0.19, 0.63, 0.76);
    colors[clr.HeaderHovered]         = ImVec4(0.41, 0.19, 0.63, 0.86);
    colors[clr.HeaderActive]          = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.ResizeGrip]            = ImVec4(0.41, 0.19, 0.63, 0.20);
    colors[clr.ResizeGripHovered]     = ImVec4(0.41, 0.19, 0.63, 0.78);
    colors[clr.ResizeGripActive]      = ImVec4(0.41, 0.19, 0.63, 1.00);
    
   
 
    colors[clr.PlotLines]             = ImVec4(0.89, 0.85, 0.92, 0.63);
    colors[clr.PlotLinesHovered]      = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.PlotHistogram]         = ImVec4(0.89, 0.85, 0.92, 0.63);
    colors[clr.PlotHistogramHovered]  = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.TextSelectedBg]        = ImVec4(0.41, 0.19, 0.63, 0.43);
    
  
    function imgui.CenterColumnText(text)
        imgui.SetCursorPosX((imgui.GetColumnOffset() + (imgui.GetColumnWidth() / 2)) - imgui.CalcTextSize(text).x / 2)
        imgui.Text(text)
    end

    function imgui.VerticalSeparator()
        local pos = imgui.GetCursorScreenPos()
        local drawlist = imgui.GetWindowDrawList()
        local color = imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.Separator])
        drawlist:AddLine(imgui.ImVec2(pos.x, pos.y - 12), imgui.ImVec2(pos.x, 0xFFFFFF), color)
    end
end)

imgui.OnFrame(function() return not isGamePaused() and show_window[0] end, function(self)
    self.LockPlayer = true
    local ImVec2 = imgui.ImVec2
    local width, heigth = getScreenResolution()
    imgui.SetNextWindowSize(imgui.ImVec2(600, 400), imgui.Cond.FirstUseEver)
    imgui.SetNextWindowPos(imgui.ImVec2(width / 2, heigth / 2), nil, imgui.ImVec2(0.5, 0.5))
    imgui.Begin("Binder", show_window, imgui.WindowFlags.NoMove + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoSavedSettings)
        imgui.BeginChild("##bindlist", ImVec2(0, 335), true)
            imgui.Columns(3, nil, false)
            imgui.SetColumnWidth(-1, 20)
            imgui.CenterColumnText("#")
            imgui.NextColumn()
            imgui.VerticalSeparator()
            imgui.CenterColumnText(u8"Êëàâèøà")
            imgui.NextColumn()
            imgui.VerticalSeparator()
            imgui.CenterColumnText(u8"Íàçâàíèå áèíäà")
            imgui.NextColumn()
            imgui.Separator()
            for id, data in ipairs(hotkeys) do
                local desc = data.description
                local keyname = hk.getKeysName(data.keys)
                if imgui.Selectable(tostring(id), current_hotkey == id, imgui.SelectableFlags.SpanAllColumns) then
                    current_hotkey = id
                end
                imgui.NextColumn()
                imgui.CenterColumnText(keyname:len() > 0 and keyname or u8"")
                imgui.NextColumn()
                imgui.CenterColumnText(desc:len() > 0 and desc or u8"")
                imgui.NextColumn()
            end
        imgui.EndChild()
        imgui.SetCursorPosY(imgui.GetCursorPosY() + 5)
        if imgui.Button(u8'Âåðíóòüñÿ â ãëàâíîå ìåíþ',imgui.ImVec2(200,24)) then  
            windows[0] = true
            show_window[0] = false
    
        end
        imgui.SameLine()
        if imgui.Button(u8"Ñîçäàòü", imgui.ImVec2(120,24)) then
            table.insert(hotkeys, {keys = {}, content = "", description = ""})

            current_hotkey = #hotkeys
            local hotkey = hotkeys[current_hotkey]
            imgui.StrCopy(description_hotkey, hotkey.description)
            imgui.StrCopy(content_hotkey, hotkey.content)
            keys_hotkey.v = hotkey.keys
            imgui.OpenPopup(u8"Ðåäàêòîð")
        end
        imgui.SameLine()
        if imgui.Button(u8"Ðåäàêòèðîâàòü", imgui.ImVec2(120,24)) then
            if current_hotkey then
                local hotkey = hotkeys[current_hotkey]
                imgui.StrCopy(description_hotkey, hotkey.description)
                imgui.StrCopy(content_hotkey, hotkey.content)
                keys_hotkey.v = hotkey.keys
                imgui.OpenPopup(u8"Ðåäàêòîð")
             end
        end
        imgui.SameLine()
        if imgui.Button(u8"Óäàëèòü", imgui.ImVec2(120,24)) then
            if current_hotkey then
                local keycombo = hotkeys[current_hotkey].keys
                if rkeys.isHotKeyDefined(keycombo) then
                    rkeys.unRegisterHotKey(keycombo)
                end
                table.remove(hotkeys, current_hotkey)
                current_hotkey = nil
             end
        end
        if imgui.BeginPopupModal(u8"Ðåäàêòîð", nil, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoMove) then
            imgui.Columns(2, nil, false)
            imgui.SetColumnWidth(-1, 158)
            imgui.Text(u8"Êëàâèøà:")
            imgui.NextColumn()
            imgui.Text(u8"Íàçâàíèå áèíäà:")
            imgui.Columns()
            if imgui.HotKey("##keys", keys_hotkey, ImVec2(150, 20)) then
                local hotkey = hotkeys[current_hotkey]
                local keycombo = {hk.getKeysName(hotkey.keys), hk.getKeysName(keys_hotkey.v)}
                if keycombo[1] ~= keycombo[2] and rkeys.isHotKeyDefined(keys_hotkey.v) then
                    printString("~b~The key is already in use", 1500)
                    keys_hotkey.v = hotkey.keys
                end
            end
            imgui.SameLine()
            imgui.PushItemWidth(350)
            imgui.InputText("##description", description_hotkey, ffi.sizeof(description_hotkey) - 1)
            imgui.PopItemWidth()
            imgui.Text(u8"Òåêñò:")
            imgui.SameLine()
            imgui.Text(u8"Çàäåðæêà - <time>")
            imgui.InputTextMultiline("##content", content_hotkey, ffi.sizeof(content_hotkey) - 1, ImVec2(504, 150))
            imgui.SetCursorPosY(imgui.GetCursorPosY() + 5)
            if imgui.Button(u8"Ñîõðàíèòü", ImVec2(250, 20)) then
                local hotkey = hotkeys[current_hotkey]
                if rkeys.isHotKeyDefined(hotkey.keys) then
                    rkeys.unRegisterHotKey(hotkey.keys)
                end

                hotkey.keys = keys_hotkey.v
                hotkey.content = ffi.string(content_hotkey)
                hotkey.description = ffi.string(description_hotkey)

                if #hotkey.keys > 0 then
                    rkeys.registerHotKey(hotkey.keys, 1, false, function()
                        onStartHotkey(hotkey.content)
                    end)
                end
                imgui.CloseCurrentPopup()
            end
            imgui.SameLine()
            if imgui.Button(u8"Çàêðûòü", ImVec2(250, 20)) then
                imgui.CloseCurrentPopup()
            end
            imgui.EndPopup()
        end
    imgui.End()
end)


local kvl = {"À", "Á", "Â", "Ã", "Ä", "Æ", "Ç", "È", "Ê", "Ë", "Ì", "Í", "Î", "Ï", "Ð", "Ñ", "Ò", "Ó", "Ô", "Õ", "Ö", "×", "Ø", "ß"}
local KV = "Ã-11"
function main()
    while not isSampAvailable() do wait(10000) end
    sampAddChatMessage('ArmyHelper: Ãîòîâ ê ðàáîòå. Àêòèâàöèÿ: /ah ', 0xFFFFFFF )
    
     if autoupdate_loaded and enable_autoupdate and Update then
        pcall(Update.check, Update.json_url, Update.prefix, Update.url)
    end
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    loadImGuiHotkeys()
    loadHotkeys()
 sampRegisterChatCommand('ah', function() windows[0] = not windows[0] end)
    sampRegisterChatCommand(settings.cmd.hyi, function(params) sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' '..params) end)
    
    sampRegisterChatCommand('clcolor', function()
        cst = sampGetPlayerColor(351)
        sampAddChatMessage(cst, -1)
    end)
    











   
   
    sampRegisterChatCommand('mask', function(text) sampSendChat('/clist 32') 
        lua_thread.create(function()
        wait(1000)
        sampSendChat('/do Íà ëèöå ìàñêà. Îïîçíàâàòåëüíûå çíàêè îòñóòñòâóþò. Ëè÷íîñòü îïîçíàòü íåâîçìîæíî.')
        end) end )

       
    while true do wait(0)


       local _, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
        porno = sampGetPlayerColor(id)
        
        if porno == 16777215 and wasKeyPressed(VK_B) and not sampIsCursorActive() then sampSendChat('/'..settings.cmd.hahaha..' '..settings.nigger.clist..' ') elseif porno ~= 16777215 and wasKeyPressed(VK_B) and not sampIsCursorActive() then sampSendChat('/clist 0') end
        
        
        local x, y, z = getCharCoordinates(PLAYER_PED)
           
           local dist = getDistanceBetweenCoords3d(x, y, z, -1468, 1490,8)
           local lva = getDistanceBetweenCoords3d(x, y, z, 355, 2029,24)
           
            if dist > 200 and dist < 203 and autoCarm[0]  then wait(1000)
                sampSendChat('/carm') 
            end
            if lva > 200 and lva < 203 and autoCarm[0]  then wait(1000)
                sampSendChat('/carm') 
            end
    
            if dist > 200 and dist < 203  then carmResponse = 0 end
            if lva > 200 and lva < 203  then carmResponse = 2 end

  
        if isCharInAnyCar(PLAYER_PED) then -- Ïðîâåðêà íà òðàíñïîðò
            local carhandle = storeCarCharIsInNoSave(PLAYER_PED) -- Ïîëó÷åíèÿ handle òðàíñïîðòà
            local idcar = getCarModel(carhandle) -- Ïîëó÷åíèå ID òðàíñïîðòà
            print(idcar) -- Âûâîäèì ID òðàíñïîðòà â êîíñîëü Sampfuncs.
            if idcar == 548 and wasKeyPressed(VK_2)  then 
               
                printStringNow('Press N', 10000)
            end
            if isKeyDown(VK_N) and idcar == 548 and not sampIsCursorActive() then jopa[0] = true else jopa[0] = false end
           end
           
   
        
           
  
       
         local xCoord, yCoord, zCoord = getCharCoordinates(PLAYER_PED)
           
         if yCoord<3000 and yCoord>-3000 and xCoord<3000 and xCoord>-3000 then
             KV = kvl[math.ceil((yCoord * - 1 + 3000) / 250)] .. "-" .. math.ceil((xCoord + 3000) / 250)
         end
  
   if wasKeyPressed(VK_L) and not sampIsCursorActive() then sampSendChat('/lock') end
  
   if isCharDead(PLAYER_PED) then wait(7000) 
    sampSendChat('/'..settings.cmd.hahaha..' '..settings.nigger.clist..' ') end
    if wasKeyPressed(VK_F2) and not sampIsCursorActive() then qwerty[0] = not qwerty[0] end
    

    if wasKeyPressed(VK_1) and qwerty[0] then -- çàñòóïëåíèå íà ïîñò
        if ComboTest[0] == 0 and kol[0] == 0 and kod[0] == 0 then -- ÊÏÏ
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:1. Êîä-1')
        elseif ComboTest[0] == 0 and kol[0] == 1 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:2. Êîä-1')
        elseif ComboTest[0] == 0 and kol[0] == 2 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:3. Êîä-1')
        elseif ComboTest[0] == 0 and kol[0] == 3 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:4. Êîä-1')
        elseif ComboTest[0] == 0 and kol[0] == 4 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:5. Êîä-1')
        

        elseif ComboTest[0] == 0 and kol[0] == 0 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:1. Êîä-2')
        elseif ComboTest[0] == 0 and kol[0] == 0 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:1. Êîä-2-1')
        elseif ComboTest[0] == 0 and kol[0] == 0 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:1. Êîä-3')
        
        elseif ComboTest[0] == 0 and kol[0] == 1 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:2. Êîä-2')
        elseif ComboTest[0] == 0 and kol[0] == 1 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:2. Êîä-2-1')
        elseif ComboTest[0] == 0 and kol[0] == 1 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:2. Êîä-3')

        elseif ComboTest[0] == 0 and kol[0] == 2 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:3. Êîä-2')
        elseif ComboTest[0] == 0 and kol[0] == 2 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:3. Êîä-2-1')
        elseif ComboTest[0] == 0 and kol[0] == 2 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:3. Êîä-3')  


        elseif ComboTest[0] == 0 and kol[0] == 3 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:4. Êîä-2')
        elseif ComboTest[0] == 0 and kol[0] == 3 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:4. Êîä-2-1')
        elseif ComboTest[0] == 0 and kol[0] == 3 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:4. Êîä-3')


        elseif ComboTest[0] == 0 and kol[0] == 4 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:5. Êîä-2')
        elseif ComboTest[0] == 0 and kol[0] == 4 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:5. Êîä-2-1')
        elseif ComboTest[0] == 0 and kol[0] == 4 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:ÊÏÏ. Ñîñòàâ:5. Êîä-3')
        
        




        elseif ComboTest[0] == 1 and kol[0] == 0 and kod[0] == 0 then -- ËÎÄÎ×ÍÀß
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:1. Êîä-1')
        elseif ComboTest[0] == 1 and kol[0] == 1 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:2. Êîä-1')
        elseif ComboTest[0] == 1 and kol[0] == 2 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:3. Êîä-1')
        elseif ComboTest[0] == 1 and kol[0] == 3 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:4. Êîä-1')
        elseif ComboTest[0] == 1 and kol[0] == 4 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:5. Êîä-1')
        

        elseif ComboTest[0] == 1 and kol[0] == 0 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:1. Êîä-2')
        elseif ComboTest[0] == 1 and kol[0] == 0 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:1. Êîä-2-1')
        elseif ComboTest[0] == 1 and kol[0] == 0 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:1. Êîä-3')
        
        elseif ComboTest[0] == 1 and kol[0] == 1 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:2. Êîä-2')
        elseif ComboTest[0] == 1 and kol[0] == 1 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:2. Êîä-2-1')
        elseif ComboTest[0] == 1 and kol[0] == 1 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:2. Êîä-3')

        elseif ComboTest[0] == 1 and kol[0] == 2 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:3. Êîä-2')
        elseif ComboTest[0] == 1 and kol[0] == 2 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:3. Êîä-2-1')
        elseif ComboTest[0] == 1 and kol[0] == 2 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:3. Êîä-3')  


        elseif ComboTest[0] == 1 and kol[0] == 3 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:4. Êîä-2')
        elseif ComboTest[0] == 1 and kol[0] == 3 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:4. Êîä-2-1')
        elseif ComboTest[0] == 1 and kol[0] == 3 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:4. Êîä-3')


        elseif ComboTest[0] == 1 and kol[0] == 4 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:5. Êîä-2')
        elseif ComboTest[0] == 1 and kol[0] == 4 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:5. Êîä-2-1')
        elseif ComboTest[0] == 1 and kol[0] == 4 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:5. Êîä-3')
        
        



        elseif ComboTest[0] == 2 and kol[0] == 0 and kod[0] == 0 then -- Òðàï
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:1. Êîä-1')
        elseif ComboTest[0] == 2 and kol[0] == 1 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:2. Êîä-1')
        elseif ComboTest[0] == 2 and kol[0] == 2 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:3. Êîä-1')
        elseif ComboTest[0] == 2 and kol[0] == 3 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:4. Êîä-1')
        elseif ComboTest[0] == 2 and kol[0] == 4 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:5. Êîä-1')
        

        elseif ComboTest[0] == 2 and kol[0] == 0 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:1. Êîä-2')
        elseif ComboTest[0] == 2 and kol[0] == 0 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:1. Êîä-2-1')
        elseif ComboTest[0] == 2 and kol[0] == 0 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:1. Êîä-3')
        
        elseif ComboTest[0] == 2 and kol[0] == 1 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:2. Êîä-2')
        elseif ComboTest[0] == 2 and kol[0] == 1 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:2. Êîä-2-1')
        elseif ComboTest[0] == 2 and kol[0] == 1 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:2. Êîä-3')

        elseif ComboTest[0] == 2 and kol[0] == 2 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:3. Êîä-2')
        elseif ComboTest[0] == 2 and kol[0] == 2 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:3. Êîä-2-1')
        elseif ComboTest[0] == 2 and kol[0] == 2 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:3. Êîä-3')  


        elseif ComboTest[0] == 2 and kol[0] == 3 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:4. Êîä-2')
        elseif ComboTest[0] == 2 and kol[0] == 3 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:4. Êîä-2-1')
        elseif ComboTest[0] == 2 and kol[0] == 3 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:4. Êîä-3')


        elseif ComboTest[0] == 2 and kol[0] == 4 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:5. Êîä-2')
        elseif ComboTest[0] == 2 and kol[0] == 4 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:5. Êîä-2-1')
        elseif ComboTest[0] == 2 and kol[0] == 4 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Çàñòóïèë íà ïîñò:Òðàï. Ñîñòàâ:5. Êîä-3')
        end
    end
   
   
   
   
   
   
   
   
   
   
    if wasKeyPressed(VK_2) and qwerty[0] then -- Cîñòîÿíèå ïîñòà
        if ComboTest[0] == 0 and kol[0] == 0 and kod[0] == 0 then -- ÊÏÏ
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:1. Êîä-1')
        elseif ComboTest[0] == 0 and kol[0] == 1 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:2. Êîä-1')
        elseif ComboTest[0] == 0 and kol[0] == 2 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:3. Êîä-1')
        elseif ComboTest[0] == 0 and kol[0] == 3 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:4. Êîä-1')
        elseif ComboTest[0] == 0 and kol[0] == 4 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:5. Êîä-1')
        

        elseif ComboTest[0] == 0 and kol[0] == 0 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:1. Êîä-2')
        elseif ComboTest[0] == 0 and kol[0] == 0 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:1. Êîä-2-1')
        elseif ComboTest[0] == 0 and kol[0] == 0 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:1. Êîä-3')
        
        elseif ComboTest[0] == 0 and kol[0] == 1 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:2. Êîä-2')
        elseif ComboTest[0] == 0 and kol[0] == 1 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:2. Êîä-2-1')
        elseif ComboTest[0] == 0 and kol[0] == 1 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:2. Êîä-3')

        elseif ComboTest[0] == 0 and kol[0] == 2 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:3. Êîä-2')
        elseif ComboTest[0] == 0 and kol[0] == 2 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:3. Êîä-2-1')
        elseif ComboTest[0] == 0 and kol[0] == 2 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:3. Êîä-3')  


        elseif ComboTest[0] == 0 and kol[0] == 3 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:4. Êîä-2')
        elseif ComboTest[0] == 0 and kol[0] == 3 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:4. Êîä-2-1')
        elseif ComboTest[0] == 0 and kol[0] == 3 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:4. Êîä-3')


        elseif ComboTest[0] == 0 and kol[0] == 4 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:5. Êîä-2')
        elseif ComboTest[0] == 0 and kol[0] == 4 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:5. Êîä-2-1')
        elseif ComboTest[0] == 0 and kol[0] == 4 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:ÊÏÏ. Ñîñòàâ:5. Êîä-3')
        
        




        elseif ComboTest[0] == 1 and kol[0] == 0 and kod[0] == 0 then -- ËÎÄÎ×ÍÀß
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:1. Êîä-1')
        elseif ComboTest[0] == 1 and kol[0] == 1 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:2. Êîä-1')
        elseif ComboTest[0] == 1 and kol[0] == 2 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:3. Êîä-1')
        elseif ComboTest[0] == 1 and kol[0] == 3 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:4. Êîä-1')
        elseif ComboTest[0] == 1 and kol[0] == 4 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:5. Êîä-1')
        

        elseif ComboTest[0] == 1 and kol[0] == 0 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:1. Êîä-2')
        elseif ComboTest[0] == 1 and kol[0] == 0 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:1. Êîä-2-1')
        elseif ComboTest[0] == 1 and kol[0] == 0 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:1. Êîä-3')
        
        elseif ComboTest[0] == 1 and kol[0] == 1 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:2. Êîä-2')
        elseif ComboTest[0] == 1 and kol[0] == 1 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:2. Êîä-2-1')
        elseif ComboTest[0] == 1 and kol[0] == 1 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:2. Êîä-3')

        elseif ComboTest[0] == 1 and kol[0] == 2 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:3. Êîä-2')
        elseif ComboTest[0] == 1 and kol[0] == 2 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:3. Êîä-2-1')
        elseif ComboTest[0] == 1 and kol[0] == 2 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:3. Êîä-3')  


        elseif ComboTest[0] == 1 and kol[0] == 3 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:4. Êîä-2')
        elseif ComboTest[0] == 1 and kol[0] == 3 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:4. Êîä-2-1')
        elseif ComboTest[0] == 1 and kol[0] == 3 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:4. Êîä-3')


        elseif ComboTest[0] == 1 and kol[0] == 4 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:5. Êîä-2')
        elseif ComboTest[0] == 1 and kol[0] == 4 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:5. Êîä-2-1')
        elseif ComboTest[0] == 1 and kol[0] == 4 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Ëîäî÷íàÿ. Ñîñòàâ:5. Êîä-3')
        
        



        elseif ComboTest[0] == 2 and kol[0] == 0 and kod[0] == 0 then -- Òðàï
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:1. Êîä-1')
        elseif ComboTest[0] == 2 and kol[0] == 1 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:2. Êîä-1')
        elseif ComboTest[0] == 2 and kol[0] == 2 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:3. Êîä-1')
        elseif ComboTest[0] == 2 and kol[0] == 3 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:4. Êîä-1')
        elseif ComboTest[0] == 2 and kol[0] == 4 and kod[0] == 0 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:5. Êîä-1')
        

        elseif ComboTest[0] == 2 and kol[0] == 0 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:1. Êîä-2')
        elseif ComboTest[0] == 2 and kol[0] == 0 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:1. Êîä-2-1')
        elseif ComboTest[0] == 2 and kol[0] == 0 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:1. Êîä-3')
        
        elseif ComboTest[0] == 2 and kol[0] == 1 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:2. Êîä-2')
        elseif ComboTest[0] == 2 and kol[0] == 1 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:2. Êîä-2-1')
        elseif ComboTest[0] == 2 and kol[0] == 1 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:2. Êîä-3')

        elseif ComboTest[0] == 2 and kol[0] == 2 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:3. Êîä-2')
        elseif ComboTest[0] == 2 and kol[0] == 2 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:3. Êîä-2-1')
        elseif ComboTest[0] == 2 and kol[0] == 2 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:3. Êîä-3')  


        elseif ComboTest[0] == 2 and kol[0] == 3 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:4. Êîä-2')
        elseif ComboTest[0] == 2 and kol[0] == 3 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:4. Êîä-2-1')
        elseif ComboTest[0] == 2 and kol[0] == 3 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:4. Êîä-3')


        elseif ComboTest[0] == 2 and kol[0] == 4 and kod[0] == 1 then 
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:5. Êîä-2')
        elseif ComboTest[0] == 2 and kol[0] == 4 and kod[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:5. Êîä-2-1')
        elseif ComboTest[0] == 2 and kol[0] == 4 and kod[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîñò:Òðàï. Ñîñòàâ:5. Êîä-3')
        end
    end

    if wasKeyPressed(VK_3) and qwerty[0] then -- Ïîêèíóë ïîñò
        if ComboTest[0] == 0 and ppp[0] == 0 then -- ÊÏÏ
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîêèíóë ïîñò:ÊÏÏ. Ïðè÷èíà:10-100')
        elseif ComboTest[0] == 0 and ppp[0] == 1 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîêèíóë ïîñò:ÊÏÏ. Ïðè÷èíà:Ïîïîëíåíèå ÁÏ')
        elseif ComboTest[0] == 0 and ppp[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîêèíóë ïîñò:ÊÏÏ. Ïðè÷èíà:Ïîñòðîåíèå')
        elseif ComboTest[0] == 0 and ppp[0] == 03 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîêèíóë ïîñò:ÊÏÏ. Ïðè÷èíà:Ïðèêàç')
       
        elseif ComboTest[0] == 1 and ppp[0] == 0 then -- Ëîäî÷íàÿ
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîêèíóë ïîñò:Ëàäî÷íàÿ. Ïðè÷èíà:10-100')
        elseif ComboTest[0] == 1 and ppp[0] == 1 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîêèíóë ïîñò:Ëîäî÷íàÿ. Ïðè÷èíà:Ïîïîëíåíèå ÁÏ')
        elseif ComboTest[0] == 1 and ppp[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîêèíóë ïîñò:Ëîäî÷íàÿ. Ïðè÷èíà:Ïîñòðîåíèå')
        elseif ComboTest[0] == 1 and ppp[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîêèíóë ïîñò:Ëîäî÷íàÿ. Ïðè÷èíà:Ïðèêàç')

             elseif ComboTest[0] == 2 and ppp[0] == 0 then -- Òðàï
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîêèíóë ïîñò:Òðàï. Ïðè÷èíà:10-100')
        elseif ComboTest[0] == 2 and ppp[0] == 1 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîêèíóë ïîñò:Òðàï. Ïðè÷èíà:Ïîïîëíåíèå ÁÏ')
        elseif ComboTest[0] == 2 and ppp[0] == 2 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîêèíóë ïîñò:Òðàï. Ïðè÷èíà:Ïîñòðîåíèå')
        elseif ComboTest[0] == 2 and ppp[0] == 3 then
            sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Ïîêèíóë ïîñò:Òðàï. Ïðè÷èíà:Ïðèêàç')
        end
    end

   end
end

function onScriptTerminate(script, quitGame)
    if thisScript() == script then
        saveHotkeys()
    end
end



sampev.onShowDialog = function(dId, style, title, button1, button2, text)
    if title:find("Ñêëàä%sîðóæèÿ") and setting.arm.mainState then
        if setting.arm.desertEagle and getAmmo(24) < 63 then
            sampSendDialogResponse(dId, 1, 0, "")
        elseif setting.arm.shotgun and getAmmo(25) < 30 then
            sampSendDialogResponse(dId, 1, 1, "")
        elseif setting.arm.smg and getAmmo(29) < 180 then
            sampSendDialogResponse(dId, 1, 2, "")
        elseif setting.arm.m4a1 and getAmmo(31) < 300 then
            sampSendDialogResponse(dId, 1, 3, "")
        elseif setting.arm.rifle and getAmmo(33) < 30 then
            sampSendDialogResponse(dId, 1, 4, "")
        elseif setting.arm.armour and getCharArmour(PLAYER_PED) < 100 then
            sampSendDialogResponse(dId, 1, 5, "")
        elseif setting.arm.parachute and getAmmo(46) < 1 then
            sampSendDialogResponse(dId, 1, 6, "")
        end
        return false
    end
    if title:find("Ðàçäåâàëêà") then
        sampSendDialogResponse(dId, 1, 0, 'Äà')
        return false
    end
   
    if title:find("Ðàçâîçêà ìàòåðèàëîâ") and autoCarm[0] then
    
        if carmResponse == 0 and autoCarm[0] then sampSendDialogResponse(dId, 1, 0) return false end
        if carmResponse == 2 and autoCarm[0] then sampSendDialogResponse(dId, 1, 2) return false end
        
       
        
    end
    
end





function SE.onSendChat(text)
    
 
    if text:match("#kv#") then
        if KV~=nil then
            text = text:gsub("#kv#", KV)
        else
            sampAddChatMessage(" Âû âíå êàðòû.", 0xFF0000)  
            return false
        end
    end

    return {text}
end



function SE.onSendCommand(text)


      if text:match("#kv#") then
          if KV~=nil then
              text = text:gsub("#kv#", KV)
          else
              sampAddChatMessage(" Âû âíå êàðòû.", 0xFF0000)  
              return false
          end
      end

  
    return {text}
end
