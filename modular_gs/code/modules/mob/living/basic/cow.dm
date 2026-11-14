/mob/living/basic/cow/wisdom
	// if false, won't give wisdoms
	var/give_wisdoms = TRUE

/mob/living/basic/cow/wisdom/wisest
	name = "Vernn"
	desc = "The wisest of the wisdom cows, proudly kept by the Research Director as an appreciation of it's vast knowledge"
	gold_core_spawnable = FALSE
	give_wisdoms = FALSE

/mob/living/basic/cow/wisdom/wisest/Initialize(mapload, granted_wisdom, granted_experience = 500, milked_reagent = null)
	. = ..()
	ai_controller.override_blackboard_key(BB_BASIC_MOB_SPEAK_LINES, list(
		BB_EMOTE_SAY = GLOB.wisestdoms,
		BB_SPEAK_CHANCE = 8,	// it's meant to be a pet, let's not have it be KOS by the RD
	))
