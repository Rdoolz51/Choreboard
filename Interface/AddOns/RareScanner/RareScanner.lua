-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local LibStub = _G.LibStub
local RareScanner = LibStub("AceAddon-3.0"):NewAddon("RareScanner")

local ADDON_NAME, private = ...

-- Locales
local AL = LibStub("AceLocale-3.0"):GetLocale("RareScanner");

-- LibAbout frames
local LibAboutPanel = LibStub:GetLibrary("LibAboutPanel-2.0", true)

-- RareScanner database libraries
local RSNpcDB = private.ImportLib("RareScannerNpcDB")
local RSContainerDB = private.ImportLib("RareScannerContainerDB")
local RSGeneralDB = private.ImportLib("RareScannerGeneralDB")
local RSConfigDB = private.ImportLib("RareScannerConfigDB")
local RSMapDB = private.ImportLib("RareScannerMapDB")

-- RareScanner internal libraries
local RSConstants = private.ImportLib("RareScannerConstants")
local RSLogger = private.ImportLib("RareScannerLogger")
local RSTimeUtils = private.ImportLib("RareScannerTimeUtils")
local RSUtils = private.ImportLib("RareScannerUtils")
local RSRoutines = private.ImportLib("RareScannerRoutines")

-- RareScanner services
local RSRespawnTracker = private.ImportLib("RareScannerRespawnTracker")
local RSNotificationTracker = private.ImportLib("RareScannerNotificationTracker")
local RSRecentlySeenTracker = private.ImportLib("RareScannerRecentlySeenTracker")
local RSMap = private.ImportLib("RareScannerMap")
local RSMinimap = private.ImportLib("RareScannerMinimap")
local RSLoot = private.ImportLib("RareScannerLoot")
local RSAudioAlerts = private.ImportLib("RareScannerAudioAlerts")
local RSEventHandler = private.ImportLib("RareScannerEventHandler")

-- RareScanner other addons integration services
local RSTomtom = private.ImportLib("RareScannerTomtom")

-- Main button
local scanner_button = CreateFrame("Button", "scanner_button", UIParent, BackdropTemplateMixin and "BackdropTemplate,SecureActionButtonTemplate")
scanner_button:Hide();
scanner_button:SetIgnoreParentScale(true)
scanner_button:SetFrameStrata("MEDIUM")
scanner_button:SetFrameLevel(200)
scanner_button:SetSize(200, 50)
scanner_button:SetScale(0.8)
scanner_button:RegisterForClicks("RightButtonUp", "LeftButtonUp")
scanner_button:SetAttribute("*type1", "macro")
scanner_button:SetAttribute("*type2", "closebutton")
scanner_button.closebutton = function(self)
	if (not InCombatLockdown()) then
		self.CloseButton:Click()
	end
end
scanner_button:SetNormalTexture([[Interface\AchievementFrame\UI-Achievement-Parchment-Horizontal-Desaturated]])
scanner_button:SetBackdrop({ tile = true, edgeSize = 16, edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]] })
scanner_button:SetBackdropBorderColor(0, 0, 0)
scanner_button:SetPoint("BOTTOM", UIParent, 0, 128)
scanner_button:SetMovable(true)
scanner_button:SetUserPlaced(true)
scanner_button:SetClampedToScreen(true)
scanner_button:RegisterForDrag("LeftButton")

scanner_button:SetScript("OnDragStart", function(self)
	if (not RSConfigDB.IsLockingPosition()) then
		self:StartMoving()
	end
end)
scanner_button:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
	RSGeneralDB.SetButtonPositionCoordinates(self:GetLeft(), self:GetBottom())
end)
scanner_button:SetScript("OnEnter", function(self)
	self:SetBackdropBorderColor(0.9, 0.9, 0.9)
end)
scanner_button:SetScript("OnLeave", function(self)
	self:SetBackdropBorderColor(0, 0, 0)
end)
scanner_button:SetScript("OnHide", function(self)
	self.npcID = nil
	self.name = nil
	self.NextButton:Reset()
	self.PreviousButton:Reset()
end)

-- Model view
scanner_button.ModelView = CreateFrame("PlayerModel", "mxpplayermodel", scanner_button)
scanner_button.ModelView:ClearAllPoints()
scanner_button.ModelView:SetPoint("TOP", 0 , 122) -- bottom left corner 2px separation from scanner_button's top left corner
scanner_button.ModelView:SetSize(120, 120)
scanner_button.ModelView:SetScale(1.25)

local Background = scanner_button:GetNormalTexture()
Background:SetDrawLayer("BACKGROUND")
Background:ClearAllPoints()
Background:SetPoint("BOTTOMLEFT", 3, 3)
Background:SetPoint("TOPRIGHT", -3, -3)
Background:SetTexCoord(0, 1, 0, 0.25)

-- Title
local TitleBackground = scanner_button:CreateTexture(nil, "BORDER")
TitleBackground:SetTexture([[Interface\AchievementFrame\UI-Achievement-RecentHeader]])
TitleBackground:SetPoint("TOPRIGHT", -5, -7)
TitleBackground:SetPoint("LEFT", 5, 0)
TitleBackground:SetSize(180, 10)
TitleBackground:SetTexCoord(0, 1, 0, 1)
TitleBackground:SetAlpha(0.8)

