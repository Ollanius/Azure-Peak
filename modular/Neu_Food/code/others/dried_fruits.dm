// -------------- RAISINS -----------------
/obj/item/reagent_containers/food/snacks/rogue/raisins
	name = "raisins"
	desc = "Jackberries that've been pruned of their juiciness, and turned into flavorful nuggets. Like the humble hardtack, so \
	too will these raisins outlast its creators.  When combined with honey and doused in a pot of boiling tallow, it can birth \
	'sweetglass'; a shatteringly sweet candy, popular amongst the elders and children-of-nobility."
	icon = 'icons/roguetown/items/produce.dmi'
	icon_state = "raisins5"
	bitesize = 5
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("dried jackberries" = 1, "shriveled bursts of sweetness" = 1)
	faretype = FARE_POOR
	foodtype = GRAIN
	eat_effect = null
	rotprocess = null
	cooked_smell = /datum/pollutant/food/sweetglass

/obj/item/reagent_containers/food/snacks/rogue/raisins/On_Consume(mob/living/eater)
	..()
	if(bitecount == 1)
		icon_state = "raisins4"
	if(bitecount == 2)
		icon_state = "raisins3"
	if(bitecount == 3)
		icon_state = "raisins2"
	if(bitecount == 4)
		icon_state = "raisins1"

/obj/item/reagent_containers/food/snacks/rogue/raisins/CheckParts(list/parts_list, datum/crafting_recipe/R)
	..()
	for(var/obj/item/reagent_containers/food/snacks/M in parts_list)
		color = M.filling_color
		if(M.reagents)
			M.reagents.remove_reagent(/datum/reagent/consumable/nutriment, M.reagents.total_volume)
			M.reagents.trans_to(src, M.reagents.total_volume)
		qdel(M)

/obj/item/reagent_containers/food/snacks/rogue/raisins/raspberry
	name = "raspberried giblets"
	desc = "Raspberried giblets that've been pruned of their juiciness, and turned into flavorful nuggets that'll last forever. When combined with honey and \
	doused in a pot of boiling tallow, it can birth 'sweetglass'; a shatteringly sweet candy, popular amongst the elders and children-of-nobility."
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("dried raspberries" = 1, "shriveled bursts of tartness" = 1)
	color = "#FF2A00"

/obj/item/reagent_containers/food/snacks/rogue/raisins/strawberry
	name = "strawberried giblets"
	desc = "Strawberried giblets that've been pruned of their juiciness, and turned into flavorful nuggets that'll last forever. When combined with honey and \
	doused in a pot of boiling tallow, it can birth 'sweetglass'; a shatteringly sweet candy, popular amongst the elders and children-of-nobility."
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("dried strawberries" = 1, "shriveled bursts of sweetness" = 1)
	color = "FF2A00"

/obj/item/reagent_containers/food/snacks/rogue/raisins/blackberry
	name = "blackberried giblets"
	desc = "Blackberried giblets that've been pruned of their juiciness, and turned into flavorful nuggets that'll last forever. When combined with honey and \
	doused in a pot of boiling tallow, it can birth 'sweetglass'; a shatteringly sweet candy, popular amongst the elders and children-of-nobility."
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("dried blackberries" = 1, "shriveled bursts of sour-sweetness" = 1)
	color = "339AB7"

/obj/item/reagent_containers/food/snacks/rogue/raisins/plum
	name = "plummic giblets"
	desc = "Plummic giblets that've been pruned of their juiciness, and turned into flavorful nuggets that'll last forever. When combined with honey and \
	doused in a pot of boiling tallow, it can birth 'sweetglass'; a shatteringly sweet candy, popular amongst the elders and children-of-nobility."
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("dried plums" = 1, "shriveled bursts of honeyy-sweetness" = 1)
	color = "#FF4F86"

/obj/item/reagent_containers/food/snacks/rogue/raisins/pear
	name = "peared giblets"
	desc = "Peared giblets that've been pruned of their juiciness, and turned into flavorful nuggets that'll last forever. When combined with honey and \
	doused in a pot of boiling tallow, it can birth 'sweetglass'; a shatteringly sweet candy, popular amongst the elders and children-of-nobility."
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("dried pears" = 1, "shriveled bursts of tarty-honeyiness" = 1)
	color = "#EAB14F"

/obj/item/reagent_containers/food/snacks/rogue/raisins/tangerine
	name = "tangerined giblets"
	desc = "Tangerined giblets that've been pruned of their juiciness, and turned into flavorful nuggets that'll last forever. When combined with honey and \
	doused in a pot of boiling tallow, it can birth 'sweetglass'; a shatteringly sweet candy, popular amongst the elders and children-of-nobility."
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("dried tangerines" = 1, "shriveled bursts of tarty-sweetness" = 1)
	color = "#FF9321"

/obj/item/reagent_containers/food/snacks/rogue/raisins/lemon
	name = "lemony giblets"
	desc = "Lemony giblets that've been pruned of their juiciness, and turned into flavorful nuggets that'll last forever. When combined with honey and \
	doused in a pot of boiling tallow, it can birth 'sweetglass'; a shatteringly sweet candy, popular amongst the elders and children-of-nobility."
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("dried lemons" = 1, "shriveled bursts of tarty-sourness" = 1)
	color = "#FFBD30"

/obj/item/reagent_containers/food/snacks/rogue/raisins/lime
	name = "limey giblets"
	desc = "Limey giblets that've been pruned of their juiciness, and turned into flavorful nuggets that'll last forever. When combined with honey and \
	doused in a pot of boiling tallow, it can birth 'sweetglass'; a shatteringly sweet candy, popular amongst the elders and children-of-nobility."
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("dried limes" = 1, "shriveled bursts of sour-tartiness" = 1)
	color = "#FFBD30"

// -------------- Trail-mix -----------------
/obj/item/reagent_containers/food/snacks/rogue/trailmix
	name = "trail-mix"
	desc = "A collection of dried and long lasting snacks tucked into a neat package to be indulged in as needed. Favorite of rangers due to it's simplicity and availability."
	icon = 'modular/Neu_food/icons/cookware/ration.dmi'
	icon_state = "ration_large"//Prob give it'S own subtype later
	eat_effect = null
	fried_type = null
	bitesize = 7
	slice_batch = FALSE
	faretype = FARE_POOR
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_NUTRITIOUS * 3)
	tastes = list("raisin" = 1, "pumpkin" = 1, "dry paper" = 1)
	rotprocess = null
