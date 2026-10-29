/obj/item/clothing/suit/replica_parade_jacket
	name = "replica parade jacket"
	desc = "Ever see command staff in a fancy parade jacket and think to yourself, \"I want that\" without having to steal it? Here's your chance. Made from the finest synthleather and synthwool, it cost far more than most people care to admit they paid."
	icon = 'modular_gs/modules/GAGS/icons/suit/suit.dmi'
	icon_state = "r_parade_jacket"
	greyscale_config = /datum/greyscale_config/replica_parade_jacket
	greyscale_config_worn = /datum/greyscale_config/replica_parade_jacket/worn
	greyscale_colors = "#b0c5ff#434343"
	flags_1 = IS_PLAYER_COLORABLE_1
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/suit/replica_parade_jacket/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/toggle_icon)