scanner_button.Title = scanner_button:CreateFontString(nil, "OVERLAY", "GameFontNormal", 1)
scanner_button.Title:SetNonSpaceWrap(true)
scanner_button.Title:SetPoint("TOPLEFT", TitleBackground, 0, 0)
scanner_button.Title:SetPoint("RIGHT", TitleBackground)
scanner_button.Title:SetTextColor(1, 1, 1, 1)
scanner_button:SetFontString(scanner_button.Title)

local Description = scanner_button:CreateFontString(nil, "OVERLAY", "SystemFont_Tiny")
Description:SetPoint("BOTTOMLEFT", TitleBackground, 0, -12)
Description:SetPoint("RIGHT", -8, 0)
Description:SetTextHeight(6)
Description:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)

scanner_button.Description_text = scanner_button:CreateFontString(nil, "OVERLAY", "GameFontWhiteTiny")
scanner_button.Description_text:SetPoint("TOPLEFT", Description, "BOTTOMLEFT", 0, -4)
scanner_button.Description_text:SetPoint("RIGHT", Description)

-- Close button
scanner_button.CloseButton = CreateFrame("Button", "CloseButton", scanner_button, "UIPanelCloseButton")
scanner_button.CloseButton:SetPoint("BOTTOMRIGHT")
scanner_button.CloseButton:SetSize(32, 32)
scanner_button.CloseButton:SetScale(0.8)
scanner_button.CloseButton:SetHitRectInsets(8, 8, 8, 8)

-- Filter disabled button
scanner_button.FilterDisabledButton = CreateFrame("Button", "FilterDisabledButton", scanner_button, "GameMenuButtonTemplate")
scanner_button.FilterDisabledButton:SetPoint("BOTTOMLEFT", 5, 5)
scanner_button.FilterDisabledButton:SetSize(16, 16)
scanner_button.FilterDisabledButton:SetNormalTexture([[Interface\WorldMap\Dash_64]])
scanner_button.FilterDisabledButton:SetScript("OnClick", function(self)
	local npcID = self:GetParent().npcID
	if (npcID) then
		if (RSConstants.IsNpcAtlas(self:GetParent().atlasName)) then
			RSConfigDB.SetNpcFiltered(npcID, false)
			RSLogger:PrintMessage(AL["DISABLED_SEARCHING_RARE"]..self:GetParent().Title:GetText())
		else
			RSConfigDB.SetContainerFiltered(npcID, false)
			RSLogger:PrintMessage(string.format(AL["DISABLED_SEARCHING_CONTAINER"], self:GetParent().Title:GetText()))
		end
		
		self:Hide()
		self:GetParent().FilterEnabledButton:Show()
	end
end)
scanner_button.FilterDisabledButton:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
	if (RSConstants.IsNpcAtlas(self:GetParent().atlasName)) then
		GameTooltip:SetText(AL["DISABLE_SEARCHING_RARE_TOOLTIP"])
	else
		GameTooltip:SetText(AL["DISABLE_SEARCHING_CONTAINER_TOOLTIP"])
	end
	GameTooltip:Show()
end)

scanner_button.FilterDisabledButton:SetScript("OnLeave", function(self)
	GameTooltip:Hide()
end)

-- Filter enabled button
scanner_button.FilterEnabledButton = CreateFrame("Button", "FilterEnabledButton", scanner_button, "GameMenuButtonTemplate")
scanner_button.FilterEnabledButton:SetPoint("BOTTOMLEFT", 5, 5)
scanner_button.FilterEnabledButton:SetSize(16, 16)
scanner_button.FilterEnabledButton:SetScript("OnClick", function(self)
	local npcID = self:GetParent().npcID
	if (npcID) then
		if (RSConstants.IsNpcAtlas(self:GetParent().atlasName)) then
			RSConfigDB.SetNpcFiltered(npcID, true)
			RSLogger:PrintMessage(AL["ENABLED_SEARCHING_RARE"]..self:GetParent().Title:GetText())
		else
			RSConfigDB.SetContainerFiltered(npcID, true)
			RSLogger:PrintMessage(string.format(AL["ENABLED_SEARCHING_CONTAINER"], self:GetParent().Title:GetText()))
		end
		self:Hide()
		self:GetParent().FilterDisabledButton:Show()
	end
end)
scanner_button.FilterEnabledButton:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
	if (RSConstants.IsNpcAtlas(self:GetParent().atlasName)) then
		GameTooltip:SetText(AL["ENABLE_SEARCHING_RARE_TOOLTIP"])
	else
		GameTooltip:SetText(AL["ENABLE_SEARCHING_CONTAINER_TOOLTIP"])
	end
	GameTooltip:Show()
end)

scanner_button.FilterEnabledButton:SetScript("OnLeave", function(self)
	GameTooltip:Hide()
end)

