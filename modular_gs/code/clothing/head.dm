//most of those are probably recolors, but this is just generally GATO / GS13 stuff
/*
/obj/item/clothing/head/helmet/space/hardsuit/ert/alert/gato
	name = "GATO Hardsuit Helmet"
	desc = "Exclusive version of a hardsuit helmet, usually reserved for GATO CC personnel."
	icon = 'modular_gs/icons/mob/head.dmi'
	icon_state = "hardsuit0-gato"
	mutantrace_variation = NONE

/obj/item/clothing/head/HoS/beret/gato
	name = "GT-CC Beret"
	desc = "A robust beret for the CC personnel, for looking stylish while not sacrificing protection."
	icon = 'modular_gs/icons/mob/head.dmi'
	icon_state = "gato_beret"
	mutantrace_variation = NONE

/obj/item/clothing/head/HoS/gato
	name = "GT-CC Cap"
	desc = "The robust standard-issue cap of the CC personnel."
	icon = 'modular_gs/icons/mob/head.dmi'
	icon_state = "gato_cap"
	mutantrace_variation = NONE

/obj/item/clothing/head/beret/sec/bitch
	name = "security's bitch beret"
	desc = "A softer beret with the word 'BITCH' embroidered on it in pink thread."
	mob_overlay_icon = 'modular_gs/icons/mob/head.dmi'
	icon_state = "bitchberet"
	mutantrace_variation = NONE
*/
/obj/item/clothing/head/lipomancers_hat
	name = "Lipomancer Witch Hat"
	desc = "A large brimmed blue witch hat that used to belong to some ancient lipomancer, who knows if it is genuine or a reproduction, makes you look like a fancy magic caster either way!"
	icon = 'modular_gs/icons/obj/clothing/head/hat.dmi'
	worn_icon = 'modular_gs/icons/mob/clothing/head/hat.dmi'
	icon_state = "lipomancer_hat"

/obj/item/clothing/head/wizard/marisa/fake/old
	name = "old witch hat"
	desc = "Strange-looking hat-wear. Makes you think of old times."
	worn_icon = 'modular_gs/icons/mob/clothing/head/witch_hats_worn.dmi'
	icon = 'icons/map_icons/clothing/head/_head.dmi'
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
	icon = 'icons/map_icons/clothing/head/_head.dmi'
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
	icon = 'icons/map_icons/clothing/head/_head.dmi'
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
	icon = 'icons/map_icons/clothing/head/_head.dmi'
	icon_state = "/obj/item/clothing/head/wizard/marisa/fake/scholar"
	post_init_icon_state = "witch_fake_scholar"
	greyscale_config = /datum/greyscale_config/witch_hat_scholar
	greyscale_config_worn = /datum/greyscale_config/witch_hat_scholar/worn
	greyscale_colors = "#32617c#ffcc33"
	flags_1 = IS_PLAYER_COLORABLE_1

/datum/greyscale_config/witch_hat_old
	name = "Old Witch Hat"
	icon_file = 'modular_gs/icons/obj/clothing/head/witch_hats.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/witch_hat_old.json'

/datum/greyscale_config/witch_hat_old/worn
	name = "Old Witch Hat (Worn)"
	icon_file = 'modular_gs/icons/mob/clothing/head/witch_hats_worn.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/witch_hat_old_worn.json'

/datum/greyscale_config/witch_hat_classic
	name = "Classic Witch Hat"
	icon_file = 'modular_gs/icons/obj/clothing/head/witch_hats.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/witch_hat_classic.json'

/datum/greyscale_config/witch_hat_classic/worn
	name = "Classic Witch Hat (Worn)"
	icon_file = 'modular_gs/icons/mob/clothing/head/witch_hats_worn.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/witch_hat_classic_worn.json'

/datum/greyscale_config/witch_hat_shy
	name = "Shy Witch Hat"
	icon_file = 'modular_gs/icons/obj/clothing/head/witch_hats.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/witch_hat_shy.json'

/datum/greyscale_config/witch_hat_shy/worn
	name = "Shy Witch Hat (Worn)"
	icon_file = 'modular_gs/icons/mob/clothing/head/witch_hats_worn.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/witch_hat_shy_worn.json'

/datum/greyscale_config/witch_hat_scholar
	name = "Scholar's Witch Hat"
	icon_file = 'modular_gs/icons/obj/clothing/head/witch_hats.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/witch_hat_scholar.json'

/datum/greyscale_config/witch_hat_scholar/worn
	name = "Scholar's Witch Hat (Worn)"
	icon_file = 'modular_gs/icons/mob/clothing/head/witch_hats_worn.dmi'
	json_config = 'modular_gs/code/datums/greyscale/json_configs/witch_hat_scholar_worn.json'

/obj/item/clothing/head/wizard/marisa
	hair_mask = /datum/hair_mask/standard_hat_middle // Stops witch hats from clipping as bad with hair

/obj/item/clothing/head/costume/strigihat
	hair_mask = /datum/hair_mask/standard_hat_middle // Stops witch hats from clipping as bad with hair
