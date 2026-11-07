/obj/item/clothing/head/wizard/marisa/fake/old
	name = "old witch hat"
	desc = "Strange-looking hat-wear. Makes you think of old times."
	worn_icon = 'modular_gs/icons/mob/clothing/head/witch_hats_worn.dmi'
	icon = 'modular_gs/icons/mob/clothing/head/witch_hats.dmi'
	icon_state = "/obj/item/clothing/head/wizard/marisa/fake/old"
	post_init_icon_state = "witch_fake_old"
	greyscale_config = /datum/greyscale_config/witch_hat_old
	greyscale_config_worn = /datum/greyscale_config/witch_hat_old/worn
	greyscale_colors = "#262626#8B6EE1#DBD6D4"
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/clothing/head/wizard/marisa/fake/classic
	name = "classic witch hat"
	desc = "Strange-looking hat-wear. Makes you want to cook potions in a hut."
	worn_icon = 'modular_gs/icons/mob/clothing/head/witch_hats_worn.dmi'
	icon = 'modular_gs/icons/mob/clothing/head/witch_hats.dmi'
	icon_state = "/obj/item/clothing/head/wizard/marisa/fake/classic"
	post_init_icon_state = "witch_fake_classic"
	greyscale_config = /datum/greyscale_config/witch_hat_classic
	greyscale_config_worn = /datum/greyscale_config/witch_hat_classic/worn
	greyscale_colors = "#262626"
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/clothing/head/wizard/marisa/fake/shy
	name = "shy witch hat"
	desc = "Strange-looking hat-wear. Hey! I cant see!"
	worn_icon = 'modular_gs/icons/mob/clothing/head/witch_hats_worn.dmi'
	icon = 'modular_gs/icons/mob/clothing/head/witch_hats.dmi'
	icon_state = "/obj/item/clothing/head/wizard/marisa/fake/shy"
	post_init_icon_state = "witch_fake_shy"
	greyscale_config = /datum/greyscale_config/witch_hat_shy
	greyscale_config_worn = /datum/greyscale_config/witch_hat_shy/worn
	greyscale_colors = "#272734#ff0606"
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/clothing/head/wizard/marisa/fake/scholar
	name = "scholar's witch hat"
	desc = "Strange-looking hat-wear. Makes you want to put your nose into a good book."
	worn_icon = 'modular_gs/icons/mob/clothing/head/witch_hats_worn.dmi'
	icon = 'modular_gs/icons/mob/clothing/head/witch_hats.dmi'
	icon_state = "/obj/item/clothing/head/wizard/marisa/fake/scholar"
	post_init_icon_state = "witch_fake_scholar"
	greyscale_config = /datum/greyscale_config/witch_hat_scholar
	greyscale_config_worn = /datum/greyscale_config/witch_hat_scholar/worn
	greyscale_colors = "#32617c#ffcc33"
	flags_1 = IS_PLAYER_COLORABLE_1

/datum/greyscale_config/witch_hat_old
	name = "Old Witch Hat"
	icon_file = 'modular_gs/icons/mob/clothing/head/witch_hats.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/witch_hat_old.json'

/datum/greyscale_config/witch_hat_old/worn
	name = "Old Witch Hat (Worn)"
	icon_file = 'modular_gs/icons/mob/clothing/head/witch_hats_worn.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/witch_hat_old_worn.json'

/datum/greyscale_config/witch_hat_classic
	name = "Classic Witch Hat"
	icon_file = 'modular_gs/icons/mob/clothing/head/witch_hats.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/witch_hat_classic.json'

/datum/greyscale_config/witch_hat_classic/worn
	name = "Classic Witch Hat (Worn)"
	icon_file = 'modular_gs/icons/mob/clothing/head/witch_hats_worn.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/witch_hat_classic_worn.json'

/datum/greyscale_config/witch_hat_shy
	name = "Shy Witch Hat"
	icon_file = 'modular_gs/icons/mob/clothing/head/witch_hats.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/witch_hat_shy.json'

/datum/greyscale_config/witch_hat_shy/worn
	name = "Shy Witch Hat (Worn)"
	icon_file = 'modular_gs/icons/mob/clothing/head/witch_hats_worn.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/witch_hat_shy_worn.json'

/datum/greyscale_config/witch_hat_scholar
	name = "Scholar's Witch Hat"
	icon_file = 'modular_gs/icons/mob/clothing/head/witch_hats.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/witch_hat_scholar.json'

/datum/greyscale_config/witch_hat_scholar/worn
	name = "Scholar's Witch Hat (Worn)"
	icon_file = 'modular_gs/icons/mob/clothing/head/witch_hats_worn.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/witch_hat_scholar_worn.json'
