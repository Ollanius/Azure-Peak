/datum/advclass/foreigner
	name = "Eastern Warrior"
	tutorial = "A warrior hailing from the distant land of Kazengun, far across the eastern sea."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = NON_DWARVEN_RACE_TYPES // Clothing has no dwarf sprites.
	outfit = /datum/outfit/job/roguetown/adventurer/foreigner
	class_select_category = CLASS_CAT_NOMAD
	traits_applied = list(TRAIT_STEELHEARTED)
	category_tags = list(CTAG_ADVENTURER, CTAG_COURTAGENT, CTAG_LICKER_WRETCH)
	subclass_languages = list(/datum/language/kazengunese)
	cmode_music = 'sound/music/combat_kazengite.ogg'
	subclass_stats = list(
		STATKEY_STR = 2,
		STATKEY_CON = 2,
		STATKEY_WIL = 1
	)
	subclass_skills = list(
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/sewing = SKILL_LEVEL_APPRENTICE, 
	)

/datum/outfit/job/roguetown/adventurer/foreigner/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("A warrior hailing from the distant land of Kazengun, far across the eastern sea."))
	head = /obj/item/clothing/head/roguetown/mentorhat
	gloves = /obj/item/clothing/gloves/roguetown/eastgloves1
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/eastpants1
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/eastshirt1
	shoes = /obj/item/clothing/shoes/roguetown/boots
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	belt = /obj/item/storage/belt/rogue/leather/black
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/recipe_book/survival = 1,
		/obj/item/flashlight/flare/torch/lantern,
		)
	H.set_blindness(0)
	if(H.mind)
		var/weapons = list("Naginata","Quarterstaff","Hwando")
		var/weapon_choice = input(H, "Choose your weapon", "TAKE UP ARMS") as anything in weapons
		switch(weapon_choice)
			if("Naginata")
				r_hand = /obj/item/rogueweapon/spear/naginata
				backr = /obj/item/rogueweapon/scabbard/gwstrap
				H.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
				armor = /obj/item/clothing/suit/roguetown/armor/basiceast/mentorsuit
			if("Quarterstaff")
				backr = /obj/item/rogueweapon/woodstaff/quarterstaff/steel
				H.adjust_skillrank_up_to(/datum/skill/combat/staves, 4, TRUE)
				armor = /obj/item/clothing/suit/roguetown/armor/basiceast/mentorsuit
			if("Hwando")
				beltl = /obj/item/rogueweapon/sword/sabre/mulyeog
				beltr = /obj/item/rogueweapon/scabbard/sword/kazengun
				armor = /obj/item/clothing/suit/roguetown/armor/basiceast
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)

/datum/advclass/foreigner/yoruku
	name = "Eastern Assassin"
	tutorial = "The Yoruku are Kazengun agents trained in assassination, sabotage, and irregular combat. You are armed with daggers or a short sword, perfect \
	for combat in the tight confines of castles and back alleys."
	allowed_races = NON_DWARVEN_RACE_TYPES //Clothing has no dwarf sprites.
	outfit = /datum/outfit/job/roguetown/adventurer/yoruku
	subclass_languages = list(/datum/language/kazengunese)
	cmode_music = 'sound/music/combat_kazengite.ogg'
	traits_applied = list(TRAIT_STEELHEARTED, TRAIT_DODGEEXPERT)
	subclass_stats = list(
		STATKEY_SPD = 3,
		STATKEY_PER = 1,
		STATKEY_WIL = 1,
	)
	subclass_skills = list(
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/tracking = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/traps = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_EXPERT,
	)

/datum/outfit/job/roguetown/adventurer/yoruku/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("The Yoruku are Kazengun agents trained in assassination, sabotage, and irregular combat. You are armed with daggers or a short sword, perfect \
	for combat in the tight confines of castles and back alleys."))
	head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/yoruku
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/flashlight/flare/torch = 1,
		/obj/item/recipe_book/survival = 1,
		/obj/item/bomb/smoke = 3,
		)
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	belt = /obj/item/storage/belt/rogue/leather/knifebelt/black/kazengun
	gloves = /obj/item/clothing/gloves/roguetown/eastgloves1
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/eastpants1
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/eastshirt1
	cloak = /obj/item/clothing/cloak/thief_cloak/yoruku
	shoes = /obj/item/clothing/shoes/roguetown/boots
	H.set_blindness(0)
	if(H.mind)
		var/weapons = list("Tanto","Kodachi")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		switch(weapon_choice)
			if("Tanto")
				beltr = /obj/item/rogueweapon/huntingknife/idagger/steel/kazengun
				beltl = /obj/item/rogueweapon/scabbard/sheath/kazengun
				H.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
			if("Kodachi")
				beltr = /obj/item/rogueweapon/sword/short/kazengun
				beltl = /obj/item/rogueweapon/scabbard/sword/kazengun/kodachi
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
		var/masks = list("Oni","Kitsune")
		var/mask_choice = input(H, "Choose your mask.", "HIDE YOURSELF") as anything in masks
		switch(mask_choice)
			if("Oni")
				mask = /obj/item/clothing/mask/rogue/facemask/yoruku_oni
			if("Kitsune")
				mask = /obj/item/clothing/mask/rogue/facemask/yoruku_kitsune

