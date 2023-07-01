local mod	= DBM:NewMod("Razorgore", "DBM-BWL", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20220808094816")
mod:SetCreatureID(12435, 99999)--Bogus detection to prevent invalid kill detection if razorgore happens to die in phase 1
mod:SetEncounterID(610)--BOSS_KILL is valid, but ENCOUNTER_END is not
mod:DisableEEKillDetection()--So disable only EE
mod:SetModelID(10115)
mod:SetHotfixNoticeRev(20220207000000)
mod:SetMinSyncRevision(20200904000000)--2020, September, 4th

mod:RegisterCombat("yell", L.YellPull)
mod:SetWipeTime(180)--guesswork

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 22425",
	"SPELL_CAST_SUCCESS 23040 19873",
	"SPELL_SUMMON 366907 367886",
	"SPELL_AURA_APPLIED 23023 364455 367873 367756",
	"CHAT_MSG_MONSTER_EMOTE",
--	"CHAT_MSG_MONSTER_YELL",
	"UNIT_DIED"
)

--[[
ability.id = 22425 and type = "begincast" or (ability.id = 23040 or ability.id = 19873) and type = "cast"
 or (ability.id = 366907 or ability.id = 367886) and type = "summon"
 or (ability.id = 367756 or ability.id = 364455) and target.id = 185320 and type = "applybuff"
 or  ability.id = 367873 and type = "applydebuff"
 or ability.id = 367740
 --]]
--Chromatic drake seems to cast one of his 5 abilities randomly every 10 second. The problem, 3 of them aren't in combat log and using debuffs for them is very inaccurate, especially since it gets even more complicated by fact that in classic can't even use spellid (only name) so it clouds it even more with multiple ids for mechanics existing too
local warnPhase2			= mod:NewPhaseAnnounce(2)
local warnFireballVolley	= mod:NewCastAnnounce(22425, 3)
local warnConflagration		= mod:NewTargetNoFilterAnnounce(23023, 2)
local warnEggsLeft			= mod:NewCountAnnounce(19873, 1)

local specWarnFireballVolley= mod:NewSpecialWarningMoveTo(22425, false, nil, nil, 2, 2)

local timerAddsSpawn		= mod:NewTimer(47, "TimerAddsSpawn", 19879, nil, nil, 1)--Only for start of adds, not adds after the adds.

mod:AddSpeedClearOption("BWL", true)
--SoM Only
mod:AddTimerLine(DBM_COMMON_L.SEASONAL)
local warnBrandofShadow		= mod:NewTargetNoFilterAnnounce(364455, 2)--Basically used as a chromatic drake spawn warning
local warnRubyBreath		= mod:NewSpellAnnounce(366907, 2)--Red
local warnDreamBreath		= mod:NewSpellAnnounce(367886, 2)--Green
local warnBlindingAsh		= mod:NewTargetAnnounce(367873, 2)--Black
local warnTemporalAcc		= mod:NewTargetNoFilterAnnounce(367756, 2)--Bronze

local timerSpecialCD		= mod:NewCDSpecialTimer(10)--Missing Azure and Obsidian triggers to make it work semi decent, a better bronze trigger would be nice too

mod.vb.eggsLeft = 30
mod.vb.firstEngageTime = nil

function mod:OnCombatStart(delay)
	self:SetStage(1)
	timerAddsSpawn:Start()
	self.vb.eggsLeft = 30
	if not self.vb.firstEngageTime then
		self.vb.firstEngageTime = GetServerTime()
		if self.Options.FastestClear and self.Options.SpeedClearTimer then
			--Custom bar creation that's bound to core, not mod, so timer doesn't stop when mod stops it's own timers
			DBT:CreateBar(self.Options.FastestClear, DBM_CORE_L.SPEED_CLEAR_TIMER_TEXT, 136106)
		end
	end
	if self:IsSeasonal() then
		DBM:AddMsg("The next special timer for chromatic is hit or miss at best since not all 5 of his triggers are detectable (azure and obsidian cast event missing, only debuffs present)")
	end
end

do
	local fireballVolley = DBM:GetSpellInfo(22425)
	function mod:SPELL_CAST_START(args)
		--if args.spellId == 23023 and args:IsDestTypePlayer() then
		if args.spellName == fireballVolley  then
			if self.Options.SpecWarn22425moveto then
				specWarnFireballVolley:Show(DBM_COMMON_L.BREAK_LOS)
				specWarnFireballVolley:Play("findshelter")
			else
				warnFireballVolley:Show()
			end
		end
	end
end

do
	local warmingFlames, destroyEgg = DBM:GetSpellInfo(23040), DBM:GetSpellInfo(19873)
	function mod:SPELL_CAST_SUCCESS(args)
		--if args.spellId == 23023 and args:IsDestTypePlayer() then
		if args.spellName == warmingFlames and self.vb.phase < 2 then
			warnPhase2:Show()
			self:SetStage(2)
		--This may not be accurate, it depends on how large expanded combat log range is
		--elseif args.spellId == 19873 then
		elseif args.spellName == destroyEgg then
			self.vb.eggsLeft = self.vb.eggsLeft - 1
			warnEggsLeft:Show(string.format("%d/%d",30-self.vb.eggsLeft,30))
		end
	end
end

do
	local RubyBreath, DreamBreath = DBM:GetSpellInfo(366907), DBM:GetSpellInfo(367886)
	function mod:SPELL_SUMMON(args)
		--if args.spellId == 23023 and args:IsDestTypePlayer() then
		if args.spellName == RubyBreath then
			warnRubyBreath:Show()
			timerSpecialCD:Start(10)
		elseif args.spellName == DreamBreath then
			warnDreamBreath:Show()
			timerSpecialCD:Start(10)
		end
	end
end

do
	local Conflagration, brandofShadow, BlindingAsh, TemporalAcceleration = DBM:GetSpellInfo(23023), DBM:GetSpellInfo(364455), DBM:GetSpellInfo(367873), DBM:GetSpellInfo(367756)
	function mod:SPELL_AURA_APPLIED(args)
		--if args.spellId == 23023 and args:IsDestTypePlayer() then
		if args.spellName == Conflagration and args:IsDestTypePlayer() then
			warnConflagration:CombinedShow(0.3, args.destName)
		elseif args.spellName == brandofShadow and args:GetDestCreatureID() == 185320 then
			warnBrandofShadow:Show(args.destName)
			timerSpecialCD:Start(13)
		elseif args.spellName == TemporalAcceleration and args:GetDestCreatureID() == 185320 then
			warnTemporalAcc:Show(args.destName)
			timerSpecialCD:Start(10)
		elseif args.spellName == BlindingAsh and args:IsDestTypePlayer() then
			warnBlindingAsh:CombinedShow(0.5, args.destName)
		end
	end
end

--For some reason this no longer works
function mod:CHAT_MSG_MONSTER_EMOTE(msg)
	if (msg == L.Phase2Emote or msg:find(L.Phase2Emote)) and self.vb.phase < 2 then
		self:SendSync("Phase2")
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 12435 then--Only trigger kill for unit_died if he dies in phase 2 with everyone alive, otherwise it's an auto wipe.
		if DBM:NumRealAlivePlayers() > 0 and self.vb.phase == 2 then
			DBM:EndCombat(self)
		else
			DBM:EndCombat(self, true)--Pass wipe arg end combat
		end
	elseif cid == 185320 then--Unstable Chromatic Drake
		timerSpecialCD:Stop()
	end
end

function mod:OnSync(msg)
	if msg == "Phase2" and self.vb.phase < 2 then
		warnPhase2:Show()
		self:SetStage(2)
	end
end
