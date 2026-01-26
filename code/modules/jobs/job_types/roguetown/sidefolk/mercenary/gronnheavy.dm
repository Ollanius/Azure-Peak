/datum/advclass/mercenary/gronnheavy
	name = "Fjall Járnklæddur"
	tutorial = "Even within Fjall, few bear witness to the Horned Visages of the Járnklæddur; Ironclad warriors who stand against the undead armies that rise out of the 'Red Blizzard'. Those who do not have the blessing of the Iskarn Shamans within the Northern Empty oft-seek the protection of the Járnklæddur, despite their steep costs."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	maximum_possible_slots = 1 //Hopefully this works.
	outfit = /datum/outfit/job/roguetown/mercenary/gronnheavy
	class_select_category = CLASS_CAT_GRONN
	category_tags = list(CTAG_MERCENARY)
	traits_applied = list(TRAIT_HEAVYARMOR)
	cmode_music = 'sound/music/combat_vagarian.ogg'
	subclass_languages = list(/datum/language/gronnic)
	subclass_stats = list(
		STATKEY_WIL = 3, //People see big numbers and start shitting their pants, but their weighted stats are 7 and it's limited to one, singular slot. This is fine. 
		STATKEY_STR = 3, //Allows for the wielding of both The Maul and The Sword, assuming you don't take a STR-reducing statpack.
		STATKEY_INT = 2,
		STATKEY_CON = 3,
		STATKEY_PER = -1, //CAN'T SEE SHIT OUTTA THIS THING!!
		STATKEY_SPD = -3  //SLOW AND UNWIELDY
	)
	subclass_skills = list(
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/crafting = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/tanning = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/fishing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_EXPERT, //All of you can suck my dick they're SEAMEN
		/datum/skill/craft/sewing = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
	)

/datum/outfit/job/roguetown/mercenary/gronnheavy
	allowed_patrons = ALL_INHUMEN_PATRONS

/datum/outfit/job/roguetown/mercenary/gronnheavy/pre_equip(mob/living/carbon/human/H)
	..()
	H.dna.species.soundpack_m = new /datum/voicepack/male/evil() //It's fucking cool okay
	to_chat(H, span_warning("You are a seasoned warrior from the mythical Fjalls - strong enough to swing weapons others couldn't hope to lift, and skilled enough to warrant a premium fee.))
	H.set_blindness(0)
	if(H.mind)
		var/weapons = list("Armorbearer's Maul","Berserker's Sword")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		switch(weapon_choice)
			if("Armorbearer's Maul")
				H.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_EXPERT, TRUE)
				r_hand = /obj/item/rogueweapon/mace/maul //Two-handed greatmace. Crushes and sunders.
			if("Berserker's Sword")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
				r_hand = /obj/item/rogueweapon/sword/long/exe/berserk //Special variant of the Executioner Sword.

	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron/gronn
	head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket/gronn
	gloves = /obj/item/clothing/gloves/roguetown/plate/iron/gronn
	armor = /obj/item/clothing/suit/roguetown/armor/plate/iron/gronn
	cloak = /obj/item/clothing/cloak/volfmantle			//Aura farming.
	wrists = /obj/item/clothing/wrists/roguetown/bracers/iron //Weakspot.
	pants = /obj/item/clothing/under/roguetown/platelegs/iron/gronn
	neck = /obj/item/clothing/neck/roguetown/bevor/iron //Their weakspot. Go replace it if you're a chud I guess
	backl = /obj/item/storage/backpack/rogue/satchel/black
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	backpack_contents = list(
		/obj/item/flashlight/flare/torch/metal = 1,
		/obj/item/roguekey/mercenary = 1,
		/obj/item/rogueweapon/huntingknife = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)
	H.merctype = 1
