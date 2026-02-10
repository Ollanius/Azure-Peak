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
	traits_applied = list(TRAIT_STEELHEARTED, TRAIT_BLOOD_RESISTANCE) //A bit heavy for a martial class, but remember that anything with 50 total damage (including unmodified dagger-stabs and longsword-thrusts) will penetrate. Parry and endure.
	subclass_stats = list(
		STATKEY_STR = 1,
		STATKEY_WIL = 3,
		STATKEY_CON = 2,
		STATKEY_SPD = -2,
	)
	subclass_skills = list(
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
	)

	extra_context = "This subclass exclusively uses bronze-tiered equipment. Weapon choices with the 'dual-' prefix also provide the Dual Wielding trait as well. A total of four Disciplines are available, each offering a distinct"

/datum/outfit/job/roguetown/adventurer/bronzeclad/pre_equip(mob/living/carbon/human/H, visualsOnly)
	..()
	to_chat(H, span_warning("The curtains part, the shieldline rallies, and the eyes of a thousand shadows fall upon you. Snarling gladiator, enthralled legionnaire, vestumed actor; ready yourself for another bout."))
	if(H.mind)
		var/bronzeweapon = list("Spatha & +1 Unarmed","Trident & +1 Unarmed","Greataxe & +1 Unarmed","Axepick & +1 Unarmed","Winged Spear + Greatshield","Heavy Khopesh + Greatshield","Shortsword + Shield","Heavy Shortsword + Shield","Khopesh + Shield","Axe + Shield","Warclub + Shield","Flail + Shield","Spear + Shield","Katar + Heavy Dagger","Dual Khopeshes","Dual Shortswords","Dual Axes")
		var/bronzeweapon_choice = input(H, "Choose your WEAPONS.", "PUT ON A SHOW FOR THE CROWD.") as anything in bronzeweapon
		switch(bronzeweapon_choice)
			if("Spatha & +1 Unarmed")
				H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/unarmed, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/sword/long/broadsword/bronze
				beltr = /obj/item/rogueweapon/scabbard/sword/strap
			if("Trident & +1 Unarmed")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/unarmed, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/spear/trident
				l_hand = /obj/item/net //Mimics the loadout of a Retiarius - a Gladiator type with a trident and weighted net.
				backr = /obj/item/rogueweapon/scabbard/gwstrap
			if("Greataxe & +1 Unarmed")
				H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/unarmed, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/greataxe/bronze
				backr = /obj/item/rogueweapon/scabbard/gwstrap
			if("Axepick & +1 Unarmed")
				H.adjust_skillrank_up_to(/datum/skill/labor/mining, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/unarmed, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/pick/bronze
			if("Winged Spear + Greatshield")
				H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/spear/bronze/winged
				backr = /obj/item/rogueweapon/scabbard/gwstrap
				l_hand = /obj/item/rogueweapon/shield/bronze/great
			if("Heavy Khopesh + Greatshield")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/sword/sabre/bronzekhopesh/great
				beltr = /obj/item/rogueweapon/scabbard/sword/strap
				backr = /obj/item/rogueweapon/shield/bronze/great
			if("Shortsword + Shield")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE)
				r_hand = /obj/item/rogueweapon/sword/short/gladius
				beltr = /obj/item/rogueweapon/scabbard/sword/strap
				backr = /obj/item/rogueweapon/shield/bronze
			if("Heavy Shortsword + Shield")
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
				gloves = /obj/item/clothing/gloves/roguetown/bandages
			if("Dual Khopeshes")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN, TRUE)
				ADD_TRAIT(H, TRAIT_DUALWIELDER, TRAIT_GENERIC) // Mimics the loadout of a Dimachaerus, or a dual-wielding Gladiator.
				r_hand = /obj/item/rogueweapon/sword/sabre/bronzekhopesh
				l_hand = /obj/item/rogueweapon/sword/sabre/bronzekhopesh
				beltr = /obj/item/rogueweapon/scabbard/sword/strap
				backr = /obj/item/rogueweapon/scabbard/sword/strap
			if("Dual Shortswords")
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
		var/bronzesidearm = list("A Javelin's Bag", "A Sling's Training And Bullets", "A Bottle Of Medicinal Fish Vinegar.. ?")
		var/bronzesidearm_choice = input(H, "Choose your ACCOUTREMENT.", "PREPARE YOUR OPENING ACT.") as anything in bronzesidearm
		switch(bronzesidearm_choice)
			if("A Javelin's Bag")
				beltl = /obj/item/quiver/javelin/bronze
			if("A Sling's Training And Bullets")
				H.adjust_skillrank_up_to(/datum/skill/combat/slings = SKILL_LEVEL_JOURNEYMAN, TRUE)
				beltl = /obj/item/quiver/sling/bronze
			if("A Bottle Of Medicinal Fish Vinegar.. ?")
				beltl = /obj/item/reagent_containers/glass/bottle/rogue/healthpot/zarum
		var/bronzediscipline = list("Thespian - Heart Protector & Dodge Expert","Gladiator - Skinarmored & Immunity To Pain","Legionnaire - Cuirass, Gorget & Maille Training","Bulwark - Fully-Armored & Plate Training")
		var/bronzediscipline_choice = input(H, "Choose your DISCIPLINE.", "EMBRACE GLORY AND DEATH.") as anything in bronzediscipline
		switch(bronzediscipline_choice)
			if("Thespian - Heart Protector & Dodge Expert")
				ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
				REMOVE_TRAIT(H, TRAIT_BLOOD_RESISTANCE, TRAIT_GENERIC)
				H.change_stat(STATKEY_SPD, 3)
				H.change_stat(STATKEY_INT, 1)
				H.change_stat(STATKEY_CON, -2) //Turns the new statblock from +3 WIL / +2 CON / +1 STR / -2 SPD to +3 WIL / +1 STR / +1 SPD / +1 INT. Has a -1 INT / +2 WIL difference over the Duelist, but with Journeyman-capped skills. If you get hit, it's going to hurt.
				head = /obj/item/flowercrown/briar
				mask = /obj/item/clothing/mask/rogue/facemask/bronze
				armor = /obj/item/clothing/suit/roguetown/armor/plate/bronze/light
				pants = /obj/item/clothing/under/roguetown/skirt/red
				belt = /obj/item/storage/belt/rogue/leather
			if("Gladiator - Skinarmored & Immunity To Pain")
				ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
				head = /obj/item/clothing/head/roguetown/helmet/heavy/bronze/gladiator
				armor = /obj/item/clothing/suit/roguetown/armor/regenerating/skin/disciple/gladiator
				pants = /obj/item/clothing/under/roguetown/loincloth/brown
				belt = /obj/item/storage/belt/rogue/leather/battleskirt/red
			if("Legionnaire - Cuirass, Gorget & Maille Training")
				ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
				head = /obj/item/clothing/head/roguetown/helmet/heavy/bronze
				neck = /obj/item/clothing/neck/roguetown/gorget/bronze
				armor = /obj/item/clothing/suit/roguetown/armor/plate/bronze
				pants = /obj/item/clothing/under/roguetown/skirt/red
				belt = /obj/item/storage/belt/rogue/leather
			if("Bulwark - Fully-Armored & Plate Training")
				ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC) //Technically takes -3 SPD instead of -2 SPD, due to their armor's quirk.
				head = /obj/item/clothing/head/roguetown/helmet/bronze
				neck = /obj/item/clothing/neck/roguetown/gorget/bronze
				armor = /obj/item/clothing/suit/roguetown/armor/plate/full/bronze
				pants = /obj/item/clothing/under/roguetown/loincloth/brown
				belt = /obj/item/storage/belt/rogue/leather/battleskirt/faulds/red
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
	if(should_wear_femme_clothes(H))
		if(bronzediscipline_choice != "Gladiator - Skinarmored & Immunity To Pain" && bronzediscipline_choice != "Thespian - Heart Protector & Dodge Expert" && bronzediscipline_choice != "Legionnaire - Cuirass, Gorget & Maille Training" && bronzediscipline_choice != "Bulwark - Fully-Armored & Plate Training")
			shirt = /obj/item/clothing/suit/roguetown/shirt/tribalrag/gladiator
	H.set_blindness(0)
	switch(H.patron?.type)
		if(/datum/patron/old_god)
			id = /obj/item/clothing/neck/roguetown/psicross/bronze
		if(/datum/patron/divine/ravox)
			id = /obj/item/clothing/neck/roguetown/psicross/ravox/bronze
		if(/datum/patron/divine/astrata)
			id = /obj/item/clothing/neck/roguetown/psicross/astrata/bronze
		else
			id = /obj/item/clothing/ring/bronze

			//NEAR-EXCLUSIVE ITEMS!
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

