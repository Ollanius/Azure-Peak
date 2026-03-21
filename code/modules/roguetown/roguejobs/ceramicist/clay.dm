/obj/item/natural/clay
	name = "clay"
	icon_state = "clay"     // Placeholder. TODO: Get an icon for clay.
	desc = "A handful of damp, malleable clay. When rolled out atop a potter's wheel, it can be sculpted into pots, cutlery, and statues."
	gripped_intents = null
	dropshrink = 0.75
	possible_item_intents = list(INTENT_GENERIC)
	force = 0
	throwforce = 0
	slot_flags = null
	obj_flags = null
	w_class = WEIGHT_CLASS_TINY
	var/cooked_type = /obj/item/natural/stone // What does this item turn into when glazed in a kiln?
											  // A regular clay lump just becomes an ordinary stone.
					// ...Possibly used to make bricks in a separate PR? Interesting way to integrate
					// the mason's construction work with the new Potter profession. - SunriseOYH

	var/cooking = 0 			// This variable measures the progress of the glazing act.
	var/cooktime = 1 MINUTES    // This dictates the time needed to glaze.
	var/burning = 0				// This variable measures the progress of the burning act
	var/burntime = 5 MINUTES	// How long must it be left unattended to burn and be ruined?
	var/burned_color = "#302d2d"
	var/shatter_chance = 15
	var/ash_kneads = 0
	var/sand_added = FALSE
	var/is_wet = FALSE
	var/needs_knead_after_wet = FALSE

/obj/item/natural/clay/proc/consume_wetting_water(obj/item/reagent_containers/container)
	if(!container?.reagents)
		return FALSE
	if(container.reagents.has_reagent(/datum/reagent/water, 2))
		container.reagents.remove_reagent(/datum/reagent/water, 2)
		return TRUE
	if(container.reagents.has_reagent(/datum/reagent/water/gross, 2))
		container.reagents.remove_reagent(/datum/reagent/water/gross, 2)
		return TRUE
	return FALSE

/obj/item/natural/clay/proc/set_wet_state(new_state)
	is_wet = !!new_state
	if(src.type == /obj/item/natural/clay)
		icon_state = is_wet ? "kneaded_clay" : initial(icon_state)

/obj/item/natural/clay/proc/get_knead_time(mob/living/user, base_time)
	var/skill_level = SKILL_LEVEL_NONE
	if(user)
		skill_level = user.get_skill_level(/datum/skill/craft/ceramics)
	// Journeyman-level skills are the baseline; lower skills take longer, higher skills speed up kneading.
	return max(6, round(base_time) + (SKILL_LEVEL_JOURNEYMAN - skill_level) * 4)

/obj/item/natural/clay/proc/knead_wetted_clay(mob/living/user)
	if(!user)
		return FALSE
	if(!is_wet || !needs_knead_after_wet)
		return FALSE
	to_chat(user, span_notice("I knead the wet clay to make it workable..."))
	playsound(get_turf(user), 'modular/Neu_Food/sound/kneading.ogg', 100, TRUE, -1)
	if(!do_after(user, get_knead_time(user, 1.5 SECONDS), target = src))
		return FALSE
	needs_knead_after_wet = FALSE
	return TRUE

/obj/item/natural/clay_shard
	name = "clay shard"
	desc = "A shard of clay, borne of a potter's crushed dreams. Even so, a crushed dream can \
	be resurrected with enough effort.. and perhaps, a sprinkling of golden powder."
	icon = 'icons/roguetown/items/crafting.dmi'
	experimental_inhand = FALSE
	icon_state = "clayshard1"
	item_state = "clayshard"
	drop_sound = 'sound/foley/dropsound/glass_drop.ogg'
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/stab)
	force = 3
	throwforce = 5
	resistance_flags = null
	w_class = WEIGHT_CLASS_TINY
	attack_verb = list("stabbed", "slashed", "sliced", "cut")
	max_integrity = 40
	smeltresult = /obj/item/natural/clay

