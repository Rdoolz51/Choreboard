if GetLocale() ~= "ruRU" then return end

local L

------------
-- Skeram --
------------
L = DBM:GetModLocalization("Skeram")

L:SetGeneralLocalization{
	name = "Пророк Скерам"
}

----------------
-- Three Bugs --
----------------
L = DBM:GetModLocalization("ThreeBugs")

L:SetGeneralLocalization{
	name = "Семейство жуков"
}
L:SetMiscLocalization{
	Yauj = "Принцесса Яудж",
	Vem = "Вем",
	Kri = "Лорд Кри"
}

-------------
-- Sartura --
-------------
L = DBM:GetModLocalization("Sartura")

L:SetGeneralLocalization{
	name = "Боевой страж Сартура"
}

--------------
-- Fankriss --
--------------
L = DBM:GetModLocalization("Fankriss")

L:SetGeneralLocalization{
	name = "Фанкрисс Непреклонный"
}
--------------
-- Viscidus --
--------------
L = DBM:GetModLocalization("Viscidus")

L:SetGeneralLocalization{
	name = "Нечистотон"
}
L:SetWarningLocalization{
	WarnFreeze	= "Заморожен: %d/3",
	WarnShatter	= "Расколот: %d/3"
}
L:SetOptionLocalization{
	WarnFreeze	= "Объявлять статус Заморозки",
	WarnShatter	= "Объявлять статус Раскола"
}
L:SetMiscLocalization{
	Slow	= "замедляется!",
	Freezing= "замораживается!",
	Frozen	= "застывает!",
	Phase4 	= "Нечистотон начинает раскалываться!",
	Phase5 	= "Нечистотон едва держится!",
	Phase6 	= "взрывается!",

	HitsRemain	= "Ударов осталось",
	Frost		= "Лёд",
	Physical	= "Физический урон"
}
-------------
-- Huhuran --
-------------
L = DBM:GetModLocalization("Huhuran")

L:SetGeneralLocalization{
	name = "Принцесса Хухуран"
}
---------------
-- Twin Emps --
---------------
L = DBM:GetModLocalization("TwinEmpsAQ")

L:SetGeneralLocalization{
	name = "Императоры-близнецы"
}
L:SetMiscLocalization{
	Veklor = "Император Век'лор",
	Veknil = "Император Век'нилаш"
}

------------
-- C'Thun --
------------
L = DBM:GetModLocalization("CThun")

L:SetGeneralLocalization{
	name = "К'Тун"
}
L:SetWarningLocalization{
	WarnEyeTentacle 	= "Глазной отросток!",
	WarnClawTentacle2	= "Когтещупальце!",
	WarnGiantEyeTentacle	= "Гигантское глазное щупальце!",
	WarnGiantClawTentacle	= "Гигантское когтещупальце!",
	WarnWeakened 		= "К'Тун ослаблен! Бейте его!"
}
L:SetTimerLocalization{
	TimerEyeTentacle	= "Глазной отросток",
	TimerGiantEyeTentacle	= "Гигантское глазное щупальце",
	TimerClawTentacle	= "Когтещупальце",
	TimerGiantClawTentacle	= "Гигантское когтещупальце",
	TimerWeakened		= "К'Тун ослаблен"
}
L:SetOptionLocalization{
	WarnEyeTentacle			= "Показывать предупреждение для Глазного отростка",
	WarnClawTentacle2		= "Показывать предупреждение для Когтещупальца",
	WarnGiantEyeTentacle	= "Показывать предупреждение для Гигантского глазного щупальца",
	WarnGiantClawTentacle	= "Показывать предупреждение для Гигантского когтещупальца",
	SpecWarnWeakened		= "Показывать специальное предупреждение, когда босс ослаблен",
	TimerEyeTentacle		= "Показывать таймер до следующего Глазного отростка",
	TimerClawTentacle		= "Показывать таймер до следующего Когтещупальца",
	TimerGiantEyeTentacle	= "Показывать таймер до следующего Гигантского глазного щупальца",
	TimerGiantClawTentacle	= "Показывать таймер до следующего Гигантского когтещупальца",
	TimerWeakened			= "Показывать таймер длительности ослабления босса",
	RangeFrame				= "Показывать окно дистанции (10м)"
}
L:SetMiscLocalization{
	Stomach		= "Живот",
	Eye			= "Око К'Туна",
	FleshTent	= "Мясистое щупальце",--Localized so it shows on frame in users language, not senders
	Weakened 	= "ослаблен!",
	NotValid	= "АК40 частично очищен. Осталось %s необязательных боссов."
}
----------------
-- Ouro --
----------------
L = DBM:GetModLocalization("Ouro")

L:SetGeneralLocalization{
	name = "Оуро"
}
L:SetWarningLocalization{
	WarnSubmerge		= "Закапывание",
	WarnEmerge			= "Появление",
	WarnSubmergeSoon	= "Скоро закапывание",
	WarnEmergeSoon		= "Скоро появление"
}
L:SetTimerLocalization{
	TimerSubmerge		= "Закапывание",
	TimerEmerge			= "Появление"
}
L:SetOptionLocalization{
	WarnSubmerge		= "Показывать предупреждение о закапывании",
	WarnSubmergeSoon	= "Предупреждать заранее о закапывании",
	TimerSubmerge		= "Показывать таймер до закапывания",
	WarnEmerge			= "Показывать предупреждение о появлении",
	WarnEmergeSoon		= "Предупреждать заранее о появлении",
	TimerEmerge			= "Показывать таймер до появления"
}

----------------
-- AQ40 Trash --
----------------
L = DBM:GetModLocalization("AQ40Trash")

L:SetGeneralLocalization{
	name = "Трэш мобы Ан'Кираж 40"
}
