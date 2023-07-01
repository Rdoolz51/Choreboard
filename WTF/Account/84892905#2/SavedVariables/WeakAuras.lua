
WeakAurasSaved = {
	["dynamicIconCache"] = {
	},
	["editor_tab_spaces"] = 4,
	["login_squelch_time"] = 10,
	["lastArchiveClear"] = 1681248578,
	["minimap"] = {
		["minimapPos"] = 249.4092215338496,
		["hide"] = false,
	},
	["lastUpgrade"] = 1681248580,
	["dbVersion"] = 65,
	["editor_font_size"] = 12,
	["registered"] = {
	},
	["displays"] = {
		["Ranged Swing Timer "] = {
			["sparkWidth"] = 2,
			["iconSource"] = -1,
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["yOffset"] = -145,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["url"] = "https://wago.io/f0-OL9h-F/3",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["fontFlags"] = "OUTLINE",
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["selfPoint"] = "CENTER",
			["barColor"] = {
				1, -- [1]
				0.10196078431373, -- [2]
				0.12941176470588, -- [3]
				0, -- [4]
			},
			["desaturate"] = false,
			["sparkOffsetY"] = 0,
			["gradientOrientation"] = "HORIZONTAL",
			["load"] = {
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["sparkDesaturate"] = false,
			["texture"] = "Blizzard",
			["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite",
			["spark"] = true,
			["tocversion"] = 11403,
			["alpha"] = 1,
			["config"] = {
			},
			["borderBackdrop"] = "None",
			["parent"] = "Swing Timer",
			["sparkRotationMode"] = "AUTO",
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["unevent"] = "auto",
						["buffShowOn"] = "showOnActive",
						["duration"] = "1",
						["event"] = "Swing Timer",
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
						["use_unit"] = true,
						["spellIds"] = {
						},
						["use_hand"] = true,
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["hand"] = "ranged",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
						["hand"] = "ranged",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 65,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["backdropInFront"] = false,
			["stickyDuration"] = false,
			["version"] = 3,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "%c",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "None",
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_visible"] = false,
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_text_format_c_format"] = "none",
				}, -- [3]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_legacy_floor"] = true,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["type"] = "subtext",
					["text_anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = -1,
					["text_text_format_p_time_format"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "None",
					["text_anchorPoint"] = "INNER_CENTER",
					["text_visible"] = true,
					["text_text_format_p_format"] = "timed",
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [4]
				{
					["text_shadowXOffset"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "None",
					["text_anchorPoint"] = "ICON_CENTER",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_visible"] = false,
				}, -- [5]
				{
					["border_size"] = 8,
					["border_anchor"] = "bar",
					["border_offset"] = 1,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Blizzard Tooltip",
					["type"] = "subborder",
				}, -- [6]
			},
			["height"] = 15,
			["sparkBlendMode"] = "ADD",
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["uid"] = "9CtH00zJQuK",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["borderInFront"] = true,
			["sparkOffsetX"] = 0,
			["icon_side"] = "RIGHT",
			["sparkColor"] = {
				0, -- [1]
				1, -- [2]
				0.65490196078431, -- [3]
				1, -- [4]
			},
			["customTextUpdate"] = "update",
			["sparkHeight"] = 15,
			["icon"] = false,
			["authorOptions"] = {
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["semver"] = "1.0.2",
			["anchorFrameType"] = "SCREEN",
			["id"] = "Ranged Swing Timer ",
			["useAdjustededMax"] = false,
			["frameStrata"] = 1,
			["width"] = 204,
			["sparkHidden"] = "EMPTY",
			["auto"] = true,
			["inverse"] = false,
			["sparkDesature"] = false,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["zoom"] = 0,
		},
		["Swing"] = {
			["sparkWidth"] = 10,
			["iconSource"] = 0,
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["backdropColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["yOffset"] = -175.6189880371094,
			["anchorPoint"] = "CENTER",
			["borderBackdrop"] = "ElvUI Blank",
			["authorOptions"] = {
				{
					["type"] = "toggle",
					["default"] = false,
					["key"] = "isSlam",
					["useDesc"] = false,
					["name"] = "Slam Mode",
					["width"] = 2,
				}, -- [1]
				{
					["type"] = "range",
					["useDesc"] = false,
					["max"] = 5,
					["step"] = 1,
					["width"] = 1,
					["min"] = 0,
					["name"] = "Points in Imp. Slam",
					["key"] = "slamPoints",
					["default"] = 0,
				}, -- [2]
				{
					["type"] = "color",
					["default"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["key"] = "tickColor",
					["useDesc"] = false,
					["name"] = "Tick Color",
					["width"] = 1,
				}, -- [3]
			},
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "https://wago.io/-WCbLx83B/6",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "local tickColor = aura_env.config.tickColor\n\nbar = WeakAuras.regions[aura_env.id].region.bar\n\ntickMark = bar:CreateTexture()\ntickMark:SetColorTexture(unpack(tickColor))\ntickMark:SetDrawLayer(\"OVERLAY\",7)",
					["do_custom"] = true,
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "OUTLINE",
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 65,
			["config"] = {
				["isSlam"] = true,
				["slamPoints"] = 0,
				["tickColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
			},
			["selfPoint"] = "CENTER",
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["displayIcon"] = 132282,
			["barColor"] = {
				0.52156862745098, -- [1]
				0.52156862745098, -- [2]
				0.52156862745098, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["icon"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["unevent"] = "auto",
						["subeventSuffix"] = "_CAST_START",
						["use_unit"] = true,
						["use_absorbMode"] = true,
						["event"] = "Swing Timer",
						["names"] = {
						},
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["use_hand"] = true,
						["genericShowOn"] = "showOnActive",
						["duration"] = "1",
						["hand"] = "main",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "unit",
						["use_incombat"] = true,
						["unevent"] = "auto",
						["use_absorbMode"] = true,
						["event"] = "Conditions",
						["use_unit"] = true,
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["genericShowOn"] = "showOnActive",
						["duration"] = "1",
						["subeventSuffix"] = "_CAST_START",
					},
					["untrigger"] = {
					},
				}, -- [2]
				{
					["trigger"] = {
						["auranames"] = {
							"Heroic Strike", -- [1]
						},
						["duration"] = "1",
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "player",
						["customIcon"] = "",
						["subeventPrefix"] = "SPELL",
						["spellName"] = 11567,
						["use_genericShowOn"] = true,
						["type"] = "custom",
						["custom_type"] = "status",
						["subeventSuffix"] = "_CAST_START",
						["useName"] = true,
						["use_unit"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["custom"] = "function(e)\n    if e == \"ACTIONBAR_UPDATE_STATE\" then\n        if aura_env.slotList and IsCurrentAction(aura_env.slotList[1]) then\n            return true\n        end\n    elseif e == \"ACTIONBAR_SLOT_CHANGED\" or e ==\"ACTIONBAR_PAGE_CHANGED\" then\n        local _, _, _, _, _, _, spellid = GetSpellInfo(\"Heroic Strike\")\n        if spellid then\n            aura_env.slotList = C_ActionBar.FindSpellActionButtons(spellid)\n        end\n    end\nend",
						["realSpellName"] = "Heroic Strike",
						["use_spellName"] = true,
						["events"] = "ACTIONBAR_UPDATE_STATE ACTIONBAR_SLOT_CHANGED ACTIONBAR_PAGE_CHANGED",
						["use_inverse"] = true,
						["check"] = "event",
						["unevent"] = "auto",
						["use_track"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [3]
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["custom"] = "function(e)\n    if e == \"ACTIONBAR_UPDATE_STATE\" then\n        if aura_env.slotList2 and IsCurrentAction(aura_env.slotList2[1]) then\n            return true\n        end\n    elseif e == \"ACTIONBAR_SLOT_CHANGED\" or e ==\"ACTIONBAR_PAGE_CHANGED\" then\n        local _, _, _, _, _, _, spellid = GetSpellInfo(\"Cleave\")\n        if spellid then\n            aura_env.slotList2 = C_ActionBar.FindSpellActionButtons(spellid)\n        end\n    end\nend",
						["check"] = "event",
						["custom_type"] = "status",
						["events"] = "ACTIONBAR_UPDATE_STATE ACTIONBAR_SLOT_CHANGED ACTIONBAR_PAGE_CHANGED",
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
					},
				}, -- [4]
				{
					["trigger"] = {
						["type"] = "custom",
						["unevent"] = "auto",
						["duration"] = "1",
						["event"] = "Health",
						["unit"] = "player",
						["custom"] = "function ()\n    if not (aura_env.config.isSlam) then return end\n    if not (UnitClass(UnitName(\"player\")) == \"Warrior\") then return end\n    \n    local atkSpeed = UnitAttackSpeed(\"player\")\n    local latency = select(4, GetNetStats()) / 1000 or 0\n    \n    local slamPoints = aura_env.config.slamPoints\n    local slamSpeed = 1.5 - (0.1 * slamPoints)\n    \n    local tick = 1 - (slamSpeed + latency) / atkSpeed\n    \n    local w = latency / atkSpeed * bar:GetWidth()\n    local h = bar:GetHeight()\n    \n    tickMark:ClearAllPoints()\n    tickMark:SetSize(max(w, 1), h)\n    tickMark:SetPoint(\"LEFT\", bar, \"LEFT\", tick * bar:GetWidth(), 0)\nend",
						["subeventPrefix"] = "SPELL",
						["check"] = "update",
						["use_unit"] = true,
						["subeventSuffix"] = "_CAST_START",
						["custom_type"] = "status",
					},
					["untrigger"] = {
					},
				}, -- [5]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["version"] = 6,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_size"] = 2,
					["border_anchor"] = "bar",
					["border_offset"] = 2,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "1 Pixel",
					["type"] = "subborder",
				}, -- [2]
				{
					["border_color"] = {
					},
					["type"] = "subforeground",
				}, -- [3]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "%n",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Oswald",
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = false,
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_text_format_n_format"] = "none",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_fontType"] = "None",
				}, -- [4]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "%n",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = false,
					["text_anchorPoint"] = "INNER_LEFT",
					["text_text_format_n_format"] = "none",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_fontType"] = "None",
				}, -- [5]
				{
					["text_shadowXOffset"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = false,
					["text_anchorPoint"] = "ICON_CENTER",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_fontType"] = "None",
				}, -- [6]
			},
			["height"] = 14.99997901916504,
			["enableGradient"] = false,
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "WARRIOR",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["source"] = "import",
			["semver"] = "1.2.1",
			["backgroundColor"] = {
				0.047058823529412, -- [1]
				0.047058823529412, -- [2]
				0.047058823529412, -- [3]
				1, -- [4]
			},
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["smoothProgress"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["borderInFront"] = false,
			["sparkHidden"] = "NEVER",
			["icon_side"] = "RIGHT",
			["sparkOffsetY"] = 0,
			["gradientOrientation"] = "HORIZONTAL",
			["sparkHeight"] = 45,
			["texture"] = "ElvUI Blank",
			["width"] = 310.0002136230469,
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["auto"] = false,
			["tocversion"] = 11302,
			["id"] = "Swing",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["spark"] = false,
			["uid"] = "ni6RWWmdP0A",
			["inverse"] = true,
			["zoom"] = 0,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "show",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = 0,
							["property"] = "alpha",
						}, -- [1]
						{
							["value"] = {
								0.047058823529412, -- [1]
								0.047058823529412, -- [2]
								0.047058823529412, -- [3]
								1, -- [4]
							},
							["property"] = "barColor",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 3,
						["variable"] = "show",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0.74117647058823, -- [1]
								0.65098039215686, -- [2]
								0.23529411764706, -- [3]
								1, -- [4]
							},
							["property"] = "barColor",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 4,
						["variable"] = "show",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0.7843137254902, -- [2]
								0.32549019607843, -- [3]
								1, -- [4]
							},
							["property"] = "barColor",
						}, -- [1]
					},
				}, -- [3]
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["sparkOffsetX"] = 0,
		},
		["Swing Timer"] = {
			["controlledChildren"] = {
				"Ranged Swing Timer ", -- [1]
				"OH Swing Timer ", -- [2]
				"MH Swing Timer", -- [3]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "https://wago.io/f0-OL9h-F/3",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["subeventPrefix"] = "SPELL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["unit"] = "player",
						["event"] = "Health",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 65,
			["selfPoint"] = "BOTTOMLEFT",
			["version"] = 3,
			["subRegions"] = {
			},
			["load"] = {
				["use_class"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "1 Pixel",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderOffset"] = 4,
			["semver"] = "1.0.2",
			["tocversion"] = 11403,
			["id"] = "Swing Timer",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["uid"] = "kmit7DmAZOA",
			["borderInset"] = 1,
			["config"] = {
			},
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
				["forceEvents"] = true,
				["groupOffset"] = true,
			},
			["authorOptions"] = {
			},
		},
		["Arrow"] = {
			["iconSource"] = -1,
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = -90.1905517578125,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["url"] = "https://wago.io/T5Im1YDZ1/2",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["itemName"] = 11285,
						["duration"] = "1",
						["genericShowOn"] = "showAlways",
						["unit"] = "player",
						["itemSlot"] = 0,
						["debuffType"] = "HELPFUL",
						["use_remaining"] = false,
						["subeventSuffix"] = "_CAST_START",
						["use_genericShowOn"] = true,
						["use_itemName"] = true,
						["event"] = "Cooldown Progress (Equipment Slot)",
						["use_itemSlot"] = true,
						["type"] = "item",
						["spellIds"] = {
						},
						["use_testForCooldown"] = false,
						["unevent"] = "auto",
						["use_unit"] = true,
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
						["itemSlot"] = 0,
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 65,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_fontSize"] = 10,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 40,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["use_itemequiped"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["itemequiped"] = 11285,
				["zoneIds"] = "",
			},
			["source"] = "import",
			["auto"] = true,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["regionType"] = "icon",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["xOffset"] = -237.3413696289063,
			["cooldown"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["config"] = {
			},
			["frameStrata"] = 1,
			["zoom"] = 0,
			["semver"] = "1.0.1",
			["tocversion"] = 11302,
			["id"] = "Arrow",
			["width"] = 40,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["useCooldownModRate"] = true,
			["uid"] = "KtGKFqWsmfp",
			["inverse"] = false,
			["cooldownTextDisabled"] = false,
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "<=",
						["variable"] = "stacks",
						["value"] = "200",
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.3.glow",
						}, -- [1]
					},
				}, -- [1]
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["cooldownEdge"] = false,
		},
		["Overpower on Nameplate"] = {
			["iconSource"] = 0,
			["authorOptions"] = {
				{
					["type"] = "number",
					["useDesc"] = false,
					["max"] = 200,
					["step"] = 0.05,
					["width"] = 1,
					["min"] = 0,
					["key"] = "xoff",
					["name"] = "X-Offset",
					["default"] = 0,
				}, -- [1]
				{
					["type"] = "number",
					["useDesc"] = false,
					["max"] = 200,
					["step"] = 0.05,
					["width"] = 1,
					["min"] = 0,
					["name"] = "Y-Offset",
					["key"] = "yoff",
					["default"] = 0,
				}, -- [2]
				{
					["type"] = "number",
					["useDesc"] = false,
					["max"] = 5,
					["step"] = 0.1,
					["width"] = 2,
					["min"] = 0,
					["key"] = "duration",
					["name"] = "Duration",
					["default"] = 3,
				}, -- [3]
			},
			["preferToUpdate"] = false,
			["customText"] = "function()\n    if aura_env.state and aura_env.state.PassUnit then\n        local region = aura_env.region\n        local plate = C_NamePlate.GetNamePlateForUnit(aura_env.state.PassUnit)\n        if plate then\n            region:ClearAllPoints()\n            region:SetPoint(\"LEFT\", plate, \"LEFT\", aura_env.config.xoff, aura_env.config.yoff)\n            region:Show()\n        else\n            region:Hide()\n        end\n    end\nend\n\n\n",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "event",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["unevent"] = "auto",
						["names"] = {
						},
						["duration"] = "1",
						["genericShowOn"] = "showOnActive",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["custom"] = "function(allstates, event,unit, ...)    \n    if event == \"NAME_PLATE_UNIT_ADDED\" then\n        if unit then\n            local guid = UnitGUID(unit)                   \n            --print(name)\n            allstates[guid] = {\n                changed = true,\n                show = false,\n                PassUnit = unit,\n                glow = false,\n            }            \n        end\n    end\n    \n    if event == \"NAME_PLATE_UNIT_REMOVED\" then\n        if unit then\n            local guid = UnitGUID(unit)\n            if allstates[guid] then\n                allstates[guid].changed = true\n                allstates[guid].PassUnit = \"none\"\n            end\n        end\n    end\n    \n    if event == \"COMBAT_LOG_EVENT_UNFILTERED\" then\n        local subEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = ...\n        local spellID,spellName,spellSchool\n        local missType = \"\"\n        local stanceIndex = GetShapeshiftForm()\n        \n        if subEvent == \"SWING_MISSED\" and sourceName == UnitName(\"player\")  then\n            --if subEvent == \"SWING_MISSED\" and sourceName == UnitName(\"player\") and stanceIndex == 1 then\n            missType = select(11,...)\n            --print(missType .. \"SWING missed\")\n            --print(missType .. \"  SWING \")\n        elseif subEvent == \"SPELL_MISSED\" and sourceName == UnitName(\"player\") then\n            --elseif subEvent == \"SPELL_MISSED\" and sourceName == UnitName(\"player\") and stanceIndex == 1 then\n            \n            spellID,spellName,spellSchool,missType = select(11, ...)\n            --print(missType .. \"SPELL missed\")\n            --print(missType .. \"  SPELL \")            \n        end\n        \n        if missType == \"DODGE\" then\n            for i = 1,40 do\n                local u = \"nameplate\"..i                \n                if UnitExists(u) and UnitGUID(u) == destGUID then            \n                    allstates[destGUID] = {\n                        changed = true,\n                        show = true,          \n                        PassUnit = u,\n                        glow = true,\n                        autoHide = true,\n                        progressType = \"timed\",\n                        duration = aura_env.config.duration,\n                    } \n                    break\n                    \n                end\n            end\n        end\n    end\n    \n    return true\n    \nend",
						["events"] = " NAME_PLATE_UNIT_ADDED NAME_PLATE_UNIT_REMOVED COMBAT_LOG_EVENT_UNFILTERED ",
						["check"] = "event",
						["event"] = "Chat Message",
						["custom_type"] = "stateupdate",
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "spell",
						["subeventSuffix"] = "_CAST_START",
						["unevent"] = "auto",
						["duration"] = "1",
						["genericShowOn"] = "showAlways",
						["unit"] = "player",
						["realSpellName"] = "Overpower",
						["use_spellName"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["subeventPrefix"] = "SPELL",
						["use_unit"] = true,
						["use_genericShowOn"] = true,
						["use_track"] = true,
						["spellName"] = 7887,
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [2]
				["disjunctive"] = "all",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 65,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["version"] = 3,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%c",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_text_format_c_format"] = "none",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_visible"] = false,
				}, -- [2]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%2.p",
					["text_text_format_2.p_time_format"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_text_format_2.p_time_legacy_floor"] = true,
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_2.p_format"] = "timed",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_text_format_2.p_time_mod_rate"] = true,
					["text_shadowYOffset"] = 0,
					["text_text_format_2.p_time_dynamic_threshold"] = 60,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["text_visible"] = true,
					["text_text_format_2.p_time_precision"] = 1,
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_automaticWidth"] = "Auto",
				}, -- [3]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = true,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [4]
			},
			["height"] = 30,
			["rotate"] = true,
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["anchorFrameType"] = "SCREEN",
			["cooldownTextDisabled"] = false,
			["rotation"] = 0,
			["source"] = "import",
			["url"] = "https://wago.io/nuh2DOgJo/3",
			["cooldown"] = true,
			["displayIcon"] = 132223,
			["mirror"] = false,
			["anchorFrameFrame"] = "WeakAuras:Nameplate Point Anchor",
			["regionType"] = "icon",
			["actions"] = {
				["start"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "if aura_env.config.duration <=  0 then\n    aura_env.config.duration = 2\nend",
					["do_custom"] = true,
				},
				["finish"] = {
				},
			},
			["blendMode"] = "BLEND",
			["xOffset"] = 0,
			["uid"] = "R0zLHbigXLR",
			["texture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura53",
			["alpha"] = 1,
			["zoom"] = 0,
			["semver"] = "1.0.2",
			["tocversion"] = 11302,
			["id"] = "Overpower on Nameplate",
			["frameStrata"] = 1,
			["useCooldownModRate"] = true,
			["width"] = 30,
			["auto"] = false,
			["config"] = {
				["yoff"] = 0,
				["xoff"] = 0,
				["duration"] = 4,
			},
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "spellUsable",
						["value"] = 0,
					},
					["changes"] = {
						{
							["property"] = "sub.4.glow",
						}, -- [1]
					},
				}, -- [1]
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
		},
		["MH Swing Timer"] = {
			["sparkWidth"] = 2,
			["iconSource"] = -1,
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["yOffset"] = -145,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["url"] = "https://wago.io/f0-OL9h-F/3",
			["icon"] = false,
			["fontFlags"] = "OUTLINE",
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["selfPoint"] = "CENTER",
			["barColor"] = {
				1, -- [1]
				0.10196078431373, -- [2]
				0.12941176470588, -- [3]
				0, -- [4]
			},
			["desaturate"] = false,
			["sparkOffsetY"] = 0,
			["gradientOrientation"] = "HORIZONTAL",
			["load"] = {
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["sparkDesaturate"] = false,
			["texture"] = "Blizzard",
			["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite",
			["spark"] = true,
			["tocversion"] = 11403,
			["alpha"] = 1,
			["sparkColor"] = {
				1, -- [1]
				0.03921568627451, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["sparkOffsetX"] = 0,
			["parent"] = "Swing Timer",
			["customTextUpdate"] = "update",
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["unevent"] = "auto",
						["buffShowOn"] = "showOnActive",
						["duration"] = "1",
						["event"] = "Swing Timer",
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["use_hand"] = true,
						["names"] = {
						},
						["use_unit"] = true,
						["hand"] = "main",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 65,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["backdropInFront"] = false,
			["stickyDuration"] = false,
			["version"] = 3,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_legacy_floor"] = true,
					["type"] = "subtext",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = -1,
					["text_text_format_p_time_format"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "None",
					["text_anchorPoint"] = "INNER_CENTER",
					["text_visible"] = true,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_text_format_p_format"] = "timed",
				}, -- [3]
				{
					["border_size"] = 8,
					["border_anchor"] = "bar",
					["border_offset"] = 1,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Blizzard Tooltip",
					["type"] = "subborder",
				}, -- [4]
			},
			["height"] = 15,
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["source"] = "import",
			["auto"] = true,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["borderInFront"] = true,
			["borderBackdrop"] = "None",
			["icon_side"] = "RIGHT",
			["config"] = {
			},
			["sparkRotationMode"] = "AUTO",
			["sparkHeight"] = 15,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["authorOptions"] = {
			},
			["uid"] = "bCEJDY)UNOe",
			["semver"] = "1.0.2",
			["anchorFrameType"] = "SCREEN",
			["id"] = "MH Swing Timer",
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["frameStrata"] = 1,
			["width"] = 204,
			["sparkHidden"] = "EMPTY",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["inverse"] = false,
			["sparkDesature"] = false,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["zoom"] = 0,
		},
		["Zera Battle Shout Reminder"] = {
			["iconSource"] = -1,
			["xOffset"] = -200.6069946289063,
			["preferToUpdate"] = false,
			["yOffset"] = -76.41619873046875,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["url"] = "https://wago.io/MtMe4SbEJ/1",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["showClones"] = false,
						["useName"] = true,
						["auranames"] = {
							"Battle Shout", -- [1]
						},
						["matchesShowOn"] = "showOnMissing",
						["event"] = "Health",
						["unit"] = "player",
						["names"] = {
						},
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["remOperator"] = "<=",
						["subeventPrefix"] = "SPELL",
						["rem"] = "20",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["rem"] = "15",
						["auranames"] = {
							"Battle Shout", -- [1]
						},
						["event"] = "Health",
						["unit"] = "player",
						["useRem"] = true,
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["remOperator"] = "<=",
						["useName"] = true,
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				{
					["trigger"] = {
						["type"] = "unit",
						["power"] = "10",
						["power_operator"] = ">=",
						["duration"] = "1",
						["event"] = "Power",
						["unit"] = "player",
						["powertype"] = 1,
						["unevent"] = "auto",
						["subeventSuffix"] = "_CAST_START",
						["use_power"] = true,
						["use_unit"] = true,
						["use_powertype"] = true,
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [3]
				{
					["trigger"] = {
						["type"] = "unit",
						["use_incombat"] = true,
						["subeventSuffix"] = "_CAST_START",
						["duration"] = "1",
						["event"] = "Conditions",
						["unit"] = "player",
						["unevent"] = "auto",
						["use_unit"] = true,
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [4]
				["disjunctive"] = "custom",
				["customTriggerLogic"] = "function(trigger)\n  return (trigger[1] or trigger[2]) and (trigger[3] or trigger[4]);\nend",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 65,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["preset"] = "bounce",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["version"] = 1,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 64,
			["load"] = {
				["use_class"] = true,
				["use_spellknown"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "WARRIOR",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["spellknown"] = 11551,
				["zoneIds"] = "",
			},
			["source"] = "import",
			["semver"] = "1.0.0",
			["cooldownEdge"] = false,
			["regionType"] = "icon",
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["cooldown"] = true,
			["icon"] = true,
			["uid"] = "U(IKD5AMZUQ",
			["useCooldownModRate"] = true,
			["zoom"] = 0,
			["auto"] = true,
			["tocversion"] = 11403,
			["id"] = "Zera Battle Shout Reminder",
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["width"] = 64,
			["alpha"] = 1,
			["config"] = {
			},
			["inverse"] = false,
			["cooldownTextDisabled"] = false,
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 3,
						["op"] = ">=",
						["variable"] = "power",
						["value"] = "10",
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.3.glow",
						}, -- [1]
					},
				}, -- [1]
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["selfPoint"] = "CENTER",
		},
		["Shaman Class Color Fix"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "Ju2GhhRiF",
			["xOffset"] = 0,
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "if not aura_env.init then \n    RAID_CLASS_COLORS.SHAMAN:SetRGB(0, 0.44, 0.87)\nend\naura_env.init = true",
					["do_custom"] = true,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["use_alwaystrue"] = true,
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Conditions",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["use_unit"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_time_mod_rate"] = true,
			["displayText_format_p_time_legacy_floor"] = false,
			["selfPoint"] = "BOTTOM",
			["font"] = "Friz Quadrata TT",
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 12,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["displayText_format_p_format"] = "timed",
			["regionType"] = "text",
			["displayText"] = "",
			["url"] = "https://wago.io/Ju2GhhRiF/2",
			["fixedWidth"] = 200,
			["internalVersion"] = 65,
			["displayText_format_p_time_precision"] = 1,
			["authorOptions"] = {
			},
			["uid"] = "R9rNIOskNmQ",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["semver"] = "1.0.1",
			["tocversion"] = 11403,
			["id"] = "Shaman Class Color Fix",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["justify"] = "LEFT",
			["config"] = {
			},
			["shadowYOffset"] = -1,
			["preferToUpdate"] = false,
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["wordWrap"] = "WordWrap",
		},
		["Pet: Happiness"] = {
			["outline"] = "OUTLINE",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayText"] = "%c",
			["customText"] = "function()\n    \n    local function round(number, decimals)\n        return ((\"%%.%df\"):format(decimals)):format(number)\n    end\n    \n    local happiness, damagePercentage, loyaltyRate = GetPetHappiness()\n    if happiness then\n        infoText = \"\"\n        local c = { [3] = '|CFF20C000', [2] = '|CFFFE8A0E', [1] = '|CFFFF0303', [99] = '|CFFFFFFFF\\n' }\n        local t = { [3] =  aura_env.i18n_strings.happy, [2] =  aura_env.i18n_strings.content, [1] =  aura_env.i18n_strings.unhappy }\n        \n        if aura_env.config.petText[1] then\n            local level = aura_env.i18n_strings.status..c[happiness]..t[happiness]\n            infoText = infoText..level\n        end\n        \n        if aura_env.config.petText[2] then\n            local rate = aura_env.i18n_strings.rate..c[happiness]..loyaltyRate\n            if WA_GetUnitBuff(\"pet\", 1539) then\n                rate = rate..\" +++\"\n            end\n            infoText = infoText..c[99]..rate\n        end\n        \n        if aura_env.config.petText[3] then\n            local damage = aura_env.i18n_strings.damage..c[happiness]..damagePercentage..\"%\"\n            infoText = infoText..c[99]..damage\n        end\n        \n        \n        if UnitLevel(\"pet\") < 60 then\n            if aura_env.config.petLeveltext[1] or aura_env.config.petLeveltext[2] then\n                infoText = infoText..c[99]..'----------------'\n                if aura_env.config.petLeveltext[1] then\n                    infoText = infoText..c[99]..aura_env.i18n_strings.level..UnitLevel(\"pet\")\n                end\n                if aura_env.config.petLeveltext[2] then        \n                    local currXP, nextXP = GetPetExperience()\n                    local percent = round((currXP/nextXP)*100,0)\n                    infoText = infoText..c[99]..aura_env.i18n_strings.exp..percent..'%'\n                end\n            end\n        end\n        return infoText\n    end        \nend\n\n\n\n\n\n\n",
			["shadowYOffset"] = -1,
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "event",
			["url"] = "https://wago.io/uVcrRuwDW/3",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "local locale = GetLocale();\n-- These locales are equivalent\nif locale == \"enGB\" or locale == \"zhTW\" or locale == \"zhCN\" then locale = \"enUS\"\nelseif locale == \"esMX\" then locale = \"esES\" end\n\nlocal i18n_strings = {\n    -- German (Germany)\n    [\"deDE\"] = {\n        [\"status\"] = \"Status: \",\n        [\"happy\"] = \"Glücklich\",\n        [\"content\"] = \"Zufrieden\",\n        [\"unhappy\"] = \"Unglücklich\",\n        [\"rate\"] = \"Rate\",\n        [\"damaga\"] = \"Schaden: \",\n        [\"level\"] = \"Level\",\n        [\"exp\"] = \"Erfahrung: \"\n    },\n    -- English (United Kingdom enGB | United States enUS)\n    [\"enUS\"] = {\n        [\"status\"] = \"Status: \",\n        [\"happy\"] = \"Happy\",\n        [\"content\"] = \"Content\",\n        [\"unhappy\"] = \"Unhappy\",\n        [\"rate\"] = \"Rate: \",\n        [\"damage\"] = \"Damage: \",\n        [\"level\"] = \"Level: \",\n        [\"exp\"] = \"Experience: \"\n    },\n    -- Spanish (Spain esES | Mexico esMX)\n    [\"esES\"] = {\n        [\"status\"] = \"Estado: \",\n        [\"happy\"] = \"Feliz\",\n        [\"content\"] = \"Contenta\",\n        [\"unhappy\"] = \"Infeliz\",\n        [\"rate\"] = \"Ratio: \",\n        [\"damage\"] = \"Daño: \",\n        [\"level\"] = \"Nivel: \",\n        [\"exp\"] = \"Experiencia: \"\n    },\n    -- French (France)\n    [\"frFR\"] = {\n        [\"status\"] = \"Status: \",\n        [\"happy\"] = \"Happy\",\n        [\"content\"] = \"Content\",\n        [\"unhappy\"] = \"Unhappy\",\n        [\"rate\"] = \"Rate: \",\n        [\"damage\"] = \"Damage: \",\n        [\"level\"] = \"Level: \",\n        [\"exp\"] = \"Experience: \"\n    },\n    -- Italian (Italy)\n    [\"itIT\"] = {\n        [\"status\"] = \"Status: \",\n        [\"happy\"] = \"Happy\",\n        [\"content\"] = \"Content\",\n        [\"unhappy\"] = \"Unhappy\",\n        [\"rate\"] = \"Rate: \",\n        [\"damage\"] = \"Damage: \",\n        [\"level\"] = \"Level: \",\n        [\"exp\"] = \"Experience: \"\n    },\n    -- Korean (Korea)\n    [\"koKR\"] = {\n        [\"status\"] = \"Status: \",\n        [\"happy\"] = \"Happy\",\n        [\"content\"] = \"Content\",\n        [\"unhappy\"] = \"Unhappy\",\n        [\"rate\"] = \"Rate: \",\n        [\"damage\"] = \"Damage: \",\n        [\"level\"] = \"Level: \",\n        [\"exp\"] = \"Experience: \"\n    },\n    -- Portuguese (Brazil)\n    [\"ptBR\"] = {\n        [\"status\"] = \"Status: \",\n        [\"happy\"] = \"Happy\",\n        [\"content\"] = \"Content\",\n        [\"unhappy\"] = \"Unhappy\",\n        [\"rate\"] = \"Rate: \",\n        [\"damage\"] = \"Damage: \",\n        [\"level\"] = \"Level: \",\n        [\"exp\"] = \"Experience: \"\n    },\n    -- Russian (Russia)\n    [\"ruRU\"] = {\n        [\"status\"] = \"Status: \",\n        [\"happy\"] = \"Happy\",\n        [\"content\"] = \"Content\",\n        [\"unhappy\"] = \"Unhappy\",\n        [\"rate\"] = \"Rate: \",\n        [\"damage\"] = \"Damage: \",\n        [\"level\"] = \"Level: \",\n        [\"exp\"] = \"Experience: \"\n    },\n    -- Simplified Chinese | Chinese (Traditional, Taiwan zhTW)\n    [\"zhCN\"] = {\n        [\"status\"] = \"Status: \",\n        [\"happy\"] = \"Happy\",\n        [\"content\"] = \"Content\",\n        [\"unhappy\"] = \"Unhappy\",\n        [\"rate\"] = \"Rate: \",\n        [\"damage\"] = \"Damage: \",\n        [\"level\"] = \"Level: \",\n        [\"exp\"] = \"Experience: \"\n    },\n}\n\naura_env.i18n_strings = i18n_strings[locale];",
					["do_custom"] = true,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["unevent"] = "auto",
						["custom_type"] = "event",
						["names"] = {
						},
						["duration"] = "10",
						["event"] = "Conditions",
						["unit"] = "player",
						["custom"] = "function(_,arg1)\n    if arg1 == \"pet\" then\n        return true\n    end\nend",
						["spellIds"] = {
						},
						["events"] = "UNIT_HAPPINESS",
						["subeventSuffix"] = "_CAST_START",
						["use_unit"] = true,
						["subeventPrefix"] = "SPELL",
						["use_HasPet"] = true,
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 65,
			["wordWrap"] = "WordWrap",
			["font"] = "Dajova",
			["version"] = 3,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["fontSize"] = 14,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["regionType"] = "text",
			["conditions"] = {
			},
			["preferToUpdate"] = false,
			["selfPoint"] = "BOTTOM",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["xOffset"] = -626.3329162597656,
			["semver"] = "2.0.1",
			["justify"] = "LEFT",
			["tocversion"] = 11303,
			["id"] = "Pet: Happiness",
			["uid"] = "0XFNseqAltC",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["automaticWidth"] = "Fixed",
			["config"] = {
				["petText"] = {
					true, -- [1]
					true, -- [2]
					true, -- [3]
					true, -- [4]
					true, -- [5]
				},
				["petLeveltext"] = {
					true, -- [1]
					true, -- [2]
				},
			},
			["authorOptions"] = {
				{
					["type"] = "multiselect",
					["default"] = {
						true, -- [1]
						false, -- [2]
						false, -- [3]
						false, -- [4]
						false, -- [5]
					},
					["name"] = "Pet Status Texts",
					["key"] = "petText",
					["useDesc"] = false,
					["values"] = {
						"Status", -- [1]
						"Rate", -- [2]
						"Damage", -- [3]
						"Level", -- [4]
						"Experience", -- [5]
					},
					["width"] = 1,
				}, -- [1]
				{
					["useName"] = true,
					["text"] = "Experience & Level",
					["type"] = "header",
					["width"] = 1,
				}, -- [2]
				{
					["desc"] = "These options will only show if the pet is below 60",
					["type"] = "multiselect",
					["name"] = "Pet Level Text",
					["default"] = {
						true, -- [1]
						false, -- [2]
					},
					["key"] = "petLeveltext",
					["useDesc"] = true,
					["values"] = {
						"Level", -- [1]
						"Experience", -- [2]
					},
					["width"] = 1,
				}, -- [3]
			},
			["yOffset"] = -239.7143249511719,
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["fixedWidth"] = 200,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["displayText_format_c_format"] = "none",
		},
		["Feed Pet Button"] = {
			["iconSource"] = 0,
			["authorOptions"] = {
				{
					["type"] = "toggle",
					["default"] = true,
					["desc"] = "Enables/Disables the tooltip that shows the selected food in the button.",
					["key"] = "tooltipOnHover",
					["useDesc"] = true,
					["name"] = "Show selected food tooltip on hover",
					["width"] = 2,
				}, -- [1]
				{
					["type"] = "toggle",
					["default"] = true,
					["desc"] = "Enables/Disables the prioritisation of conjured food.",
					["key"] = "conjuredFoodPrio",
					["useDesc"] = true,
					["name"] = "Prioritize conjured food",
					["width"] = 2,
				}, -- [2]
				{
					["type"] = "toggle",
					["default"] = false,
					["desc"] = "Enables/Disables showing the icon only when the pet is hungry",
					["key"] = "showWhenHungry",
					["useDesc"] = true,
					["name"] = "Show icon only when pet is hungry",
					["width"] = 2,
				}, -- [3]
				{
					["type"] = "number",
					["useDesc"] = true,
					["max"] = 5000,
					["step"] = 1,
					["width"] = 2,
					["min"] = 0,
					["key"] = "updateThrottle",
					["desc"] = "How often the WA updates in milliseconds",
					["name"] = "Update throttle",
					["default"] = 1000,
				}, -- [4]
			},
			["preferToUpdate"] = false,
			["yOffset"] = -340.5716247558594,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["url"] = "https://wago.io/h1NCdjUfF/21",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["custom_type"] = "status",
						["custom_hide"] = "timed",
						["names"] = {
						},
						["event"] = "Health",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["custom"] = "function ()    \n    -- If showWhenHungry enabled, check if it's hungry first\n    if UnitExists(\"pet\") and GetPetHappiness() ~= nil then\n        if (not aura_env.config.showWhenHungry) or (GetPetHappiness() < 3) then\n            aura_env.UpdateFeedButton()\n            return true\n        end\n    end\nend",
						["spellIds"] = {
						},
						["events"] = "BAG_UPDATE,UNIT_HAPPINESS,UNIT_PET,PET_BAR_SHOWGRID,UNIT_NAME_UPDATE,PET_BAR_UPDATE,PET_UI_UPDATE,PET_BAR_HIDE,PET_UI_CLOSE,PLAYER_ENTERING_WORLD,PLAYER_ENTER_COMBAT,PLAYER_LEAVE_COMBAT",
						["check"] = "event",
						["dynamicDuration"] = false,
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
						["custom"] = "function()\n    return true\nend",
					},
				}, -- [1]
				{
					["trigger"] = {
						["duration"] = "10",
						["genericShowOn"] = "showOnCooldown",
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["use_genericShowOn"] = true,
						["use_unit"] = true,
						["use_petspec"] = false,
						["use_powertype"] = true,
						["custom_hide"] = "timed",
						["custom_type"] = "status",
						["type"] = "custom",
						["custom"] = "function()\n    if UnitExists(\"pet\") and GetPetHappiness() ~= nil and GetPetHappiness() < 3 then\n        return true    \n    end\nend",
						["unevent"] = "auto",
						["events"] = "UNIT_HAPPINESS, UNIT_PET, PET_BAR_SHOWGRID, UNIT_NAME_UPDATE, PET_BAR_UPDATE, PET_UI_UPDATE, PET_BAR_HIDE, PET_UI_CLOSE, PLAYER_ENTERING_WORLD, PLAYER_ENTER_COMBAT, PLAYER_LEAVE_COMBAT",
						["spellName"] = 0,
						["event"] = "Power",
						["use_behavior"] = false,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["check"] = "event",
						["debuffType"] = "HELPFUL",
						["use_track"] = true,
						["unit"] = "pet",
					},
					["untrigger"] = {
						["custom"] = "\n\n",
						["unit"] = "pet",
					},
				}, -- [2]
				{
					["trigger"] = {
						["auranames"] = {
							"Feed Pet Effect", -- [1]
						},
						["duration"] = "1",
						["genericShowOn"] = "showOnCooldown",
						["unit"] = "pet",
						["debuffType"] = "HELPFUL",
						["showClones"] = false,
						["type"] = "aura2",
						["unevent"] = "auto",
						["spellName"] = 0,
						["subeventPrefix"] = "",
						["event"] = "Cooldown Progress (Spell)",
						["use_genericShowOn"] = true,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["custom_hide"] = "timed",
						["useName"] = true,
						["custom_type"] = "status",
						["matchesShowOn"] = "showOnActive",
						["use_track"] = true,
						["subeventSuffix"] = "",
					},
					["untrigger"] = {
					},
				}, -- [3]
				{
					["trigger"] = {
						["type"] = "custom",
						["events"] = "CHAT_MSG_PET_INFO",
						["custom_type"] = "status",
						["check"] = "event",
						["unit"] = "player",
						["custom"] = "function(event, text)\n    aura_env.PrintLogMessage(text)\nend",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [4]
				["disjunctive"] = "custom",
				["customTriggerLogic"] = "function(triggers)\n    return triggers[1];\nend",
				["activeTriggerMode"] = 3,
			},
			["internalVersion"] = 65,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["version"] = 21,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glowScale"] = 1,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [2]
			},
			["height"] = 40,
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["use_spellknown"] = true,
				["size"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "HUNTER",
					["multi"] = {
						["HUNTER"] = true,
					},
				},
				["use_alive"] = true,
				["spellknown"] = 6991,
				["zoneIds"] = "",
			},
			["source"] = "import",
			["cooldownTextDisabled"] = false,
			["uid"] = "aG2TUTojcp8",
			["xOffset"] = 403.8098754882813,
			["desc"] = "Displays a clickable button that picks the highest level food available for your pet and feeds it. Shows the cooldown of the debuff on your pet so you know not to spam.",
			["regionType"] = "icon",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["displayIcon"] = "132165",
			["selfPoint"] = "CENTER",
			["cooldownEdge"] = false,
			["width"] = 40,
			["alpha"] = 1,
			["zoom"] = 0,
			["semver"] = "1.0.20",
			["tocversion"] = 11306,
			["id"] = "Feed Pet Button",
			["frameStrata"] = 1,
			["useCooldownModRate"] = true,
			["anchorFrameType"] = "SCREEN",
			["auto"] = false,
			["config"] = {
				["updateThrottle"] = 1000,
				["tooltipOnHover"] = true,
				["showWhenHungry"] = true,
				["conjuredFoodPrio"] = true,
			},
			["inverse"] = false,
			["actions"] = {
				["start"] = {
					["do_glow"] = false,
					["custom"] = "aura_env.UpdateFeedButton()",
					["do_custom"] = true,
				},
				["init"] = {
					["custom"] = "-- Somehow this is needed\nlocal aura_env = aura_env\n\n-- IDs for different foods\nlocal meat = {\n    117, 2287, 2539, 2679, 2681, 2682, 2685, 3727, 3770, 3771, 4599, 5477, 6413,\n    6890, 7097, 8952, 11444, 15935, 17408, 19304, 19223, 19224, 19305, 19306,\n    19995\n}\nlocal fish = {\n    787, 1326, 4592, 4593, 4594, 4592, 4593, 4594, 5095, 6290, 6299, 6887, 7751,\n    7752, 7828, 8364, 8957, 12238, 13546, 13893, 13930, 13933, 13935, 21072,\n    21552\n}\nlocal bread = {\n    1113, 1114, 1487, 4540, 4541, 4542, 4544, 4601, 5349, 8075, 8076, 8950,\n    13724, 19301, 21030, 21236, 22895, 23160, 37836\n}\nlocal fungus = {414, 1707, 4604, 4605, 4606, 4607, 4608, 8543, 8948}\nlocal fruit = {\n    4536, 4537, 4538, 4539, 4602, 4656, 5057, 8953, 11415, 12763, 16168, 19994\n}\nlocal cheese = {414, 422, 1707, 2070, 3927, 8932, 17406}\n\nlocal function GetPetFoodsByName(name)\n    if name == 'Meat' then return meat; end\n    if name == 'Fish' then return fish; end\n    if name == 'Fruit' then return fruit; end\n    if name == 'Fungus' then return fungus; end\n    if name == 'Bread' then return bread; end\n    if name == 'Cheese' then return cheese; end\n    return {};\nend\n\nlocal function GetKnownPetFoods()\n    local knownPetFoods = {};\n    \n    for _, petFoodType in pairs({GetPetFoodTypes()}) do\n        local petFoodItems = GetPetFoodsByName(petFoodType);\n        \n        for _, petFoodItem in pairs(petFoodItems) do\n            knownPetFoods[petFoodItem] = true;\n        end\n    end\n    \n    return knownPetFoods\nend\n\nlocal function GetPetFoodFromBag()\n    -- Get the known pet food mapp\n    local knownPetFoods = GetKnownPetFoods()\n    \n    -- Define the chosen food\n    local foodBag = nil\n    local foodSlot = nil\n    local foodName = ''\n    local foodCount = 0\n    local foodMinLevel = 0\n    local foodConjured = false\n    \n    -- Create the updater fn\n    local UpdateBestFood = function(bag, slot)\n        -- Get the item id from the bags\n        local itemID = GetContainerItemID(bag, slot);\n        \n        -- Check if itemId is exists and it's a known pet food\n        if not itemID or not knownPetFoods[itemID] then return false end\n        \n        -- Extract item info and pet level\n        local petLevel = UnitLevel(\"pet\")\n        local itemCount = GetItemCount(itemID)\n        local itemName, itemLink, itemRarity, itemLevel, itemMinLevel = GetItemInfo(itemID);\n        \n        -- Make sure item info exists and the min level is not exceeding pet lvl\n        if not itemName or itemMinLevel <= 0 or itemMinLevel > petLevel then\n            return false\n        end\n        \n        -- Check if item is conjured\n        local itemConjured = itemName:find(\"^Conjured\") ~= nil\n        \n        -- Special logic if conjured food is prioritised\n        if aura_env.config.conjuredFoodPrio then\n            -- If item is conjured\n            if itemConjured and petLevel - itemLevel > 20 then\n                return false\n            end\n            \n            -- If we found a conjured food dont pick anything else\n            if foodConjured and not itemConjured then return false end\n            \n            -- Dont pick lower level food and keep the same conjured status\n            if itemConjured == foodConjured and itemMinLevel < foodMinLevel then\n                return false\n            end\n            \n            -- Pick the food with the bigger count and keep the same conjured status\n            if itemConjured == foodConjured and itemCount <= foodCount then\n                return false\n            end\n        else\n            -- Dont pick lower level food\n            if itemMinLevel < foodMinLevel then return false end\n            \n            -- Pick the food with the bigger count\n            if itemCount <= foodCount then return false end\n        end\n        \n        foodSlot = slot\n        foodBag = bag\n        foodName = itemName\n        foodCount = itemCount\n        foodMinLevel = itemMinLevel\n        foodConjured = itemConjured\n        \n        return true\n    end\n    \n    -- Iterate in each bag\n    for bag = 0, 4 do\n        for slot = 1, GetContainerNumSlots(bag) do\n            UpdateBestFood(bag, slot)\n        end\n    end\n    \n    return foodName, foodBag, foodSlot, foodCount;\nend\n\nlocal function OnButtonEnter(self)\n    if not aura_env.config.tooltipOnHover then return; end\n    \n    local bag = self:GetAttribute(\"target-bag\");\n    local slot = self:GetAttribute(\"target-slot\");\n    \n    GameTooltip:SetOwner(self, \"ANCHOR_TOP\", 0, 10);\n    GameTooltip:SetBagItem(bag, slot);\n    GameTooltip:Show();\nend\n\nlocal function OnButtonLeave(self) \n    GameTooltip:Hide() \nend\n\nlocal function UpdateFeedButton()\n    -- Make sure we don't update if we are in combat lockdown\n    if InCombatLockdown() then\n        return\n    end\n    \n    -- Get the boundaries of the weakaura icon\n    local auraFrame = WeakAuras.regions[aura_env.id].region;\n    local feedButton = auraFrame.MikeysFeedPetButton or nil;\n    \n    -- Check if button exists\n    if not feedButton then\n        -- Create the button frame\n        feedButton = CreateFrame(\"Button\", \"MikeysFeedPetButton\", UIParent, \"ActionButtonTemplate,SecureActionButtonTemplate\");\n        feedButton:SetAlpha(0);\n        feedButton:SetAttribute(\"type\", \"spell\");\n        feedButton:SetAttribute(\"spell\", \"Feed Pet\");\n        feedButton:SetScript(\"OnEnter\", OnButtonEnter);\n        feedButton:SetScript(\"OnLeave\", OnButtonLeave);\n        \n        -- Set the button to aura\n        auraFrame.MikeysFeedPetButton = feedButton;\n    end\n    \n    -- If the button is not visible don't update\n    if not feedButton:IsVisible() then \n        return \n    end\n    \n    -- Update the position of the button\n    feedButton:SetAllPoints(auraFrame);\n    \n    -- Update the food\n    local foodName, bag, slot = GetPetFoodFromBag();\n    feedButton:SetAttribute(\"target-bag\", bag);\n    feedButton:SetAttribute(\"target-slot\", slot);\nend\n\nlocal function PrintLogMessage(fromText)\n    if not fromText then return end\n    \n    local _, _, foodName = fromText:find('Your pet begins eating the (.+).')\n    local _, foodLink = GetItemInfo(foodName or '')\n    \n    if not foodLink then return end\n    \n    local petName = UnitName('pet');\n    local foodCount = GetItemCount(foodName);\n    \n    local textTpl = \"You feed %s some %s, %d remaining\";\n    local textStr = string.format(textTpl, petName, foodLink, foodCount);\n    \n    SELECTED_CHAT_FRAME:AddMessage(textStr, 1.0, 0.49, 0.04);\nend\n\naura_env.UpdateFeedButton = UpdateFeedButton;\naura_env.PrintLogMessage = PrintLogMessage;",
					["do_custom"] = true,
				},
				["finish"] = {
					["custom"] = "aura_env.DestroyFeedButton()",
					["do_custom"] = false,
				},
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "show",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.2.glow",
						}, -- [1]
					},
				}, -- [1]
			},
			["cooldown"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["OH Swing Timer "] = {
			["sparkWidth"] = 2,
			["iconSource"] = -1,
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["yOffset"] = -145,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["url"] = "https://wago.io/f0-OL9h-F/3",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["fontFlags"] = "OUTLINE",
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["selfPoint"] = "CENTER",
			["barColor"] = {
				1, -- [1]
				0.10196078431373, -- [2]
				0.12941176470588, -- [3]
				0, -- [4]
			},
			["desaturate"] = false,
			["sparkOffsetY"] = 0,
			["gradientOrientation"] = "HORIZONTAL",
			["load"] = {
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["sparkDesaturate"] = false,
			["texture"] = "Blizzard",
			["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite",
			["auto"] = true,
			["tocversion"] = 11403,
			["alpha"] = 1,
			["config"] = {
			},
			["borderBackdrop"] = "None",
			["parent"] = "Swing Timer",
			["customTextUpdate"] = "update",
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["unevent"] = "auto",
						["buffShowOn"] = "showOnActive",
						["duration"] = "1",
						["event"] = "Swing Timer",
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["use_hand"] = true,
						["names"] = {
						},
						["use_unit"] = true,
						["hand"] = "off",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
						["hand"] = "off",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 65,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["backdropInFront"] = false,
			["stickyDuration"] = false,
			["version"] = 3,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "%c",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "None",
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_visible"] = false,
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_text_format_c_format"] = "none",
				}, -- [3]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_text_format_p_time_mod_rate"] = true,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_legacy_floor"] = true,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_shadowXOffset"] = 1,
					["type"] = "subtext",
					["text_anchorXOffset"] = -30,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = -1,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "None",
					["text_anchorPoint"] = "INNER_CENTER",
					["text_text_format_p_format"] = "timed",
					["text_anchorYOffset"] = 0,
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [4]
				{
					["text_shadowXOffset"] = 1,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "None",
					["text_anchorPoint"] = "ICON_CENTER",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [5]
				{
					["border_size"] = 8,
					["border_anchor"] = "bar",
					["border_offset"] = 1,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Blizzard Tooltip",
					["type"] = "subborder",
				}, -- [6]
			},
			["height"] = 15,
			["sparkBlendMode"] = "ADD",
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["sparkColor"] = {
				1, -- [1]
				0.91764705882353, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["borderInFront"] = true,
			["sparkOffsetX"] = 0,
			["icon_side"] = "RIGHT",
			["spark"] = true,
			["sparkRotationMode"] = "AUTO",
			["sparkHeight"] = 15,
			["icon"] = false,
			["authorOptions"] = {
			},
			["zoom"] = 0,
			["semver"] = "1.0.2",
			["width"] = 204,
			["sparkHidden"] = "EMPTY",
			["useAdjustededMax"] = false,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["id"] = "OH Swing Timer ",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["inverse"] = false,
			["sparkDesature"] = false,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["uid"] = "V4I5VFtqmlW",
		},
	},
	["editor_theme"] = "Monokai",
}
