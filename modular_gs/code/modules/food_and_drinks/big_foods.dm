//GS13 BIG FOODS
//these usually need specifically a crafting menu recipe, they also have way bigger sprites
//recipes are found in the subfolder

/obj/item/food/cake/hugecookiecream
	name = "GlucoBomb Cookies and Cream Cakeshake"
	desc = "Are you out of your fucking mind? It's good that this doesn't have a nutritional label, otherwise you'd have a stroke reading it."
	icon = 'modular_gs/icons/obj/food/food64x64.dmi'
	icon_state = "hugecakeshake"
	max_volume = 700
	bite_consumption = 7
	pixel_x = -16
	pixel_y = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	food_reagents = list(/datum/reagent/consumable/nutriment = 200, /datum/reagent/consumable/sugar = 100, /datum/reagent/consumable/milk = 50)
	tastes = list("sugar" = 1, "sugar shock" = 1, "syrup" = 1, "slop" = 1, "overwhelming surge of calories" = 10)
	foodtypes = GRAIN | DAIRY | SUGAR
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/burger/hoardburger
	name = "Hoardburger"
	desc = "A monument to greed. There are rumors that some can eat this in one bite."
	icon = 'modular_gs/icons/obj/food/food96x32.dmi'
	icon_state = "hoardburger"
	max_volume = 700
	bite_consumption = 7
//	pixel_x = -16
	pixel_y = -32
	inhand_x_dimension = 128
	inhand_y_dimension = 32
	food_reagents = list(/datum/reagent/consumable/nutriment = 200, /datum/reagent/consumable/nutriment/vitamin = 20)
	tastes = list("meat" = 1, "veggies" = 1, "grease" = 1, "bun" = 1, , "overwhelming surge of calories" = 10)
	foodtypes = GRAIN | DAIRY | MEAT | VEGETABLES
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3


// this has been ported from CHOMP/Virgo, but I've decided to adjust the recipe a bit
// ourgh I need a big pizzuh...

/obj/item/food/pizza/framewrecker
	name = "Framewrecker Pizza"
	desc = "You feel your arteries clogging just by merely looking at this monster. Is this even real, or a mere hallucination?"
	icon = 'modular_gs/icons/obj/food/food64x64.dmi'
	icon_state = "theonepizza"
	pixel_x = -16
	pixel_y = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	food_reagents = list(/datum/reagent/consumable/nutriment = 200, /datum/reagent/consumable/tomatojuice = 10, /datum/reagent/consumable/nutriment/vitamin = 30)
	max_volume = 500
	bite_consumption = 5
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "meat" = 1, "overwhelming surge of calories" = 10)
	foodtypes = MEAT | VEGETABLES | RAW | GRAIN | FRUIT | DAIRY | PINEAPPLE
	boxtag = "The One Pizza"
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = SHEET_MATERIAL_AMOUNT * 5.3)

	var/slice_list = list(/obj/item/food/pizzaslice/framewrecker/mushroom,
							/obj/item/food/pizzaslice/framewrecker/veggie,
							/obj/item/food/pizzaslice/framewrecker/cheese,
							/obj/item/food/pizzaslice/framewrecker/pineapple,
							/obj/item/food/pizzaslice/framewrecker/meat)
	slices_left = 5

//slices
/obj/item/food/pizzaslice/framewrecker
	name = "Framewrecker Pizza Slice"
	desc = "This mere slice is the size of pizza on its own!"
	icon = 'modular_gs/icons/obj/food/ported_meals.dmi'
	food_reagents = list(/datum/reagent/consumable/nutriment = 40, /datum/reagent/consumable/tomatojuice = 1, /datum/reagent/consumable/nutriment/vitamin = 4)
	icon_state = "big_mushroom_slice"

/obj/item/food/pizzaslice/framewrecker/mushroom
	name = "Giant mushroom pizza slice"
	icon_state = "big_mushroom_slice"
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "mushrooms" = 1, "delight" = 5)
	foodtypes = GRAIN | VEGETABLES | DAIRY | JUNKFOOD

/obj/item/food/pizzaslice/framewrecker/veggie
	name = "Giant veggie pizza slice"
	icon_state = "big_veggie_slice"
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "veggies" = 1, "delight" = 5)
	foodtypes = GRAIN | VEGETABLES | DAIRY | JUNKFOOD

/obj/item/food/pizzaslice/framewrecker/pineapple
	name = "Giant pineapple pizza slice"
	icon_state = "big_pineapple_slice"
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "ham" = 1, "pineapple" = 5)
	foodtypes = GRAIN | VEGETABLES | DAIRY | JUNKFOOD | FRUIT

/obj/item/food/pizzaslice/framewrecker/meat
	name = "Giant meat pizza slice"
	icon_state = "big_veggie_slice"
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "meat" = 1, "delight" = 5)
	foodtypes = GRAIN | VEGETABLES | DAIRY | JUNKFOOD | MEAT

/obj/item/food/pizzaslice/framewrecker/cheese
	name = "Giant cheese pizza slice"
	icon_state = "big_cheese_slice"
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "delight" = 5)
	foodtypes = GRAIN | VEGETABLES | DAIRY | JUNKFOOD

/obj/item/food/pizza/framewrecker/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	. = NONE
	if(isnull(slice_type) || !(tool.tool_behaviour in cutting_tools))
		return

	user.visible_message("[user] successfully cuts The One Pizza.", span_notice("You successfully cut The One Pizza."))
	cut_apart()
	return ITEM_INTERACT_SUCCESS

/obj/item/food/pizza/framewrecker/cut_apart()
	for(var/slicetype in slice_list)
		new slicetype(src.loc)
	qdel(src)
