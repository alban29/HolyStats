local cache = {}
local healingSpells = {
	Heal = {
		['Rank 1'] = {
			org = {
				Min = 307,
				Max = 353,
				Mana = 155,
				Cast = 2.5,
				BaseCast = 3,
				lvl = 16
			}
		},
		['Rank 2'] = {
			org = {
				Min = 445,
				Max = 507,
				Mana = 205,
				Cast = 2.5,
				BaseCast = 3,
				lvl = 28
			}
		},
		['Rank 3'] = {
			org = {
				Min = 586,
				Max = 662,
				Mana = 255,
				Cast = 2.5,
				BaseCast = 3,
				lvl = 28
			}
		},
		['Rank 4'] = {
			org = {
				Min = 734,
				Max = 827,
				Mana = 305,
				Cast = 2.5,
				BaseCast = 3,
				lvl = 34
			}
		}
	},
	['Greater Heal'] = {
		['Rank 1'] = {
			org = {
				Min = 924,
				Max = 1039,
				Mana = 370,
				Cast = 2.5,
				BaseCast = 3,
				lvl = 40
			}
		},
		['Rank 2'] = {
			org = {
				Min = 1178,
				Max = 1318,
				Mana = 455,
				Cast = 2.5,
				BaseCast = 3,
				lvl = 46
			}
		},
		['Rank 3'] = {
			org = {
				Min = 1470,
				Max = 1642,
				Mana = 545,
				Cast = 2.5,
				BaseCast = 3,
				lvl = 52
			}
		},
		['Rank 4'] = {
			org = {
				Min = 1813,
				Max = 2021,
				Mana = 655,
				Cast = 2.5,
				BaseCast = 3,
				lvl = 58
			}
		}
	},
	['Flash Heal'] = {
		['Rank 1'] = {
			org = {
				Min = 202,
				Max = 247,
				Mana = 125,
				Cast = 1.5,
				BaseCast = 1.5,
				lvl = 20
			}
		},
		['Rank 2'] = {
			org = {
				Min = 269,
				Max = 325,
				Mana = 155,
				Cast = 1.5,
				BaseCast = 1.5,
				lvl = 26
			}
		},
		['Rank 3'] = {
			org = {
				Min = 339,
				Max = 406,
				Mana = 185,
				Cast = 1.5,
				BaseCast = 1.5,
				lvl = 32
			}
		},
		['Rank 4'] = {
			org = {
				Min = 414,
				Max = 492,
				Mana = 215,
				Cast = 1.5,
				BaseCast = 1.5,
				lvl = 38
			}
		},
		['Rank 5'] = {
			org = {
				Min = 534,
				Max = 633,
				Mana = 265,
				Cast = 1.5,
				BaseCast = 1.5,
				lvl = 44
			}
		},
		['Rank 6'] = {
			org = {
				Min = 662,
				Max = 783,
				Mana = 315,
				Cast = 1.5,
				BaseCast = 1.5,
				lvl = 50
			}
		},
		['Rank 7'] = {
			org = {
				Min = 828,
				Max = 975,
				Mana = 380,
				Cast = 1.5,
				BaseCast = 1.5,
				lvl = 56
			}
		}
	},
	['Renew'] = {
		['Rank 1'] = {
			org = {
				Min = 45,
				Max = 45,
				Mana = 30,
				Cast = 0,
				BaseCast = 15,
				lvl = 8
			}
		},
		['Rank 2'] = {
			org = {
				Min = 100,
				Max = 100,
				Mana = 65,
				Cast = 0,
				BaseCast = 15,
				lvl = 14
			}
		},
		['Rank 3'] = {
			org = {
				Min = 175,
				Max = 175,
				Mana = 105,
				Cast = 0,
				BaseCast = 15,
				lvl = 20
			}
		},
		['Rank 4'] = {
			org = {
				Min = 245,
				Max = 245,
				Mana = 140,
				Cast = 0,
				BaseCast = 15,
				lvl = 26
			}
		},
		['Rank 5'] = {
			org = {
				Min = 315,
				Max = 315,
				Mana = 170,
				Cast = 0,
				BaseCast = 15,
				lvl = 32
			}
		},
		['Rank 6'] = {
			org = {
				Min = 400,
				Max = 400,
				Mana = 205,
				Cast = 0,
				BaseCast = 15,
				lvl = 38
			}
		},
		['Rank 7'] = {
			org = {
				Min = 510,
				Max = 510,
				Mana = 250,
				Cast = 0,
				BaseCast = 15,
				lvl = 44
			}
		},
		['Rank 8'] = {
			org = {
				Min = 650,
				Max = 650,
				Mana = 305,
				Cast = 0,
				BaseCast = 15,
				lvl = 50
			}
		},
		['Rank 9'] = {
			org = {
				Min = 810,
				Max = 810,
				Mana = 365,
				Cast = 0,
				BaseCast = 15,
				lvl = 56
			}
		},
	},
	['Prayer of Healing'] = {
		['Rank 1'] = {
			org = {
				Min = 312,
				Max = 333,
				Mana = 410,
				Cast = 3,
				BaseCast = 3,
				lvl = 60,
				targets = 5
			}
		},
		['Rank 2'] = {
			org = {
				Min = 458,
				Max = 487,
				Mana = 560,
				Cast = 3,
				BaseCast = 3,
				lvl = 60,
				targets = 5
			}
		},
		['Rank 3'] = {
			org = {
				Min = 675,
				Max = 713,
				Mana = 770,
				Cast = 3,
				BaseCast = 3,
				lvl = 60,
				targets = 5
			}
		},
		['Rank 4'] = {
			org = {
				Min = 939,
				Max = 991,
				Mana = 1030,
				Cast = 3,
				BaseCast = 3,
				lvl = 60,
				targets = 5
			}
		},
	}
}

