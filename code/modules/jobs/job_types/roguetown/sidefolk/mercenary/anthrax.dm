/datum/advclass/mercenary/anthrax
	name = "Black Venom"
	tutorial = "The Dark Elves, who usually live underground, are an extremely violent \
	race. They are known for their insidious ability to use spider poisons and razor-sharp \
	blades.  The matriarch has set you a task: to get to the surface and find out what is going \
	on, and during this time you will be able to earn money, because, unfortunately, the \
	inhabitants of the upper world refuse to accept spider paws as payment for their services."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/elf/dark,
		/datum/species/human/halfelf, // Because half-drows are half-elves, guh.
	)
	outfit = /datum/outfit/job/roguetown/mercenary/anthrax
	class_select_category = CLASS_CAT_RACIAL
	category_tags = list(CTAG_MERCENARY)

	cmode_music = 'sound/music/combat_delf.ogg'

	traits_applied = list(TRAIT_DARKVISION, TRAIT_MEDIUMARMOR, TRAIT_ANTHRAXI)
	subclass_stats = list(
		STATKEY_STR = 2,
		STATKEY_CON = 2,
		STATKEY_WIL = 2,
		STATKEY_PER = 1,
	)

	subclass_skills = list(
		/datum/skill/combat/bows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT, 
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN, 
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/traps = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/alchemy = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/axes = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/shields = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,

	)
	subclass_languages = list(/datum/language/undercommon)
	extra_context = "This subclass is race-restricted to the Dark Elves."

/datum/outfit/job/roguetown/mercenary/anthrax/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	belt = /obj/item/storage/belt/rogue/leather/black
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/shadowpants
	backl = /obj/item/storage/backpack/rogue/satchel/black
	head = /obj/item/clothing/neck/roguetown/chaincoif/full/black
	backpack_contents = list(
		/obj/item/roguekey/mercenary = 1, 
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1, 
		/obj/item/rogueweapon/huntingknife/idagger/steel/corroded/dirk = 1,
		/obj/item/reagent_containers/glass/bottle/rogue/strongpoison = 1,
		/obj/item/rogueweapon/scabbard/sheath)
	armor = /obj/item/clothing/suit/roguetown/armor/plate/fluted/shadowplate
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/shadowrobe
	gloves = /obj/item/clothing/gloves/roguetown/plate/shadowgauntlets
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	mask = /obj/item/clothing/mask/rogue/facemask/shadowfacemask
	neck = /obj/item/clothing/neck/roguetown/chaincoif/chainmantle
	backr = /obj/item/rogueweapon/shield/tower/spidershield
	beltr = /obj/item/rogueweapon/whip/spiderwhip	
	beltl = /obj/item/rope/chain

	H.faction += "spider_lowers"

	if(H.mind)
		var/riding = list("Spidertamer (Tameable Spider Mount)", "Shroomwalker (+I to Athletics)")
		var/ridingchoice = input(H, "Choose your TRAVELBOON.", "ROAM ABROAD AND ROAM FAR.") as anything in riding
		switch(ridingchoice)
			if("Spidertamer (Tameable Spider Mount)")
				apply_virtue(H, new /datum/virtue/utility/riding)
			if("Shroomwalker (+I to Athletics)")
				H.adjust_skillrank_up_to(/datum/skill/misc/athletics, SKILL_LEVEL_MASTER, TRUE)		

	H.merctype = 15

/datum/advclass/mercenary/anthrax_assasin
	name = "Anthrax Assassin"
	tutorial = "Black Venom's infamous killers for hire, it is said a single cut \
	from their poison tipped blades is enough to send their victim to an early grave. You are one \
	of those assassins, use your trusty bow and arrow to bring your targets' demise \
	from afar or take a second sabre and weave a beautiful dance of death. All that matters is \
	that your contract is fulfilled and your pockets heavy with mammon."
	outfit = /datum/outfit/job/roguetown/mercenary/anthrax_assasin
	traits_applied = list(TRAIT_DARKVISION, TRAIT_DODGEEXPERT, TRAIT_ANTHRAXI)
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/elf/dark,
		/datum/species/human/halfelf, // Because half-drows are half-elves, guh.
	)
	class_select_category = CLASS_CAT_RACIAL
	category_tags = list(CTAG_MERCENARY)

	subclass_stats = list(
		STATKEY_WIL = 2,
		STATKEY_PER = 2,
		STATKEY_INT = 1,
		STATKEY_SPD = 2,
	)
	subclass_skills = list(
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT, 
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN, 
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/alchemy = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_MASTER,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/bows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/crossbows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/knives = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/sewing = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/traps = SKILL_LEVEL_EXPERT,
	)