/obj/item/reagent_containers/glass/bottle/rogue/healthpot/zarum
	name = "bottle of medicinal fish vinegar"
	desc = "A bottle with a mudclay cork, tethered to the bottleneck via braided twine. Fermented innard-paste and herbs makes for a disgustingly cheap medicine; an ancient concoction, resurrected for usage within the gladitorial arenas of Lirvas and Raneshen. </br>A particular variant of this, made by fermenting zardines in the Terrorbog, happens to be a very popular condiment back in Rockhill."
	list_reagents = list(/datum/reagent/medicine/healthpot/zarum = 50)

/datum/reagent/medicine/healthpot/zarum
	name = "Zarum"
	description = "Gradually regenerates all types of damage, imparts a savory taste to most topped meals."
	color = "#891305"
	taste_description = "lip-puckeringly rich fishiness"
	scent_description = "fermented pungence"

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/disciple/gladiator
	name = "gladiator's skin"
	desc = "Are you not entertained?!"
	max_integrity = 200
	repair_time = 25 SECONDS

/obj/item/clothing/suit/roguetown/shirt/tribalrag/gladiator
	name = "gladiator's rags"
	desc = "Freedom is a luxury savored by few."

/obj/item/clothing/head/roguetown/helmet/heavy/bronze/gladiator
	name = "gladiator's bronze barbute"
	desc = "A greathelm of bronze, who's nasalguard and mandibles leave the wearer's face cloaked in darkness. The heroes of yore have long since passed, yet their blood still courses through the veins of Psydonia's children; you are no different. Quiff a feather to its skullcap to bare your allegience with pride. </br>It sits lighter on the head than most helmets; the consequence of surviving many-a-bout without proper aftercare."
	body_parts_covered = FULL_HEAD
	max_integrity = ARMOR_INT_HELMET_HEAVY_BRONZE - 100 //Quartered durability, in order to play nicer with the Gladiator Discipline's reduced blood loss and regenerating skin armor. Durability's between iron and steel, for reference.
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/storage/belt/rogue/leather/battleskirt/red
	color = CLOTHING_RED

