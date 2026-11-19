/*
    Inflation System Integration for SFX
    Handles the playback of sounds based on inflation delta.
*/

/mob/living/proc/handle_inflation_audio(old_level, new_level)
	if(new_level > old_level)
		// Inflating
		if(new_level > 70)
			// High pressure creaking
			if(prob(20)) // Don't spam every tick
				playsound(src, 'sound/effects/inflation/creak.ogg', 40, TRUE, -1)
		else
			// Standard air intake
			if(prob(15))
				playsound(src, 'sound/effects/inflation/inflate.ogg', 50, TRUE, -1)
	
	else if(new_level < old_level)
		// Deflating
		if(prob(20))
			playsound(src, 'sound/effects/inflation/deflate.ogg', 45, TRUE, -1)

// Hook into the existing inflation level setter
/mob/living/var/inflation_level = 0

/mob/living/proc/set_inflation_level(amount)
	var/old_level = inflation_level
	inflation_level = clamp(amount, 0, 200)
	
	if(old_level != inflation_level)
		handle_inflation_audio(old_level, inflation_level)
		update_genital_sprites()

/mob/living/proc/update_genital_sprites()
	for(var/obj/item/organ/genital/G in organs)
		if(istype(G, /obj/item/organ/genital/penis))
			var/obj/item/organ/genital/penis/P = G
			P.update_inflation_sprite(get_inflation_stage())

/mob/living/proc/get_inflation_stage()
	switch(inflation_level)
		if(0 to 10)
			return 0
		if(11 to 40)
			return 1
		if(41 to 75)
			return 2
		else
			return 3
