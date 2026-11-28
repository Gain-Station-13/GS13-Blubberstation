// /obj/item/reagent_containers/food
// 	var/blessed = 0

// /obj/item/food/gbburrito
// 	name = "\improper GATO Gas Giant Burrito"
// 	icon = 'modular_gs/icons/obj/food/food.dmi'
// 	icon_state = "gbburrito"
// 	desc = "More than three pounds of beans, meat, and cheese wrapped in a greasy tortilla. It's piping hot."
// 	trash = null
// 	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/flatulose = 4, /datum/reagent/consumable/sodiumchloride = 0.5)
// 	filling_color = "#74291b"
// 	tastes = list("refried beans","grease" = 1)
// 	foodtype = MEAT

// //these have been ported from CHOMPstation / Virgo
// /obj/item/food/doner_kebab
// 	name = "doner kebab"
// 	icon = 'modular_gs/icons/obj/food/ported_meals.dmi'
// 	desc = "A delicious sandwich-like food from ancient Earth. The meat is typically cooked on a vertical rotisserie."
// 	icon_state = "doner_kebab"
// 	trash = null
// 	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
// 	filling_color = "#93684d"
// 	tastes = list("thinly sliced meat","meat" = 1)
// 	foodtype = GRAIN | VEGETABLES | MEAT | JUNKFOOD

// /obj/item/food/lasagna
// 	name = "lasagna"
// 	desc = "Meaty, tomato-y, and ready to eat-y. Favorite of cats."
// 	icon = 'modular_gs/icons/obj/food/ported_meals.dmi'
// 	icon_state = "lasagna"
// 	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
// 	filling_color = "#872020"
// 	tastes = list("italian cuisine" = 1)
// 	foodtype = GRAIN | VEGETABLES | MEAT

// /obj/item/food/corndog
// 	name = "corn dog"
// 	desc = "A cornbread covered sausage deepfried in oil."
// 	icon = 'modular_gs/icons/obj/food/ported_meals.dmi'
// 	icon_state = "corndog"
// 	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
// 	filling_color = "#df9745"
// 	tastes = list("corn batter", "sausage" = 1)
// 	foodtype = GRAIN | MEAT | JUNKFOOD

// /obj/item/food/turkey
// 	name = "turkey"
// 	desc = "Tastes like chicken. It can be sliced!"
// 	icon = 'modular_gs/icons/obj/food/ported_meals.dmi'
// 	icon_state = "turkey"
// 	slice_path = /obj/item/food/turkey_leg
// 	slices_num = 4
// 	list_reagents = list(/datum/reagent/consumable/nutriment = 15)
// 	filling_color = "#d4864b"
// 	tastes = list("turkey" = 1)
// 	foodtype = MEAT

// /obj/item/food/turkey_leg
// 	name = "turkey leg"
// 	desc = "Tastes like chicken."
// 	icon = 'modular_gs/icons/obj/food/ported_meals.dmi'
// 	icon_state = "turkey_slice"
// 	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
// 	filling_color = "#ae6941"
// 	tastes = list("turkey" = 1)
// 	foodtype = MEAT

// /obj/item/food/brownies
// 	name = "brownies"
// 	desc = "Halfway to fudge, or halfway to cake? Who cares!"
// 	icon = 'modular_gs/icons/obj/food/ported_meals.dmi'
// 	icon_state = "brownies"
// 	slice_path = /obj/item/food/brownies_slice
// 	slices_num = 6
// 	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
// 	filling_color = "#392f27"
// 	tastes = list("chocolate" = 1)
// 	foodtype = GRAIN | SUGAR | DAIRY

// /obj/item/food/brownies_slice
// 	name = "brownie"
// 	desc = "a dense, decadent chocolate brownie."
// 	icon = 'modular_gs/icons/obj/food/ported_meals.dmi'
// 	icon_state = "browniesslice"
// 	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
// 	filling_color = "#392f27"
// 	tastes = list("chocolate" = 1)
// 	foodtype = GRAIN | SUGAR | DAIRY

// /obj/item/food/brownies_cosmic
// 	name = "cosmic brownies"
// 	desc = "The power of cosmos likes within your hand."
// 	icon = 'modular_gs/icons/obj/food/ported_meals.dmi'
// 	icon_state = "cosmicbrownies"
// 	slice_path = /obj/item/food/brownies_slice_cosmic
// 	slices_num = 6
// 	list_reagents = list(/datum/reagent/consumable/nutriment = 25, /datum/reagent/medicine/omnizine = 5)
// 	filling_color = "#392f27"
// 	tastes = list("chocolate" = 1)
// 	foodtype = GRAIN | SUGAR | DAIRY

// /obj/item/food/brownies_slice_cosmic
// 	name = "cosmic brownie"
// 	desc = "a dense, decadent and fun-looking chocolate brownie."
// 	icon = 'modular_gs/icons/obj/food/ported_meals.dmi'
// 	icon_state = "cosmicbrownieslice"
// 	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/medicine/omnizine = 1)
// 	filling_color = "#392f27"
// 	tastes = list("chocolate" = 1)
// 	foodtype = GRAIN | SUGAR | DAIRY

// /obj/item/food/cinammonbun
// 	name = "cinammon bun"
// 	desc = "Careful not to have it stolen."
// 	icon = 'modular_gs/icons/obj/food/ported_meals.dmi'
// 	icon_state = "cinammonbun"
// 	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
// 	filling_color = "#e9e6e3"
// 	tastes = list("eggs", "breakfast" = 1)
// 	foodtype = GRAIN | SUGAR

/obj/item/food/burger/greaseburger
	name = "greaseburger"
	desc = "Better hope you've got extra-wide veins."
	icon = 'modular_gs/icons/obj/food/burgerbread.dmi'
	icon_state = "greaseburger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 25,
		/datum/reagent/consumable/nutriment/protein = 20,
		/datum/reagent/consumable/nutriment/fat/oil/corn = 5,
		/datum/reagent/consumable/nutriment/fat/oil = 5,
		/datum/reagent/consumable/nutriment/fat = 5,
	)
	w_class = WEIGHT_CLASS_NORMAL
	bite_consumption = 7
	max_volume = 100
	tastes = list("clogged arteries" = 4, "type twenty diabetes" = 10)
	foodtypes = GRAIN | MEAT | DAIRY
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_5
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT * 2)
