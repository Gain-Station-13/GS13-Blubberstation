/datum/antagonist/bloodsucker/proc/gain_weight_from_blood(mob/living/carbon/vampire, seconds_per_tick)
	vampire.adjust_fatness(seconds_per_tick, FATTENING_TYPE_FOOD)
