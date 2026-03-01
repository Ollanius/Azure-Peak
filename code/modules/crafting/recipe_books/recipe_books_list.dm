// Deleted the flavorful desc from Vanderlin until I can think of a better desc. 
/obj/item/recipe_book/leatherworking
	name = "The Tanned Hide Tome: Mastery of Leather and Craft"
	icon_state = "book8_0"
	base_icon_state = "book8"

	types = list(
	/datum/crafting_recipe/roguetown/tallow,
	/datum/crafting_recipe/roguetown/leather, 		
	)

/obj/item/recipe_book/sewing
	name = "Threads of Destiny: A Tailor's Codex"
	icon_state = "book7_0"
	base_icon_state = "book7"

	types = list(
		/datum/crafting_recipe/roguetown/survival/cloth, // Screw it just in case
		/datum/crafting_recipe/roguetown/sewing,
		)

/obj/item/recipe_book/blacksmithing
	name = "The Smith’s Legacy"
	icon_state = "book3_0"
	base_icon_state = "book3"

	types = list(/datum/anvil_recipe)

/obj/item/recipe_book/engineering
	name = "The Artificer's Handbook"
	icon_state = "book4_0"
	base_icon_state = "book4"

	types = list(/datum/crafting_recipe/roguetown/engineering)

// I gave up I will make better names later lol
// Was gonna do a carpenter + masonry handbook but 
// Both are under structures so I will just make them one and add categories
// Later 
/obj/item/recipe_book/builder
	name = "The Builder's Handbook - For Carpenters and Masons"
	icon_state = "book5_0"
	base_icon_state = "book5"

	types = list(
		/datum/crafting_recipe/roguetown/structure,
		/datum/crafting_recipe/roguetown/turfs,

		/datum/crafting_recipe/roguetown/turfs/brick,
		/datum/crafting_recipe/roguetown/turfs/brick/floor,
		/datum/crafting_recipe/roguetown/turfs/brick/wall,
		/datum/crafting_recipe/roguetown/turfs/brick/window,

		/datum/crafting_recipe/roguetown/turfs/fancywindow,		
		/datum/crafting_recipe/roguetown/turfs/fancywindow/openclose,

		/datum/crafting_recipe/roguetown/turfs/hay,

		/datum/crafting_recipe/roguetown/turfs/reinforcedwindow,
		/datum/crafting_recipe/roguetown/turfs/reinforcedwindow/openclose,
		/datum/crafting_recipe/roguetown/turfs/roguewindow,
		/datum/crafting_recipe/roguetown/turfs/roguewindow/dynamic,
		/datum/crafting_recipe/roguetown/turfs/roguewindow/stone,

		/datum/crafting_recipe/roguetown/turfs/stone,
		/datum/crafting_recipe/roguetown/turfs/stone/cobblerock,
		/datum/crafting_recipe/roguetown/turfs/stone/cobble,
		/datum/crafting_recipe/roguetown/turfs/stone/block,
		/datum/crafting_recipe/roguetown/turfs/stone/newstone,
		/datum/crafting_recipe/roguetown/turfs/stone/herringbone,
		/datum/crafting_recipe/roguetown/turfs/stone/hexstone,
		/datum/crafting_recipe/roguetown/turfs/stone/platform,
		/datum/crafting_recipe/roguetown/turfs/stone/wall,
		/datum/crafting_recipe/roguetown/turfs/stone/brick,
		/datum/crafting_recipe/roguetown/turfs/stone/decorated,
		/datum/crafting_recipe/roguetown/turfs/stone/craft,
		/datum/crafting_recipe/roguetown/turfs/stone/window,

		/datum/crafting_recipe/roguetown/turfs/tentwall,
		/datum/crafting_recipe/roguetown/turfs/tentdoor,
		/datum/crafting_recipe/roguetown/turfs/twigplatform,
		/datum/crafting_recipe/roguetown/turfs/twig,

		/datum/crafting_recipe/roguetown/turfs/wood,
		/datum/crafting_recipe/roguetown/turfs/wood/floor,
		/datum/crafting_recipe/roguetown/turfs/wood/platform,
		/datum/crafting_recipe/roguetown/turfs/wood/wall,
		/datum/crafting_recipe/roguetown/turfs/wood/wall/alt,
		/datum/crafting_recipe/roguetown/turfs/wood/fancy,
		/datum/crafting_recipe/roguetown/turfs/wood/murderhole,
		/datum/crafting_recipe/roguetown/turfs/wood/murderhole/alt
		)