scanner_button.FilterEnabledTexture = scanner_button.FilterEnabledButton:CreateTexture()
scanner_button.FilterEnabledTexture:SetTexture([[Interface\WorldMap\Skull_64]])
scanner_button.FilterEnabledTexture:SetSize(12, 12)
scanner_button.FilterEnabledTexture:SetTexCoord(0,0.5,0,0.5)
scanner_button.FilterEnabledTexture:SetPoint("CENTER")
scanner_button.FilterEnabledButton:SetNormalTexture(scanner_button.FilterEnabledTexture)
scanner_button.FilterEnabledButton:Hide()

-- Loot bar
scanner_button.LootBar = CreateFrame("Frame", "LootBar", scanner_button)
scanner_button.LootBar.itemFramesPool = CreateFramePool("FRAME", scanner_button.LootBar, "RSLootTemplate");
scanner_button.LootBar.itemFramesPool.InitItemList = function(self, atlasName, entityID)
	self:ReleaseAll()
	
	-- Cancels previous requests
	scanner_button.LootBar:SetScript("OnUpdate", nil)
	
	if (not atlasName or not entityID) then
		return
	end
	
	local parent = self
	parent.items = {}
	parent.totalLoaded = 0

	-- Extract entity loot
	local updateCacheItemRoutine = RSRoutines.LoopRoutineNew()
	if (RSConstants.IsNpcAtlas(atlasName) and RSNpcDB.GetNpcLoot(entityID)) then
		updateCacheItemRoutine:Init(RSNpcDB.GetNpcLoot, 3, nil, nil, entityID)
		parent.totalItems = RSUtils.GetTableLength(RSNpcDB.GetNpcLoot(entityID))
	elseif (RSConstants.IsContainerAtlas(atlasName) and RSContainerDB.GetContainerLoot(entityID)) then
		updateCacheItemRoutine:Init(RSContainerDB.GetContainerLoot, 3, nil, nil, entityID)
		parent.totalItems = RSUtils.GetTableLength(RSContainerDB.GetContainerLoot(entityID))
	else
		return
	end
	
	scanner_button.LootBar:SetScript("OnUpdate", function()
		local finished = updateCacheItemRoutine:Run(function(context, _, itemID)
			if (C_Item.DoesItemExistByID(itemID)) then
				parent:UpdateCacheItem(itemID)
			else
				parent.totalItems = self.totalItems - 1
				RSLogger:PrintDebugMessage(string.format("Detectado ITEM [%s] para la entidad [%s] que no existe!.", itemID, entityID))
			end
		end)
		if (finished) then
			scanner_button.LootBar:SetScript("OnUpdate", nil)
		end
	end)
end
scanner_button.LootBar.itemFramesPool.UpdateCacheItem = function(self, itemID)
	if (not itemID or not self.items) then
		return
	end
	
	-- If enough items to show ignore the rest
	if (self.totalLoaded >= RSConfigDB.GetMaxNumItemsToShow()) then
		return
	end
	
	-- Otherwise try to add the item
	self.items[itemID] = {}
	self.items[itemID].loaded = false
	
	local item = Item:CreateFromItemID(itemID)
	if (not item) then
		return
	end
	
	item:ContinueOnItemLoad(function()
		local _, _, _, itemEquipLoc, _, itemClassID, itemSubClassID = GetItemInfoInstant(item:GetItemID())
		if (RSLoot.IsFiltered(itemID, item:GetItemLink(), item:GetItemQuality(), itemEquipLoc, itemClassID, itemSubClassID)) then
			self.items[item:GetItemID()] = nil
			self.totalItems = self.totalItems - 1
		elseif (self.items[item:GetItemID()]) then
			self.items[item:GetItemID()].loaded = true
			self.totalLoaded = self.totalLoaded + 1
		end
		
		if (self.totalLoaded >= RSConfigDB.GetMaxNumItemsToShow() and self:GetNumActive() == 0) then
			self:ShowIfReady()
		elseif (self.totalItems == self.totalLoaded) then
			self:ShowIfReady()
		end
	end)
end
scanner_button.LootBar.itemFramesPool.ShowIfReady = function(self)
	if (not self.items) then
		return
	end
	
	local currentIndex = 1
	for itemID, _ in pairs (self.items) do
		if (self.items[itemID].loaded) then
			if (currentIndex <= RSConfigDB.GetMaxNumItemsToShow()) then
				local itemFrame = self:Acquire()
				itemFrame:AddItem(itemID, self:GetNumActive())
				currentIndex = currentIndex + 1
			else
				break
			end
		end
	end
end
scanner_button.LootBar.LootBarToolTip = CreateFrame("GameTooltip", "LootBarToolTip", scanner_button, "GameTooltipTemplate")
scanner_button.LootBar.LootBarToolTip:SetScale(0.9)
scanner_button.LootBar.LootBarToolTipComp1 = CreateFrame("GameTooltip", "LootBarToolTipComp1", nil, "GameTooltipTemplate")
scanner_button.LootBar.LootBarToolTipComp1:SetScale(0.7)
scanner_button.LootBar.LootBarToolTipComp2 = CreateFrame("GameTooltip", "LootBarToolTipComp2", nil, "GameTooltipTemplate")
scanner_button.LootBar.LootBarToolTipComp2:SetScale(0.7)
scanner_button.LootBar.LootBarToolTip.shoppingTooltips = { scanner_button.LootBar.LootBarToolTipComp1, scanner_button.LootBar.LootBarToolTipComp2 }

