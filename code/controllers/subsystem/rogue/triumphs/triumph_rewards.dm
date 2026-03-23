////////////////////////
// TRIUMPH-EXCLUSIVE! //
////////////////////////

/obj/item/rogueweapon/sword/long/triumph
	name = "valorian longsword"
	desc = "A lethal and perfectly balanced weapon, the longsword is the protagonist of endless tales and myths \
	all across Psydonia. This particular variant has a stouter crossguard and wider blade; a prevaling design \
	from the preceding century, oft-mantled in the homes of now-retired adventurers."
	icon = 'icons/roguetown/weapons/64.dmi'  //Framework for Triumph-purchasable longswords.
	icon_state = "longsword_triumph"

/obj/item/rogueweapon/sword/long/triumph/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -14,"sy" = -8,"nx" = 15,"ny" = -7,"wx" = -10,"wy" = -5,"ex" = 7,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -13,"sturn" = 110,"wturn" = -60,"eturn" = -30,"nflip" = 1,"sflip" = 1,"wflip" = 8,"eflip" = 1)
			if("onback")
				return list("shrink" = 0.5,"sx" = -1,"sy" = 2,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)
			if("wielded")
				return list("shrink" = 0.5,"sx" = 5,"sy" = -2,"nx" = -6,"ny" = -2,"wx" = -6,"wy" = -2,"ex" = 7,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -28,"sturn" = 29,"wturn" = -35,"eturn" = 32,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.4,"sx" = -4,"sy" = -6,"nx" = 5,"ny" = -6,"wx" = 0,"wy" = -6,"ex" = -1,"ey" = -6,"nturn" = 100,"sturn" = 156,"wturn" = 90,"eturn" = 180,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/sword/long/triumph/rockhill
	desc = "A lethal and perfectly balanced weapon, the longsword is the protagonist of endless tales and myths \
	all across Psydonia. This particular variant has a narrow crossguard and lengthened blade; the proportions \
	of an ancient hero's claymore, resurrected through modern smithing techniques."
	icon_state = "longsword_rockhill"
	sheathe_icon = "gensword"

/obj/item/rogueweapon/sword/long/exe/rockhill //Alternate version of the Executioner Sword.
	name = "valorian claymore"
	icon = 'icons/roguetown/weapons/64.dmi'
	desc = "A lethal and perfectly balanced weapon, the longsword is the protagonist of endless tales and myths \
	all across Psydonia. This sharp-edged variant has a narrow crossguard and lengthened blade; the proportions \
	of an ancient hero's claymore, resurrected through modern smithing techniques."
	icon_state = "longsword_rockhill"

/obj/item/rogueweapon/sword/long/exe/rockhill/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -14,"sy" = -8,"nx" = 15,"ny" = -7,"wx" = -10,"wy" = -5,"ex" = 7,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -13,"sturn" = 110,"wturn" = -60,"eturn" = -30,"nflip" = 1,"sflip" = 1,"wflip" = 8,"eflip" = 1)
			if("onback")
				return list("shrink" = 0.5,"sx" = -1,"sy" = 2,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -2,"nx" = -6,"ny" = -2,"wx" = -6,"wy" = -2,"ex" = 7,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -28,"sturn" = 29,"wturn" = -35,"eturn" = 32,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.4,"sx" = -4,"sy" = -6,"nx" = 5,"ny" = -6,"wx" = 0,"wy" = -6,"ex" = -1,"ey" = -6,"nturn" = 100,"sturn" = 156,"wturn" = 90,"eturn" = 180,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/sword/long/triumph/sabreguard
	desc = "A lethal and perfectly balanced weapon, the longsword is the protagonist of endless tales and myths \
	all across Psydonia. This particular variant has a curved crossguard and stouter blade; hallmarks of nobility, \
	whether professed atop a saiga or against a villain's edge."
	icon_state = "longsword_sabreguard"
	sheathe_icon = "cutlass"

/obj/item/rogueweapon/sword/long/kriegmesser/sabreguard
	name = "valorian greatsabre"
	icon = 'icons/roguetown/weapons/64.dmi'
	desc = "A lethal and perfectly balanced weapon, the longsword is the protagonist of endless tales and myths \
	all across Psydonia. This broad-edged variant has a curved crossguard and stouter blade; hallmarks of nobility, \
	whether professed atop a saiga or against a villain's edge."
	icon_state = "longsword_sabreguard"
	sheathe_icon = "cutlass"

/obj/item/rogueweapon/sword/long/kriegmesser/sabreguard/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -14,"sy" = -8,"nx" = 15,"ny" = -7,"wx" = -10,"wy" = -5,"ex" = 7,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -13,"sturn" = 110,"wturn" = -60,"eturn" = -30,"nflip" = 1,"sflip" = 1,"wflip" = 8,"eflip" = 1)
			if("onback")
				return list("shrink" = 0.5,"sx" = -1,"sy" = 2,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -2,"nx" = -6,"ny" = -2,"wx" = -6,"wy" = -2,"ex" = 7,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -28,"sturn" = 29,"wturn" = -35,"eturn" = 32,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.4,"sx" = -4,"sy" = -6,"nx" = 5,"ny" = -6,"wx" = 0,"wy" = -6,"ex" = -1,"ey" = -6,"nturn" = 100,"sturn" = 156,"wturn" = 90,"eturn" = 180,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/sword/long/triumph/wideguard
	desc = "A lethal and perfectly balanced weapon, the longsword is the protagonist of endless tales and myths \
	all across Psydonia. This particular variant has a widened crossguard, adored by lightly-armored mercenaries \
	who cannot afford to leave a single riposte without interception."
	icon_state = "longsword_wideguard"
	sheathe_icon = "opsysword"

/obj/item/rogueweapon/sword/rapier/wideguard //Alternate variant for the Rapier.
	name = "valorian greatrapier"
	icon = 'icons/roguetown/weapons/64.dmi'
	desc = "A lethal and perfectly balanced weapon, the longsword is the protagonist of endless tales and myths \
	all across Psydonia. This well-honed variant has a widened crossguard, adored by lightly-armored mercenaries \
	who cannot afford to leave a single riposte without interception."
	icon_state = "longsword_wideguard"
	sheathe_icon = "opsysword"

/obj/item/rogueweapon/sword/rapier/wideguard/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -14,"sy" = -8,"nx" = 15,"ny" = -7,"wx" = -10,"wy" = -5,"ex" = 7,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -13,"sturn" = 110,"wturn" = -60,"eturn" = -30,"nflip" = 1,"sflip" = 1,"wflip" = 8,"eflip" = 1)
			if("onback")
				return list("shrink" = 0.5,"sx" = -1,"sy" = 2,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -2,"nx" = -6,"ny" = -2,"wx" = -6,"wy" = -2,"ex" = 7,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -28,"sturn" = 29,"wturn" = -35,"eturn" = 32,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.4,"sx" = -4,"sy" = -6,"nx" = 5,"ny" = -6,"wx" = 0,"wy" = -6,"ex" = -1,"ey" = -6,"nturn" = 100,"sturn" = 156,"wturn" = 90,"eturn" = 180,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/sword/long/triumph/psycrucifix
	desc = "A lethal and perfectly balanced weapon, the longsword is the protagonist of endless tales and myths \
	all across Psydonia. This particular variant has a psycruciformed crossguard; a masterwork, held in silent \
	reverance by those who've vowed to never forget the ultimate sacrifice."
	icon_state = "longsword_psycrucifix"
	sheathe_icon = "opsysword"

/obj/item/rogueweapon/sword/long/psysword/psycrucifix //Alternate variant for the Psydonic Longswords.
	name = "valorian silver longsword"
	icon = 'icons/roguetown/weapons/64.dmi'
	desc = "A lethal and perfectly balanced weapon, the longsword is the protagonist of endless tales and myths \
	all across Psydonia. This silvered variant has a psycruciformed crossguard; a masterwork, held in silent \
	reverance by those who've vowed to never forget the ultimate sacrifice."
	icon_state = "longsword_psycrucifix"
	sheathe_icon = "opsysword"

/obj/item/rogueweapon/sword/long/psysword/psycrucifix/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -14,"sy" = -8,"nx" = 15,"ny" = -7,"wx" = -10,"wy" = -5,"ex" = 7,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -13,"sturn" = 110,"wturn" = -60,"eturn" = -30,"nflip" = 1,"sflip" = 1,"wflip" = 8,"eflip" = 1)
			if("onback")
				return list("shrink" = 0.5,"sx" = -1,"sy" = 2,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -2,"nx" = -6,"ny" = -2,"wx" = -6,"wy" = -2,"ex" = 7,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -28,"sturn" = 29,"wturn" = -35,"eturn" = 32,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.4,"sx" = -4,"sy" = -6,"nx" = 5,"ny" = -6,"wx" = 0,"wy" = -6,"ex" = -1,"ey" = -6,"nturn" = 100,"sturn" = 156,"wturn" = 90,"eturn" = 180,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
/obj/item/rogueweapon/stoneaxe/woodcut/triumph
	name = "valorian axe"
	icon_state = "axelegacy"
	desc = "'Through thick-and-thin, I have never failed you. May we trounce through the Terrorbog, one last time, before Astrata's glare vanishes 'neath the horizon?'"

/obj/item/rogueweapon/stoneaxe/handaxe/triumph
	name = "valorian hatchet"
	icon_state = "hatchetlegacy"
	desc = "'What is that rag for, anyways?'"

/obj/item/rogueweapon/stoneaxe/woodcut/triumphalt
	name = "double-headed axe"
	desc = "'For Karl!'"
	icon_state = "axedouble"
	swingsound = BLADEWOOSH_HUGE

/obj/item/rogueweapon/stoneaxe/woodcut/bronze/triumph
	name = "double-headed bronze axe"
	desc = "'Give them nothing.. but take from them, EVERYTHING!'"
	icon_state = "bronzeaxedouble"
	swingsound = BLADEWOOSH_HUGE

/obj/item/rogueweapon/stoneaxe/woodcut/steel/triumph
	name = "double-headed steel axe"
	desc = "'Last man alive, lock the doors!'"
	icon_state = "saxedouble"
	swingsound = BLADEWOOSH_HUGE

/obj/item/rogueweapon/stoneaxe/battle/triumph
	name = "double-headed battle axe"
	desc = "'Never thought I'd die side-by-side wi' an elve.' </br>'How about with a friend?' </br>'Aye, I coul' do that.'"
	icon_state = "battleaxedouble"
	swingsound = BLADEWOOSH_HUGE

/obj/item/rogueweapon/stoneaxe/woodcut/silver/triumph
	name = "double-headed silver axe"
	desc = "'I'll swallow your soul, I'll swallow your soul!' </br>'Swallow this.'"
	icon_state = "silveraxedouble"
	swingsound = BLADEWOOSH_HUGE

/obj/item/rogueweapon/stoneaxe/battle/psyaxe/triumph
	name = "double-headed psydonic axe"
	desc = "'Hail to the king, baby.'"
	icon_state = "psyaxedouble"
	swingsound = BLADEWOOSH_HUGE
