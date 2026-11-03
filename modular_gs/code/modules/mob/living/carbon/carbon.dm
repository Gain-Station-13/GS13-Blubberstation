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
