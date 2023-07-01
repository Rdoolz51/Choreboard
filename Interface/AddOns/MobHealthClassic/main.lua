
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED");
frame:RegisterEvent("UNIT_HEALTH");
frame:RegisterEvent("PLAYER_ENTERING_WORLD");
frame:RegisterEvent("UNIT_POWER_FREQUENT");
frame:RegisterEvent("PLAYER_TARGET_CHANGED");

local mobHealthTextFrame = frame:CreateFontString(nil, "OVERLAY", "ChatFontSmall")
mobHealthTextFrame:SetPoint("CENTER",_G["TargetFrameHealthBar"],"CENTER",0,0)
mobHealthTextFrame:Hide()

local mobPowerTextFrame = frame:CreateFontString(nil, "OVERLAY", "ChatFontSmall")
mobPowerTextFrame:SetPoint("CENTER",_G["TargetFrameManaBar"],"CENTER",0,0)
mobPowerTextFrame:Hide()

local function show()
  mobHealthTextFrame:Show()
  if MobHealthClassicSetting.showPower then
    mobPowerTextFrame:Show()
  else
    mobPowerTextFrame:Hide()
  end
end

local function hideBoth()
  mobHealthTextFrame:Hide()
  mobPowerTextFrame:Hide()
end

local function updateHealth()
  local hp = UnitHealth("target")
  local maxhp = UnitHealthMax("target")
  local percentage = math.floor((hp/maxhp)*100)
  if hp >= 1000000 then
    hp = format("%.1fm", hp / 1000000)
  elseif hp >= 10000 then
    hp = format("%.1fk", hp / 1000)
  end
  if MobHealthClassicSetting.showPercentage then
    mobHealthTextFrame:SetText(format("%s (%s)", hp, percentage))
  else
    mobHealthTextFrame:SetText(hp)
  end
end

local function updatePower()
  local powerType = UnitPowerType("target")
  local value = UnitPower("target")
  if powerType == 0 then
    local maxValue = UnitPowerMax("target")
    local percentage = math.floor((value/maxValue)*100)
    if value >= 1000000 then
      value = format("%.1fm", value / 1000000)
    elseif value >= 10000 then
      value = format("%.1fk", value / 1000)
    end
	if MobHealthClassicSetting.showPercentage then
      mobPowerTextFrame:SetText(format("%s (%s)", value, percentage))
	else
	  mobPowerTextFrame:SetText(value)
	end
  else
    mobPowerTextFrame:SetText(value)
  end
end

local function update()
  if not UnitExists("target") then
     hideBoth()
   else
     if UnitIsDead("target") then
       hideBoth()
     else 
       show()
	   updateHealth()
	   if MobHealthClassicSetting.showPower then
	     updatePower()
	   end
     end
   end
end

local function handleUnitEvent(who)
   if who == "target" then
     update()
   end
end

local function initUi()
	local optionsFrame = CreateFrame( "Frame", "optionsFrame", UIParent );
	optionsFrame.name = "MobHealthClassic";
	InterfaceOptions_AddCategory(optionsFrame);
	
	if MobHealthClassicSetting == nil then
	  MobHealthClassicSetting = {showPower=true, showPercentage=true}
	end
	
	local showPowerButton = CreateFrame("CheckButton", "ShowPowerButton", optionsFrame, "UICheckButtonTemplate")
	showPowerButton:SetPoint("TOPLEFT",0,0)
	showPowerButton.text:SetText("Show mana/rage/energy value")
	showPowerButton:SetChecked(MobHealthClassicSetting.showPower)
	showPowerButton:SetScript("OnClick",function() MobHealthClassicSetting.showPower=not MobHealthClassicSetting.showPower update() end)
	
	local showPercentageButton = CreateFrame("CheckButton", "ShowPercentageButton", optionsFrame, "UICheckButtonTemplate")
	showPercentageButton:SetPoint("TOPLEFT",0,-30)
	showPercentageButton.text:SetText("Show percentages")
	showPercentageButton:SetChecked(MobHealthClassicSetting.showPercentage)
	showPercentageButton:SetScript("OnClick",function() MobHealthClassicSetting.showPercentage=not MobHealthClassicSetting.showPercentage update() end)
	  
end

local eventHandle=function(self, event, arg1, ...)
   if event == "ADDON_LOADED" and arg1 == "MobHealthClassic" then
	 initUi()
   elseif event == "PLAYER_ENTERING_WORLD" then
     hideBoth()
   elseif event == "PLAYER_TARGET_CHANGED" then
     update()
   elseif event == "UNIT_HEALTH" or event == "UNIT_POWER_FREQUENT" then
     handleUnitEvent(arg1)
   end
end

frame:SetScript("OnEvent", eventHandle)