/datum/outfit/job/roguetown/mercenary/anthrax_assasin/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/shadowshirt/elflock
	armor = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/shadowrobe
	cloak = /obj/item/clothing/cloak/half/shadowcloak
	gloves = /obj/item/clothing/gloves/roguetown/fingerless/shadowgloves/elflock
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	mask = /obj/item/clothing/mask/rogue/shepherd/shadowmask/delf
	neck = /obj/item/clothing/neck/roguetown/chaincoif/chainmantle
	beltl = /obj/item/rogueweapon/scabbard/sword
	r_hand = /obj/item/rogueweapon/sword/sabre/stalker

	H.faction += "spider_lowers"

	if(H.mind)
		var/weapon = list("Bow and Arrow", "Dual Sabres")
		var/weaponchoice = input(H, "Choose your WEAPON.", "PICK YOUR INSTRUMENTS.") as anything in weapon
		switch(weaponchoice)
			if("Bow and Arrow")
				backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/short
				beltr = /obj/item/quiver/poisonarrows
				H.adjust_skillrank_up_to(/datum/skill/combat/bows, SKILL_LEVEL_EXPERT, TRUE)
			if("Dual Sabres")
				l_hand = /obj/item/rogueweapon/sword/sabre/stalker
				beltr = /obj/item/rogueweapon/scabbard/sword
				backr = null
				ADD_TRAIT(H, TRAIT_DUALWIELDER, TRAIT_GENERIC)
		var/riding = list("Spidertamer (Tameable Spider Mount)", "Shroomwalker (+I to Athletics)")
		var/ridingchoice = input(H, "Choose your TRAVELBOON.", "ROAM ABROAD AND ROAM FAR.") as anything in riding
		switch(ridingchoice)
			if("Spidertamer (Tameable Spider Mount)")
				apply_virtue(H, new /datum/virtue/utility/riding)
			if("Shroomwalker (+I to Athletics)")
				H.adjust_skillrank_up_to(/datum/skill/misc/athletics, SKILL_LEVEL_MASTER, TRUE)		

	H.merctype = 15	

/datum/advclass/mercenary/anthrax_bladesinger
	name = "Plumphelmic Bladesinger"
	tutorial = "Within the fungal depths of the Underdark, maneuverability is \
	worth its weight in gold. From the yils spent rushing past shroomtrees to \
	hunt man-and-merbeaste, you've cultivated a physique rivaled only by the \
	surface-dwelling hunters of old. Strike fast and strike true, for the blade \
	is thy God."
	outfit = /datum/outfit/job/roguetown/mercenary/anthrax_bladesinger
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/elf/dark,
		/datum/species/human/halfelf, // Because half-drows are half-elves, guh.
	)
	class_select_category = CLASS_CAT_RACIAL
	category_tags = list(CTAG_MERCENARY)

	traits_applied = list(TRAIT_DARKVISION, TRAIT_MEDIUMARMOR, TRAIT_ANTHRAXI)
	subclass_stats = list(
		STATKEY_STR = 1,
		STATKEY_SPD = 2,
		STATKEY_WIL = 3,
	)
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN, 
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_MASTER, 
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/sewing = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/traps = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/roguetown/mercenary/anthrax_bladesinger/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/plate/bladesinger
	belt = /obj/item/storage/belt/rogue/leather/black
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/shadowpants
	backl = /obj/item/storage/backpack/rogue/satchel/black
	head = /obj/item/clothing/head/roguetown/helmet/heavy/bladesinger
	backpack_contents = list(
		/obj/item/roguekey/mercenary = 1, 
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1)
	armor = /obj/item/clothing/suit/roguetown/armor/plate/fluted/shadowplate/bladesinger
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/shadowrobe
	gloves = /obj/item/clothing/gloves/roguetown/plate/shadowgauntlets/bladesinger
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	mask = /obj/item/clothing/mask/rogue/facemask/shadowfacemask
	neck = /obj/item/clothing/neck/roguetown/leather
	backr = /obj/item/rogueweapon/scabbard/gwstrap
	beltl = /obj/item/rope/chain
	r_hand = /obj/item/rogueweapon/greatsword/elfgsword

	H.faction += "spider_lowers"

	H.merctype = 15	

/obj/item/clothing/suit/roguetown/armor/plate/fluted/shadowplate/bladesinger
	name = "shadowplate breastplate"
	desc = "Sunless alloys, meticulously shaped without the Riddle's grace into an interlocking shroud that barely inhibits one's \
	agility. The fur-mantle of a great spiderbeaste lays draped across its shoulders, and its bronze-gilded breastplates bares the \
	rontz stud with pride."
	icon_state = "elfchest"
	item_state = "elfchest"
	icon = 'icons/roguetown/clothing/special/race_armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/race_armor.dmi'

/obj/item/clothing/gloves/roguetown/plate/shadowgauntlets/bladesinger
	name = "shadowplate gauntlets"
	desc = "Taloned gauntlets, forged from sunless alloys. Decorating the cufflinks and talon-segments are intricate lacings of bronze, coveted amongst \
	the Underdark's inhabitants as much as a surface-dweller covets gold."
	icon_state = "elfhand"
	item_state = "elfhand"
	icon = 'icons/roguetown/clothing/special/race_armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/race_armor.dmi'

/obj/item/clothing/shoes/roguetown/boots/armor/plate/bladesinger
	name = "shadowplate boots"
	desc = "Plumphelmic sabatons, cuffed with bronze-gilded decorations and shingled with plates of sunless alloys. Each foot is cradled by a dozen seperate \
	plates, allowing for an intimidating amount of agility to be practiced. Most tend to tremble in fear, when their presumptions of a plated hunter's \
	speed are shattered mid-pursuit."
	icon_state = "elfshoes"
	item_state = "elfshoes"
	icon = 'icons/roguetown/clothing/special/race_armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/race_armor.dmi'

/obj/item/clothing/head/roguetown/helmet/heavy/bladesinger
	name = "shadowplate barbute"
	desc = "The horned visage of a Bladesinger, and the last thing that many-a-fool hath seen. Though little is understood of this enigmatic station, some \
	believe them to be the Underdark's equivalent of anointed knights - then again, perhaps they mistranslated the Dark Elven term for 'knight' with \
	'hunter' or 'marauder'."
	icon_state = "elfhead"
	item_state = "elfhead"
	icon = 'icons/roguetown/clothing/special/race_armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/race_armor.dmi'
	bloody_icon = 'icons/effects/blood64.dmi'
	smeltresult = /obj/item/ingot/drow
	smelt_bar_num = 2