/datum/advclass/foreigner/repentant
	name = "Otavan Repentant"
	tutorial = "An exile from the Holy See of Otava, accused of heresy and cast out of your homeland as penance. \
	Some consider yours a fate worse than death; the metal alloy mask seared onto your face serving as a permanent reminder of your sins. \
	You are a living example of what becomes of those who stand in defiance of the Otavan inquisition."
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/repentant
	subclass_languages = list(/datum/language/otavan)
	cmode_music = 'sound/music/cmode/adventurer/combat_outlander2.ogg'
	category_tags = list(CTAG_ADVENTURER, CTAG_COURTAGENT)
	traits_applied = list(TRAIT_STEELHEARTED, TRAIT_NOPAINSTUN)
	subclass_stats = list(
		STATKEY_CON = 3,
		STATKEY_SPD = -1,
		STATKEY_STR = -1,
		STATKEY_WIL = 3,
	)
	subclass_skills = list(
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_EXPERT,
	)

/datum/outfit/job/roguetown/adventurer/repentant/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("An exile from the Holy See of Otava, accused of heresy and cast out of your homeland as penance. \
	Some consider yours a fate worse than death; the metal alloy mask seared onto your face serving as a permanent reminder of your sins. \
	You are a living example of what becomes of those who stand in defiance of the Otavan inquisition."))
	mask = /obj/item/clothing/mask/rogue/facemask/steel/paalloy/mad_touched
	wrists = /obj/item/clothing/neck/roguetown/psicross
	shirt = /obj/item/clothing/cloak/tabard/psydontabard
	gloves = /obj/item/clothing/gloves/roguetown/chain/psydon
	shoes = /obj/item/clothing/shoes/roguetown/boots/psydonboots
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/otavan
	backr = /obj/item/storage/backpack/rogue/satchel/otavan
	belt = /obj/item/storage/belt/rogue/leather/rope/dark
	head = /obj/item/clothing/head/roguetown/roguehood/psydon
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltl = /obj/item/rogueweapon/whip
	backpack_contents = list(/obj/item/recipe_book/survival = 1, 
						/obj/item/rogueweapon/huntingknife = 1)

/datum/advclass/foreigner/refugee
	name = "Naledi Refugee"
	tutorial = "An asylum-seeker from the war-torn deserts of Naledi, driven north as your homeland continues to be ravaged by an endless conflict against the Djinn."
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/refugee
	subclass_languages = list(/datum/language/celestial)
	cmode_music = 'sound/music/warscholar.ogg'
	traits_applied = list(TRAIT_STEELHEARTED, TRAIT_DODGEEXPERT)
	subclass_stats = list(
		STATKEY_SPD = 2,
		STATKEY_PER = 1,
		STATKEY_WIL = 1,
		STATKEY_INT = 1,
	)
	subclass_skills = list(
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/polearms = SKILL_LEVEL_EXPERT,
	)

/datum/outfit/job/roguetown/adventurer/refugee/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("An asylum-seeker from the war-torn deserts of Naledi, \
	driven north as your homeland continues to be ravaged by an endless conflict against the Djinn."))
	mask = /obj/item/clothing/mask/rogue/lordmask/tarnished
	r_hand = /obj/item/rogueweapon/spear/assegai
	backl = /obj/item/rogueweapon/scabbard/gwstrap
	backr = /obj/item/storage/backpack/rogue/satchel
	wrists = /obj/item/clothing/neck/roguetown/psicross/naledi
	shoes = /obj/item/clothing/shoes/roguetown/sandals
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/hierophant/civilian
	pants = /obj/item/clothing/under/roguetown/skirt/black
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/black
	beltr = /obj/item/flashlight/flare/torch/lantern
	backpack_contents = list(/obj/item/recipe_book/survival = 1, 
						/obj/item/rogueweapon/huntingknife = 1)

