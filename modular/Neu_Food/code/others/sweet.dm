// -------------- CHOCOLATE -----------------
/obj/item/reagent_containers/food/snacks/chocolate
	name = "chocolate ingot"
	desc = "An unbelievably decadant slab of fudge, made with Amazonia's cocoa beans and Grenzelhoft's saiga milk. A \
	recent trade agreement between the two nations has turned this once-expensive delicacy into a slightly-less-expensive \
	treat for many. </br>Following a rather unfortunate diplomatic incident involving a Lupian nobleman and a box of chocolates, \
	chocolate is also now-known to double as a potent 'humor rebalancer' for some of Dendor's children."
	icon = 'modular/Neu_Food/icons/others/sweet.dmi'
	icon_state = "chocolate"
	bitesize = 4
	slices_num = 2
	slice_path = /obj/item/reagent_containers/food/snacks/chocolate/slice
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("rich sweetness" = 1)
	faretype = FARE_LAVISH
	rotprocess = null
	eat_effect = /datum/status_effect/buff/snackbuff
	chopping_sound = TRUE

/obj/item/reagent_containers/food/snacks/chocolate/On_Consume(mob/living/eater)
	if(islupian(eater) || isvulp(eater))
		to_chat(eater, span_warning("The chocolate tastes delicious but my stomach churns violently!"))
		if(iscarbon(eater))
			var/mob/living/carbon/C = eater
			C.add_nausea(120) // enough to trigger vomiting
		eater.adjustToxLoss(5)
	return ..()

/obj/item/reagent_containers/food/snacks/chocolate/slice
	name = "halved chocolate ingot"
	desc = "An unbelievably decadant piece of fudge, made with Amazonia's cocoa beans and Grenzelhoft's saiga milk. A \
	recent trade agreement between the two nations has turned this once-expensive delicacy into a slightly-less-expensive \
	treat for many. </br>Following a rather unfortunate diplomatic incident involving a Lupian nobleman and a box of chocolates, \
	chocolate is also now-known to double as a potent 'humor rebalancer' for some of Dendor's children."
	bitesize = 3 //Sharing is caring!
	icon_state = "chocolatehalf"