-- Show navigation buttons
scanner_button.NextButton = CreateFrame("Frame", "NextButton", scanner_button, "RSRightNavTemplate")
scanner_button.NextButton:Hide()
scanner_button.PreviousButton = CreateFrame("Frame", "PreviousButton", scanner_button, "RSLeftNavTemplate")
scanner_button.PreviousButton:Hide()

-- Register events
RSEventHandler.RegisterEvents(scanner_button, RareScanner)

function scanner_button:SimulateRareFound(npcID, objectGUID, name, x, y, atlasName)
	local vignetteInfo = {}
	vignetteInfo.atlasName = atlasName
	vignetteInfo.id = npcID
	vignetteInfo.name = name
	vignetteInfo.objectGUID = objectGUID or string.format("a-a-a-a-a-%s-a", npcID)
	vignetteInfo.x = x
	vignetteInfo.y = y
	self:DetectedNewVignette(self, vignetteInfo)
end

-- Checks if the rare has been found already in the last 5 minutes
function scanner_button:DetectedNewVignette(self, vignetteInfo, isNavigating)
	local _, _, _, _, _, id, _ = strsplit("-", vignetteInfo.objectGUID);
	local entityID = tonumber(id)
	
	if (not entityID) then
		return
	end
	
	--RSLogger:PrintDebugMessage(string.format("Vignette ATLAS [%s]", vignetteInfo.atlasName))

	-- Check if we have already found this vignette in a short period of time
	if (RSNotificationTracker.IsAlreadyNotificated(vignetteInfo.id, isNavigating, entityID)) then
		--RSLogger:PrintDebugMessage(string.format("La entidad [%s] se ignora porque se ha avisado de esta hace menos de %s minutos", entityID, RSConfigDB.GetRescanTimer()))
		return
	end

	local mapID = C_Map.GetBestMapForUnit("player")

	if (not isNavigating) then
		-- If the vignette is simulated
		if (vignetteInfo.x and vignetteInfo.y) then
			local coordinates = {}
			coordinates.x = vignetteInfo.x
			coordinates.y = vignetteInfo.y
			RareScanner:UpdateRareFound(entityID, vignetteInfo, coordinates)
		else
			RareScanner:UpdateRareFound(entityID, vignetteInfo)
		end
	end

	local isInstance, instanceType = IsInInstance()

	-- disable ALL alerts while cinematic is playing
	if (RSEventHandler.IsCinematicPlaying()) then
		return
	-- disable ALL alerts in instances
	elseif (isInstance == true and not RSConfigDB.IsScanningInInstances()) then
		RSLogger:PrintDebugMessage(string.format("La entidad [%s] se ignora por estar en una instancia", entityID))
		return
	-- disable alerts while flying
	elseif (UnitOnTaxi("player") and not RSConfigDB.IsScanningWhileOnTaxi()) then
		RSLogger:PrintDebugMessage(string.format("La entidad [%s] se ignora por estar montado en un transporte", entityID))
		return
	-- disable scanning for every entity that is not treasure or rare
	elseif (not RSConstants.IsScanneableAtlas(vignetteInfo.atlasName)) then
		RSLogger:PrintDebugMessage(string.format("La entidad [%s] se ignora por tener el atlas [%s] que no es escaneable", entityID, vignetteInfo.atlasName))
		return
	-- disable ALL alerts for containers
	elseif (RSConstants.IsContainerAtlas(vignetteInfo.atlasName) and not RSConfigDB.IsScanningForContainers()) then
		RSLogger:PrintDebugMessage(string.format("El contenedor [%s] se ignora por haber deshabilitado alertas de contenedores", entityID))
		return
	-- disable alerts for filtered containers. Check if the container is filtered, in which case we don't show anything
	elseif (RSConstants.IsContainerAtlas(vignetteInfo.atlasName) and RSConfigDB.IsContainerFiltered(entityID) and not RSConfigDB.IsContainerFilteredOnlyOnWorldMap()) then
		RSLogger:PrintDebugMessage(string.format("El contenedor [%s] se ignora por estar filtrado", entityID))
		return
	-- disable alerts for rare NPCs
	elseif (RSConstants.IsNpcAtlas(vignetteInfo.atlasName) and not RSConfigDB.IsScanningForNpcs()) then
		RSLogger:PrintDebugMessage(string.format("El NPC [%s] se ignora por haber deshabilitado alertas de NPCs", entityID))
		return
	-- disable alerts for filtered rare NPCs. Check if the NPC is filtered, in which case we don't show anything
	elseif (RSConstants.IsNpcAtlas(vignetteInfo.atlasName) and RSConfigDB.IsNpcFiltered(entityID) and not RSConfigDB.IsNpcFilteredOnlyOnWorldMap()) then
		RSLogger:PrintDebugMessage(string.format("El NPC [%s] se ignora por estar filtrado", entityID))
		return
	-- disable alerts for filtered zones
	elseif (not RSConfigDB.IsZoneFilteredOnlyOnWorldMap() and (RSConfigDB.IsZoneFiltered(mapID) or RSConfigDB.IsEntityZoneFiltered(entityID, vignetteInfo.atlasName))) then
		RSLogger:PrintDebugMessage(string.format("La entidad [%s] se ignora por pertenecer a una zona filtrada", entityID))
		return
	-- extra checkings for containers
	elseif (RSConstants.IsContainerAtlas(vignetteInfo.atlasName)) then
		-- there is one container without name in Shadowlands
		if (not vignetteInfo.name or string.gsub(vignetteInfo.name, "", "") == "") then
			vignetteInfo.name = AL["CONTAINER"]
		end
		
		-- save containers to show it on the world map
		RSContainerDB.SetContainerName(entityID, vignetteInfo.name)

		-- disable button alert for containers
		if (not RSConfigDB.IsButtonDisplayingForContainers()) then
			RSRecentlySeenTracker.AddRecentlySeen(entityID, vignetteInfo.atlasName, false)

			-- If navigation disabled, control Tomtom waypoint externally
			if (not RSConfigDB.IsDisplayingNavigationArrows()) then
				RSTomtom.AddTomtomWaypointFromVignette(vignetteInfo)
			end

			if (RSNotificationTracker.IsAlreadyNotificated(vignetteInfo.id, false, entityID)) then
				RSLogger:PrintDebugMessage(string.format("El contenedor [%s] se ignora porque se ha avisado de esta hace menos de 2 minutos", entityID))
				return
			else
				RSNotificationTracker.AddNotification(vignetteInfo.id, false, entityID)
				FlashClientIcon()
				RSAudioAlerts.PlaySoundAlert(vignetteInfo.atlasName)
				self:DisplayMessages(vignetteInfo.preEvent and string.format(AL["PRE_EVENT"], vignetteInfo.name) or vignetteInfo.name)
				return
			end
		end
	end

	-- Sets the current vignette as new found
	RSNotificationTracker.AddNotification(vignetteInfo.id, isNavigating, entityID)

	--------------------------------
	-- show messages and play alarm
	--------------------------------
	if (not isNavigating) then
		FlashClientIcon()
		self:DisplayMessages(vignetteInfo.preEvent and string.format(AL["PRE_EVENT"], vignetteInfo.name) or vignetteInfo.name)
		RSAudioAlerts.PlaySoundAlert(vignetteInfo.atlasName)
	end

	------------------------
	-- set up new button
	------------------------
	if (RSConfigDB.IsButtonDisplaying()) then
		-- Adds the new NPCID to the navigation list
		if (RSConfigDB.IsDisplayingNavigationArrows() and not isNavigating) then
			self.NextButton:AddNext(vignetteInfo)
		end

		-- Show the button
		if (not self:IsShown() or isNavigating or not RSConfigDB.IsDisplayingNavigationArrows() or not RSConfigDB.IsNavigationLockEnabled()) then
			self.npcID = entityID
			self.name = vignetteInfo.name
			self.preEvent = vignetteInfo.preEvent
			self.atlasName = vignetteInfo.atlasName

			local npcInfo = RSNpcDB.GetInternalNpcInfo(entityID)
			self.displayID = npcInfo and npcInfo.displayID or nil

			-- Show button / miniature / loot bar if not in combat
			if (not InCombatLockdown()) then
				-- Wow API doesnt allow to call Show() (protected function) if you are under attack, so
				-- we check if this is the situation to avoid it and show the frames
				-- once the battle is over (pendingToShow)
				self:ShowButton()
			else
				-- Mark to show after combat
				self.pendingToShow = true
			end
		elseif (RSConfigDB.IsDisplayingNavigationArrows() and RSConfigDB.IsNavigationLockEnabled()) then
			-- reset the time to auto hide (so it takes into account the new entity found)
			self:StartHideTimer()

			-- Refresh the navigation arrows
			if (self.NextButton:EnableNextButton()) then
				self.NextButton:Show()
			else
				self.NextButton:Hide()
			end

			if (self.PreviousButton:EnablePreviousButton()) then
				self.PreviousButton:Show()
			else
				self.PreviousButton:Hide()
			end
		end
	end

	-- If navigation disabled, control Tomtom waypoint externally
	if (not RSConfigDB.IsButtonDisplaying() or not RSConfigDB.IsDisplayingNavigationArrows()) then
		RSTomtom.AddTomtomWaypointFromVignette(vignetteInfo)
	end

	-- Add recently seen
	RSRecentlySeenTracker.AddRecentlySeen(entityID, vignetteInfo.atlasName, isNavigating)

	-- Refresh minimap
	RSMinimap.RefreshAllData(true)