local sortBy = 'eff'
local sortOrder = 1

function SpellsFrame_OnLoad(self)
	SpellsFrameBG:SetVertexColor(0.2, 0.2, 0.2)
	self:SetMinResize(20,20)
	self:SetClampedToScreen(true)
	local offset = 0

	local btn = CreateFrame("Button", nil, self,"UIPanelButtonTemplate")
		btn:SetPoint("TOPLEFT", -20, 1)
		btn:SetScript("OnClick", function()
			toggleSpellsFrameConfig()
		end)
	btn:SetText('?')
	btn:SetWidth(20)
	local columns = {
		{ name = 'spell', width = 110 },
		{ name = 'rank', width = 50 },
		{ name = 'min', width = 40 },
		{ name = 'max', width = 40 },
		{ name = 'avg', width = 40 },
		{ name = 'mana', width = 40 },
		{ name = 'eff', width = 40 },
		{ name = 'hbcoeff', width = 40 },
		{ name = 'hb', width = 40 },
		{ name = 'hbp', width = 40 }
	}
	SpellsFrameTextSpell1:SetWidth(columns[1]['width'])
	for _,col in pairs(columns)
	do
		local btn = CreateFrame("Button", nil, self,"UIPanelButtonTemplate")
		btn:SetPoint("TOPLEFT", offset, 1)
		btn:SetScript("OnClick", function()
			if sortBy ~= col['name']
			then
				sortBy = col['name']
				sortOrder = 1
			else
				if sortOrder == 1
				then
					sortOrder = 0
				else 
					sortOrder = 1
				end
			end
			SpellsFrame_Update()
		end)
		btn:SetText(col['name'])
		btn:SetWidth(col['width'])
		offset = offset + col['width']
	end
end

function SpellsFrame_OnMouseDown(self, button)
	if (button == "LeftButton") then
		self:StartMoving()
		return
	elseif button == "RightButton" then
		self:StartSizing()
		self.isSizing = true
		return
	elseif button == "MiddleButton" then
		hideSpellsFrame()
	end
end

function SpellsFrame_OnMouseUp(self, button)
	self:StopMovingOrSizing()
end

function SpellsFrame_Update()
	calculateSpells()
	local spells = getHealingSpells()
	local data = getSpells(spells)
	printData(data)