/obj/item/natural/clay_shard/Initialize()
	. = ..()
	AddComponent(/datum/component/caltrop, force)
	AddComponent(/datum/component/butchering, 150, 65)

/obj/item/natural/clay_shard/Crossed(mob/living/L)
	if(istype(L))
		playsound(loc, 'sound/foley/glass_step.ogg', HAS_TRAIT(L, TRAIT_LIGHT_STEP) ? 30 : 50, TRUE)
	return ..()

/obj/item/natural/clay_shard/get_mechanics_examine(mob/user)
    . = ..()
    . += span_info("FILL IN HERE LATER.")

/obj/item/natural/clay/kneaded
	name = "kneaded clay"
	desc = "Well-worked clay made pliable for pottery. Prepared by wetting two lumps of raw clay with a water source and thoroughly kneading \
	them together until smooth. It can be further worked at a potter's wheel into basic clayware."
	icon_state = "kneaded_clay"

/obj/item/natural/clay/refined_partial
	name = "partially refined clay"
	desc = "Clay mixed with refining materials, but not fully worked yet."
	icon_state = "partialrefined_clay"

/obj/item/natural/clay/get_mechanics_examine(mob/user)
    . = ..()
    . += span_info("FILL IN HERE LATER.")

// '''Clay''' for making glass.
/obj/item/natural/clay/glassbatch
	name = "glass batch"
	icon_state = "glassBatch"
	desc = "A mortar-ground mixture of clay, ash, and stone powder that's ready to be smelted into glisteningly hot glass."
	smeltresult = /obj/item/natural/glass/heated 	// Pulled from the furnace with tongs for blowing.
	grind_results = list(/datum/reagent/iron = 15)
	sellprice = 5
	cooktime = 0
	burntime = 0

/obj/item/natural/clay/glassbatch/get_mechanics_examine(mob/user)
    . = ..()
    . += span_info("FILL IN HERE LATER.")

/obj/item/natural/clay/Initialize()
	if(cooked_type)
		cooktime = 30 SECONDS
	..() // The ..() refers to calling the parent class's (obj/item/natural) Initialize() proc.

/obj/item/natural/clay/refined
	name = "refined clay"
	desc = "Fine clay tempered through repeated cycles of wetting, kneading and resting with ash and sand to produce a smooth, dense body \
	that's fit for porcelain."
	icon_state = "refined_clay"

/obj/item/natural/clay/refined/Initialize()
	. = ..()
	if(cooked_type)
		cooktime = 1 MINUTES

/obj/item/natural/clay/refined/get_mechanics_examine(mob/user)
    . = ..()
    . += span_info("FILL IN HERE LATER.")

/obj/item/natural/clay/attack_hand(mob/living/user)
	if(is_wet && needs_knead_after_wet)
		if(knead_wetted_clay(user))
			return
	return ..()