end

function RareScanner:UpdateRareFound(entityID, vignetteInfo, coordinates)
	-- Calculates all the parameters
	local atlasName

	-- If its a NPC
	local mapID = nil
	if (RSConstants.IsNpcAtlas(vignetteInfo.atlasName)) then
		atlasName = RSConstants.NPC_VIGNETTE

		-- MapID always try to get it first from the internal database
		-- GetBestMapForUnit not always returns the expected value!
		local npcInfo = RSNpcDB.GetInternalNpcInfo(entityID)
		if (RSNpcDB.IsInternalNpcMonoZone(entityID) and npcInfo.zoneID ~= 0) then
			mapID = npcInfo.zoneID
		else
			mapID = C_Map.GetBestMapForUnit("player")
		end
		-- If its a container
	elseif (RSConstants.IsContainerAtlas(vignetteInfo.atlasName)) then
		atlasName = RSConstants.CONTAINER_VIGNETTE

		-- MapID always try to get it first from the internal database
		-- GetBestMapForUnit not always returns the expected value!
		local containerInfo = RSContainerDB.GetInternalContainerInfo(entityID)
		if (RSContainerDB.IsInternalContainerMonoZone(entityID) and containerInfo.zoneID ~= 0) then
			mapID = containerInfo.zoneID
		else
			mapID = C_Map.GetBestMapForUnit("player")
		end
	else
		return
	end

	if (not mapID or mapID == 0) then
		RSLogger:PrintDebugMessage(string.format("UpdateRareFound[%s]: Error! No se ha podido calcular el mapID para la entidad recien encontrada!", entityID))
		return
	end

	-- Extract the coordinates from the parameter if we are simulating a vignette, or from a real vignette info
	local vignettePosition = nil
	if (coordinates and coordinates.x and coordinates.y) then
		vignettePosition = coordinates
	else
		vignettePosition = C_VignetteInfo.GetVignettePosition(vignetteInfo.vignetteGUID, mapID)
	end

	if (not vignettePosition) then
		RSLogger:PrintDebugMessage(string.format("UpdateRareFound[%s]: Error! No se han podido calcular las coordenadas para la entidad recien encontrada!", entityID))
		return
	end

	local artID = C_Map.GetMapArtID(mapID)

	-- Updates if it was found before
	if (RSGeneralDB.GetAlreadyFoundEntity(entityID)) then
		RSGeneralDB.UpdateAlreadyFoundEntity(entityID, mapID, vignettePosition.x, vignettePosition.y, artID, atlasName)
		-- Adds if its the first time found
	else
		RSGeneralDB.AddAlreadyFoundEntity(entityID, mapID, vignettePosition.x, vignettePosition.y, artID, atlasName)
	end
