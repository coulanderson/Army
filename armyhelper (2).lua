require("samp-api")
require("moonloader")
script_name('ArmyHelper')
require ('lib.moonloader')
local dlstatus = require('moonloader').download_status


update_state = false 

local script_vers = 2
local script_vers_text = '1.01'
local script_path =  thisScript().path
local script_url = ''
local update_path = getWorkingDirectory().. '/update.ini'
local update_url = 'https://raw.githubusercontent.com/coulanderson/Army/main/update.%20ini'













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
local sex = new.bool()
local gey = new.bool()

local carmResponse
local qwerty = new.bool()
local key = require 'vkeys'

local inicfg = require 'inicfg'
local new, str = imgui.new, ffi.string
local SE = require "lib.samp.events"
local sampev = require('lib.samp.events')
local show_window = imgui.new.bool()
local note_text = new.char[256]( )

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
        pro = false,
        huipizda = false,
        nigaone = false,
        porol = '',
        nigatwo = false,
        quit = false,
        grib = false,
        vipaddblock = false,
        
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
    infobar = {  
        color1 = 0,
        color2 = 0,
        color3 = 0,
        color4 = 0,
        name = false,
        kvcheck = false,
        time = false,
        data = false,
        number = false,
        nickna = false,
        pstat = false,
    },
    postav = {
        pstats = 0 
    },
    zvan = {   frank = 0,
    
    stmatros = 'Старший Матрос',
    starshina = 'Старшина',
    mlmichman = 'Младший Мичман',
    michman = 'Мичман',
    stmich = 'Старший Мичман',
    mlleit = 'Младший Лейтенант',
    leit = 'Лейтенант',
    stleit = 'Старший Лейтенант',
    kapleit = 'Капитан-Лейтенант',
    kap1 = 'Капитан 1го ранга',
    kontr = 'Контр-Адмирал',
    vice = 'Вице-Адмирал',
    admiral = 'Адмирал'
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


local vkl = new.bool(settings.nigger.nigatwo)
local negr = new.bool(settings.nigger.nigaone)
local postavstats = new.bool(settings.infobar.pstat)
local hyita = new.bool(settings.nigger.huipizda)
local nickn = new.bool(settings.infobar.nickna)
local num = new.bool(settings.infobar.number)
local deny = new.bool(settings.infobar.data)
local vremya = new.bool(settings.infobar.time)
local sector = new.bool(settings.infobar.kvcheck)
local naz = new.bool(settings.infobar.name)
local proz = new.bool(settings.nigger.pro)
local dok4 = new.char[256](u8(settings.nigger.raz))
local dok3 = new.char[256](u8(settings.nigger.suhoi))
local dok2 = new.char[256](u8(settings.nigger.zav))
local dok1 = new.char[256](u8(settings.nigger.nach))
local qu = new.bool(settings.nigger.quit)
local nar =new.bool(settings.nigger.grib)
local autoCarm = new.bool(settings.nigger.Carm)
local postavki = new.bool(settings.nigger.autodoklad)
local lll = new.bool(settings.nigger.vipaddblock)
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
local password = new.char[256](u8(settings.nigger.porol))
--------------------------------ГЛАВНОЕ МЕНЮ---------------------------
imgui.OnFrame(function() return windows[0] end, function (player)
    imgui.SetNextWindowPos(imgui.ImVec2(500,500), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(245, 270), imgui.Cond.Always)
    imgui.Begin('ArmyHelper', windows, imgui.WindowFlags.NoResize)
    if imgui.Button(u8'Основное',imgui.ImVec2(240,24)) then
        windows[0] = false
        blyat[0] = true
    end
    if imgui.Button(u8'Биндер',imgui.ImVec2(240,24)) then  
        windows[0] = false
        show_window[0] = true

    end
    if imgui.Button(u8'АвтоБП',imgui.ImVec2(240,24)) then  
        windows[0] = false
        xxx.bool[0] = true

    end
    if imgui.Button(u8'Поставки',imgui.ImVec2(240,24)) then
        windows[0] = false
        her[0] = true
    end
    if imgui.Button(u8'Информация',imgui.ImVec2(240,24)) then
        windows[0] = false
        pizda[0] = true
    end
    if imgui.Button(u8'Информационная панель',imgui.ImVec2(240,24)) then  
        windows[0] = false
        gey[0] = true
    end
    imgui.End()
end)

------------------------------ОСНОВНОЕ---------------------------------
imgui.OnFrame(function() return blyat[0] end, function (player)
    imgui.SetNextWindowPos(imgui.ImVec2(500,500), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(400, 270), imgui.Cond.Always)
    imgui.Begin(u8'Основное', blyat, imgui.WindowFlags.NoResize)
    imgui.Text(u8'Введите тег:')
    
    if imgui.InputText('##Add', inputt, 256) then
        settings.nigger.inputsaved = u8:decode(str(inputt)) 
        inicfg.save(settings, 'ArmyHelper.ini') 
    end
    imgui.Text(u8'Введите клист:')
    
    if imgui.InputText('##qwerty', cl, 256) then
        settings.nigger.clist = u8:decode(str(cl))
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    imgui.SameLine()
    if imgui.Checkbox(u8'Вкл', hyita)  then
        settings.nigger.huipizda = hyita[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    
    if imgui.Checkbox(u8'Цветные ники в чате', checkboxone) then
        settings.nigger.checkboxstatus = checkboxone[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.Checkbox(u8'АвтоДоклад о ликвидации ОПГ', negr) then
        settings.nigger.nigaone = negr[0] 
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
        imgui.Text(u8'Блокирует рекламу в чате')
        imgui.EndTooltip()
    end
    if imgui.Checkbox(u8'VIP AddBlock', lll ) then
        settings.nigger.vipaddblock = lll[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    imgui.SameLine()
    imgui.TextDisabled("(?)")
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.Text(u8'Блокирует VIP рекламу в чате')
        imgui.EndTooltip()
    end
    if imgui.Checkbox(u8'Блокировка АдминЧата', admin) then
        settings.nigger.adminchat = admin[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.Checkbox(u8'Блокировка новостей', qqq) then
        settings.nigger.nov = qqq[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
   
    if imgui.Checkbox(u8'Информация о ипользовании /grib heal и /usedrugs', nar) then
        settings.nigger.grib = nar[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.Checkbox(u8'QuitInformer', qu) then
        settings.nigger.quit = qu[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    imgui.SameLine()
   imgui.TextDisabled("(?)")
   if imgui.IsItemHovered() then
       imgui.BeginTooltip()
       imgui.Text(u8'Игрок Nick_Name[id] отключился от сервера. Причина: краш / /q / кик сервером')
       imgui.EndTooltip()
   end
   imgui.Text(u8('Автологи'))
   imgui.SameLine()
   imgui.TextDisabled("(?)")
   if imgui.IsItemHovered() then
       imgui.BeginTooltip()
       imgui.Text(u8'Автоматически вводит пароль')
       imgui.EndTooltip()
   end
    if imgui.InputText(u8'##Автологин', password, 256, imgui.InputTextFlags.Password) then
        settings.nigger.porol = u8:decode(str(password))
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    imgui.SameLine()
    if imgui.Checkbox(u8'Вкл.', vkl) then
        settings.nigger.nigatwo = vkl[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
        end
   
    if imgui.Button(u8'Вернуться в главное меню',imgui.ImVec2(240,24)) then  
        windows[0] = true
        blyat[0] = false

    end

    
    
    imgui.End()


end)

-----------------------------АВТОБП------------------------------------
imgui.OnFrame(function() return xxx.bool[0] end, function()
    local screen = {getScreenResolution()}
    imgui.SetNextWindowPos(imgui.ImVec2(screen[1] / 2, screen[2] / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(250, 250), imgui.Cond.FirstUseEver)
    imgui.Begin(u8"АвтоБП", xxx.bool, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoSavedSettings)
    if imgui.Checkbox(u8"Включить/выключить", xxx.mainState) then
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
    if imgui.Button(u8'Вернуться в главное меню',imgui.ImVec2(240,24)) then  
        windows[0] = true
        xxx.bool[0] = false

    end
    imgui.End()
end)


--------------------------Поставки-------------------------------------
imgui.OnFrame(function() return her[0] end, function (player)
    imgui.SetNextWindowPos(imgui.ImVec2(500,500), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(720, 250), imgui.Cond.Always)
    imgui.Begin(u8'Поставки', her, imgui.WindowFlags.NoResize)
    
    if imgui.Checkbox(u8'Авто /carm', autoCarm) then
        settings.nigger.Carm = autoCarm[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    imgui.SameLine()
    imgui.TextDisabled("(?)")
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.Text(u8'При подлете к ЛВа и сухогрузу автоматически вводит /carm')
        imgui.EndTooltip()
    end
    imgui.Separator()
    imgui.Text(u8("Редактирование докладов:"))
    if imgui.InputText(u8'Начало поставок',dok1, 256) then
        settings.nigger.nach = u8:decode(str(dok1))
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.InputText(u8'Завершение поставок',dok2, 256) then
        settings.nigger.zav = u8:decode(str(dok2))
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.InputText(u8'Загрузка на сухогрузе',dok3, 256) then
        settings.nigger.suhoi = u8:decode(str(dok3))
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.InputText(u8'Разгрузка на ЛВа ',dok4, 256) then
        settings.nigger.raz = u8:decode(str(dok4))
        inicfg.save(settings, 'ArmyHelper.ini')
    end 
    imgui.SameLine()
    imgui.TextDisabled("(?)")
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.Text(u8'#kilo# - состояние склада LVa')
        imgui.EndTooltip()
    end
    if imgui.Button(u8'Вернуться в главное меню',imgui.ImVec2(240,24)) then  
        windows[0] = true
        her[0] = false

    end
    imgui.End()
end)









-----------------------------ИНФОРМАЦИЯ----------------------------------
imgui.OnFrame(function() return pizda[0] end, function (player)
    imgui.SetNextWindowPos(imgui.ImVec2(500,500), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(600, 400), imgui.Cond.Always)
    imgui.Begin(u8'Информация', pizda, imgui.WindowFlags.NoResize)
    if imgui.BeginTabBar('Tabs') then 
        if imgui.BeginTabItem(u8'Клавиши') then 
            imgui.Columns(2) 
            imgui.Text(u8'L') imgui.SetColumnWidth(-1,80) 
            imgui.NextColumn()
            imgui.Text(u8'Отправляет в чат /lock') imgui.SetColumnWidth(-1, 400) 
            imgui.Columns(1)
            imgui.Separator()
           
            imgui.Columns(2)
            imgui.Text(u8'F2') imgui.SetColumnWidth(-1, 80)
            imgui.NextColumn()
            imgui.Text(u8'Меню докладов') imgui.SetColumnWidth(-1, 400) 
            imgui.Columns(1)
            imgui.Separator()

            imgui.Columns(2)
            imgui.Text(u8'N') imgui.SetColumnWidth(-1, 80)
            imgui.NextColumn()
            imgui.Text(u8'Меню поставок(работает только в матолете)') imgui.SetColumnWidth(-1, 400) 
            imgui.Columns(1)
            imgui.Separator()

            imgui.Columns(2)
            imgui.Text(u8'B') imgui.SetColumnWidth(-1, 80)
            imgui.NextColumn()
            imgui.Text(u8'Быстрый /clist ') imgui.SetColumnWidth(-1, 400) 
            imgui.Columns(1)
            imgui.Separator()

            imgui.Columns(2)
            imgui.Text(u8'LALT + R') imgui.SetColumnWidth(-1, 80)
            imgui.NextColumn()
            imgui.Text(u8'Открывает чат и пишет /r ') imgui.SetColumnWidth(-1, 400) 
            imgui.Columns(1)
            imgui.Separator()

            imgui.EndTabItem() 
        end
        
    
        if imgui.BeginTabItem(u8'Команды') then 
            imgui.Columns(2) 
             imgui.Text(u8'/mask') imgui.SetColumnWidth(-1,80) 
             imgui.NextColumn()
             imgui.Text(u8'Отправляет в чат отыгровку маски') imgui.SetColumnWidth(-1, 400) 
             imgui.Columns(1)
             imgui.Separator() 
             imgui.EndTabItem() 
        end


        if imgui.BeginTabItem(u8'Переменные') then 
            imgui.Columns(2) 
             imgui.Text(u8'#kv#') imgui.SetColumnWidth(-1,80) 
             imgui.NextColumn()
             imgui.Text(u8'Отправляет в чат текущий квадрат') imgui.SetColumnWidth(-1, 400) 
             imgui.Columns(1)
             imgui.Separator() 

             imgui.Columns(2)
             imgui.Text(u8'#kilo#') imgui.SetColumnWidth(-1,80) 
             imgui.NextColumn()
             imgui.Text(u8'Отправляет в чат cостояние склада LVa') imgui.SetColumnWidth(-1, 400) 
             imgui.Columns(1)
             imgui.Separator()

             imgui.Columns(2)
             imgui.Text(u8'#id#') imgui.SetColumnWidth(-1,80) 
             imgui.NextColumn()
             imgui.Text(u8'Отправляет в чат ваш ID') imgui.SetColumnWidth(-1, 400) 
             imgui.Columns(1)
             imgui.Separator()
             imgui.EndTabItem() 
        end
        
        
        imgui.EndTabBar() -- 
    end
   
   
   
   
   
    if imgui.Button(u8'Вернуться в главное меню',imgui.ImVec2(240,24)) then  
        windows[0] = true
        pizda[0] = false

    end
    
    imgui.End()
end)

local ComboTest = new.int() 
local kol = new.int()
local kod = new.int()
local ppp = new.int()
local item_list = {u8'КПП', u8'Лодочная', u8'Трап'} --  список
local kollist = {'0','1','2','3','4','5','6','7','8','9','10'}
local kodlist = {u8'Код 1',u8'Код 2',u8'Код 2-1',u8'Код 3'}
local prlist = {u8'10-100',u8'Пополнение БП',u8'Построение', u8'Приказ'}
local ImItems = imgui.new['const char*'][#item_list](item_list)
local list = imgui.new['const char*'][#kollist](kollist)
local sost = imgui.new['const char*'][#kodlist](kodlist)
local pr = imgui.new['const char*'][#prlist](prlist)

imgui.OnFrame(function() return qwerty[0] end, function (player)
    imgui.SetNextWindowPos(imgui.ImVec2(500,500), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(240, 240), imgui.Cond.Always)
    imgui.Begin(u8'Доклады', qwerty, imgui.WindowFlags.NoResize)
    imgui.Combo(u8'Пост',ComboTest,ImItems, #item_list)
    imgui.Combo(u8'Состав',kol,list, #kollist)
    imgui.Combo(u8'Код',kod,sost, #kodlist)
    imgui.Combo(u8'Причина',ppp,pr, #prlist)
    imgui.Text(u8'Клавиша 1 - Заступил на пост ')
    imgui.Text(u8'Клавиша 2 - Состояние поста ')
    imgui.Text(u8'Клавиша 3 - Покинул пост ')
    imgui.Text(u8'Клавиша 4 - Доклад о прибытии ')
    imgui.Text(u8('военнослужащего в часть'))
    imgui.SameLine()
    imgui.TextDisabled("(?)")
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.Text(u8'Работает, если вам показали паспорт')
        imgui.EndTooltip()
    end
    imgui.End()
end)




imgui.OnFrame(function() return jopa[0] end, function (player)
    imgui.SetNextWindowPos(imgui.ImVec2(500,500), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(256, 150), imgui.Cond.Always)
    imgui.Begin(u8'Меню докладов', jopa, imgui.WindowFlags.NoResize)
    if imgui.Button(u8'Начало поставок',imgui.ImVec2(240,24)) then
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' ' ..settings.nigger.nach..'')
    end
    if imgui.Button(u8'Загрузился на сухогрузе',imgui.ImVec2(240,24)) then
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' ' ..settings.nigger.suhoi..'')
    end
    if imgui.Button(u8'Разгрузился на ЛВа',imgui.ImVec2(240,24)) then  
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' ' ..settings.nigger.raz..'')
    end
    if imgui.Button(u8'Завершаю поставки',imgui.ImVec2(240,24)) then  
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' ' ..settings.nigger.zav..'')
    end
    imgui.End()
end)

----------------инфобар-------------------------------
local OneTwo = new.int(settings.infobar.color2)
local SliderOne = new.int(settings.infobar.color1)
local SliderTwo = new.float(settings.infobar.color4)
local SliderTree = new.int(settings.infobar.color3)
imgui.OnFrame(function() return gey[0] end , function (player) 
    
	
    imgui.SetNextWindowPos(imgui.ImVec2(500,500), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    
     imgui.Begin(u8'Информационная панель', gey, imgui.WindowFlags.NoResize + imgui.WindowFlags.AlwaysAutoResize)
     if imgui.Checkbox(u8'Включить/выключить', proz)  then
        settings.nigger.pro = proz[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
   if imgui.SliderInt(u8'Красный', SliderOne, 0, 1000) then
        settings.infobar.color1 = SliderOne[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
   end
    if imgui.SliderInt(u8'Зеленый', OneTwo, 0, 1000) then
    settings.infobar.color2 = OneTwo[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.SliderInt(u8'Синий', SliderTree, 0, 1000) then
        settings.infobar.color3 = SliderTree[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.SliderFloat(u8'Прозрачность', SliderTwo, 0, 1) then
        settings.infobar.color4 = SliderTwo[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.Checkbox(u8'Название скрипта', naz)  then
        settings.infobar.name = naz[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.Checkbox(u8'Квадрат', sector)  then
        settings.infobar.kvcheck = sector[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.Checkbox(u8'Статистика поставок', postavstats)  then
        settings.infobar.pstat = postavstats[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.Checkbox(u8'Время', vremya)  then
        settings.infobar.time = vremya[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    imgui.SameLine()
    if imgui.Checkbox(u8'Дата', deny)  then
        settings.infobar.data = deny[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if imgui.Checkbox(u8'Мой ID', num)  then
        settings.infobar.number = num[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    imgui.SameLine()
    if imgui.Checkbox(u8'Мой nickname', nickn)  then
        settings.infobar.nickna = nickn[0] 
        inicfg.save(settings, 'ArmyHelper.ini')
    end



    




    if imgui.Button(u8'Вернуться в главное меню',imgui.ImVec2(240,24)) then  
        windows[0] = true
        gey[0] = false

    end
     imgui.End()
    
 
     
end)




stata = {
    pstats = new.bool(settings.postav.pstats),
    frank = new.bool(settings.zvan.frank)
}
local p = (settings.postav.pstats)
local z = (settings.zvan.frank)


imgui.OnFrame(function() return sex[0] end ,  function(self)
    self.HideCursor = true 

   local KV = 'Г-11'
   local kvl = {"А", "Б", "В", "Г", "Д", "Ж", "З", "И", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Я"}
   local xCoord, yCoord, zCoord = getCharCoordinates(PLAYER_PED)
           
         if yCoord<3000 and yCoord>-3000 and xCoord<3000 and xCoord>-3000 then
             KV = kvl[math.ceil((yCoord * - 1 + 3000) / 250)] .. "-" .. math.ceil((xCoord + 3000) / 250)
         end

    time = (os.date("%H",os.time())..':'..os.date("%M",os.time())..':'..os.date("%S",os.time()))
    date = (os.date("%d",os.time())..'/'..os.date("%m",os.time())..'/'..os.date("%Y",os.time()))
    _, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
    nick = sampGetPlayerNickname(id)









    
    imgui.SetNextWindowPos(imgui.ImVec2(500, 500), imgui.Cond.FirstUseEver)
    imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(SliderOne[0], OneTwo[0], SliderTree[0], SliderTwo[0]))
    imgui.Begin(u8'Информа', sex, imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoResize + imgui.WindowFlags.AlwaysAutoResize)
    if naz[0] == true then imgui.CenterText('ArmyHelper') imgui.Separator() end
    if nickn[0] then imgui.Text(u8'Nickname: '..nick) end
    if num[0] then imgui.Text(u8'Мой ID: '..id) end
    if sector[0] == true then imgui.Text(u8("Квадрат: " ..KV)) end
    
    
    
    
    
    if postavstats[0] then imgui.Text(u8'Количество поставок: '..p) end
    if vremya[0] == true then imgui.Text(u8"Время: " ..time) end
    if deny[0] == true then imgui.Text(u8"Дата: " ..date ) end
    imgui.End()
    imgui.PopStyleColor()

    
end)









getAmmo = function(id)
    return getAmmoInCharWeapon(PLAYER_PED, id)
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
        if line:len() > 0 and not sampIsCursorActive() then
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
            imgui.CenterColumnText(u8"Клавиша")
            imgui.NextColumn()
            imgui.VerticalSeparator()
            imgui.CenterColumnText(u8"Название бинда")
            imgui.NextColumn()
            imgui.Separator()
            for id, data in ipairs(hotkeys) do
                local desc = data.description
                local keyname = hk.getKeysName(data.keys)
                if imgui.Selectable(tostring(id), current_hotkey == id, imgui.SelectableFlags.SpanAllColumns) then
                    current_hotkey = id
                end
                imgui.NextColumn()
                imgui.CenterColumnText(keyname:len() > 0 and keyname or u8"—")
                imgui.NextColumn()
                imgui.CenterColumnText(desc:len() > 0 and desc or u8"—")
                imgui.NextColumn()
            end
        imgui.EndChild()
        imgui.SetCursorPosY(imgui.GetCursorPosY() + 5)
        if imgui.Button(u8'Вернуться в главное меню',imgui.ImVec2(200,24)) then  
            windows[0] = true
            show_window[0] = false
    
        end
        imgui.SameLine()
        if imgui.Button(u8"Создать", imgui.ImVec2(120,24)) then
            table.insert(hotkeys, {keys = {}, content = "", description = ""})

            current_hotkey = #hotkeys
            local hotkey = hotkeys[current_hotkey]
            imgui.StrCopy(description_hotkey, hotkey.description)
            imgui.StrCopy(content_hotkey, hotkey.content)
            keys_hotkey.v = hotkey.keys
            imgui.OpenPopup(u8"Редактор")
        end
        imgui.SameLine()
        if imgui.Button(u8"Редактировать", imgui.ImVec2(120,24)) then
            if current_hotkey then
                local hotkey = hotkeys[current_hotkey]
                imgui.StrCopy(description_hotkey, hotkey.description)
                imgui.StrCopy(content_hotkey, hotkey.content)
                keys_hotkey.v = hotkey.keys
                imgui.OpenPopup(u8"Редактор")
             end
        end
        imgui.SameLine()
        if imgui.Button(u8"Удалить", imgui.ImVec2(120,24)) then
            if current_hotkey then
                local keycombo = hotkeys[current_hotkey].keys
                if rkeys.isHotKeyDefined(keycombo) then
                    rkeys.unRegisterHotKey(keycombo)
                end
                table.remove(hotkeys, current_hotkey)
                current_hotkey = nil
             end
        end
        if imgui.BeginPopupModal(u8"Редактор", nil, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoMove) then
            imgui.Columns(2, nil, false)
            imgui.SetColumnWidth(-1, 158)
            imgui.Text(u8"Клавиша:")
            imgui.NextColumn()
            imgui.Text(u8"Название бинда:")
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
            imgui.Text(u8"Текст:")
            imgui.SameLine()
            imgui.Text(u8"Задержка - <time>")
            imgui.InputTextMultiline("##content", content_hotkey, ffi.sizeof(content_hotkey) - 1, ImVec2(504, 150))
            imgui.SetCursorPosY(imgui.GetCursorPosY() + 5)
            if imgui.Button(u8"Сохранить", ImVec2(250, 20)) then
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
            if imgui.Button(u8"Закрыть", ImVec2(250, 20)) then
                imgui.CloseCurrentPopup()
            end
            imgui.EndPopup()
        end
    imgui.End()
end)






































local search = false
local playeridz = 0

local playsec = 0
local playmin = 0
local playhours = 0

local kvl = {"А", "Б", "В", "Г", "Д", "Ж", "З", "И", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Я"}
local KV = "Г-11"



possst = {
    [0] = 'КПП',
    [1] = 'Лодочная',
    [2] = 'Трап'
}
geyporno = {
    [0] = 'Код-1',
    [1] = 'Код-2',
    [2] = 'Код-2.1',
    [3] = 'Код-3'
}
suka = {
    [0] = '10-100',
    [1] = 'Пополнение БП',
    [2] = 'Построение',
    [3] = 'Приказ'
}



 





function onScriptTerminate(script, quitGame)
    if thisScript() == script then
        saveHotkeys()
    end
end

local Deagle = ''
local M4 = ''
local SMG = ''
local SHOTGUN = ''
local RIFLE = ''
local bron = ''
local parashut = ''

local bp

sampev.onShowDialog = function(dId, style, title, button1, button2, text)
    if title:find("Склад%sоружия") and setting.arm.mainState then
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

   



   
    if title:find("Раздевалка") then
        sampSendDialogResponse(dId, 1, 0, 'Да')
        return false
    end
   
    if title:find("Развозка материалов") and autoCarm[0] then
    
        if carmResponse == 0 and autoCarm[0] then sampSendDialogResponse(dId, 1, 0) return false end
        if carmResponse == 2 and autoCarm[0] then sampSendDialogResponse(dId, 1, 2) return false end
    end
    if title:find("Авторизация") and vkl[0] then
        sampSendDialogResponse(dId, 1, 0, settings.nigger.porol)
        return false
    end
    
end





function sampev.onSendPickedUpPickup(pickupId)
  if setting.arm.mainState then
        if xxx.armour[0] and getCharArmour(PLAYER_PED) < 100 then bron = ' бронежелет'  else bron = '' end
        if xxx.parachute[0] and getAmmo(46) < 1  then parashut  = ' парашют' else parashut = '' end
        if xxx.desertEagle[0] and getAmmo(24) < 63 then Deagle = ' Desert Eagle'  else Deagle = '' end
        if xxx.m4a1[0] and getAmmo(31) < 300 then M4 = ' M4A1' else M4 = '' end
        if xxx.smg[0] and getAmmo(29) < 180 then SMG = ' SMG' else SMG = '' end 
        if xxx.shotgun[0] and getAmmo(25) < 30 then SHOTGUN = ' Shotgun'  else SHOTGUN = '' end 
        if xxx.rifle[0] and getAmmo(33) < 30 then RIFLE = ' Rifle'  else RIFLE = '' end
        
          
            lua_thread.create(function()
            if pickupId == 1815 and bron == '' and Deagle == '' and M4 == '' and SMG == '' and SHOTGUN == '' and RIFLE == '' and parashut == '' then sampAddChatMessage('Вам не требуются боеприпасы', 0xFFFFFFF) elseif  pickupId == 1815 then wait(1400) sampSendChat('/me взял со склада'..bron..Deagle..M4..SMG..SHOTGUN..RIFLE..parashut)  end
            if pickupId == 1826 and bron == '' and Deagle == '' and M4 == '' and SMG == '' and SHOTGUN == '' and RIFLE == '' and parashut == '' then sampAddChatMessage('Вам не требуются боеприпасы', 0xFFFFFFF) elseif  pickupId == 1826 then wait(1400) sampSendChat('/me взял со склада'..bron..Deagle..M4..SMG..SHOTGUN..RIFLE..parashut)  end
            if pickupId == 1814 and bron == '' and Deagle == '' and M4 == '' and SMG == '' and SHOTGUN == '' and RIFLE == '' and parashut == '' then sampAddChatMessage('Вам не требуются боеприпасы', 0xFFFFFFF) elseif  pickupId == 1814 then wait(1400) sampSendChat('/me взял со склада'..bron..Deagle..M4..SMG..SHOTGUN..RIFLE..parashut)  end
            if pickupId == 1817 and bron == '' and Deagle == '' and M4 == '' and SMG == '' and SHOTGUN == '' and RIFLE == '' and parashut == '' then sampAddChatMessage('Вам не требуются боеприпасы', 0xFFFFFFF) elseif  pickupId == 1817 then wait(1400) sampSendChat('/me взял со склада'..bron..Deagle..M4..SMG..SHOTGUN..RIFLE..parashut)  end
            if pickupId == 1816 and bron == '' and Deagle == '' and M4 == '' and SMG == '' and SHOTGUN == '' and RIFLE == '' and parashut == '' then sampAddChatMessage('Вам не требуются боеприпасы', 0xFFFFFFF) elseif  pickupId == 1816 then wait(1400) sampSendChat('/me взял со склада'..bron..Deagle..M4..SMG..SHOTGUN..RIFLE..parashut)  end
             
            end)
        
            
        
            

    end
    

end








function sampev.onServerMessage(color, text)
    if text == " Рабочий день начат" and color == 1790050303 and hyita[0] then
        lua_thread.create(function()
            wait(1500)
            sampSendChat('/'..settings.cmd.hahaha..' '..settings.nigger.clist..' ')
        end)
    end 
    ----------------------------- БЛОКИРОВЩИК РЕКЛАМЫ -----------------------------
    if color == 14221567 and string.find (text,'Объявление:',1,true) and block[0] then 
        return false
        end
        if color == 14221567 and string.find (text,'Редакция News',1,true) and block[0] then 
        return false
        end
    
    ---------------------------БЛОКИРОВЩИК АДМИНЧАТА----------------------------
    
    if color == -10270721 and string.find (text,'Администратор:',1,true) and admin[0] then 
        return false
        end
        if color == -10270721 and string.find (text,'бан чата',1,true) and admin[0] then 
        return false
        end
    

 ------------------------Блокировка новостей--------------------------------------
    if color == 641859327 and string.find (text,'[Новости]:',1,true) and qqq[0] then 
        return false
        end
        if color == -1 and string.find (text,'-----------=== Государственные Новости ===-----------',1,true) and qqq[0] then 
        return false
        end
        if color == 641859327 and string.find (text,'Новости:',1,true) and qqq[0] then 
        return false
        end
   ----------------------------------ЦВЕТНЫЕ НИКИ В ЧАТЕ-----------------------------
    if text:find("%w+_%w+%[%d+%]%: .*") and checkboxone[0] then
        local nick = text:match("(%w+_%w+)%[%d+%]%:")
        local hexcolorchat = bit.tohex(bit.rshift(color, 8), 6)
        local id = sampGetPlayerIdByNickname(nick)
        local hexplayercolor = ("%06X"):format(bit.band(sampGetPlayerColor(id), 0xFFFFFF))
        text = text:gsub(nick, "{"..string.upper(hexplayercolor).."}"..nick.."{"..string.upper(hexcolorchat).."}")
        
        return {color, text}
    end
    ------------------------поставки-----------------------------
    if color == -65281 and text:find("На складе Army LV: %d+/%d+") then  
        kg =text:match('%d+/%d+')
    end
    if color == -65281 and text:find("На складе Army LV: %d+/%d+") then  
        p = p + 1
        settings.postav.pstats = p 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    ------------------паспорт------------------------------------
    if color == -169954305 and text:find("Имя: %w+_%w+" ) then
        imyaname = text:match('%w+_%w+')
    end
    if color == -169954305 and string.find (text,'Организация: Army SF   Должность: Ст.Матрос',1,true) then 
        z = 3
        settings.zvan.frank = z 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if color == -169954305 and string.find (text,'Организация: Army SF   Должность: Старшина',1,true) then 
        z = 4
        settings.zvan.frank = z 
        inicfg.save(settings, 'ArmyHelper.ini')  
    end
    if color == -169954305 and string.find (text,'Организация: Army SF   Должность: Мл.Мичман',1,true) then 
        z = 5
        settings.zvan.frank = z 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if color == -169954305 and string.find (text,'Организация: Army SF   Должность: Мичман',1,true) then
        z = 6
        settings.zvan.frank = z 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if color == -169954305 and string.find (text,'Организация: Army SF   Должность: Ст.Мичман',1,true) then 
        z = 7
        settings.zvan.frank = z 
        inicfg.save(settings, 'ArmyHelper.ini')    
    end 
    if color == -169954305 and string.find (text,'Организация: Army SF   Должность: Мл.Лейтенант',1,true) then 
        z = 8
        settings.zvan.frank = z 
        inicfg.save(settings, 'ArmyHelper.ini') 
    end
    if color == -169954305 and string.find (text,'Организация: Army SF   Должность: Лейтенант',1,true) then 
        z = 9
        settings.zvan.frank = z 
        inicfg.save(settings, 'ArmyHelper.ini')  
    end
    if color == -169954305 and string.find (text,'Организация: Army SF   Должность: Ст.Лейтенант',1,true) then 
        z = 10
        settings.zvan.frank = z 
        inicfg.save(settings, 'ArmyHelper.ini') 
    end
    if color == -169954305 and string.find (text,'Организация: Army SF   Должность: Капитан-Лейтенант',1,true) then 
        z = 11
        settings.zvan.frank = z 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if color == -169954305 and string.find (text,'Организация: Army SF   Должность: Капитан 1го Ранга',1,true) then 
        z = 12
        settings.zvan.frank = z 
        inicfg.save(settings, 'ArmyHelper.ini')   
    end
    if color == -169954305 and string.find (text,'Организация: Army SF   Должность: Контр-Адмирал',1,true) then 
        z = 13
        settings.zvan.frank = z 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if color == -169954305 and string.find (text,'Организация: Army SF   Должность: Вице-Адмирал',1,true) then 
        z = 14
        settings.zvan.frank = z 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
    if color == -169954305 and string.find (text,'Организация: Army SF   Должность: Адмирал',1,true) then 
        settings.zvan.frank = 15 
        inicfg.save(settings, 'ArmyHelper.ini')
    end
---------------------------VIP ADDBLOCK-------------------------------------
if color == 780883967 and string.find (text,'VIP Объявление:',1,true) and lll[0] then return false end
if color == 780883967 and string.find (text,'Редакция News',1,true) and lll[0] then return false end
------------------------------  -1920073729 цвет r чата ---------------------------------


        
end

function SE.onSendChat(text)
    if text:match("#surname#") then
        local Data = {}
        local imya = sampGetPlayerIdByNickname(imyaname)
        table.insert(Data, tostring(sampGetPlayerNickname(imya):gsub('(.*_)', '')))
        text = text:gsub("#surname#", table.concat(Data, ", "))

    end

    if text:match("#id#") then
        local _, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
        text = text:gsub("#id#", id)
    end

    

    if text:match("#kilo#") then
        if kg~=nil then
        text = text:gsub("#kilo#", kg)
        else
        sampAddChatMessage('[ArmyHelper]: Информация о разгрузке отсутствует', 0xFFFFFFF)
        return false
        end
    end
 
    if text:match("#kv#") then
        if KV~=nil then
            text = text:gsub("#kv#", KV)
        else
            sampAddChatMessage("[ArmyHelper]: Вы вне карты.", 0xFFFFFFF)  
            return false
        end
    end

    return {text}
end



function SE.onSendCommand(text)

    if text:match("#surname#") then
        local Data = {}
        local imya = sampGetPlayerIdByNickname(imyaname)
        table.insert(Data, tostring(sampGetPlayerNickname(imya):gsub('(.*_)', '')))
        text = text:gsub("#surname#", table.concat(Data, ", "))

    end
    
    if text:match("#id#") then
        local _, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
        text = text:gsub("#id#", id)
    end

  


    if text:match("#kilo#") then
        if kg~=nil then
        text = text:gsub("#kilo#", kg)
        else
        sampAddChatMessage('[ArmyHelper]: Информация о разгрузке отсутствует', 0xFFFFFFF)
        return false
        end
     
    end

      if text:match("#kv#") then
          if KV~=nil then
              text = text:gsub("#kv#", KV)
          else
              sampAddChatMessage("[ArmyHelper]: Вы вне карты.", 0xFFFFFFF)  
              return false
          end
      end

  
    return {text}
end


function imgui.CenterText(text)
    imgui.SetCursorPosX(imgui.GetWindowWidth()/2-imgui.CalcTextSize(u8(text)).x/2)
    imgui.Text(u8(text))
end



function sampev.onSendGiveDamage(playerId, damage, weapon, bodypart) 
    lua_thread.create(function()
    if sampIsLocalPlayerSpawned(playerId) and negr[0] then 
        if sampGetPlayerHealth(playerId) - damage <= 0 then 
           wait(3000)
                sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Противник ликвидирован в квадрате: '..KV) 
            wait(3000)
                sampSendChat('/') 
        end
    end end)
end



function main()
    while not isSampAvailable() do wait(10000) end
    sampAddChatMessage('ArmyHelper: Готов к работе. Активация: /ah ', 0xFFFFFFF )
    loadImGuiHotkeys()
    loadHotkeys()
    
    downloadUrlToFile(update_url, update_path, function(id, status)
        
        if status == dlstatus.STATUS_ENDDOWNLOADDATA then 
            updateIni = inicfg.load(nil, update_path)
            if tonumber(updateIni.info.vers) > script_vers then sampAddChatMessage('Доступно обновление', -1) 
                update_state = true 
            end
            os.remove(update_path)
        end

    end)

 sampRegisterChatCommand('ah', function() windows[0] = not windows[0] end)
    sampRegisterChatCommand(settings.cmd.hyi, function(params) sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' '..params) end)
    
    sampRegisterChatCommand('clcolor', function()
        cst = sampGetPlayerColor(351)
        sampAddChatMessage(cst, -1)
    end)
    
   
    
    sampRegisterChatCommand('mask', function(text) sampSendChat('/clist 32') 
        lua_thread.create(function()
        wait(1000)
        sampSendChat('/do На лице маска. Опознавательные знаки отсутствуют. Личность опознать невозможно.')
        end) end )

       
    while true do wait(0)
        if wasKeyPressed(VK_L) and not sampIsCursorActive() then wait(300) sampSendChat('/lock') end
        if proz[0] then sex[0] = true else sex[0] = false end
        
        if wasKeyPressed(VK_R) and wasKeyPressed(0x12) and not sampIsCursorActive() then lua_thread.create(function() sampSetChatInputEnabled(true) wait(100)
            sampSetChatInputText("/r ") end) end


           

            
            

        playsec = playsec + 1
			if playsec == 60 and playmin then
				playmin = playmin + 1
				playsec = 0
			end
			if playmin == 60 then
				playhours = playhours + 1
				playmin = 0
			end



       local _, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
        porno = sampGetPlayerColor(id)
        
        if porno == 16777215 and wasKeyPressed(VK_B) and not sampIsCursorActive() then
            lua_thread.create(function()
                 sampSendChat('/'..settings.cmd.hahaha..' '..settings.nigger.clist..' ')
                wait(1000)
                sampSendChat('/me надел повязку №'..settings.nigger.clist)
                 end)
                
                elseif porno ~= 16777215 and wasKeyPressed(VK_B) and not sampIsCursorActive() then 
                    lua_thread.create(function() sampSendChat('/clist 0')
                        wait(1000)
                        sampSendChat('/me отключил GPS-трекер')
                      end)
        
                end
        local x, y, z = getCharCoordinates(PLAYER_PED)
           
           local dist = getDistanceBetweenCoords3d(x, y, z, -1468, 1490,8)
           local lva = getDistanceBetweenCoords3d(x, y, z, 355, 2029,24)
           
            if dist > 200 and dist < 201 and autoCarm[0]  then wait(1000)
                sampSendChat('/carm') 
            end
            if lva > 200 and lva < 201 and autoCarm[0]  then wait(1000)
                sampSendChat('/carm') 
            end
    
            if dist > 200 and dist < 203  then carmResponse = 0 end
            if dist < 100 then carmResponse = 1 end
            if lva > 200 and lva < 203  then carmResponse = 2 end
            if lva < 100 then carmResponse = 1 end
            
  
        if isCharInAnyCar(PLAYER_PED) then 
            local carhandle = storeCarCharIsInNoSave(PLAYER_PED)
            local idcar = getCarModel(carhandle) 
            
            if idcar == 548 and wasKeyPressed(VK_2)  then 
               
                printStringNow('Press N', 10000)
            end
            if isKeyDown(VK_N) and idcar == 548 and not sampIsCursorActive() then jopa[0] = true else jopa[0] = false end
           end
           
   
        
           
  
       
         local xCoord, yCoord, zCoord = getCharCoordinates(PLAYER_PED)
           
         if yCoord<3000 and yCoord>-3000 and xCoord<3000 and xCoord>-3000 then
             KV = kvl[math.ceil((yCoord * - 1 + 3000) / 250)] .. "-" .. math.ceil((xCoord + 3000) / 250)
         end
  
           
  
   if isCharDead(PLAYER_PED) and hyita[0] then wait(7000) 
    sampSendChat('/'..settings.cmd.hahaha..' '..settings.nigger.clist..' ') end
    if wasKeyPressed(VK_F2) and not sampIsCursorActive() then qwerty[0] = not qwerty[0] end
    
    
    if wasKeyPressed(VK_1) and qwerty[0] and not sampIsCursorActive() then -- заступление на пост
    
      sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Заступил на пост: '..possst[ComboTest[0]]..'.'..' Состав: '..kol[0]..'.'..' '..geyporno[kod[0]] )
       
    
    end
    if wasKeyPressed(VK_2) and qwerty[0] and not sampIsCursorActive() then -- Cостояние поста
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Пост: '..possst[ComboTest[0]]..'.'..' Состав: '..kol[0]..'.'..' '..geyporno[kod[0]] )
    end

    if wasKeyPressed(VK_3) and qwerty[0] and not sampIsCursorActive() then -- Покинул пост
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' Покинул пост: '..possst[ComboTest[0]]..'.'..' Причина: '..suka[ppp[0]] )
    end

    if wasKeyPressed(VK_4) and qwerty[0] and settings.zvan.frank == 3 and not sampIsCursorActive() and imyaname ~= nil then  
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' '..' В расположение части прибыл ' ..settings.zvan.stmatros..' #surname#')
    end

    if wasKeyPressed(VK_4) and qwerty[0] and settings.zvan.frank == 4 and not sampIsCursorActive() and imyaname ~= nil then  
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' '..' В расположение части прибыл '..settings.zvan.starshina..' #surname#')
    end

    if wasKeyPressed(VK_4) and qwerty[0] and settings.zvan.frank == 5 and not sampIsCursorActive() and imyaname ~= nil then  
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' '..' В расположение части прибыл '..settings.zvan.mlmichman..' #surname#')
    end

    if wasKeyPressed(VK_4) and qwerty[0] and settings.zvan.frank == 6 and not sampIsCursorActive() and imyaname ~= nil then  
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' '..' В расположение части прибыл '..settings.zvan.michman..' #surname#')
    end

    if wasKeyPressed(VK_4) and qwerty[0] and settings.zvan.frank == 7 and not sampIsCursorActive() and imyaname ~= nil then  
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' '..' В расположение части прибыл '..settings.zvan.stmich..' #surname#')
    end 

    if wasKeyPressed(VK_4) and qwerty[0] and settings.zvan.frank == 8 and not sampIsCursorActive() and imyaname ~= nil then  
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' '..' В расположение части прибыл '..settings.zvan.mlleit..' #surname#')
    end

    if wasKeyPressed(VK_4) and qwerty[0] and settings.zvan.frank == 9 and not sampIsCursorActive() and imyaname ~= nil then  
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' '..' В расположение части прибыл '..settings.zvan.leit..' #surname#')
    end

    if wasKeyPressed(VK_4) and qwerty[0] and settings.zvan.frank == 10 and not sampIsCursorActive() and imyaname ~= nil then  
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' '..' В расположение части прибыл '..settings.zvan.stleit..' #surname#')
    end

    if wasKeyPressed(VK_4) and qwerty[0] and settings.zvan.frank == 11 and not sampIsCursorActive() and imyaname ~= nil then  
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' '..' В расположение части прибыл '..settings.zvan.kapleit..' #surname#')
    end

    if wasKeyPressed(VK_4) and qwerty[0] and settings.zvan.frank == 12 and not sampIsCursorActive() and imyaname ~= nil then  
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' '..' В расположение части прибыл '..settings.zvan.kap1..' #surname#')
    end

    if wasKeyPressed(VK_4) and qwerty[0] and settings.zvan.frank == 13 and not sampIsCursorActive() and imyaname ~= nil then  
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' '..' В расположение части прибыл '..settings.zvan.kontr..' #surname#')
    end

    if wasKeyPressed(VK_4) and qwerty[0] and settings.zvan.frank == 14 and not sampIsCursorActive() and imyaname ~= nil then  
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' '..' В расположение части прибыл '..settings.zvan.vice..' #surname#')
    end

    if wasKeyPressed(VK_4) and qwerty[0] and settings.zvan.frank == 15 and not sampIsCursorActive() and imyaname ~= nil then  
        sampSendChat('/'..settings.cmd.hyi..' '..settings.nigger.inputsaved..' '..' В расположение части прибыл '..settings.zvan.admiral..' #surname#')
    end

    if update_state then
    downloadUrlToFile(script_url, script_path, function(id, status)
        
        if dlstatus == dlstatus.STATUS_ENDDOWNLOADDATA then 
            sampAddChatMessage('Скрипт обновлен', -1)
            thisScript():reload()
        end

    end)
    break
    end

    end

end


function sampev.onApplyPlayerAnimation(playerId, animLib, animName, frameDelta, loop, lockX, lockY, freeze, time)
    name = sampGetPlayerNickname(playerId) 
    local myid = select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)) 
    if animName == 'M_smk_drag' and playerId ~= myid and nar[0]  then sampAddChatMessage('Игрок '..name..'['..playerId..']'..' употребил психохил/наркотики', 0xFFFFFFF) end
    
end



pritch = {
    [0] = 'краш',
    [1] = '/q',         
    [2] = 'кикнул сервер'
}

    
function sampev.onPlayerQuit(playerid,reason)
    
    
    if  select(1, sampGetCharHandleBySampPlayerId(playerid)) and qu[0] then
        zaebumba = sampGetPlayerNickname(playerid)
        sampAddChatMessage('Игрок '..zaebumba..'['..playerid..']'..' отключился от сервера. Причина: '..pritch[reason]..'', 0xFFFFFFF)
        
    end
end








