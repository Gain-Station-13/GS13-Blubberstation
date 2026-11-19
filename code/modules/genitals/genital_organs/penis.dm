/obj/item/organ/genital/penis
	name = "penis"
	icon_state = "penis"
	var/inflation_stage = 0
	var/max_inflation_stage = 3

/obj/item/organ/genital/penis/proc/update_inflation_sprite(stage)
	inflation_stage = stage
	if(inflation_stage > 0)
		icon_state = "penis_inflated_[inflation_stage]"
	else
		icon_state = "penis"
	
	if(owner)
		owner.update_body()

/obj/item/organ/genital/penis/on_life(delta_time, times_fired)
	..()
	// Logic to sync with the mob's overall inflation level
	if(owner && owner.inflation_level)
		var/new_stage = 0
		switch(owner.inflation_level)
			if(1 to 30)
				new_stage = 1
			if(31 to 60)
				new_stage = 2
			if(61 to 100)
				new_stage = 3
		
		if(new_stage != inflation_stage)
			update_inflation_sprite(new_stage)