end

function scanner_button:DisplayMessages(name)
	if (name) then
		if (RSConfigDB.IsDisplayingRaidWarning()) then
			RaidNotice_AddMessage(RaidWarningFrame, string.format(AL["JUST_SPAWNED"], name), ChatTypeInfo["RAID_WARNING"], RSConstants.RAID_WARNING_SHOWING_TIME)
		end

		-- Print message in chat if user wants
		if (RSConfigDB.IsDisplayingChatMessages()) then
			RSLogger:PrintMessage(string.format(AL["JUST_SPAWNED"], name))
		end
	else
		if (RSConfigDB.IsDisplayingRaidWarning()) then
			RaidNotice_AddMessage(RaidWarningFrame, AL["ALARM_MESSAGE"], ChatTypeInfo["RAID_WARNING"], RSConstants.RAID_WARNING_SHOWING_TIME)
		end
	end
end

-- Hide action
function scanner_button:HideButton()
	if (not InCombatLockdown()) then
		GameTooltip:Hide()
		scanner_button.ModelView:ClearModel()
		scanner_button.ModelView:Hide()
		scanner_button:Hide()
	else
		scanner_button.pendingToHide = true
	end
end

-- Show action
function scanner_button:ShowButton()
	if (not self.npcID) then
		return
	end

	-- Resizes the button
	self:SetScale(RSConfigDB.GetButtonScale())

	-- Sets the name
	self.Title:SetText(self.preEvent and string.format(AL["PRE_EVENT"], self.name) or self.name)

	-- show loot bar
	if (RSConfigDB.IsDisplayingLootBar()) then
		self.LootBar.itemFramesPool:InitItemList(self.atlasName, self.npcID)
	else
		self.LootBar.itemFramesPool:ReleaseAll()
	end

	-- show navigation arrows
	if (RSConfigDB.IsDisplayingNavigationArrows()) then
		if (self.NextButton:EnableNextButton()) then
			self.NextButton:Show()
		else
			self.NextButton:Hide()
		end

		if (self.PreviousButton:EnablePreviousButton()) then
			self.PreviousButton:Show()
		else
			self.PreviousButton:Hide()
		end
	end

	-- Show button, model and loot panel
	if (RSConstants.IsNpcAtlas(self.atlasName)) then
		self.Description_text:SetText(AL["CLICK_TARGET"])

		local macrotext = "/cleartarget\n/targetexact "..self.name
		if (RSConfigDB.IsDisplayingMarkerOnTarget()) then
			macrotext = string.format("%s\n/tm %s",macrotext, RSConfigDB.GetMarkerOnTarget())
		end

		macrotext = string.format("%s\n/rarescanner %s;%s;%s",macrotext, RSConstants.CMD_TOMTOM_WAYPOINT, self.npcID, self.name)

		self:SetAttribute("macrotext", macrotext)

		-- show model
		if (self.displayID and RSConfigDB.IsDisplayingModel()) then
			self.ModelView:SetDisplayInfo(self.displayID)
			self.ModelView:Show()
		else
			self.ModelView:Hide()
		end
	else
		self.Description_text:SetText(AL["NOT_TARGETEABLE"])
		self:SetAttribute("macrotext", string.format("\n/rarescanner %s;%s;%s", RSConstants.CMD_TOMTOM_WAYPOINT, self.npcID, self.name))

		-- hide model if displayed
		self.ModelView:ClearModel()
		self.ModelView:Hide()
	end
	
	-- Toggle filter buttons
	if (RSConstants.IsNpcAtlas(self.atlasName) or RSConstants.IsContainerAtlas(self.atlasName)) then
		self.FilterEnabledButton:Hide()
		self.FilterDisabledButton:Show()
	else
		self.FilterDisabledButton:Hide()
		self.FilterEnabledButton:Hide()
	end
	
	
	-- show button
	self:Show()

	-- set the time to auto hide
	self:StartHideTimer()
