/obj/item/blueprint
	name = "papyrus"
	icon_state = "scroll"
	slot_flags = null
	dropshrink = 0.6
	firefuel = 30 SECONDS
	gender = NEUTER
	icon = 'icons/roguetown/items/misc.dmi'
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_range = 1
	throw_speed = 1
	resistance_flags = FLAMMABLE
	max_integrity = 100
	drop_sound = 'sound/foley/dropsound/paper_drop.ogg'
	pickup_sound =  'sound/blank.ogg'

/obj/item/blueprint/mace_mushroom
	name = "Lithmyc mace blueprint"
	desc = "A tattered, damp parchment that smells of wet earth and copper."
	color = "#124d00"

/obj/item/blueprint/mace_mushroom/examine(mob/user)
	. = ..()
	. += span_notice("The scroll lists the following requirements: <b>1x Lithmyc Ingot, 1x blueprint, and a Weaponsmithing Anvil.</b>")
	. += span_notice("Originally conceived of by the Drow weaponsmith, Lithmyc is a liquid-solid metal made out of a particular metallic mushroom. This mushroom can be found in the Underdark, but it's only seen some weeks rather than others.")
	. += span_notice("Curiously, the sketches seem to describe a unique type of spore that can 'shed' off Lithmyc weapons. When the air is saturated enough, these spores suddenly release all of their energy in a tremendous, stunning explosion.")

/obj/item/blueprint/sword_berserker
	name = "berserker sword blueprint"
	desc = "A worn, crimson-tinged parchment that smells of dried haggis and soot."
	color = "#880808"

/obj/item/blueprint/sword_berserker/examine(mob/user)
	. = ..()
	. += span_notice("The scroll lists the following requirements: <b>1x Executioner's Sword, 1x Glut, 1x Blueprint, and a Weaponsmithing Anvil.</b>")
	. += span_notice("Sketched next to the listing of 'Glut' is a blood diamond, meticulously filled with metallic dyes to impart a reflective finish. Such a gemstone can be found in only one place: the steaming, spilled entrails of a Gnoll.")
	. += span_notice("Myths say that long ago, an Azurian nobleman commissioned the Town's finest smith to forge a weapon that could 'slay a drake'. The result honored the request, yet no man could wield it - for only the worthiest could wield its weight.")
