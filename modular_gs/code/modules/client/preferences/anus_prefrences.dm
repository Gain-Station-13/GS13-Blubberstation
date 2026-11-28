/datum/preference/numeric/anus_size
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "anus_size"
	relevant_mutant_bodypart = ORGAN_SLOT_ANUS
	minimum = ANUS_MIN_SIZE
	maximum = ANUS_MAX_SIZE

/datum/preference/numeric/anus_size/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	var/erp_allowed = preferences.read_preference(/datum/preference/toggle/master_erp_preferences) && preferences.read_preference(/datum/preference/toggle/allow_genitals)
	var/part_enabled = is_factual_sprite_accessory(relevant_mutant_bodypart, preferences.read_preference(/datum/preference/choiced/genital/anus))
	return erp_allowed && part_enabled && (passed_initial_check || allowed)

/datum/preference/numeric/anus_size/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	target.dna.features["anus_size"] = value


/datum/preference/toggle/genital_skin_tone/anus
	savefile_key = "anus_skin_tone"
	relevant_mutant_bodypart = ORGAN_SLOT_ANUS
	genital_pref_type = /datum/preference/choiced/genital/anus

/datum/preference/toggle/genital_skin_tone/anus/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	target.dna.features["anus_uses_skintones"] = value

/datum/preference/toggle/genital_skin_color/anus
	savefile_key = "anus_skin_color"
	relevant_mutant_bodypart = ORGAN_SLOT_ANUS
	genital_pref_type = /datum/preference/choiced/genital/anus

/datum/preference/toggle/genital_skin_color/anus/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	if(!..()) // Don't apply it if it failed the check in the parent.
		value = FALSE

	target.dna.features["anus_uses_skincolor"] = value


/datum/preference/tri_color/genital/anus
	savefile_key = "anus_color"
	relevant_mutant_bodypart = ORGAN_SLOT_ANUS
	type_to_check = /datum/preference/choiced/genital/anus
	skin_color_type = /datum/preference/toggle/genital_skin_color/anus

/datum/preference/tri_bool/genital/anus
	savefile_key = "anus_emissive"
	relevant_mutant_bodypart = ORGAN_SLOT_ANUS
	type_to_check = /datum/preference/choiced/genital/anus
	skin_color_type = /datum/preference/toggle/genital_skin_color/anus

/datum/preference/numeric/max_anus_size
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "max_anus_size"
	relevant_mutant_bodypart = ORGAN_SLOT_ANUS
	minimum = ANUS_MIN_SIZE
	maximum = ANUS_MAX_SIZE

/datum/preference/numeric/max_anus_size/create_default_value()
	return ANUS_MAX_SIZE

/datum/preference/numeric/max_anus_size/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	var/erp_allowed = preferences.read_preference(/datum/preference/toggle/master_erp_preferences) && preferences.read_preference(/datum/preference/toggle/allow_genitals)
	var/part_enabled = is_factual_sprite_accessory(relevant_mutant_bodypart, preferences.read_preference(/datum/preference/choiced/genital/anus))
	return erp_allowed && part_enabled && (passed_initial_check || allowed)

/datum/preference/numeric/max_anus_size/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	target.dna.features["max_anus_size"] = value
	var/obj/item/organ/genital/anus/anus = target.get_organ_slot(ORGAN_SLOT_ANUS)
	if(!isnull(anus))
		anus.max_genital_size = value
