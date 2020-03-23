--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- FONCTIONS DE BASE POUR LE MENU

RMenu.Add('showcase', 'main', RageUI.CreateMenu("Ademo", "Undefined for using SetSubtitle"))
RMenu.Add('showcase', 'submenu', RageUI.CreateSubMenu(RMenu:Get('showcase', 'main'), "RageUI", "~b~RAGEUI SHOWCASE", nil, nil, "casinoui_roulette_high", "casinoui_roulette_high"))

RMenu:Get('showcase', 'main'):SetSubtitle("~b~Ademo")
RMenu:Get('showcase', 'main').EnableMouse = true
RMenu:Get('showcase', 'main').Closed = function()
    -- TODO Perform action
end;

RageUI.CreateWhile(1.0, true, function()

    if IsControlJustPressed(1, 51) then
        RageUI.Visible(RMenu:Get('showcase', 'main'), not RageUI.Visible(RMenu:Get('showcase', 'main')))
    end

    if RageUI.Visible(RMenu:Get('showcase', 'main')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
            ---Items
        end, function()
            ---Panels
        end)
    end

    if RageUI.Visible(RMenu:Get('showcase', 'submenu')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
            ---Items
        end, function()
            ---Panels
        end)
    end

end, 1)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- ITEMS


local index = {}  -- a ne pas repeter
index.ketchup = false

RageUI.Checkbox("Add ketchup ?", "Do you wish to add ketchup ?", index.ketchup, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked) -- Checkbox
    if (Hovered) then

    end
    if (Active) then

    end
    if (Selected) then
        RageUI.Text({
            message = string.format("~r~Ketchup status: ~b~%s", tostring(index.ketchup))
        })
    end
    index.ketchup = Checked;
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---- Slidebar

local foods = {  -- slidebar pour ligne 51
    "zbo",
    "zbi",
    "zbe",
    "zbu",
}

local index = {}  -- a ne pas repeter
index.dish = 1

RageUI.List("Czon", foods, index.dish, "Select the type of food you want to eat.", {}, true, function(Hovered, Active, Selected, Index)   -- Slidebar
    if (Hovered) then

    end
    if (Active) then
        RageUI.Text({
            message = string.format("Preparing ~b~%s~w~...", foods[index.dish])
        })
    end
    if (Selected) then

    end
    index.dish = Index;
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Slider NUI

local index = {}  -- a ne pas repeter
index.quantity = 0

RageUI.Slider("Quantity", index.quantity, 10, "Select the amount of food you want to eat.", false, { }, true, function(Hovered, Selected, Active, Index)  
    if (Hovered) then

    end
    if (Selected) then
        RageUI.Text({
            message = string.format("Preparing ~r~%s ~b~%s(s)~w~...", index.quantity, foods[index.dish])
        })
    end
    if (Active) then

    end
    index.quantity = Index;
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Button

RageUI.Button("Cook !", "Cook the dish with the appropriate ingredients and ketchup.", { RightBadge = RageUI.BadgeStyle.Tick }, true, function(Hovered, Active, Selected)  
    if (Hovered) then

    end
    if (Active) then

    end
    if (Selected) then
        local string = string.format("You have ordered ~r~%s ~b~%s(s)~w~ ~r~with~w~ ketchup.", index.quantity, foods[index.dish])
        if not (index.ketchup) then
            string = string.format("You have ordered ~r~%s ~b~%s(s)~w~ ~r~without~w~ ketchup.", index.quantity, foods[index.dish])
        end
        RageUI.Text({
            message = string;
        })
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Go SubMenu

RageUI.Button("Another Menu", "Sample description that takes more than one line. Moreso, it takes way more than two lines since it's so long. Wow, check out this length !", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
    if (Hovered) then

    end
    if (Active) then

    end
    if (Selected) then

    end
end, RMenu:Get('showcase', 'submenu'))