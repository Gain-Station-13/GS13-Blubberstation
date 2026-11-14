/datum/preference/toggle/inflation
	category = BLUEBERRY_PREFERENCES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "inflation"
	default_value = FALSE

/datum/preference/toggle/inflation/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return

/datum/preference/toggle/inflation_size_scaling
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_identifier = PREFERENCE_PLAYER
	savefile_key = "inflation_size_scaling"
	default_value = FALSE

/datum/preference/numeric/helplessness/inflation_bursting
	category = BURSTING_PREFERENCES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "inflation_bursting"

/datum/preference/numeric/helplessness/inflation_bursting/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return