/obj/item/clothing/cloak/cape/red
	color = CLOTHING_RED

/obj/item/storage/belt/rogue/leather/battleskirt/faulds/red
	color = CLOTHING_RED

/obj/item/rogueweapon/spear/bronze/winged
	name = "bronze winged spear"
	desc = "An antiquital staff, adorned with a winged bronze spearhead. The flared edges catch errant strikes and keep snarling foes from further impaling themselves in order to maul its wielder. </br>Scholars believe this particular type of polearm was made to counter Vheslynic seadaemons, during the now-mythologized Syonic era's collapse."
	icon_state = "bronzewingedspear"
	item_state = "bronzewingedspear"
	icon = 'icons\roguetown\clothing\special\onmob\thespian64.dmi'
	wdefense = 6 //Functionally the same, but with +1 DEF.

/obj/item/rogueweapon/sword/sabre/bronzekhopesh/great
	name = "apophis"
	desc = "The Khopesh's older brother. One would be mistaken for thinking it was designed to be wielded in both hands; for the strength of these ancient legionnaires, prodigious as it were, allowed them to effortlessly wield it alongside their towering greatshield."
	wdefense = 3
	wdefense_wbonus = 2
	force = 22
	force_wielded = 25
	possible_item_intents = list(/datum/intent/sword/chop/sabre, /datum/intent/sword/cut/sabre, /datum/intent/sword/thrust/sabre, /datum/intent/sword/peel)
	gripped_intents = list(/datum/intent/sword/chop/sabre, /datum/intent/sword/thrust/sabre, /datum/intent/sword/strike, /datum/intent/sword/peel)
	max_integrity = 150
	max_blade_int = 300
	wbalance = WBALANCE_NORMAL
	minstr = 11
	sheathe_icon = "decgladius"
	icon_state = "bronzegreatkhopesh"
	item_state = "bronzegreatkhopesh"
	icon = 'icons\roguetown\clothing\special\onmob\thespian64.dmi'

/datum/intent/sword/chop/sabre
	damfactor = 1.15
	penfactor = 20

