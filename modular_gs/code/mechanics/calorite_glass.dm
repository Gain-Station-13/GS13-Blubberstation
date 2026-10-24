GLOBAL_LIST_INIT(calorite_glass_recipes, list ( \
	new/datum/stack_recipe("directional window", /obj/structure/window/calorite/unanchored, time = 0.5 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ON_SOLID_GROUND | CRAFT_CHECK_DIRECTION, category = CAT_WINDOWS), \
	new/datum/stack_recipe("fulltile window", /obj/structure/window/calorite/fulltile/unanchored, 2, time =  1 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ON_SOLID_GROUND | CRAFT_IS_FULLTILE, category = CAT_WINDOWS), \
	new/datum/stack_recipe("calorite glass shard", /obj/item/shard/calorite_glass, time = 0, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ON_SOLID_GROUND, category = CAT_MISC), \
	/*new/datum/stack_recipe("calorite glass tile", /obj/item/stack/tile/glass, 1, 4, 20, category = CAT_TILES) */\
))

/obj/item/stack/sheet/calorite_glass/get_main_recipes()
	. = ..()
	. += GLOB.calorite_glass_recipes

/obj/item/stack/sheet/calorite_glass
	name = "calorite glass"
	icon = 'modular_gs/icons/obj/stack_objects.dmi'
	icon_state = "sheet-calorite_glass"
	//inhand_icon_state = "sheet-calorite"
	singular_name = "calorite glass sheet"
	resistance_flags = ACID_PROOF
	armor_type = /datum/armor/sheet_glass
	mats_per_unit = list(/datum/material/calorite = SHEET_MATERIAL_AMOUNT, /datum/material/glass = (SHEET_MATERIAL_AMOUNT / 2))
	merge_type = /obj/item/stack/sheet/calorite_glass
	material_type = /datum/material/alloy/calorite_glass

/obj/item/stack/sheet/calorite_glass/grind_results()
	return list(/datum/reagent/silicon = 20, /datum/reagent/consumable/lipoifier = 2)

/obj/item/stack/sheet/calorite_glass/Initialize(mapload, new_amount, merge, list/mat_override, mat_amt)
	AddComponent(\
		/datum/component/fattening,\
		1,\
		FATTENING_TYPE_ITEM\
		)
	. = ..()

/obj/item/stack/sheet/calorite_glass/five
	amount = 5

/obj/item/stack/sheet/calorite_glass/ten
	amount = 10

/obj/item/stack/sheet/calorite_glass/fifty
	amount = 50

/datum/material/alloy/calorite_glass
	name = "calorite glass"
	desc = "Calorite infused silicate. It is much weaker than regular glass due to calorite's softness."
	color = "#ff7200"
	alpha = 150
	starlight_color = COLOR_TAN_ORANGE
	init_flags = MATERIAL_INIT_MAPLOAD
	// integrity_modifier = 0.15
	// armor_modifiers = list(MELEE = 0.25, BULLET = 0.25, LASER = 1.1, ENERGY = 1.1, BOMB = 0.1, BIO = 1.2, FIRE = 2, ACID = 2)
	sheet_type = /obj/item/stack/sheet/calorite_glass
	shard_type = /obj/item/shard/calorite_glass
	// debris_type = /obj/effect/decal/cleanable/glass/calorite_glass
	value_per_unit = 0.1
	mat_properties = list(
		MATERIAL_DENSITY = 6,
		MATERIAL_HARDNESS = 3,
		MATERIAL_FLEXIBILITY = 6,
		MATERIAL_REFLECTIVITY = 4,
		MATERIAL_ELECTRICAL = 4,
		MATERIAL_THERMAL = 5,
		MATERIAL_CHEMICAL = 5,
	)
	// categories = list(
	// 	MAT_CATEGORY_RIGID=TRUE,
	// 	// MAT_CATEGORY_BASE_RECIPES = TRUE,
	// 	MAT_CATEGORY_ITEM_MATERIAL = TRUE,
	// 	MAT_CATEGORY_ITEM_MATERIAL_COMPLEMENTARY = TRUE,
	// )
	composition = list(/datum/material/glass = 0.5, /datum/material/calorite = 1)
	// fish_weight_modifier = 1.2
	// fishing_difficulty_modifier = 5
	// fishing_experience_multiplier = 1.3
	// fishing_gravity_mult = 0.9

/datum/material/alloy/calorite_glass/on_applied(atom/source, amount, multiplier, from_slot)
	. = ..()

	if (isobj(source))
		var/obj/source_obj = source
		source_obj.damtype = FAT

/datum/material/alloy/calorite_glass/on_removed(atom/source, multiplier, from_slot)
	if (isobj(source))
		var/obj/source_obj = source
		source_obj.damtype = initial(source_obj.damtype)
	return ..()

/obj/item/shard/calorite_glass
	name = "orange shard"
	desc = "A nasty looking shard of calorite glass."
	force = 4
	throwforce = 9
	icon = 'modular_gs/icons/obj/debris.dmi'
	icon_state = "calorite_large"
	icon_prefix = "calorite_"
	inhand_icon_state = "shard_calorite"
	lefthand_file = 'modular_gs/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_gs/icons/mob/inhands/melee_righthand.dmi'
	// inhand_icon_state = "shard-calorite"
	custom_materials = list(/datum/material/calorite = SHEET_MATERIAL_AMOUNT, /datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT)
	// icon_prefix = "calorite"
	weld_material = /obj/item/stack/sheet/calorite_glass
	shiv_type = null
	craft_time = 1.5 SECONDS
	damtype = FAT

/obj/item/shard/calorite_glass/Initialize(mapload)
	AddComponent(\
		/datum/component/fattening,\
		1,\
		FATTENING_TYPE_ITEM,\
		bumped = FALSE\
		)
	. = ..()

/datum/design/calorite_glass
	name = "Calorite Glass"
	build_type = AUTOLATHE | SMELTER | PROTOLATHE | AWAY_LATHE
	materials = list(
		/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/calorite = SHEET_MATERIAL_AMOUNT,
		)
	build_path = /obj/item/stack/sheet/calorite_glass
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS,
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SCIENCE