end

function scanner_button:StartHideTimer()
	if (RSConfigDB.GetAutoHideButtonTime() > 0) then
		if (AUTOHIDING_TIMER) then
			AUTOHIDING_TIMER:Cancel()
		end
		AUTOHIDING_TIMER = C_Timer.NewTimer(RSConfigDB.GetAutoHideButtonTime(), function()
			scanner_button:HideButton()
		end)
	end
end

----------------------------------------------
-- Testing
----------------------------------------------
function RareScanner:Test()
	local npcTestName = "Sandworm"
	local npcTestID = 17075
	local npcTestDisplayID = 17445

	scanner_button.npcID = npcTestID
	scanner_button.name = npcTestName
	scanner_button.displayID = npcTestDisplayID
	scanner_button.atlasName = RSConstants.NPC_VIGNETTE
	scanner_button.Title:SetText(npcTestName)
	scanner_button:DisplayMessages(npcTestName)
	RSAudioAlerts.PlaySoundAlert(RSConstants.NPC_VIGNETTE)
	scanner_button.Description_text:SetText(AL["CLICK_TARGET"])

	if (not InCombatLockdown()) then
		scanner_button:ShowButton()
		scanner_button.FilterDisabledButton:Hide()
	end

	RSLogger:PrintMessage("test launched")
end

function RareScanner:ResetPosition()
	scanner_button:ClearAllPoints()
	scanner_button:SetPoint("BOTTOM", UIParent, 0, 128)
	RSGeneralDB.SetButtonPositionCoordinates(scanner_button:GetLeft(), scanner_button:GetBottom())
end

----------------------------------------------
-- Loading addon methods
----------------------------------------------
function RareScanner:OnInitialize()
	-- Init database
	self:InitializeDataBase()

	-- Adds about panel to wow options
	if (LibAboutPanel) then
		self.optionsFrame = LibAboutPanel:CreateAboutPanel("RareScanner")
	end

	-- Initialize setup panels
	self:SetupOptions()

	-- Initialize not discovered lists
	RSMap.InitializeNotDiscoveredLists()

	-- Setup our map provider
	WorldMapFrame:AddDataProvider(CreateFromMixins(RareScannerDataProviderMixin));
	
	-- Add minimap icon
	RSMinimap.LoadMinimapButton()
	
	-- Sets the nameplates distance to the max value
	C_CVar.SetCVar("nameplateMaxDistance", 41)

	-- Refresh minimap
	C_Timer.NewTicker(2, function()
		RSMinimap.RefreshAllData()
	end)

	RSLogger:PrintDebugMessage("Cargado")
end