/obj/item/natural/clay/attackby(obj/item/W, mob/living/user, params)
	if(istype(src, /obj/item/natural/clay/refined))
		return ..()

	if(!user)
		return ..()

	var/found_table = locate(/obj/structure/table) in (loc)
	var/obj/item/reagent_containers/water_container = W
	if(istype(water_container) && !is_wet)
		if(isturf(loc) && !found_table)
			to_chat(user, span_notice("I need a table to work this clay."))
			return TRUE
		if(!consume_wetting_water(water_container))
			to_chat(user, span_notice("Needs more water to work it."))
			return TRUE
		to_chat(user, span_notice("I wet the clay so it can be worked again."))
		playsound(get_turf(user), 'modular/Neu_Food/sound/splishy.ogg', 80, TRUE, -1)
		set_wet_state(TRUE)
		needs_knead_after_wet = TRUE
		return TRUE

	if(src.type == /obj/item/natural/clay && W.type == /obj/item/natural/clay)
		if(!is_wet)
			to_chat(user, span_warning("This clay is too dry. I need to wet it first."))
			return
		if(needs_knead_after_wet)
			to_chat(user, span_warning("I should knead the wetted clay first before adding more clay."))
			return
		if(isturf(loc) && !found_table)
			to_chat(user, span_notice("I need a table to knead this properly."))
			return
		to_chat(user, span_notice("I knead the clay together..."))
		playsound(get_turf(user), 'modular/Neu_Food/sound/kneading.ogg', 100, TRUE, -1)
		if(!do_after(user, get_knead_time(user, 2 SECONDS), target = src))
			return
		qdel(W)
		var/obj/item/natural/clay/kneaded/kneaded_clay = new(loc)
		kneaded_clay.is_wet = FALSE
		if(user.mind)
			user.mind.add_sleep_experience(/datum/skill/craft/ceramics, 2, FALSE)
		qdel(src)
		return

	if(user.get_skill_level(/datum/skill/craft/ceramics) < SKILL_LEVEL_JOURNEYMAN)
		to_chat(user, span_warning("I can't refine this clay without a Journeyman's skills in pottery."))
		return ..()

	if(!(istype(src, /obj/item/natural/clay/kneaded) || istype(src, /obj/item/natural/clay/refined_partial)))
		return ..()

	if(!is_wet)
		to_chat(user, span_warning("The clay has dried out. I need to wet it again first."))
		return

	if(needs_knead_after_wet)
		to_chat(user, span_warning("I should knead the wetted clay first before mixing more ingredients."))
		return

	if(isturf(loc) && !found_table)
		to_chat(user, span_notice("I need a table to keep kneading this."))
		return

	if(istype(W, /obj/item/ash))
		if(ash_kneads >= 2)
			to_chat(user, span_warning("This clay already has enough ash mixed in."))
			return
		to_chat(user, span_notice("I knead ash into the clay..."))
		playsound(get_turf(user), 'modular/Neu_Food/sound/kneading.ogg', 100, TRUE, -1)
		if(!do_after(user, get_knead_time(user, 1.5 SECONDS), target = src))
			return
		ash_kneads++
		set_wet_state(FALSE)
		needs_knead_after_wet = FALSE
		qdel(W)
		if(user.mind)
			user.mind.add_sleep_experience(/datum/skill/craft/ceramics, 1, FALSE)
		to_chat(user, span_notice("The clay now has [ash_kneads]/2 ash mixed in."))
		if(ash_kneads >= 2 && sand_added)
			var/obj/item/natural/clay/refined/refined_clay = new(loc)
			refined_clay.is_wet = FALSE
			to_chat(user, span_notice("The clay is now fully refined and ready for porcelain work."))
			qdel(src)
			return
		if(istype(src, /obj/item/natural/clay/kneaded))
			var/obj/item/natural/clay/refined_partial/partial = new(loc)
			partial.ash_kneads = ash_kneads
			partial.sand_added = sand_added
			partial.is_wet = FALSE
			qdel(src)
		return

	if(istype(W, /obj/item/natural/stone) || istype(W, /obj/item/natural/dirtclod/sand) || istype(W, /obj/item/alch/stonedust))
		var/is_stonedust = istype(W, /obj/item/alch/stonedust)
		if(is_stonedust && user.get_skill_level(/datum/skill/craft/ceramics) < SKILL_LEVEL_JOURNEYMAN)
			to_chat(user, span_warning("I can't meld this into a glass batch without a Journeyman's skills in pottery."))
			return ..()
		if(ash_kneads < 2)
			to_chat(user, span_warning("I need to knead in two clumps of ash before adding some sand."))
			return
		if(sand_added)
			to_chat(user, span_warning("This clay already has enough sand mixed in."))
			return
		to_chat(user, span_notice("I knead the final mineral temper into the clay to refine it."))
		playsound(get_turf(user), 'modular/Neu_Food/sound/kneading.ogg', 100, TRUE, -1)
		if(!do_after(user, get_knead_time(user, 2 SECONDS), target = src))
			return
		sand_added = TRUE
		set_wet_state(FALSE)
		needs_knead_after_wet = FALSE
		qdel(W)
		if(user.mind)
			user.mind.add_sleep_experience(/datum/skill/craft/ceramics, 1, FALSE)
		if(ash_kneads >= 2)
			if(is_stonedust)
				var/obj/item/natural/clay/glassbatch/glass_batch = new(loc)
				glass_batch.is_wet = FALSE
				to_chat(user, span_notice("The clay mixture is now ready to be smelted into glass."))
			else
				var/obj/item/natural/clay/refined/refined_clay = new(loc)
				refined_clay.is_wet = FALSE
				to_chat(user, span_notice("The clay is now fully refined and ready for porcelain work."))
			qdel(src)
			return
		if(istype(src, /obj/item/natural/clay/kneaded))
			var/obj/item/natural/clay/refined_partial/partial = new(loc)
			partial.ash_kneads = ash_kneads
			partial.sand_added = sand_added
			partial.is_wet = FALSE
			qdel(src)
			return
		to_chat(user, span_notice("This clay is partially refined. I need more ash to finish it."))
		return

	return ..()

