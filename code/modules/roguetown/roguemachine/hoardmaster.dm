/obj/structure/roguemachine/Hoardmaster
	name = ""
	desc = ""
	icon = 'icons/roguetown/misc/96x96.dmi'
	icon_state = "Hoardmaster"
	density = TRUE
	blade_dulling = DULLING_BASH
	max_integrity = 0
	anchored = TRUE
	layer = ABOVE_MOB_LAYER
	var/upgrade_flags
	var/current_cat = "1"


/obj/structure/roguemachine/Hoardmaster/Initialize()
	. = ..()
	update_icon()
	var/namechance = rand(1,6)
	switch(namechance)
		if(1)
			name = "Hoardmaster Skyblue"
		if(2)
			name = "Hoardmaster Thea"
		if(3)
			name = "Hoardmaster Radagon"
		if(4)
			name = "Hoardmaster Shiver"
		if(5)
			name = "Hoardmaster Deathbringer"
		if(6)
			name = "Hoardmaster Darkstalker"

/obj/structure/roguemachine/Hoardmaster/examine(mob/user)
	. = ..()
	if(user.mind?.has_antag_datum(/datum/antagonist/bandit))
		. += "Formerly a covetous creature, this one now shares its Hoard with the Freefolk. Protecting the transactor's Hoard, and trading it for Favor."
		return
	else
		. += "Some mean looking statue of a dragon. Something about it makes me uneasy, like its eyes are following me."
		return

/obj/structure/roguemachine/Hoardmaster/Topic(href, href_list)
	. = ..()
	if(!HAS_TRAIT(usr, TRAIT_COMMIE))
		return
	if(!usr.canUseTopic(src, BE_CLOSE))
		return
	if(!ishuman(usr))
		return
	if(href_list["buy"])
		var/mob/M = usr
		var/datum/antagonist/bandit/B = M.mind.has_antag_datum(/datum/antagonist/bandit)
		var/path = text2path(href_list["buy"])
		if(!ispath(path, /datum/supply_pack))
			message_admins("silly MOTHERFUCKER [usr.key] IS TRYING TO BUY A [path] WITH THE HOARDMASTER")
			return
		var/datum/supply_pack/PA = SSmerchant.supply_packs[path]
		var/cost = PA.cost
		if(B.favor >= cost)
			B.favor -= cost
			playsound(loc, 'sound/misc/hoardmasterpurchase.ogg', 80, FALSE, -1)
		else
			say("Earn your keep first!")
			return
		var/shoplength = PA.contains.len
		var/l
		for(l=1,l<=shoplength,l++)
			var/pathi = pick(PA.contains)
			var/atom/hmasteritem = new pathi(get_turf(M))
			hmasteritem.flags_1 |= HOARDMASTER_SPAWNED_1
			if(istype(hmasteritem, /obj/item))
				var/obj/item/newitem = hmasteritem
				newitem.sellprice = 0
				if(newitem.smeltresult)
					newitem.smeltresult = /obj/item/ash
				if(newitem.salvage_result)
					newitem.salvage_result = /obj/item/ash
	if(href_list["changecat"])
		current_cat = href_list["changecat"]
	return attack_hand(usr)

/obj/structure/roguemachine/Hoardmaster/attack_hand(mob/living/user)
	if(!HAS_TRAIT(user, TRAIT_COMMIE))
		return
	var/datum/antagonist/bandit/B = usr.mind.has_antag_datum(/datum/antagonist/bandit)
	. = ..()
	if(.)
		return
	if(!ishuman(user))
		return
	user.changeNext_move(CLICK_CD_INTENTCAP)
	var/contents
	contents = "<center>Wishes for the Free<BR>"
	contents += "<a href='?src=[REF(src)];change=1'>Your favor:</a> [B.favor]<BR>"


	var/list/unlocked_cats = list("Things")
	switch(usr.advjob)
		if("Brigand")
			unlocked_cats+="Brigand"
		if("Sellsword")
			unlocked_cats+="Sellsword"
		if("Hedge Alchemist")
			unlocked_cats+="Alchemist"
		if("Hedge Knight")
			unlocked_cats+="Knight"
		if("Hedge Mage")
			unlocked_cats+="Mage"
		if("Knave")
			unlocked_cats+="Knave"
		if("Iconoclast")
			unlocked_cats+="Iconoclast"
   
	if(current_cat == "1")
		contents += "<center>"
		for(var/X in unlocked_cats)
			contents += "<a href='?src=[REF(src)];changecat=[X]'>[X]</a><BR>"
		contents += "</center>"
	else
		contents += "<center>[current_cat]<BR></center>"
		contents += "<center><a href='?src=[REF(src)];changecat=1'>\[RETURN\]</a><BR><BR></center>"
		var/list/pax = list()
		for(var/pack in SSmerchant.supply_packs)
			var/datum/supply_pack/PA = SSmerchant.supply_packs[pack]
			if(PA.group == current_cat)
				pax += PA
		for(var/datum/supply_pack/PA in sortList(pax))
			contents += "[PA.name] [PA.contains.len > 1?"x[PA.contains.len]":""] - ([PA.cost])<a href='?src=[REF(src)];buy=[PA.type]'>BUY</a><BR>"

	var/datum/browser/popup = new(user, "HOARDMASTER", "", 370, 600)
	popup.set_content(contents)
	popup.open()


