local strings = {
    ['deDE'] = {
        -- Talents
        ['Spiritual Healing'] = 'Spirituelle Heilung',
        ['Improved Healing'] = 'Verbesserte Heilung',
        ['Improved Renew'] = 'Verbesserte Erneuerung',
        ['Mental Agility'] = 'Mentale Beweglichkeit',
        ['Holy Specialization'] = 'Macht des Glaubens',
        ['Meditation'] = 'Meditation',
        ['Improved Prayer of Healing'] = 'Verbesserte Gebet der Heilung',
        -- Skills
        ['Heal'] = 'Heilen',
        ['Greater Heal'] = 'Große Heilung',
        ['Prayer of Healing'] = 'Gebet der Heilung',
        ['Renew'] = 'Erneuerung',
        ['Flash Heal'] = 'Blitzheilung',
        ['Lesser Heal'] = 'Geringes Heilen',
        ['Rank 1'] = 'Rang 1',
        ['Rank 2'] = 'Rang 2',
        ['Rank 3'] = 'Rang 3',
        ['Rank 4'] = 'Rang 4',
        ['Rank 5'] = 'Rang 5',
        ['Rank 6'] = 'Rang 6',
        ['Rank 7'] = 'Rang 7',
        ['Rank 8'] = 'Rang 8',
        ['Rank 9'] = 'Rang 9',
        ['Rank 10'] = 'Rang 10',
    },
    ['enUS'] = {
        -- Talents
        ['Spiritual Healing'] = 'Spiritual Healing',
        ['Improved Healing'] = 'Improved Healing',
        ['Improved Renew'] = 'Improved Renew',
        ['Mental Agility'] = 'Mental Agility',
        ['Holy Specialization'] = 'Holy Specialization',
        ['Meditation'] = 'Meditation',
        ['Improved Prayer of Healing'] = 'Improved Prayer of Healing',
        -- Skills
        ['Heal'] = 'Heal',
        ['Greater Heal'] = 'Greater Heal',
        ['Prayer of Healing'] = 'Prayer of Healing',
        ['Renew'] = 'Renew',
        ['Flash Heal'] = 'Flash Heal',
        ['Lesser Heal'] = 'Lesser Heal',
        ['Rank 1'] = 'Rank 1',
        ['Rank 2'] = 'Rank 2',
        ['Rank 3'] = 'Rank 3',
        ['Rank 4'] = 'Rank 4',
        ['Rank 5'] = 'Rank 5',
        ['Rank 6'] = 'Rank 6',
        ['Rank 7'] = 'Rank 7',
        ['Rank 8'] = 'Rank 8',
        ['Rank 9'] = 'Rank 9',
        ['Rank 10'] = 'Rank 10',
    },
    ['zhCN'] = {
        -- Talents
        ['Spiritual Healing'] = '精神治疗',
        ['Improved Healing'] = '强化治疗术',
        ['Improved Renew'] = '强化恢复',
        ['Mental Agility'] = '精神敏锐',
        ['Holy Specialization'] = '神圣专精',
        ['Meditation'] = '冥想',
        ['Improved Prayer of Healing'] = '强化治疗祷言',
        -- Skills
        ['Heal'] = '治疗术',
        ['Greater Heal'] = '强效治疗术',
        ['Prayer of Healing'] = '治疗祷言',
        ['Renew'] = '恢复',
        ['Flash Heal'] = '快速治疗',
        ['Lesser Heal'] = '次级治疗术',
        ['Rank 1'] = '(等级 1)',
        ['Rank 2'] = '(等级 2)',
        ['Rank 3'] = '(等级 3)',
        ['Rank 4'] = '(等级 4)',
        ['Rank 5'] = '(等级 5)',
        ['Rank 6'] = '(等级 6)',
        ['Rank 7'] = '(等级 7)',
        ['Rank 8'] = '(等级 8)',
        ['Rank 9'] = '(等级 9)',
        ['Rank 10'] = '(等级 10)',
    },
}

function b(s)
    local lang = 'enUS'
    if strings[GetLocale()] ~= nil
    then
        lang = GetLocale()
    end
    if lang == 'enUS'
    then
        return s
    end
    local val
    if strings[lang] ~= nil and strings[lang][s] ~= nil
    then
        val = strings[lang][s]
        -- print('Translation [' .. lang .. ']: ' .. s .. ' - '.. val)
    else
        val = s
        print('HolyStats: NoTranslation [' .. lang .. '] for ' .. s)
    end
    return val
end

function en(s)
    local lang = 'enUS'
    if GetLocale() == 'deDE'
    then
        lang = GetLocale()
    end
    if lang == 'enUS'
    then
        return s
    end

    for org, tr in pairs(strings[lang])
    do
        if tr == s
        then
            -- print('ReverseTranslation [' .. lang .. ']: ' .. s .. ' - ' .. org)
            return org
        end
    end
    -- print('HolyStats: NoReverseTranslation [' .. lang .. '] for ' .. s)
    return s
end
