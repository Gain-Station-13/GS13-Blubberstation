/obj/machinery/smartfridge/hotbar
	name = "hotbar"
	desc = "A table with heated, neatly layed out dishes in fancy glass containers. Fancy!"
	icon = 'modular_gs/icons/obj/machines/hotbar.dmi'
	icon_state = "hotbar-icon"
	base_icon_state = "hotbar"
	contents_overlay_icon = "food"
	base_build_path = /obj/machinery/smartfridge/hotbar
	has_emissive = FALSE
	can_atmos_pass = ATMOS_PASS_YES

/obj/machinery/smartfridge/hotbar/accept_check(obj/item/weapon)
	var/static/list/plant_stuffs = list(
		/obj/item/food/grown,
		/obj/item/seeds,
		/obj/item/grown,
		/obj/item/graft,
	)

	if(weapon.w_class >= WEIGHT_CLASS_BULKY)
		return FALSE
	if(IS_EDIBLE(weapon))
		return TRUE
	if(istype(weapon, /obj/item/reagent_containers/cup/bowl) && weapon.reagents?.total_volume > 0)
		return TRUE

	return is_type_in_list(weapon, plant_stuffs)
