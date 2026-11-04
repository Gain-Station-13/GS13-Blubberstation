/mob/living/carbon/proc/handle_inflation()
	if (!client?.prefs?.read_preference(/datum/preference/toggle/inflation))
		return

	var/datum/gas_mixture/environment = loc.return_air()

	// outside is more pressurized than inside, let's not crunch us
	if (environment.return_pressure() >= air.return_pressure())
		return
	
	var/pressure_difference = air.return_pressure() - environment.return_pressure()
	var/new_inflation_stage = round(pressure_difference / ONE_ATMOSPHERE, 1)
	if (inflation_stage == new_inflation_stage)
		return

	inflation_stage = new_inflation_stage

	var/obj/item/organ/genital/belly/belly = get_organ_slot(ORGAN_SLOT_BELLY)

	if(belly)
		var/fatness_stage = get_fatness_to_stage(fatness)
		belly.update_size_from_weight(fatness_stage)
		update_body()
		if (belly.set_genital_size + fatness_stage + inflation_stage > belly.max_genital_size)
			inflation_resize()

/mob/living/carbon/proc/inflation_resize()
	var/datum/component/temporary_size/existing_size_component = GetComponent(/datum/component/temporary_size)
	if (!ishuman(src))
		return FALSE

	if(isnull(existing_size_component) && !QDELETED(src))
		AddComponent(/datum/component/temporary_size/xwg/inflation)

	return TRUE

// I have no clue if this will work well
/datum/component/temporary_size/xwg/inflation/Initialize(size_to_apply)
	. = ..()
	if (. == COMPONENT_INCOMPATIBLE)
		return .

	UnregisterSignal(parent, COMSIG_WEIGHT_ADJUSTED)
