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
		belly.update_size_from_weight(get_fatness_to_stage(fatness))
		update_body()