/datum/advclass/foreigner/slaver
	name = "Ranesheni Slaver"
	tutorial = "In parts of Psydonia, the practice of slavery is still a common sight. \
	You hail from the Ranesheni Empire, where the market of flesh is ancient and unbroken, and your coin is earned in the trade of living souls."
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/slaver
	subclass_languages = list(/datum/language/celestial)
	cmode_music = 'sound/music/combat_desertrider.ogg'
	traits_applied = list(TRAIT_STEELHEARTED, TRAIT_MEDIUMARMOR)
	subclass_stats = list(
		STATKEY_STR = 2,
		STATKEY_CON = 2,
		STATKEY_WIL = 1,
	)
	subclass_skills = list(
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
	) // Spawns with a variety of jman skills and fairly good medium armor.

/datum/outfit/job/roguetown/adventurer/slaver/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("In parts of Psydonia, the practice of slavery is still a common sight. \
	You hail from the Ranesheni Empire, where the market of flesh is ancient and unbroken, and your coin is earned in the trade of living souls."))
	mask = /obj/item/clothing/mask/rogue/facemask/steel
	head = /obj/item/clothing/head/roguetown/roguehood/shalal/purple
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	shoes = /obj/item/clothing/shoes/roguetown/shalal
	pants = /obj/item/clothing/under/roguetown/chainlegs
	gloves = /obj/item/clothing/gloves/roguetown/angle
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/purple
	belt = /obj/item/storage/belt/rogue/leather/shalal/purple
	armor = /obj/item/clothing/suit/roguetown/armor/plate/scale
	cloak = /obj/item/clothing/cloak/cape/purple
	backr = /obj/item/rogueweapon/shield/heater
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/rogueweapon/sword/long/shotel
	backpack_contents = list(/obj/item/rope/chain = 2, 
							/obj/item/storage/belt/rogue/pouch/coins/poor = 1, 
							/obj/item/recipe_book/survival = 1, 
							/obj/item/rogueweapon/huntingknife = 1)


//

/datum/advclass/foreigner/bronzeclad
	name = "Thespian-Errant"
	tutorial = "Gladiators, legionnaire, reenactors; all are unified in their subconscious pursuit of entertaining something greater than themselves. You \
	are a skilled combatant from beyond Azuria, who - for one reason or another - is intimately familiar with fighting in ancient equipment."
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/bronzeclad
	cmode_music = 'sound/music/cmode/church/combat_eora.ogg' //What am I fighting for? Why am I here? To die in this terrible place?
	traits_applied = list(TRAIT_STEELHEARTED)
	subclass_stats = list(
		STATKEY_STR = 1,
		STATKEY_WIL = 2,
		STATKEY_CON = 3, //Bronze armor is sturdier than steel, but has exceptionally poor defensive values for metal armor. The goal is to not ward off blows, but to use the armor's durability to withstand them.
		STATKEY_SPD = -2, //Five weighted points, in technicality. Stylistically inverted from the Barbarian's statblock - slow and sturdy, instead of stupid and strong.
	)
	subclass_skills = list(
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
	)

	extra_context = "This subclass exclusively uses bronze-tiered equipment. Weapon choices with the 'dual-' prefix also provide the Dual Wielding trait as well. Two Disciples are available for selection, which allows for you to further specialize in survivability through coverage or resilience."