/obj/structure/roguemachine/hoardbarrier //Blocks sprite locations
	name = ""
	desc = "Formerly a covetous creature, this one now shares its Hoard with the Freefolk. Protecting the transactor's Hoard, and trading it for Favor."
	icon = 'icons/roguetown/underworld/underworld.dmi'
	icon_state = "spiritpart"
	density = TRUE
	anchored = TRUE

//////////////////////////////////
// HOARDMASTER-EXCLUSIVE ITEMS! //
//////////////////////////////////

/obj/item/clothing/suit/roguetown/armor/plate/cuirass/fluted/gilded
	name = "gilded cuirass"
	icon_state = "goldcuirass"
	desc = "A resplendant cuirass of gilded steel, padded with a besilked arming jacket. Stand in the daelight for too long, and its angled breastplate can turn even an errant glare into a blinding hazard; a quirk oft-exploited by less noble-hearted aristocrats."
	max_integrity = ARMOR_INT_CHEST_MEDIUM_STEEL + 50

/obj/item/clothing/wrists/roguetown/bracers/gilded
	name = "gilded bracers"
	desc = "A resplendant pair of gilded vambraces, padded with besilked sleeves and equipped with maille-tethered knuckleguards. Engraved marginalia decorates the surface; one that tells the story of a grieving father who strode to the heavens-and-back to save his son."
	icon_state = "goldbracers"
	item_state = "goldbracers"
	max_integrity = ARMOR_INT_SIDE_STEEL + 50
	body_parts_covered = ARMS | HANDS

/obj/item/clothing/shoes/roguetown/boots/armor/gilded
	name = "gilded greaves"
	desc = "Resplendant sabatons of gilded steel, adorned with angled greaves that further guard the thighs from debalancing strikes. The flakage that rubs off onto the cobblestone with each step is worth more than the sum of a peasant's monthly harvest."
	icon_state = "goldgreaves"
	item_state = "goldgreaves"
	max_integrity = ARMOR_INT_SIDE_STEEL + 50
	body_parts_covered = FEET | LEGS

/obj/item/clothing/neck/roguetown/gorget/gilded
	name = "gilded gorget"
	desc = "A series of resplendant gilded-steel plates designed to protect the neck, traditionally worn atop a jacket or cuirass. The lack of a 'bolt-proofing' mark - as worrisome as it might be - ensures its well-polished symmetricality isn't tarnished."
	icon_state = "goldgorget"
	max_integrity = ARMOR_INT_SIDE_STEEL + 50

/obj/item/clothing/head/roguetown/helmet/heavy/knight/gilded
	name = "gilded knight's armet"
	desc = "A resplendant armet, masterfully assembled from gilded steel. Articulation commands "
	icon_state = "goldknight"
	max_integrity = ARMOR_INT_SIDE_STEEL + 50

/obj/item/rogueweapon/sword/gilded
	name = "gilded arming sword"
	desc = "A resplendant arming sword, who's alloyed blade and besilked handle lays separated by a duocruciformic crossguard. This particular weapon seems to have innovatively combined the lethal cutting prowess of Psydonia's oldest weapon with the psychological damage of knowing that its wielder could likely bribe the Carriageman himself, and still chose to personally kill you."
	icon_state = "goldsword"
	force = 27
	force_wielded = 32
	sheathe_icon = "goldsword"
	max_blade_int = 300
	wdefense_wbonus = 3

