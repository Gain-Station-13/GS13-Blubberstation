/mob/living/carbon/human/proc/update_stomp_footsteps()
	var/list/legs = list(get_bodypart(BODY_ZONE_L_LEG), get_bodypart(BODY_ZONE_R_LEG))

	if (HAS_TRAIT(src, TRAIT_STOMP))
		if (!length(stomp_old_types))
			stomp_old_footstep_type = footstep_type
			for (var/obj/item/bodypart/leg/leg as anything in legs)
				if (leg)
					stomp_old_sounds[leg] = leg.special_footstep_sounds?.Copy()
					stomp_old_types[leg] = leg.footstep_type

		var/list/sounds = list(list(
			'modular_gs/sound/effects/footstep/giant1.ogg',
			'modular_gs/sound/effects/footstep/giant2.ogg',
		), 70, 1)

		for (var/obj/item/bodypart/leg/leg as anything in legs)
			if (leg)
				leg.special_footstep_sounds = sounds
		footstep_type = sounds
	else
		for (var/obj/item/bodypart/leg/leg as anything in stomp_old_types)
			if (leg)
				leg.special_footstep_sounds = stomp_old_sounds[leg]
				leg.footstep_type = stomp_old_types[leg]
		stomp_old_sounds = list()
		stomp_old_types = list()
		footstep_type = stomp_old_footstep_type
		stomp_old_footstep_type = null