end

function getHealingSpells()
	local spells = {}
	local i = 1
	while true do
		local spellName, spellSubName = GetSpellBookItemName(i, BOOKTYPE_SPELL)
		if not spellName
		then
			do break end
		end
		spellName = en(spellName)
		spellSubName = en(spellSubName)

		if healingSpells[spellName] ~= nil and healingSpells[spellName][spellSubName] ~= nil
		then
			if spells[spellName] == nil
			then
				spells[spellName] = {}
			end
			spells[spellName][spellSubName] = healingSpells[spellName][spellSubName]
		end
		i = i + 1
	end
	return spells
end

function sortKeys(data)
	local keys = {}
	for k in pairs(data)
	do
		table.insert(keys, k)
	end
	table.sort(keys)

	return keys
end

function calculateSpells()
	-- Mental Agility - instant casts 2% * 5
	-- Improved Renew - renew 5% * 3
	-- Improved Healing - mana cost Lesser Heal, Heal, Greater Heal 5% * 3
	-- Improved Prayer of Healing - mana cost Prayer of Healing 10% * 2
	-- Spiritual Guidance - healing by 5% * 5 of Spirit [included in bonus healing]
	-- Spritual Healing - healing spells 2% * 5
	local bonus = 0
	local spellRank = getTalentRank('Spiritual Healing')
	if spellRank > 0
	then
		bonus = 0.02 * spellRank
	end

	local manaCost = 0
	spellRank = getTalentRank('Improved Healing')
	if spellRank > 0
	then
		manaCost = 0.05 * spellRank
	end

	local renew = 0
	spellRank = getTalentRank('Improved Renew')
	if spellRank > 0
	then
		renew = 0.05 * spellRank
	end

	local instantMana = 0
	spellRank = getTalentRank('Mental Agility')
	if spellRank > 0
	then
		instantMana = 0.02 * spellRank
	end

	local data = healingSpells
	for spell, ranks in pairs(healingSpells)
	do
		for rank, obj in pairs(ranks)
		do
			local mana = obj['org']['Mana']
			if spell == 'Heal' or spell == 'Lesser Heal' or spell == 'Greater Heal'
			then
				mana = obj['org']['Mana']*(1-manaCost)
			end
			if spell == 'Prayer of Healing'
			then
				mana = obj['org']['Mana'] * (1 - getTalentRank('Improved Prayer of Healing') * 0.1)
			end

			local xMin = obj['org']['Min']*(1+bonus)
			local xMax = obj['org']['Max']*(1+bonus)
			if spell == 'Renew'
			then
				mana = obj['org']['Mana']*(1-instantMana)
				xMin = obj['org']['Min']*(1+bonus+renew)
				xMax = obj['org']['Max']*(1+bonus+renew)
			end

			local tg = nil
			if obj['org']['targets'] ~= nil
			then
				tg = obj['org']['targets']
			end
			data[spell][rank] = {
				Min = obj['org']['Min']*(1+bonus),
				Max = obj['org']['Max']*(1+bonus),
				Mana = mana,
				Cast = obj['org']['Cast'],
				BaseCast = obj['org']['BaseCast'],
				lvl = obj['org']['lvl'],
				targets = tg,
				org = obj['org']
			}
		end
	end

	healingSpells = data
end
	
