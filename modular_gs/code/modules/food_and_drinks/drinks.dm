////////////////////////////////////////////////////////////////////////////////
/// GS13 Drinks
////////////////////////////////////////////////////////////////////////////////

/obj/item/reagent_containers/cup/soda_cans/fizzwiz
	name = "Fizz Wiz"
	desc = "Unleash your inner magic!"
	icon = 'modular_gs/icons/obj/drinks.dmi'
	lefthand_file = 'modular_gs/icons/mob/inhands/food_lefthand.dmi'
	righthand_file = 'modular_gs/icons/mob/inhands/food_righthand.dmi'
	icon_state = "fizzwiz"
	list_reagents = list(/datum/reagent/consumable/space_cola = 25, /datum/reagent/consumable/fizulphite = 15)

/obj/item/reagent_containers/cup/soda_cans/soothseltz
	name = "Soothing Seltzer"
	desc = "A useful drink that helps relieve a bloated stomach."
	icon = 'modular_gs/icons/obj/drinks.dmi'
	lefthand_file = 'modular_gs/icons/mob/inhands/food_lefthand.dmi'
	righthand_file = 'modular_gs/icons/mob/inhands/food_righthand.dmi'
	icon_state = "soothseltz"
	list_reagents = list(/datum/reagent/consumable/space_cola = 25, /datum/reagent/consumable/extilphite = 15)

//big soda bottles
/obj/item/reagent_containers/cup/bigbottle
	name = "Bottle"
	desc = "You shouldn't see this."
	icon = 'modular_gs/icons/obj/food/bigbottle.dmi'
	icon_state = "bigbottle_default"
	list_reagents = list(/datum/reagent/consumable/space_cola = 25)
	custom_materials = list(/datum/material/plastic=200)
	volume = 100

/obj/item/reagent_containers/cup/bigbottle/starkist
	name = "StarKist Bottle"
	desc = "A big bottle of Sunkist - for all your chuggin' needs."
	icon_state = "bigbottle_fan"
	list_reagents = list(/datum/reagent/consumable/sodawater = 20, /datum/reagent/consumable/orangejuice = 60)

/obj/item/reagent_containers/cup/bigbottle/cola
	name = "GT-Cola Bottle"
	desc = "A big bottle of GT-Cola - for all your chuggin' needs."
	icon_state = "bigbottle_cola"
	list_reagents = list(/datum/reagent/consumable/space_cola = 80)

/obj/item/reagent_containers/cup/bigbottle/spaceup
	name = "Space-Up! Bottle"
	desc = "A big bottle of Space-Up! - for all your chuggin' needs."
	icon_state = "bigbottle_spr"
	list_reagents = list(/datum/reagent/consumable/space_up = 60, /datum/reagent/consumable/sodawater = 20)

/obj/item/reagent_containers/cup/bigbottle/fizz
	name = "Fizz-Wizz Bottle"
	desc = "A big bottle of Fizz-Wizz - for all your chuggin' needs."
	icon_state = "bigbottle_fizz"
	list_reagents = list(/datum/reagent/consumable/space_cola = 50, /datum/reagent/consumable/fizulphite = 30)


//code for overlays of big bottles
/obj/item/reagent_containers/cup/bigbottle/on_reagent_change()
	cut_overlays()
	var/mutable_appearance/reagent_overlay = mutable_appearance(icon, "reagent")

	if(reagents.reagent_list.len)
		/*if(!renamedByPlayer)
			name = "bottle of " + R.name
			desc = R.glass_desc*/

		var/percent = round((reagents.total_volume / volume) * 100)
		switch(percent)
			if(0)
				reagent_overlay.icon_state = "reagent0"
			if(1 to 19)
				reagent_overlay.icon_state = "reagent20"
			if(20 to 39)
				reagent_overlay.icon_state = "reagent40"
			if(40 to 59)
				reagent_overlay.icon_state = "reagent60"
			if(60 to 79)
				reagent_overlay.icon_state = "reagent80"
			if(80 to 100)
				reagent_overlay.icon_state = "reagent100"
		reagent_overlay.color = mix_color_from_reagents(reagents.reagent_list)
		add_overlay(reagent_overlay)

	else
		reagent_overlay.icon_state = "reagent0"
	add_overlay(reagent_overlay)
