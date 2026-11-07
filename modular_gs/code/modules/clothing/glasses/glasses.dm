// Transparent glasses from iris/oculis station and recolorable regular version

/obj/item/clothing/glasses/regular/color
	worn_icon = 'modular_gs/icons/mob/clothing/glasses/glasses_worn.dmi'
	icon = 'modular_gs/icons/mob/clothing/glasses/glasses.dmi'
	icon_state = "/obj/item/clothing/glasses/regular/color"
	post_init_icon_state = "glasses_regular_color"
	greyscale_config = /datum/greyscale_config/glasses_regular_color
	greyscale_config_worn = /datum/greyscale_config/glasses_regular_color/worn
	greyscale_colors = "#0d0d0d#FFFFFF"
	flags_1 = IS_PLAYER_COLORABLE_1

// transparent variety of three prescription glasses
/obj/item/clothing/glasses/regular/transparent
	worn_icon = 'modular_gs/icons/mob/clothing/glasses/glasses_worn.dmi'
	icon = 'modular_gs/icons/mob/clothing/glasses/glasses.dmi'
	icon_state = "/obj/item/clothing/glasses/regular/transparent"
	post_init_icon_state = "glasses_transparent_regular_color"
	greyscale_config = /datum/greyscale_config/glasses_transparent_regular_color
	greyscale_config_worn = /datum/greyscale_config/glasses_transparent_regular_color/worn
	greyscale_colors = "#0d0d0d#9CCBFB"
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/clothing/glasses/regular/circle/transparent
	worn_icon = 'modular_gs/icons/mob/clothing/glasses/glasses_worn.dmi'
	icon = 'modular_gs/icons/mob/clothing/glasses/glasses.dmi'
	icon_state = "/obj/item/clothing/glasses/regular/circle/transparent"
	post_init_icon_state = "glasses_transparent_circle_color"
	greyscale_config = /datum/greyscale_config/glasses_transparent_circle_color
	greyscale_config_worn = /datum/greyscale_config/glasses_transparent_circle_color/worn
	greyscale_colors = "#0d0d0d#9CCBFB"
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/clothing/glasses/regular/thin/transparent
	worn_icon = 'modular_gs/icons/mob/clothing/glasses/glasses_worn.dmi'
	icon = 'modular_gs/icons/mob/clothing/glasses/glasses.dmi'
	icon_state = "/obj/item/clothing/glasses/regular/thin/transparent"
	post_init_icon_state = "glasses_transparent_thin_color"
	greyscale_config = /datum/greyscale_config/glasses_transparent_thin_color
	greyscale_config_worn = /datum/greyscale_config/glasses_transparent_thin_color/worn
	greyscale_colors = "#0d0d0d#9CCBFB"
	flags_1 = IS_PLAYER_COLORABLE_1

/datum/greyscale_config/glasses_regular_color
	name = "Glasses"
	icon_file = 'modular_gs/icons/mob/clothing/glasses/glasses.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/glasses_regular_color.json'

/datum/greyscale_config/glasses_regular_color/worn
	name = "Glasses (Worn)"
	icon_file = 'modular_gs/icons/mob/clothing/glasses/glasses_worn.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/glasses_regular_color_worn.json'

/datum/greyscale_config/glasses_transparent_regular_color
	name = "Glasses"
	icon_file = 'modular_gs/icons/mob/clothing/glasses/glasses.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/glasses_transparent_regular_color.json'

/datum/greyscale_config/glasses_transparent_regular_color/worn
	name = "Glasses (Worn)"
	icon_file = 'modular_gs/icons/mob/clothing/glasses/glasses_worn.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/glasses_transparent_regular_color_worn.json'


/datum/greyscale_config/glasses_transparent_thin_color
	name = "Thin Glasses"
	icon_file = 'modular_gs/icons/mob/clothing/glasses/glasses.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/glasses_transparent_thin_color.json'

/datum/greyscale_config/glasses_transparent_thin_color/worn
	name = "Thin Glasses (Worn)"
	icon_file = 'modular_gs/icons/mob/clothing/glasses/glasses_worn.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/glasses_transparent_thin_color_worn.json'

/datum/greyscale_config/glasses_transparent_circle_color
	name = "Circle Glasses"
	icon_file = 'modular_gs/icons/mob/clothing/glasses/glasses.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/glasses_transparent_circle_color.json'

/datum/greyscale_config/glasses_transparent_circle_color/worn
	name = "Circle Glasses (Worn)"
	icon_file = 'modular_gs/icons/mob/clothing/glasses/glasses_worn.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/glasses_transparent_circle_color_worn.json'