/obj/item/clothing/suit/roguetown/armor/plate/bronze/light
	name = "bronze cardiophylax"
	desc = "A thick bronze plate, meticulously sculpted to fit its wearer's physique and guard their heart from all that'd seek to strike it. Unfortunately, it does little to riposte more emotional blows."
	icon_state = "bronzeprotector"
	item_state = "bronzeprotector"
	icon = 'icons\roguetown\clothing\special\thespian.dmi'
	mob_overlay_icon = 'icons\roguetown\clothing\special\onmob\thespian.dmi'
	body_parts_covered = CHEST
	max_integrity = ARMOR_INT_CHEST_MEDIUM_BRONZE - 100 //Translates into 250 INT, or a little above Iron - and +100 INT over the Copper variant.
	armor_class = ARMOR_CLASS_LIGHT
	armor = list("blunt" = 75, "slash" = 75, "stab" = 75, "piercing" = 40, "fire" = 0, "acid" = 0) //Note; same as the Copper Heart Protector. Quite good, but strictly locked to the chest zone. Say goodbye to your entrails and crotch, if you aren't smart!

/obj/item/clothing/suit/roguetown/armor/plate/full/bronze
	name = "bronze panoplic armor"
	desc = "What can only be described as an 'armored robe'; thick bronze plates, layered atop one-another and interlinked with strappings to form an assembly of segmented plate armor. While overwhelmingly heavy and cumbersome, it is certain to weather any storm poised its way. </br>Scholars oft-describe this suit as a 'panoply', purpose-made for the physiques of Psydonia's earliest Aasimari."
	icon_state = "bronzeplate"
	item_state = "bronzeplate"
	icon = 'icons\roguetown\clothing\special\thespian.dmi'
	mob_overlay_icon = 'icons\roguetown\clothing\special\onmob\thespian.dmi'
	max_integrity = ARMOR_INT_CHEST_PLATE_BRONZE + 100 //Translates into 650 INT. Note that its defensive values, like with the rest of all bronze items, is hardset to '50' - this means any attack which deals a combined amount (Via AP and FORCE) to 50 will pierce it.
	armor_class = ARMOR_CLASS_HEAVY
	smeltresult = /obj/item/ingot/bronze
	prevent_crits = PREVENT_CRITS_ALL //Bronze-specific trait. While this sounds scary, all it mechanically does is add resistances to Pick-induced critical hits. Bleed and suffer, but do not go quietly into the darkness.
	smelt_bar_num = 3
	var/bronzeplatecumbersome = FALSE

/obj/item/clothing/suit/roguetown/armor/plate/full/bronze/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == SLOT_ARMOR)
		user.change_stat(STATKEY_SPD, -1) //Takes away a point of Speed when worn. For its lone on-spawn class, this gives them a starting malus of -III.
		bronzeplatecumbersome = TRUE
	return

/obj/item/clothing/suit/roguetown/armor/plate/full/bronze/dropped(mob/living/carbon/human/user)
	. = ..()
	if(bronzeplatecumbersome == TRUE)
		user.change_stat(STATKEY_SPD, 1) //Restores a point of Speed when taken off.
		bronzeplatecumbersome = FALSE
	return

/obj/item/clothing/suit/roguetown/armor/plate/full/bronze/get_mechanics_examine(mob/user)
	. = ..()
	. += span_info("Even with the necessary training, this suit of armor is difficult to maneuver in. While donned, your Speed will be further reduced by a single point.")

/obj/item/clothing/mask/rogue/facemask/bronze
	name = "bronze mask"
	desc = "Glimmering bronze, meticuliusly shaped to mimic the guise of another. One of civilization's oldest superstitions is the belief that donning such masks would impart a sliver of the mimicked facebearer's power unto its wearer."
	armor = ARMOR_PLATE_BRONZE
	armor_class = ARMOR_CLASS_LIGHT
	icon_state = "bronzemask"
	item_state = "bronzemask"
	icon = 'icons\roguetown\clothing\special\thespian.dmi'
	mob_overlay_icon = 'icons\roguetown\clothing\special\onmob\thespian.dmi'
	max_integrity = 150
	prevent_crits = PREVENT_CRITS_ALL
	smeltresult = /obj/item/ingot/bronze

/obj/item/rogueweapon/shield/bronze/great
	name = "hoplon greatshield"
	desc = "A heavy shield, taller and thicker than most of their contemporaries. It has survived the Calamity, endured the Apotheosis, and blunted the Sundering; and for one final time, it shall ward this dying world from a crueler fate."
	icon_state = "bronzegreatshield"
	item_state = "bronzegreatshield"
	icon = 'icons\roguetown\clothing\special\thespian.dmi'
	max_integrity = 360 //Highest integrity and passive projectile-blocking chance of most non-unique shields. Defense is consequently reduced to Buckler levels, however. Time your blocks and take one for the team!
	possible_item_intents = list(/datum/intent/shield/block, /datum/intent/mace/smash/shield/metal/great, /datum/intent/effect/daze) // No SHIELD_BASH. Able to inflict Daze due to its weight. 
	coverage = 75 
	wdefense = 9
	minstr = 12 //Requires a natural +STR modifier or statpack to double as a melee weapon, for its given class. Note that it has a heavier charge time and active stamina drain, too, as.. well, it's quite heavy.
	force = 28
    throwforce = 23