function getSpells(spells)
	local toFrame = ''
	local data = {}
	cache['maxeff'] = 0
	for a,spell in pairs(sortKeys(spells))
	do
		for a,rank in pairs(sortKeys(spells[spell]))
		do
			if not isSpellIgnored(spell, rank)
			then
				local meta = spells[spell][rank]
				local hb = 0
				local bonusHealing = GetSpellBonusHealing()
				local coeff = meta.BaseCast / 3.5
				if spell == 'Renew'
				then
					coeff = meta.BaseCast / 15
				end
				if spell == 'Prayer of Healing'
				then
					coeff = coeff / 3
				end
				local lvlPenality = 1
				if meta.lvl < 20
				then
					lvlPenality = 1 - ((20 - meta.lvl) * 0.0375)
				end
				coeff = coeff * lvlPenality
				local mana = math.ceil(meta.Mana)
				hbp = bonusHealing * coeff
				
				local loopTargets = 1
				if meta.targets ~= nil
				then
					loopTargets = meta.targets
				end 
				for tarNum = 1, loopTargets
				do
					local targets = ''
					local cMin = meta.Min * tarNum
					local cMax = meta.Max * tarNum
					if meta.targets ~=nil
					then
						targets = ' (x' .. tostring(tarNum) .. ')'
					end

					local avg = (cMin + cMax) / 2
					local mMin = cMin + bonusHealing * coeff
					local mMax = cMax + bonusHealing * coeff
					local avgHB = avg + bonusHealing * coeff
					local eff = avgHB / meta.Mana
					hb = (avgHB - avg) * 100 / avgHB
					
					local entry = {
						['spell'] = spell .. targets,
						['rank'] = rank,
						['mana'] = mana,
						['min'] = mMin,
						['max'] = mMax,
						['avg'] = avgHB,
						['eff'] = eff,
						['hbcoeff'] = coeff * 100,
						['hb'] = hbp,
						['hbp'] = hb
					}
					table.insert(data, entry)
					if cache['maxeff'] < eff
					then
						cache['maxeff'] = eff
					end
				end
			end
		end
	end

	if sortBy ~= nil 
	then
		data = sortData(data)
	end
	return data
end

function printData(data)
	local keys = {'spell', 'rank', 'mana', 'min', 'max', 'avg', 'eff', 'hbcoeff', 'hb', 'hbp'}
	local col = {}
	for _,key in pairs(keys)
	do
		col[key] = {}
	end
	
	for i, entry in pairs(data)
	do
		for _,key in pairs(keys)
		do
			if key == 'eff'
			then
				entry[key] = entry[key] * 100 / cache['maxeff']
			end
			if key == 'avg' or key == 'eff' or key == 'hb' or key == 'min' or key == 'max' or key == 'hbcoeff' or key == 'hbp'
			then
				entry[key] = math.floor(entry[key]+0.5)
			end
			if key == 'hbp' or key == 'hbcoeff'
			then
				entry[key] = string.format("%d%%", entry[key])
			end
			table.insert(col[key], entry[key])
		end
	end

	SpellsFrameTextSpell1:SetText( table.concat(col['spell'], "\n"))
	SpellsFrameTextRank1:SetText(table.concat(col['rank'], "\n"))
	SpellsFrameTextMana1:SetText(table.concat(col['mana'], "\n"))
	SpellsFrameTextMin1:SetText(table.concat(col['min'], "\n"))
	SpellsFrameTextMax1:SetText(table.concat(col['max'], "\n"))
	SpellsFrameTextAvg1:SetText(table.concat(col['avg'], "\n"))
	SpellsFrameTextEff1:SetText(table.concat(col['eff'], "\n"))
	SpellsFrameTextHBCoeff1:SetText(table.concat(col['hbcoeff'], "\n"))
	SpellsFrameTextHB1:SetText(table.concat(col['hb'], "\n"))
	SpellsFrameTextHBp1:SetText(table.concat(col['hbp'], "\n"))

	-- SpellsFrameBG:SetWidth( 8 * 40 + 160 )
	-- print('W: ' .. tostring(8 * 40 + 160))
	-- print('H: ' .. tostring(SpellsFrameTextSpell1:GetHeight()))
	-- SpellsFrameBG:SetHeight(SpellsFrameTextSpell1:GetHeight()+40)
end

function sortData(data)
	table.sort( data, sortFunction )

	return data
end

function sortFunction(a, b)
	if (a[sortBy] == b[sortBy]) and (a['spell'] == b['spell'])
	then
		if sortOrder == 1
		then 
			return a['rank'] < b['rank']
		else
			return a['rank'] > b['rank']
		end
	end
	if sortOrder == 1
	then
		return a[sortBy] < b[sortBy]
	else
		return a[sortBy] > b[sortBy]
	end
end