/obj/item/natural/clay/cooking(input as num, burninput, atom/A) // The original coder's using the same variable names from cooking, for simplicity's sake.
	if(!input)
		return
	if(cooktime)
		if(cooking < cooktime)
			cooking = cooking + input
			if(cooking >= cooktime)
				return heating_act(A)
			return
	burning(burninput)

/obj/item/natural/clay/heating_act(atom/A)
	var/obj/item/result
	if(istype(A,/obj/machinery/light/rogue/oven))
		if(prob(shatter_chance))
			if(A)
				A.visible_message(span_warning("[src] cracks apart in the heat!"))
			playsound(src, 'sound/foley/glassbreak.ogg', 75, TRUE)
			qdel(src)
			return null
		if(cooked_type)
			result = new cooked_type(A)
			apply_pottery_quality(result, pottery_quality, creator_skill)
		return result
	result = new /obj/item/natural/clay_shard(A) // No cooked_type? Pulverized.
	return result

/obj/item/natural/clay/proc/apply_pottery_quality(obj/item/result, quality_tier, creator_skill_level)
	if(!result)
		return
	
	var/quality_prefix = ""
	var/quality_multiplier = 1.0
	
	switch(quality_tier)
		if(0)
			quality_prefix = "crude "
			quality_multiplier = 0.4
		if(1)
			quality_prefix = "poor "
			quality_multiplier = 0.6
		if(2)
			quality_prefix = ""
			quality_multiplier = 0.8
		if(3)
			quality_prefix = "fine "
			quality_multiplier = 1.1
		if(4)
			quality_prefix = "flawless "
			quality_multiplier = 1.2
		if(5)
			quality_prefix = "masterwork "
			quality_multiplier = 1.5
	
	// Apply quality prefix to name
	if(quality_prefix)
		result.name = quality_prefix + initial(result.name)
	
	// Apply quality multiplier to sell price
	if(result.sellprice)
		result.sellprice = round(result.sellprice * quality_multiplier)
	
	// Add masterwork sparkling effect
	if(quality_tier >= 4)
		result.polished = 4
		if(!result.GetComponent(/datum/component/metal_glint))
			result.AddComponent(/datum/component/metal_glint)
	
	// Store quality info on the result
	result.pottery_quality = quality_tier
	result.creator_skill = creator_skill_level
	result.pottery_fragile = TRUE
	result.pottery_baked_at = world.time

/obj/item/natural/clay/burning(input as num) // Overrides the generic /obj/item/proc/burning in snacks.dm
	if(!input)
		return
	if(burntime)
		burning = burning + input
		if(burning >= burntime && color != burned_color)
			color = burned_color
			name = "burned [name]"
