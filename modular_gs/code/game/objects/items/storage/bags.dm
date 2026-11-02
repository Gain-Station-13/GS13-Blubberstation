/obj/item/storage/bag/tray/bluespace
	name = "bluespace serving tray"
	icon = 'modular_gs/icons/obj/food/containers.dmi'
	icon_state = "bluetray"
	worn_icon = 'modular_gs/icons/mob/clothing/belt.dmi'
	worn_icon_state = "bluetray"
	desc = "A metal tray to lay food on."
	force = 5
	throwforce = 10
	throw_speed = 3
	throw_range = 5
	obj_flags = CONDUCTS_ELECTRICITY
	slot_flags = ITEM_SLOT_BELT
	custom_materials = list(/datum/material/gold = SHEET_MATERIAL_AMOUNT * 0.75, /datum/material/plasma = SHEET_MATERIAL_AMOUNT * 0.75, /datum/material/uranium = SMALL_MATERIAL_AMOUNT * 2.5)
	custom_price = PAYCHECK_CREW * 0.6
	storage_type = /datum/storage/bag/tray/bluespace
	sound_vary = TRUE
	pickup_sound = SFX_TRAY_PICKUP
	drop_sound = SFX_TRAY_DROP