/datum/outfit/job/roguetown/adventurer/bronzeclad/pre_equip(mob/living/carbon/human/H, visualsOnly)
	..()
	to_chat(H, span_warning("The curtains part, the shieldline rallies, and the eyes of a thousand shadows fall upon you. Snarling gladiator, enthralled legionnaire, vestumed actor; ready yourself for another bout."))
	if(H.mind)
		var/bronzeweapons = list("Spatha & +1 Wrestling","Trident & +1 Wrestling","Greataxe & +1 Wrestling","Dolabra (Axepick) & +1 Wrestling","Gladius (Shortsword) + Shield","Kopis (Heavy Shortsword) + Shield","Khopesh + Shield","Axe + Shield","Warclub + Shield","Flail + Shield","Spear + Shield","Katar + Heavy Dagger","Dual Khopeshes","Dual Gladii (Shortswords)","Dual Axes")
		var/bronzeweapons_choice = input(H, "Choose your WEAPONS.", "PUT ON A SHOW FOR THE CROWD.") as anything in bronzeweapon
		switch(bronzeweapons_choice)
			if("Spatha & +1 Wrestling")
				H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/wrestling, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/sword/long/broadsword/bronze
				beltr = /obj/item/rogueweapon/scabbard/sword/strap
			if("Trident & +1 Wrestling")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/wrestling, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/spear/trident
				l_hand = /obj/item/net //Mimics the loadout of a Retiarius - a Gladiator type with a trident and weighted net.
				backr = /obj/item/rogueweapon/scabbard/gwstrap
			if("Greataxe & +1 Wrestling")
				H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/wrestling, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/greataxe/bronze
				backr = /obj/item/rogueweapon/scabbard/gwstrap
			if("Dolabra (Axepick) & +1 Wrestling")
				H.adjust_skillrank_up_to(/datum/skill/labor/mining, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/wrestling, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/pick/bronze
			if("Gladius (Shortsword) + Shield")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/sword/short/gladius
				beltr = /obj/item/rogueweapon/scabbard/sword/strap
				backr = /obj/item/rogueweapon/shield/bronze
			if("Kopis (Heavy Shortsword) + Shield")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/sword/short/messer/bronze
				beltr = /obj/item/rogueweapon/scabbard/sword/strap
				backr = /obj/item/rogueweapon/shield/bronze
			if("Khopesh + Shield")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/sword/sabre/bronzekhopesh
				beltr = /obj/item/rogueweapon/scabbard/sword/strap
				backr = /obj/item/rogueweapon/shield/bronze
			if("Axe + Shield")
				H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/stoneaxe/woodcut/bronze
				backr = /obj/item/rogueweapon/shield/bronze
			if("Warclub + Shield")
				H.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/mace/warhammer/bronze
				backr = /obj/item/rogueweapon/shield/bronze
			if("Flail + Shield")
				H.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/flail/bronze
				backr = /obj/item/rogueweapon/shield/bronze
			if("Spear + Shield")
				H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/spear/bronze
				l_hand = /obj/item/rogueweapon/shield/bronze
				backr = /obj/item/rogueweapon/scabbard/gwstrap
			if("Katar + Heavy Dagger")
				H.adjust_skillrank_up_to(/datum/skill/combat/knives, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/unarmed, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/wrestling, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/huntingknife/combat/bronze
				l_hand = /obj/item/rogueweapon/katar/bronze // Mimics the loadout of a Scissor.. which is exactly what it sounds like. Gladiators with a specialized punching dagger-axe in one hand, and an actual dagger in the other hand.
				backr = /obj/item/rogueweapon/scabbard/sheath/strap
			if("Dual Khopeshes")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN, TRUE)
				ADD_TRAIT(H, TRAIT_DUALWIELDER, TRAIT_GENERIC) // Mimics the loadout of a Dimachaerus, or a dual-wielding Gladiator.
				r_hand = /obj/item/rogueweapon/sword/sabre/bronzekhopesh
				l_hand = /obj/item/rogueweapon/sword/sabre/bronzekhopesh
				beltr = /obj/item/rogueweapon/scabbard/sword/strap
				backr = /obj/item/rogueweapon/scabbard/sword/strap
			if("Dual Gladii (Shortswords)")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN, TRUE)
				ADD_TRAIT(H, TRAIT_DUALWIELDER, TRAIT_GENERIC) // Ditto.
				r_hand = /obj/item/rogueweapon/sword/short/gladius
				l_hand = /obj/item/rogueweapon/sword/short/gladius
				beltr = /obj/item/rogueweapon/scabbard/sword/strap
				backr = /obj/item/rogueweapon/scabbard/sword/strap
			if("Dual Axes")
				H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_JOURNEYMAN, TRUE)
				ADD_TRAIT(H, TRAIT_DUALWIELDER, TRAIT_GENERIC)
				r_hand = /obj/item/rogueweapon/stoneaxe/woodcut/bronze
				l_hand = /obj/item/rogueweapon/stoneaxe/woodcut/bronze
		var/bronzesidearm = list("A Javelin's Bag", "A Sling's Training And Bullets", "A Bottle Of Garum(?)")
		var/bronzesidearm_choice = input(H, "Choose your ACCOUTREMENT.", "PREPARE YOUR OPENING ACT.") as anything in bronzesidearm
		switch(bronzesidearm_choice)
			if("A Javelin's Bag")
				beltl = /obj/item/quiver/javelin/bronze
			if("A Sling's Training And Bullets")
				H.adjust_skillrank_up_to(/datum/skill/combat/slings = SKILL_LEVEL_JOURNEYMAN, TRUE)
				beltl = /obj/item/quiver/sling/bronze
			if("A Bottle Of Garum(?)")
				beltl = /obj/item/reagent_containers/glass/bottle/rogue/healthpot/garum
		var/bronzediscipline = list("Legionnaire - Bronze Armor & Maille Training","Gladiator - Skinarmored & Halved Bloodbloss")
		var/bronzediscipline_choice = input(H, "Choose your DISCIPLINE.", "EMBRACE GLORY AND DEATH.") as anything in bronzediscipline
		switch(bronzediscipline_choice)
			if("Legionnaire - Bronze Armor & Maille Training")
				ADD_TRAIT(H, TRAIT_MEDIUM_ARMOR, TRAIT_GENERIC)
				head = /obj/item/clothing/head/roguetown/helmet/heavy/bronze
				neck = /obj/item/clothing/neck/roguetown/gorget/bronze
				armor = /obj/item/clothing/suit/roguetown/armor/plate/bronze
				pants = /obj/item/clothing/under/roguetown/skirt/red
				belt = /obj/item/storage/belt/rogue/leather
			if("Gladiator - Skinarmored & Halved Bloodbloss")
				ADD_TRAIT(H, TRAIT_BLOOD_RESISTANCE, TRAIT_GENERIC)
				head = /obj/item/clothing/head/roguetown/helmet/heavy/bronze/gladiator
				armor = /obj/item/clothing/suit/roguetown/armor/regenerating/skin/disciple/gladiator
				pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/bronzeskirt
				belt = /obj/item/storage/belt/rogue/leather/battleskirt/red
				gloves = /obj/item/clothing/gloves/roguetown/bandages
	wrists = /obj/item/clothing/wrists/roguetown/bracers/bronze
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/bronze 
	cloak = /obj/item/clothing/cloak/cape/red
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/flashlight/flare/torch = 1,
		/obj/item/recipe_book/survival = 1,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/gun/ballistic/revolver/grenadelauncher/sling = 1,
		/obj/item/rogueweapon/huntingknife/bronze = 1,
		)
	H.set_blindness(0)
	switch(H.patron?.type)
		if(/datum/patron/old_god)
			id = /obj/item/clothing/neck/roguetown/psicross/bronze
		if(/datum/patron/divine/ravox)
			id = /obj/item/clothing/neck/roguetown/psicross/ravox/bronze
		else
			id = /obj/item/clothing/ring/bronze