/obj/item/reagent_containers/food/snacks/grown/apple/gold
	seed = null //Ungrowable(?). Can be changed if someone wishes.
	name = "ambrosia"
	desc = "A golden apple, by any other name. You can see your own reflection in the golden apple's surface, as the fingers cradling it adopt a pleasant numbness."
	icon_state = "gapple"
	faretype = FARE_FINE
	tastes = list("divinely crisp sweetness" = 1)
	trash = /obj/item/trash/gapplecore
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/fruit/apple_sliced/gold
	slices_num = 3
	rotprocess = null
	eat_effect = /datum/status_effect/buff/snackbuff
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD, /datum/reagent/medicine/stronghealth = 12)

/obj/item/reagent_containers/food/snacks/grown/apple/gold/Initialize()
  ..()
  add_filter(FORCE_FILTER, 2, list("type" = "outline", "color" = GLOW_COLOR_LIGHTNING, "alpha" = 155, "size" = 1))

/obj/item/reagent_containers/food/snacks/grown/apple/gold/examine(mob/user)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.patron.type == /datum/patron/inhumen/matthios)
			. += span_rose("A fruit from the heavens, courageously plucked by Matthios while escaping with Astrata's divine fire.. or so, they say. Eating it will not only be quite tasty, but help mend my lesser wounds as well.")

/obj/item/reagent_containers/food/snacks/rogue/fruit/apple_sliced/gold
	name = "sliceed ambrosia"
	icon_state = "gapple_sliced"
	desc = "A golden apple, parted into perfectly symmetrical thirds. Opulance has never tasted so sweet!"
	faretype = FARE_LAVISH
	rotprocess = null
	tastes = list("a sliver of divine sweetness" = 1)
	eat_effect = /datum/status_effect/buff/snackbuff
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD, /datum/reagent/medicine/stronghealth = 6)

/obj/item/reagent_containers/food/snacks/rogue/fruit/apple_sliced/gold/Initialize()
  ..()
  add_filter(FORCE_FILTER, 2, list("type" = "outline", "color" = GLOW_COLOR_LIGHTNING, "alpha" = 155, "size" = 1))

/obj/item/reagent_containers/food/snacks/rogue/fruit/apple_sliced/gold/examine(mob/user)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.patron.type == /datum/patron/inhumen/matthios)
			. += span_rose("Sliced fruit from the heavens, courageously plucked by Matthios while escaping with Astrata's divine fire.. or so, they say. Eating it will not only be quite tasty, but help mend my lesser wounds as well.")

/obj/item/trash/gapplecore
	name = "cored ambrosia"
	desc = "Hey, who turned out the lights? I thought the feast was just getting started!"
	icon_state = "gapplecore"
	icon = 'icons/roguetown/items/produce.dmi'

/obj/item/trash/gapplecore/Initialize()
  ..()
  add_filter(FORCE_FILTER, 2, list("type" = "outline", "color" = GLOW_COLOR_LIGHTNING, "alpha" = 77, "size" = 1))

/obj/item/trash/gapplecore/examine(mob/user)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.patron.type == /datum/patron/inhumen/matthios)
			. += span_rose("The remains of a heavenly fruit, courageously plucked by Matthios while escaping with Astrata's divine fire.. or so, they say. Such fruits're said to refresh and heal mortals more than any other morsel. </br>I can fetch more by bargaining with the Hoardmaster and those most-devout to greed.")

//

/obj/item/reagent_containers/food/snacks/grown/apple/gold/On_Consume(mob/living/eater)
	..()
	if(ishuman(eater))
		var/mob/living/carbon/human/H = eater
		if(!(H.real_name in bitten_names))
			bitten_names += H.real_name

/obj/item/reagent_containers/food/snacks/grown/apple/gold/blockproj(mob/living/carbon/human/H)

	if(prob(98))
		H.visible_message(span_notice("[H] is saved by the golden apple!"))
		H.dropItemToGround(H.head)
		return 1
	else
		H.dropItemToGround(H.head)
		return 0

/obj/item/reagent_containers/food/snacks/grown/apple/gold/equipped(mob/M)
	..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.head == src)

			equippedloc = H.loc
			START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/food/snacks/grown/apple/gold/process()
	. = ..()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(H.head == src)
			if(equippedloc != H.loc)
				H.dropItemToGround(H.head)

//
