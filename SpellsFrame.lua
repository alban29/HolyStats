local cache = {}
local healingSpells = {
	Heal = {
		['Rank 1'] = {
			org = {
				Min = 307,
				Max = 353,
				Mana = 155,
				Cast = 2.5,
				BaseCast = 3
			}
		},
		['Rank 2'] = {
			org = {
				Min = 445,
				Max = 507,
				Mana = 205,
				Cast = 2.5,
				BaseCast = 3
			}
		},
		['Rank 3'] = {
			org = {
				Min = 586,
				Max = 662,
				Mana = 255,
				Cast = 2.5,
				BaseCast = 3
			}
		},
		['Rank 4'] = {
			org = {
				Min = 734,
				Max = 827,
				Mana = 305,
				Cast = 2.5,
				BaseCast = 3
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
				BaseCast = 3
			}
		},
		['Rank 2'] = {
			org = {
				Min = 1178,
				Max = 1318,
				Mana = 455,
				Cast = 2.5,
				BaseCast = 3
			}
		},
		['Rank 3'] = {
			org = {
				Min = 1470,
				Max = 1642,
				Mana = 545,
				Cast = 2.5,
				BaseCast = 3
			}
		},
		['Rank 4'] = {
			org = {
				Min = 1813,
				Max = 2021,
				Mana = 655,
				Cast = 2.5,
				BaseCast = 3
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
				BaseCast = 1.5
			}
		},
		['Rank 2'] = {
			org = {
				Min = 269,
				Max = 325,
				Mana = 155,
				Cast = 1.5,
				BaseCast = 1.5
			}
		},
		['Rank 3'] = {
			org = {
				Min = 339,
				Max = 406,
				Mana = 185,
				Cast = 1.5,
				BaseCast = 1.5
			}
		},
		['Rank 4'] = {
			org = {
				Min = 414,
				Max = 492,
				Mana = 215,
				Cast = 1.5,
				BaseCast = 1.5
			}
		},
		['Rank 5'] = {
			org = {
				Min = 534,
				Max = 633,
				Mana = 265,
				Cast = 1.5,
				BaseCast = 1.5
			}
		},
		['Rank 6'] = {
			org = {
				Min = 662,
				Max = 783,
				Mana = 315,
				Cast = 1.5,
				BaseCast = 1.5
			}
		},
		['Rank 7'] = {
			org = {
				Min = 828,
				Max = 975,
				Mana = 380,
				Cast = 1.5,
				BaseCast = 1.5
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
				BaseCast = 15
			}
		},
		['Rank 2'] = {
			org = {
				Min = 100,
				Max = 100,
				Mana = 65,
				Cast = 0,
				BaseCast = 15
			}
		},
		['Rank 3'] = {
			org = {
				Min = 175,
				Max = 175,
				Mana = 105,
				Cast = 0,
				BaseCast = 15
			}
		},
		['Rank 4'] = {
			org = {
				Min = 245,
				Max = 245,
				Mana = 140,
				Cast = 0,
				BaseCast = 15
			}
		},
		['Rank 5'] = {
			org = {
				Min = 315,
				Max = 315,
				Mana = 170,
				Cast = 0,
				BaseCast = 15
			}
		},
		['Rank 6'] = {
			org = {
				Min = 400,
				Max = 400,
				Mana = 205,
				Cast = 0,
				BaseCast = 15
			}
		},
		['Rank 7'] = {
			org = {
				Min = 510,
				Max = 510,
				Mana = 250,
				Cast = 0,
				BaseCast = 15
			}
		},
		['Rank 8'] = {
			org = {
				Min = 650,
				Max = 650,
				Mana = 305,
				Cast = 0,
				BaseCast = 15
			}
		},
		['Rank 9'] = {
			org = {
				Min = 810,
				Max = 810,
				Mana = 365,
				Cast = 0,
				BaseCast = 15
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
		{ name = 'spell', width = 100 },
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

			local xMin = obj['org']['Min']*(1+bonus)
			local xMax = obj['org']['Max']*(1+bonus)
			if spell == 'Renew'
			then
				mana = obj['org']['Mana']*(1-instantMana)
				xMin = obj['org']['Min']*(1+bonus+renew)
				xMax = obj['org']['Max']*(1+bonus+renew)
			end

			data[spell][rank] = {
				Min = obj['org']['Min']*(1+bonus),
				Max = obj['org']['Max']*(1+bonus),
				Mana = mana,
				Cast = obj['org']['Cast'],
				BaseCast = obj['org']['BaseCast'],
				org = obj['org']
			}
		end
	end

	healingSpells = data
end
	

function getTalentRank(talent)
	if talent == 'Spiritual Healing'
	then
		local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(2, 15) --Spiritual Healing
		if name == talent and currentRank > 0
		then
			return currentRank
		else
			return 0
		end
	elseif talent == 'Improved Healing'
	then
		local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(2, 10) --Improved Healing
		if name == talent and currentRank > 0
		then
			return currentRank
		else
			return 0
		end
	elseif talent == 'Improved Renew'
	then
		local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(2, 2) --Improved Renew
		if name == talent and currentRank > 0
		then
			return currentRank
		else
			return 0
		end
	elseif talent == 'Mental Agility'
	then
		local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(1, 10) --Mental Agility
		if name == talent and currentRank > 0
		then
			return currentRank
		else
			return 0
		end
	end
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
				-- print(spell .. '(' .. rank .. ')')
				local avg = (meta.Min + meta.Max) / 2
				local eff = avg * 100 / meta.Mana
				local hb = 0
		
				-- toFrame = toFrame .. "\n" .. string.format("%s (%s): [Min: %d][Max:%d][Avg: %d][Eff: %d]", spell, rank, meta.Min, meta.Max, avg, eff, hb )
				
				local bonusHealing = GetSpellBonusHealing()
				local coeff = meta.BaseCast / 3.5
				if spell == 'Renew'
				then
					coeff = meta.BaseCast / 15
				end
				
				local mMin = meta.Min + bonusHealing * coeff
				local mMax = meta.Max + bonusHealing * coeff
				local avgHB = avg + bonusHealing * coeff
				local mana = math.ceil(meta.Mana)
				eff = avgHB / meta.Mana
				hb = (avgHB - avg) * 100 / avgHB
				hbp = bonusHealing * coeff
				
				local entry = {
					['spell'] = spell,
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
				-- toFrame = toFrame .. "\n" .. string.format("%s (%s): [Min: %d][Max:%d][Avg: %d][Eff: %d][HB: %d%%]", spell, rank, mMin, mMax, avgHB, eff, hb ) 
			end
		end
	end

	if sortBy ~= nil 
	then
		data = sortData(data)
	end
	-- SpellsFrameText:SetText(toFrame)
	return data
end

function printData(data)
	-- local toFrame = ''
	local keys = {'spell', 'rank', 'mana', 'min', 'max', 'avg', 'eff', 'hbcoeff', 'hb', 'hbp'}
	local col = {}
	for i, entry in pairs(data)
	do
		for _,key in pairs(keys)
		do
			if col[key] == nil
			then
				col[key] = {}
			end
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

		-- toFrame = toFrame .. "\n" .. string.format("%s (%s): [Min: %d][Max:%d][Avg: %d][Eff: %d][HB: %d%%]", entry['spell'], entry['rank'], entry['min'], entry['max'], entry['avg'], entry['eff'], entry['hb'] ) 
		-- do break end
	end
	-- SpellsFrameHSpell:SetText( 'Spell' )
	-- SpellsFrameHRank:SetText('Rank')
	-- SpellsFrameHMin:SetText('Min')
	-- SpellsFrameHMax:SetText('Max')
	-- SpellsFrameHAvg:SetText('Avg')
	-- SpellsFrameHEff:SetText('Eff')
	-- SpellsFrameHHB:SetText('HB')

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
end

function sortData(data)
	if sortOrder == 1
	then
		table.sort( data, function( a,b ) return a[sortBy] > b[sortBy] end )
	else
		table.sort( data, function( a,b ) return a[sortBy] < b[sortBy] end )
	end

	return data
end