/obj/item/rogueweapon/sword/short/messer/bronze
	name = "kopis"
	desc = "A heavier variant of the gladius that sacrifices its thrusting tip for a wider blade, fit for cleaving through both foliage and flesh. </br>Infamous for its presence amongst the gladitorial arenas of Lirvas and Raneshen, where gashes provide the kind of crimson spectacle that liqour-addled crowds adore the most."
	icon_state = "kopis"
	minstr = 6
	wdefense = 3
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_NORMAL
	smeltresult = /obj/item/ingot/bronze
	max_integrity = 150
	sheathe_icon = "kopis"

/obj/item/reagent_containers/glass/bottle/rogue/healthpot/garum
	name = "bottle of medicinal fish vinegar"
	desc = "A bottle with a mudclay cork, tethered to the bottleneck via braided twine. Fermented innard-paste and herbs makes for a disgustingly cheap medicine; an ancient concoction, resurrected for usage within the gladitorial arenas of Lirvas and Raneshen. </br>A particular variant of this, made by fermenting zardines in the Terrorbog, happens to be a very popular condiment back in Rockhill."
	list_reagents = list(/datum/reagent/medicine/healthpot/garum = 50)

/datum/reagent/medicine/healthpot/garum
	name = "Garum"
	description = "Gradually regenerates all types of damage, imparts a savory taste to most topped meals."
	color = "#891305"
	taste_description = "lip-puckeringly rich fishiness"
	scent_description = "fermented pungence"

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/disciple/gladiator
	name = "gladiator's skin"
	desc = "Are you not entertained?!"
	max_integrity = 200
	repair_time = 25 SECONDS

/obj/item/clothing/head/roguetown/helmet/heavy/bronze/gladiator
	name = "gladiator's bronze barbute"
	max_integrity = ARMOR_INT_HELMET_HEAVY_BRONZE - 100 //Quartered durability, in order to play nicer with the Gladiator Discipline's reduced blood loss and regenerating skin armor. Durability's between iron and steel, for reference.
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/storage/belt/rogue/leather/battleskirt/red
	color = CLOTHING_RED

/obj/item/clothing/cloak/cape/red
	color = CLOTHING_RED

//

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/hierophant/civilian
	name = "shawl"
	desc = "Thick and protective while remaining light and breezy; the perfect garb for protecting one from the hot sun and the harsh sands of Naledi."
	color = CLOTHING_BLACK

/obj/item/clothing/head/roguetown/roguehood/shalal/hijab/black
	color = CLOTHING_BLACK

/obj/item/storage/belt/rogue/leather/shalal/purple
	color = CLOTHING_PURPLE