local function RefreshDatabaseData()
	RareScanner.db:RegisterDefaults(RSConstants.PROFILE_DEFAULTS)
		
	-- Creates a chain of routines to execute in order
	local routines = {}
		
	-- Checks again if the rare names DB is totally updated
	-- It could fail if a "script run too long" exception was launched on the first login
	local currentDbVersion = RSGeneralDB.GetDbVersion()
	if (not currentDbVersion.sync) then
		local recheckRareNamesRoutine = RSRoutines.LoopRoutineNew()
		recheckRareNamesRoutine:Init(RSNpcDB.GetAllInternalNpcInfo, 1000, 
			function(context, npcID, _)
				if (not RSNpcDB.GetNpcName(npcID)) then
					RSLogger:PrintDebugMessage(string.format("NPC [%s]. Sin nombre, reintentando obtenerlo.", npcID))
				end
				if (not RSNpcDB.GetNpcName(npcID)) then
					context.sync = false
				end
			end, 
			function(context)			
				RSLogger:PrintDebugMessage(string.format("Version sincronizada: [%s]", (context.sync == nil and 'true' or 'false')))
				currentDbVersion.sync = context.sync
			end
		)
		table.insert(routines, recheckRareNamesRoutine)
	end
	
	-- Sync loot found with internal database and remove duplicates
	local lootDbVersion = RSGeneralDB.GetLootDbVersion()
	if (not lootDbVersion or lootDbVersion < RSConstants.CURRENT_LOOT_DB_VERSION) then
		RSGeneralDB.SetLootDbVersion(RSConstants.CURRENT_LOOT_DB_VERSION)
		
		local syncLocalNpcLootRoutine = RSRoutines.LoopRoutineNew()
		syncLocalNpcLootRoutine:Init(RSNpcDB.GetAllNpcsLootFound, 200, 
			function(context, npcID, npcLootFound)
				local cleanItemsList = RSUtils.FilterRepeated(npcLootFound, RSNpcDB.GetInteralNpcLoot(npcID))
				if (cleanItemsList) then
					RSNpcDB.SetNpcLootFound(npcID, cleanItemsList)
				else
					RSNpcDB.RemoveNpcLootFound(npcID)
				end
			end, 
			function(context)			
				RSLogger:PrintDebugMessage("Sincronizado loot de NPCs local con interno")
			end
		)
		table.insert(routines, syncLocalNpcLootRoutine)
		
		local syncLocalContainercLootRoutine = RSRoutines.LoopRoutineNew()
		syncLocalContainercLootRoutine:Init(RSContainerDB.GetAllContainersLootFound, 200, 
			function(context, containerID, containerLootFound)
				local cleanItemsList = RSUtils.FilterRepeated(containerLootFound, RSNpcDB.GetInteralNpcLoot(containerID))
				if (cleanItemsList) then
					RSContainerDB.SetContainerLootFound(containerID, cleanItemsList)
				else
					RSContainerDB.RemoveContainerLootFound(containerID)
				end
			end, 
			function(context)			
				RSLogger:PrintDebugMessage("Sincronizado loot de Contenedores local con interno")
			end
		)
		table.insert(routines, syncLocalContainercLootRoutine)
	end
	
	-- Clear previous overlay if active when closed the game
	RSGeneralDB.RemoveAllOverlayActive()
end

local function UpdateRareNamesDB()
	RSGeneralDB.AddDbVersion(RSConstants.CURRENT_DB_VERSION)

	local npcNameScannerRoutine = RSRoutines.LoopRoutineNew()
	npcNameScannerRoutine:Init(RSNpcDB.GetAllInternalNpcInfo, 100)
	C_Timer.NewTicker(0.5, function(self)
		local finished = npcNameScannerRoutine:Run(function(context, npcID, _)
			RSNpcDB.GetNpcName(npcID);
		end)
	
		if (finished) then
			npcNameScannerRoutine:Reset()
			self:Cancel()			
			
			-- Continue refreshing the rest of the database
			RefreshDatabaseData()
		end
	end);
end

function RareScanner:InitializeDataBase()
	--============================================
	-- Initialize default profiles
	--============================================

	-- Initialize zone filter list
	for k, v in pairs(RSMapDB.GetContinents()) do
		table.foreach(v.zones, function(index, zoneID)
			RSConstants.PROFILE_DEFAULTS.profile.general.filteredZones[zoneID] = true
		end)
	end

	-- Initialize loot filter list
	for categoryID, subcategories in pairs(private.ITEM_CLASSES) do
		table.foreach(subcategories, function(index, subcategoryID)
			if (not RSConstants.PROFILE_DEFAULTS.profile.loot.filteredLootCategories[categoryID]) then
				RSConstants.PROFILE_DEFAULTS.profile.loot.filteredLootCategories[categoryID] = {}
			end

			RSConstants.PROFILE_DEFAULTS.profile.loot.filteredLootCategories[categoryID][subcategoryID] = true
		end)
	end

	--============================================
	-- Initialize database
	--============================================

	self.db = LibStub("AceDB-3.0"):New("RareScannerDB", RSConstants.PROFILE_DEFAULTS, true)
	self.db.RegisterCallback(self, "OnProfileChanged", "RefreshOptions")
	self.db.RegisterCallback(self, "OnProfileCopied", "RefreshOptions")
	self.db.RegisterCallback(self, "OnProfileReset", "RefreshOptions")
	private.dbm = self.db
	private.db = self.db.profile
	private.dbchar = self.db.char
	private.dbglobal = self.db.global

	-- Initialize global database
	RSGeneralDB.InitItemInfoDB()
	RSGeneralDB.InitAlreadyFoundEntitiesDB()
	RSGeneralDB.InitRecentlySeenDB()
	RSGeneralDB.InitDbVersionDB()
	RSNpcDB.InitNpcNamesDB()
	RSNpcDB.InitNpcLootFoundDB()
	RSNpcDB.InitCustomNpcDB()
	RSContainerDB.InitContainerNamesDB()
	RSContainerDB.InitContainerLootFoundDB()

	-- Check if rare NPC names database is updated
	local currentDbVersion = RSGeneralDB.GetDbVersion()
	local databaseUpdated = currentDbVersion and currentDbVersion.version == RSConstants.CURRENT_DB_VERSION
	if (not databaseUpdated) then
		UpdateRareNamesDB(); -- Internally calls to RefreshDatabaseData once its done
	else
		RefreshDatabaseData()
	end
end

function RareScanner:GetOptionsTable()
	return LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db, RSConstants.PROFILE_DEFAULTS)
end