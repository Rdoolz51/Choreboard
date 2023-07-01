if not DBM:IsSeasonal() then return end--If not SoM, these two bosses load separately
local mod	= DBM:NewMod("EbonrocandFlamegor", "DBM-BWL", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20220808094816")
mod:SetCreatureID(14601, 11981)
mod:SetEncounterID(614, 615, 2566)
mod:SetModelID(6377)
mod:RegisterCombat("combat")
mod:SetBossHPInfoToHighest()

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 22539",
	"SPELL_CAST_SUCCESS 23339 23340 23342 368515 368521",
	"SPELL_AURA_APPLIED 23340 23342 368515 368521",
	"SPELL_AURA_APPLIED_DOSE 368515 368521",
	"SPELL_AURA_REMOVED 23340 23342"
)

--Changes from non SoM (besides bosses being linked together)
--Wing buffet changed from channeled to instant cast
--Shadow of Ebonroc and Frenzy are spell linked (always cast at same time)
--Shadow flame and Wing Buffet also spell linked, always cast when other drake casts it
--All CDs changed to ~25
--[[
(ability.id = 23339 or ability.id = 22539) and type = "begincast"
 or (ability.id = 368942 or ability.id = 23342 or ability.id = 369103 or ability.id = 369105 or ability.id = 23340 or ability.id = 368515 or ability.id = 368521) and type = "cast"
--]]
--Both
mod:AddTimerLine(DBM_COMMON_L.BOTH)
local warnWingBuffet		= mod:NewCastAnnounce(23339, 2)
local warnShadowFlame		= mod:NewCastAnnounce(22539, 2)

local timerWingBuffet		= mod:NewCDTimer(25, 23339, nil, nil, nil, 2)
local timerShadowFlameCD	= mod:NewCDTimer(25, 22539)--25-32
local TimerBrandCD			= mod:NewTimer(13, "TimerBrandCD", 368521, nil, nil, 3)

--Ebonroc
mod:AddTimerLine(L.Ebonroc)
local warnShadow			= mod:NewTargetNoFilterAnnounce(23340, 4, nil, "Tank|Healer", 2)

local specWarnShadowYou		= mod:NewSpecialWarningYou(23340, nil, nil, nil, 1, 2)
local specWarnShadow		= mod:NewSpecialWarningTaunt(23340, nil, nil, nil, 1, 2)
local specWarnBrandofShadow	= mod:NewSpecialWarningStack(368515, nil, 4, nil, nil, 1, 6)

local timerShadowCD			= mod:NewCDTimer(25, 23340, nil, "Tank|Healer", 3, 5, nil, DBM_COMMON_L.TANK_ICON)
local timerShadow			= mod:NewTargetTimer(8, 23340, nil, "Tank|Healer", 3, 5, nil, DBM_COMMON_L.TANK_ICON)

--Flamegore
mod:AddTimerLine(L.Flamegore)
local warnFrenzy			= mod:NewSpellAnnounce(23342, 3, nil, "Tank|RemoveEnrage|Healer", 5)

local specWarnFrenzy		= mod:NewSpecialWarningDispel(23342, "RemoveEnrage", nil, nil, 1, 6)
local specWarnBrandofFlame	= mod:NewSpecialWarningStack(368521, nil, 4, nil, nil, 1, 6)

local timerFrenzyCD			= mod:NewCDTimer(25, 23342, nil, "Tank|RemoveEnrage|Healer", nil, 5, nil, DBM_COMMON_L.ENRAGE_ICON)
local timerFrenzy	 		= mod:NewBuffActiveTimer(10, 23342, nil, "Tank|RemoveEnrage|Healer", nil, 5, nil, DBM_COMMON_L.ENRAGE_ICON)

function mod:OnCombatStart(delay)
	--Both
	TimerBrandCD:Start(16-delay)
	timerShadowFlameCD:Start(29-delay)--29-50, yep, classic for you
	timerWingBuffet:Start(40-delay)--40-42, better than shadow flame
	--Ebon
	timerShadowCD:Start(27-delay)--27-37
	--Flame
	timerFrenzyCD:Start(27-delay)--27-38
end

do
	local ShadowFlame = DBM:GetSpellInfo(22539)
	function mod:SPELL_CAST_START(args)--did not see ebon use any of these abilities
		--if args.spellId == 23339 then
		if args.spellName == ShadowFlame and self:AntiSpam(3, 1) then
			warnShadowFlame:Show()
			timerShadowFlameCD:Start()
		end
	end
end

do
	local Frenzy, ShadowofEbonroc, WingBuffet = DBM:GetSpellInfo(23342), DBM:GetSpellInfo(23340), DBM:GetSpellInfo(369103)
	local brandofShadow, brandofFlame = DBM:GetSpellInfo(368515), DBM:GetSpellInfo(368521)
	function mod:SPELL_CAST_SUCCESS(args)
		--if args.spellId == 23342 then
		if args.spellName == Frenzy and args:IsSrcTypeHostile() then
			if self.Options.SpecWarn23342dispel then
				specWarnFrenzy:Show(args.sourceName)
				specWarnFrenzy:Play("enrage")
			else
				warnFrenzy:Show()
			end
			timerFrenzyCD:Start()
		--if args.spellId == 23339 then
		elseif args.spellName == WingBuffet and self:AntiSpam(3, 2) then
			warnWingBuffet:Show()
			timerWingBuffet:Start()
		elseif args.spellName == ShadowofEbonroc then
			timerShadowCD:Start()
		elseif (args.spellName == brandofShadow or args.spellName == brandofFlame) and self:AntiSpam(3, 3) then
			TimerBrandCD:Start()
		end
	end
	function mod:SPELL_AURA_APPLIED(args)
		--if args.spellId == 23342 then
		if args.spellName == Frenzy then
			timerFrenzy:Start()
		--elseif args.spellId == 23340 then
		elseif args.spellName == ShadowofEbonroc then
			if args:IsPlayer() then
				specWarnShadowYou:Show()
				specWarnShadowYou:Play("targetyou")
			else
				--Can't use GetNumAliveTanks in classic, rip
				if self.Options.SpecWarn23340taunt and (self:IsTank() or not DBM.Options.FilterTankSpec) and self:CheckNearby(12, args.destName) then
					specWarnShadow:Show(args.destName)
					specWarnShadow:Play("tauntboss")
				else
					warnShadow:Show(args.destName)
				end
			end
			timerShadow:Start(args.destName)
		--elseif args.spellId == 368515 then
		elseif args.spellName == brandofShadow then
			local amount = args.amount or 1
			--if adds all dead, should be swapping at about 6-7. If they aren't all dead, it'll start throwing emergency warnings at 8+
			if amount >= 4 then
				if args:IsPlayer() then
					specWarnBrandofShadow:Show(amount)
					specWarnBrandofShadow:Play("stackhigh")
				end
			end
		--elseif args.spellId == 368521 then
		elseif args.spellName == brandofFlame then
			local amount = args.amount or 1
			--if adds all dead, should be swapping at about 6-7. If they aren't all dead, it'll start throwing emergency warnings at 8+
			if amount >= 4 then
				if args:IsPlayer() then
					specWarnBrandofFlame:Show(amount)
					specWarnBrandofFlame:Play("stackhigh")
				end
			end
		end
	end
	mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

	function mod:SPELL_AURA_REMOVED(args)--did not see ebon use any of these abilities
		--if args.spellId == 23342 then
		if args.spellName == Frenzy then
			timerFrenzy:Stop()
		--elseif args.spellId == 23340 then
		elseif args.spellName == ShadowofEbonroc then
			timerShadow:Stop(args.destName)
		end
	end
end
