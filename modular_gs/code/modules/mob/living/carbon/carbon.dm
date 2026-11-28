/mob/living/carbon/Initialize(mapload)
	. = ..()
	blueberry_inflate_loop = new(src, FALSE)
	air = new /datum/gas_mixture(STOMACH_VOLUME)

/mob/living/carbon/Destroy()
	QDEL_NULL(blueberry_inflate_loop)
	QDEL_NULL(air)
	return ..()

/mob/living/carbon/Life(seconds_per_tick = SSMOBS_DT)
	. = ..()
	handle_inflation()

/mob/living/carbon/return_analyzable_air()
	RETURN_TYPE(/datum/gas_mixture)
	return air

/// how much less blood do you use when a vampire drinks blood from you, given as a multiplier (so for example 0.5 means you only lose half of what the vampire gets)
/mob/living/carbon/proc/get_bloodsuck_reduction()
	/// how much fat you really have, so without any hiders that may increase the virtual weight
	var/realish_fatness = fatness_real + fatness_perma
	return clamp((FATNESS_LEVEL_IMMOBILE - realish_fatness) / FATNESS_LEVEL_IMMOBILE, 0.35, 1)
