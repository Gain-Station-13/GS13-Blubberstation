/datum/design/tray/bluespace
	name = "Bluespace Serving Tray"
	id = "bluservingtray"
	build_type = AUTOLATHE | PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/gold = SHEET_MATERIAL_AMOUNT * 0.75, /datum/material/plasma = SHEET_MATERIAL_AMOUNT * 0.75, /datum/material/uranium = SMALL_MATERIAL_AMOUNT * 2.5)
	build_path = /obj/item/storage/bag/tray/bluespace
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_KITCHEN,
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE
