/obj/item/hand_item/kisser/inflation
	name = "puff kiss"
	desc = "I want you all to know, everyone and anyone, to seal it with a kiss."	// idfk what to put here
	/// The kind of projectile this version of the kiss blower fires
	kiss_type = /obj/projectile/kiss/inflation

/obj/projectile/kiss/inflation
	name = "puff kiss"

/obj/projectile/kiss/inflation/harmless_on_hit(mob/living/living_target)
	. = ..()
	if (!iscarbon(living_target))
		return
	
	var/mob/living/carbon/target = living_target

	if (!target.client?.prefs?.read_preference(/datum/preference/toggle/inflation))
		return

	var/datum/gas_mixture/gas_mix = SSair.parse_gas_string(OPENTURF_DEFAULT_ATMOS)
	var/moles_to_take = ONE_ATMOSPHERE * STOMACH_VOLUME / (R_IDEAL_GAS_EQUATION * gas_mix.return_temperature())
	target.air.merge(gas_mix.remove(moles_to_take))