/obj/item/recipe_book/ceramics
	name = "The Potter's Handbook"
	icon_state = "book5_0"
	base_icon_state = "book5"

	types = list(
		/datum/crafting_recipe/roguetown/structure/ceramicswheel,
		/datum/crafting_recipe/roguetown/ceramics
		)

// This book should be widely given to everyone
/obj/item/recipe_book/survival
	name = "Tips, Tricks, & Triumphs: The Novice's Handbook To Azuria"
	desc = "A heftsome tome, filled to the brim with all the information you'd need to survive within Azuria. The golden bookmark seems to always lead you \
	to the page you needed the most, no matter how you flip it. </br>Activate the tome in your hand to open a searchable glossary, filled with most crafting \
	recipes. </br>Click the 'Mechanics' tab to reveal a wide variety of tips and tricks, for getting started."
	icon_state = "starterguide_0"
	base_icon_state = "starterguide"

	types = list(
		/datum/crafting_recipe/roguetown/survival,
		/datum/crafting_recipe/roguetown/tallow,
		)

/obj/item/recipe_book/survival/get_mechanics_examine(mob/user)
	. = ..()
	. += span_info("Examining things will display a small blurb in the chatbox. IF present, clicking the blurb's 'Mechanics' tab or '(?)' button will reveal more detailed information about the thing-in-question.")
	. += span_info("If you're ever trumped, try asking a question through the 'Mentorhelp' verb in the 'Admin' tab, located in your screen's top-right corner. Alternatively, try asking in the Discord's #mentor-talk channel.")
	. += span_info("Adventurers, Pilgrims, and other newcomers usually spawn to the south of Town. Following the cobblestone road - and any signs of civilization - will eventually lead you there.")
	. += span_info("Most spawn locations have 'far travel' points, which allows your character to leave the round for whatever reason. Click-drag yourself, or a comatose friend, onto the yellow tile to leave.")
	. += span_info("Virtues and statpacks can be selected in the character creation menu, in order to further flesh out your character's mechanical capabilities. Try taking the 'Resident' virtue, if you ever feel overwhelmed.")
	. += span_info("Pressing 'C', by default, toggles COMBAT MODE. This allows your character to PARRY and DODGE incoming attacks, while greatly improving their capacity to fight back.")
	. += span_info("Pressing 'X', by default, allows you to RESIST. This is used for many circumstances; putting out fires, wriggling out of man-eating foliage, removing shackles, and so on.")

// TBD - Cauldron Recipes
/obj/item/recipe_book/alchemy
	name = "Secrets of Alchemy"
	icon_state = "book3_0"
	base_icon_state = "book3"

	types = list(
		/datum/crafting_recipe/roguetown/structure/alch,
		/datum/crafting_recipe/roguetown/structure/cauldronalchemy,
		/datum/crafting_recipe/roguetown/alchemy,
		/datum/alch_grind_recipe,
		/datum/alch_cauldron_recipe
		)
 
/obj/item/recipe_book/cooking
	name = "The Culinary Codex"
	desc = "A book full of recipes and tips for cooking. This version looks very incomplete, and only contain brewing recipes. Perhaps it will be filled in later?"
	icon_state = "book2_0"
	base_icon_state = "book2"

	types = list(
		/datum/brewing_recipe,
		/datum/book_entry/brewing
	)

/obj/item/recipe_book/magic
	name = "The Magister's Grimoire"
	icon_state = "book4_0"
	base_icon_state = "book4"

	types = list(
		/datum/book_entry/magic1,
		/datum/book_entry/magic2,
		/datum/crafting_recipe/roguetown/arcana,
		/datum/crafting_recipe/gemstaff,
		/datum/runeritual,
		)
