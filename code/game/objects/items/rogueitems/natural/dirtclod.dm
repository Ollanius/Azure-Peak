/obj/item/natural/dirtclod
	name = "clod"
	desc = "A handful of earth."
	icon_state = "clod1"
	dropshrink = 0
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY

	var/being_deleted = FALSE

	var/static/list/slapcraft_recipe_list = list(
		/datum/crafting_recipe/roguetown/survival/wickercloak
	)

/obj/item/natural/dirtclod/sand
	name = "sand"
	desc = "A handful of loose sand."
	icon_state = "sand1"

/obj/item/natural/dirtclod/sand/Initialize()
	. = ..()
	icon_state = "sand[rand(1,2)]"

/obj/item/natural/dirtclod/snow
	name = "packed snow"
	desc = "A handful of snow, frigid yet frail."
	icon_state = "snow1"

/obj/item/natural/dirtclod/snow/Initialize()
	..()
	icon_state = "snow[rand(1,2)]"

/obj/item/natural/dirtclod/Initialize()
	icon_state = "clod[rand(1,2)]"
	..()

	var/datum/element/slapcrafting/E = AddElement(/datum/element/slapcrafting, slapcraft_recipe_list)
	if(E)
		E.slapcraft_recipes = slapcraft_recipe_list

/obj/item/natural/dirtclod/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/rogueweapon/shovel))
		var/obj/item/rogueweapon/shovel/S = W
		if(!S.heldclod && user.used_intent.type == /datum/intent/shovelscoop)
			playsound(loc, 'sound/items/dig_shovel.ogg', 100, TRUE)
			forceMove(S)
			S.heldclod = src
			W.update_icon()
			return
	..()

/obj/item/natural/dirtclod/Entered(atom/newloc)
	..()
	if(being_deleted || QDELETED(src))
		return
	if(istype(src, /obj/item/natural/dirtclod/sand))
		if(isturf(loc))
			var/turf/T_sand = loc
			for(var/obj/structure/fluff/sandpile/SP in T_sand)
				SP.sandamt = min(SP.sandamt + 1, 5)
				qdel(src)
				return
			var/sandcount = 1
			var/list/sands = list()
			for(var/obj/item/natural/dirtclod/sand/S in T_sand)
				sandcount++
				sands += S
			if(sandcount >= 5)
				for(var/obj/item/I_sand in sands)
					qdel(I_sand)
				qdel(src)
				new /obj/structure/fluff/sandpile(T_sand)
		return
	if(!isturf(newloc))
		return

	try_merge(newloc)

/obj/item/natural/dirtclod/Moved(oldLoc, dir)
	..()
	if(being_deleted || QDELETED(src))
		return
	if(isturf(loc))
		try_merge(loc)

/obj/item/natural/dirtclod/proc/try_merge(turf/T)
	if(being_deleted || QDELETED(src))
		return

	// 1) Merge into existing pile
	for(var/obj/structure/fluff/clodpile/C in T)
		C.dirtamt = min(C.dirtamt + 1, 5)
		being_deleted = TRUE
		if(!QDELETED(src))
			qdel(src)
		return

	// 2) Collect loose clods
	var/list/dirts = list()
	for(var/obj/item/natural/dirtclod/D in T)
		if(D == src || D.being_deleted)
			continue
		dirts += D

	// 3) Create pile if threshold reached
	if(dirts.len + 1 >= 5)
		for(var/obj/item/natural/dirtclod/D in dirts)
			D.being_deleted = TRUE

		for(var/obj/item/natural/dirtclod/D in dirts)
			if(!QDELETED(D))
				qdel(D)

		being_deleted = TRUE
		if(!QDELETED(src))
			qdel(src)

		new /obj/structure/fluff/clodpile(T)

/obj/item/natural/dirtclod/attack_self(mob/living/user)
	user.visible_message(span_warning("[user] scatters [src]."))
	if(being_deleted || QDELETED(src))
		return
	being_deleted = TRUE
	qdel(src)

/obj/item/natural/dirtclod/Destroy()
	being_deleted = TRUE
	return ..()


/obj/structure/fluff/clodpile
	name = "dirt pile"
	desc = "A pile of dirt."
	icon_state = "clodpile"
	icon = 'icons/roguetown/items/natural.dmi'
	climbable = FALSE
	density = FALSE
	climb_offset = 10

	var/dirtamt = 5

/obj/structure/fluff/clodpile/Initialize()
	dir = pick(GLOB.cardinals)
	..()

/obj/structure/fluff/clodpile/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/rogueweapon/shovel))
		var/obj/item/rogueweapon/shovel/S = W
		if(user.used_intent.type == /datum/intent/shovelscoop)
			if(!S.heldclod)
				playsound(loc, 'sound/items/dig_shovel.ogg', 100, TRUE)
				var/obj/item/natural/dirtclod/J = new(S)
				S.heldclod = J
				W.update_icon()
				dirtamt--
				if(dirtamt <= 0)
					qdel(src)
				return
			else
				playsound(loc, 'sound/items/empty_shovel.ogg', 100, TRUE)
				var/obj/item/I = S.heldclod
				S.heldclod = null
				qdel(I)
				W.update_icon()
				dirtamt = min(dirtamt + 1, 5)
				return
	..()

/obj/structure/fluff/sandpile
	name = "sand pile"
	desc = "A pile of loose sand."
	icon_state = "sandpile"
	var/sandamt = 5
	icon = 'icons/roguetown/items/natural.dmi'
	climbable = FALSE
	density = FALSE
	climb_offset = 10

/obj/structure/fluff/sandpile/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/rogueweapon/shovel))
		var/obj/item/rogueweapon/shovel/S = W
		if(user.used_intent.type == /datum/intent/shovelscoop)
			if(!S.heldclod)
				playsound(loc,'sound/items/dig_shovel.ogg', 100, TRUE)
				var/obj/item/J = new /obj/item/natural/dirtclod/sand(S)
				S.heldclod = J
				W.update_icon()
				sandamt--
				if(sandamt <= 0)
					qdel(src)
				return
			else
				playsound(loc,'sound/items/empty_shovel.ogg', 100, TRUE)
				var/obj/item/I = S.heldclod
				if(!istype(I, /obj/item/natural/dirtclod/sand))
					return ..()
				S.heldclod = null
				qdel(I)
				W.update_icon()
				sandamt++
				if(sandamt > 5)
					sandamt = 5
				return
	..()

/obj/structure/fluff/sandpile/Initialize(mapload)
	dir = pick(GLOB.cardinals)
	..()