/obj/item/rogueweapon/shield/bronze/great/get_mechanics_examine(mob/user)
	. = ..()
	. += span_info("This greatshield has a uniquely high chance to block incoming projectiles, without requiring the active use of the 'BLOCK' intent.")

/obj/item/clothing/head/roguetown/helmet/bronze
	name = "bronze illyriahelm"
	desc = "A helmet of bronze, older-in-design than you could possibly imagine. Mounted to its crest is a decorative sigil that has sparked scholarly debates for the better part of a millennium; is it a star, a vortex, or the Sun? </br>A notch behind the sigil allows for the joint mounting of a plume. Nock a feather into it to show off your alliegence's colors."
	armor = ARMOR_PLATE_BRONZE
	max_integrity = ARMOR_INT_HELMET_HEAVY_BRONZE - 25 //Close, but no cigar.
	material_category = ARMOR_MAT_PLATE
	prevent_crits = PREVENT_CRITS_ALL
	body_parts_covered = HEAD|HAIR|EARS
	icon_state = "bronzehelmet"
	item_state = "bronzehelmet"
	icon = 'icons\roguetown\clothing\special\thespian.dmi'
	mob_overlay_icon = 'icons\roguetown\clothing\special\onmob\thespian64.dmi'

/obj/item/clothing/head/roguetown/helmet/bronze/attackby(obj/item/W, mob/living/user, params)
	..()
	if(istype(W, /obj/item/natural/feather) && !detail_tag)
		var/choice = input(user, "Choose a color.", "Greatplume") as anything in COLOR_MAP
		detail_color = COLOR_MAP[choice]
		detail_tag = "_detail"
		user.visible_message(span_warning("[user] adds [W] to [src]."))
		user.transferItemToLoc(W, src, FALSE, FALSE)
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()

/obj/item/clothing/head/roguetown/helmet/bronze/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/neck/roguetown/psicross/astrata/bronze
	name = "bronze amulet of Astrata"
	desc = "'We are Her soldiers, the Legion of light.' </br>'We are the center, the ward of the Sun.' </br>'Fire and flame - we are one.'"
	icon_state = "astrata_b"
	item_state = "astrata_b"
	icon = 'icons\roguetown\clothing\special\thespian.dmi'
	mob_overlay_icon = 'icons\roguetown\clothing\special\onmob\thespian.dmi'

/obj/item/clothing/neck/roguetown/psicross/astrata/bronze/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	..()

	if(slot == SLOT_WRISTS || (wrist_display && slot != SLOT_NECK))
		mob_overlay_icon = 'icons\roguetown\clothing\onmob\helpers\stonekeep_thespian.dmi'
		sleeved = 'icons\roguetown\clothing\onmob\helpers\stonekeep_thespian.dmi'
	else
		mob_overlay_icon = initial(mob_overlay_icon)
		sleeved = initial(sleeved)

	return TRUE

/obj/item/clothing/neck/roguetown/psicross/astrata/bronze/psicross/attack_right(mob/user)
	if(!ismob(loc))
		return ..()

	wrist_display = !wrist_display
	to_chat(user, span_info("You adjust \the [src] to [wrist_display ? "display on your wrists" : "display around your neck"]."))
	if(wrist_display)
		mob_overlay_icon = 'icons\roguetown\clothing\onmob\helpers\stonekeep_thespian.dmi'
		sleeved = 'icons\roguetown\clothing\onmob\helpers\stonekeep_thespian.dmi'
	else
		mob_overlay_icon = initial(mob_overlay_icon)
		sleeved = initial(sleeved)

	if(isliving(loc))
		var/mob/living/L = loc
		L.regenerate_clothes()
	return ..()

//

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/hierophant/civilian
	name = "shawl"
	desc = "Thick and protective while remaining light and breezy; the perfect garb for protecting one from the hot sun and the harsh sands of Naledi."
	color = CLOTHING_BLACK

/obj/item/clothing/head/roguetown/roguehood/shalal/hijab/black
	color = CLOTHING_BLACK

/obj/item/storage/belt/rogue/leather/shalal/purple
	color = CLOTHING_PURPLE
