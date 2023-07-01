
ExtendedCharacterStats = {
	["general"] = {
		["statColorSelection"] = "full",
		["window"] = {
			["height"] = 422,
			["width"] = 180,
			["xOffset"] = -30,
			["yOffset"] = 30,
		},
		["statsWindowClosedOnOpen"] = false,
		["addColorsToStatTexts"] = true,
		["profileVersion"] = 16,
		["showQualityColors"] = true,
		["statFontSize"] = 10,
		["headerFontSize"] = 11,
	},
	["profile"] = {
		["ranged"] = {
			["attackPower"] = {
				["statColor"] = "ffa000",
				["display"] = true,
				["text"] = "Attack Power",
				["refName"] = "RangeAttackpower",
				["textColor"] = "ffd149",
			},
			["attackSpeed"] = {
				["statColor"] = "00766c",
				["display"] = true,
				["text"] = "Attack Speed",
				["refName"] = "RangedAttackSpeed",
				["textColor"] = "009688",
			},
			["hasteBonus"] = {
				["isTbcOnly"] = true,
				["statColor"] = "ffd740",
				["display"] = true,
				["text"] = "Haste Bonus",
				["refName"] = "RangedHasteBonus",
				["textColor"] = "c8a600",
			},
			["text"] = "Ranged",
			["hasteRating"] = {
				["isTbcOnly"] = true,
				["statColor"] = "ffd740",
				["display"] = true,
				["text"] = "Haste Rating",
				["refName"] = "RangedHasteRating",
				["textColor"] = "c8a600",
			},
			["hit"] = {
				["bossLevel"] = {
					["statColor"] = "558b2f",
					["display"] = true,
					["text"] = "Miss (Lvl + 3)",
					["refName"] = "RangedHitBossLevel",
					["textColor"] = "85bb5c",
				},
				["sameLevel"] = {
					["statColor"] = "558b2f",
					["display"] = true,
					["text"] = "Miss",
					["refName"] = "RangedHitSameLevel",
					["textColor"] = "85bb5c",
				},
				["isSubGroup"] = true,
				["text"] = "Hit",
				["display"] = true,
				["rating"] = {
					["isTbcOnly"] = true,
					["statColor"] = "558b2f",
					["display"] = true,
					["text"] = "Rating",
					["refName"] = "RangedHitRating",
					["textColor"] = "85bb5c",
				},
				["refName"] = "RangedHitHeader",
				["bonus"] = {
					["statColor"] = "558b2f",
					["display"] = true,
					["text"] = "Bonus",
					["refName"] = "RangedHitBonus",
					["textColor"] = "85bb5c",
				},
			},
			["display"] = true,
			["refName"] = "RangedHeader",
			["crit"] = {
				["statColor"] = "d32f2f",
				["display"] = true,
				["text"] = "Crit Chance",
				["refName"] = "RangedCritChance",
				["textColor"] = "ff6659",
			},
			["penetration"] = {
				["isTbcOnly"] = true,
				["statColor"] = "00766c",
				["display"] = true,
				["text"] = "Armor Penetration",
				["refName"] = "RangedArmorPenetration",
				["textColor"] = "009688",
			},
		},
		["defense"] = {
			["critImmunity"] = {
				["display"] = true,
				["isTbcOnly"] = true,
				["refName"] = "CritImmunity",
				["text"] = "Crit Immune",
			},
			["defense"] = {
				["display"] = true,
				["text"] = "Defense",
				["refName"] = "DefenseValue",
			},
			["blockChance"] = {
				["display"] = true,
				["text"] = "Block Chance",
				["refName"] = "BlockChance",
			},
			["text"] = "Defense",
			["blockValue"] = {
				["display"] = true,
				["text"] = "Block Value",
				["refName"] = "BlockValue",
			},
			["parry"] = {
				["display"] = true,
				["text"] = "Parry Chance",
				["refName"] = "ParryChance",
			},
			["display"] = false,
			["critReduction"] = {
				["display"] = true,
				["isTbcOnly"] = true,
				["refName"] = "CritReduction",
				["text"] = "Crit Reduction",
			},
			["defenseRating"] = {
				["display"] = true,
				["text"] = "Defense Rating",
				["refName"] = "DefenseRating",
			},
			["dodge"] = {
				["display"] = true,
				["text"] = "Dodge Chance",
				["refName"] = "DodgeChance",
			},
			["avoidance"] = {
				["display"] = true,
				["text"] = "Avoidance",
				["refName"] = "Avoidance",
			},
			["armor"] = {
				["display"] = true,
				["text"] = "Armor",
				["refName"] = "Armor",
			},
			["refName"] = "DefenseHeader",
			["resilience"] = {
				["display"] = true,
				["isTbcOnly"] = true,
				["refName"] = "ResilienceValue",
				["text"] = "Resilience",
			},
		},
		["general"] = {
			["display"] = true,
			["text"] = "General",
			["refName"] = "GeneralHeader",
			["movementSpeed"] = {
				["display"] = true,
				["text"] = "Movement Speed",
				["refName"] = "MovementSpeed",
			},
		},
		["melee"] = {
			["attackPower"] = {
				["statColor"] = "ffa000",
				["display"] = true,
				["text"] = "Attack Power",
				["refName"] = "MeleeAttackPower",
				["textColor"] = "ffd149",
			},
			["attackSpeed"] = {
				["offHand"] = {
					["statColor"] = "00766c",
					["display"] = true,
					["text"] = "Off Hand",
					["refName"] = "MeleeAttackSpeedOffHand",
					["textColor"] = "009688",
				},
				["mainHand"] = {
					["statColor"] = "00766c",
					["display"] = true,
					["text"] = "Main Hand",
					["refName"] = "MeleeAttackSpeedMainHand",
					["textColor"] = "009688",
				},
				["display"] = true,
				["text"] = "Attack Speed",
				["refName"] = "MeleeAttackSpeedHeader",
				["isSubGroup"] = true,
			},
			["hasteBonus"] = {
				["isTbcOnly"] = true,
				["statColor"] = "ffd740",
				["display"] = true,
				["text"] = "Haste Bonus",
				["refName"] = "MeleeHasteBonus",
				["textColor"] = "c8a600",
			},
			["text"] = "Melee",
			["penetration"] = {
				["isTbcOnly"] = true,
				["statColor"] = "00766c",
				["display"] = true,
				["text"] = "Armor Penetration",
				["refName"] = "MeleeArmorPenetration",
				["textColor"] = "009688",
			},
			["expertise"] = {
				["display"] = true,
				["isTbcOnly"] = true,
				["refName"] = "Expertise",
				["text"] = "Expertise",
			},
			["expertiseRating"] = {
				["display"] = true,
				["isTbcOnly"] = true,
				["refName"] = "ExpertiseRating",
				["text"] = "Expertise Rating",
			},
			["hit"] = {
				["bossLevel"] = {
					["statColor"] = "558b2f",
					["display"] = true,
					["text"] = "Miss (Lvl + 3)",
					["refName"] = "MeleeHitBossLevel",
					["textColor"] = "85bb5c",
				},
				["sameLevel"] = {
					["statColor"] = "558b2f",
					["display"] = true,
					["text"] = "Miss",
					["refName"] = "MeleeHitSameLevel",
					["textColor"] = "85bb5c",
				},
				["isSubGroup"] = true,
				["text"] = "Hit",
				["display"] = true,
				["rating"] = {
					["isTbcOnly"] = true,
					["statColor"] = "558b2f",
					["display"] = true,
					["text"] = "Rating",
					["refName"] = "MeleeHitRating",
					["textColor"] = "85bb5c",
				},
				["refName"] = "MeleeHitHeader",
				["bonus"] = {
					["statColor"] = "558b2f",
					["display"] = true,
					["text"] = "Bonus",
					["refName"] = "MeleeHitBonus",
					["textColor"] = "85bb5c",
				},
			},
			["display"] = true,
			["crit"] = {
				["statColor"] = "d32f2f",
				["display"] = true,
				["text"] = "Crit Chance",
				["refName"] = "MeleeCritChance",
				["textColor"] = "ff6659",
			},
			["refName"] = "MeleeHeader",
			["hasteRating"] = {
				["isTbcOnly"] = true,
				["statColor"] = "ffd740",
				["display"] = true,
				["text"] = "Haste Rating",
				["refName"] = "MeleeHasteRating",
				["textColor"] = "c8a600",
			},
		},
		["regen"] = {
			["mp5Items"] = {
				["statColor"] = "0d47a1",
				["display"] = true,
				["text"] = "MP5 (Items)",
				["refName"] = "MP5Items",
				["textColor"] = "5472d3",
			},
			["mp5Buffs"] = {
				["statColor"] = "0d47a1",
				["display"] = true,
				["text"] = "MP5 (Buffs)",
				["refName"] = "MP5Buffs",
				["textColor"] = "5472d3",
			},
			["mp5Spirit"] = {
				["statColor"] = "0d47a1",
				["display"] = true,
				["text"] = "MP5 (Spirit)",
				["refName"] = "MP5Spirit",
				["textColor"] = "5472d3",
			},
			["mp5Casting"] = {
				["statColor"] = "0d47a1",
				["display"] = true,
				["text"] = "MP5 (Casting)",
				["refName"] = "MP5Casting",
				["textColor"] = "5472d3",
			},
			["display"] = true,
			["text"] = "Mana",
			["refName"] = "ManaHeader",
			["mp5NotCasting"] = {
				["statColor"] = "0d47a1",
				["display"] = true,
				["text"] = "MP5 (Not casting)",
				["refName"] = "MP5NotCasting",
				["textColor"] = "5472d3",
			},
		},
		["spellBonus"] = {
			["physicalCrit"] = {
				["statColor"] = "cfcfcf",
				["display"] = true,
				["text"] = "Physical Crit",
				["refName"] = "PhysicalCritChance",
				["textColor"] = "9e9e9e",
			},
			["arcaneCrit"] = {
				["statColor"] = "80deea",
				["display"] = true,
				["text"] = "Arcane Crit",
				["refName"] = "ArcaneCritChance",
				["textColor"] = "b4ffff",
			},
			["natureDmg"] = {
				["statColor"] = "64dd17",
				["display"] = true,
				["text"] = "Nature Damage",
				["refName"] = "NatureDmg",
				["textColor"] = "9cff57",
			},
			["holyDmg"] = {
				["statColor"] = "ffd600",
				["display"] = true,
				["text"] = "Holy Damage",
				["refName"] = "HolyDmg",
				["textColor"] = "ff9e40",
			},
			["frostCrit"] = {
				["statColor"] = "00b0ff",
				["display"] = true,
				["text"] = "Frost Crit",
				["refName"] = "FrostCritChance",
				["textColor"] = "69e2ff",
			},
			["fireDmg"] = {
				["statColor"] = "d50000",
				["display"] = true,
				["text"] = "Fire Damage",
				["refName"] = "FireDmg",
				["textColor"] = "ff5131",
			},
			["bonusHealing"] = {
				["statColor"] = "f5f5f5",
				["display"] = true,
				["text"] = "Healing Power",
				["refName"] = "BonusHealing",
				["textColor"] = "ffffff",
			},
			["fireCrit"] = {
				["statColor"] = "d50000",
				["display"] = true,
				["text"] = "Fire Crit",
				["refName"] = "FireCritChance",
				["textColor"] = "ff5131",
			},
			["shadowDmg"] = {
				["statColor"] = "aa00ff",
				["display"] = true,
				["text"] = "Shadow Damage",
				["refName"] = "ShadowDmg",
				["textColor"] = "e254ff",
			},
			["frostDmg"] = {
				["statColor"] = "00b0ff",
				["display"] = true,
				["text"] = "Frost Damage",
				["refName"] = "FrostDmg",
				["textColor"] = "69e2ff",
			},
			["text"] = "Spell Power",
			["holyCrit"] = {
				["statColor"] = "ffd600",
				["display"] = true,
				["text"] = "Holy Crit",
				["refName"] = "HolyCritChance",
				["textColor"] = "ff9e40",
			},
			["physicalDmg"] = {
				["statColor"] = "cfcfcf",
				["display"] = true,
				["text"] = "Physical Damage",
				["refName"] = "PhysicalDmg",
				["textColor"] = "9e9e9e",
			},
			["shadowCrit"] = {
				["statColor"] = "aa00ff",
				["display"] = true,
				["text"] = "Shadow Crit",
				["refName"] = "ShadowCritChance",
				["textColor"] = "e254ff",
			},
			["display"] = false,
			["arcaneDmg"] = {
				["statColor"] = "80deea",
				["display"] = true,
				["text"] = "Arcane Damage",
				["refName"] = "ArcaneDmg",
				["textColor"] = "b4ffff",
			},
			["refName"] = "SpellBonusHeader",
			["natureCrit"] = {
				["statColor"] = "64dd17",
				["display"] = true,
				["text"] = "Nature Crit",
				["refName"] = "NatureCritChance",
				["textColor"] = "9cff57",
			},
		},
		["spell"] = {
			["penetration"] = {
				["display"] = true,
				["text"] = "Penetration",
				["refName"] = "SpellPenetration",
			},
			["crit"] = {
				["statColor"] = "d32f2f",
				["display"] = true,
				["text"] = "Crit Chance",
				["refName"] = "SpellCritChance",
				["textColor"] = "ff6659",
			},
			["hasteRating"] = {
				["isTbcOnly"] = true,
				["statColor"] = "ffd740",
				["display"] = true,
				["text"] = "Haste Rating",
				["refName"] = "SpellHasteRating",
				["textColor"] = "c8a600",
			},
			["hasteBonus"] = {
				["isTbcOnly"] = true,
				["statColor"] = "ffd740",
				["display"] = true,
				["text"] = "Haste Bonus",
				["refName"] = "SpellHasteBonus",
				["textColor"] = "c8a600",
			},
			["display"] = false,
			["text"] = "Spell",
			["refName"] = "SpellHeader",
			["hit"] = {
				["bossLevel"] = {
					["statColor"] = "558b2f",
					["display"] = true,
					["text"] = "Miss (Lvl + 3)",
					["refName"] = "SpellHitBossLevel",
					["textColor"] = "85bb5c",
				},
				["sameLevel"] = {
					["statColor"] = "558b2f",
					["display"] = true,
					["text"] = "Miss",
					["refName"] = "SpellHitSameLevel",
					["textColor"] = "85bb5c",
				},
				["isSubGroup"] = true,
				["text"] = "Hit",
				["display"] = true,
				["rating"] = {
					["isTbcOnly"] = true,
					["statColor"] = "558b2f",
					["display"] = true,
					["text"] = "Rating",
					["refName"] = "SpellHitRating",
					["textColor"] = "85bb5c",
				},
				["refName"] = "SpellHitHeader",
				["bonus"] = {
					["statColor"] = "558b2f",
					["display"] = true,
					["text"] = "Bonus",
					["refName"] = "SpellHitBonus",
					["textColor"] = "85bb5c",
				},
			},
		},
	},
}
