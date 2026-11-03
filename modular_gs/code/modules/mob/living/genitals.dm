/obj/item/organ/genital/butt/set_size(size)
	genital_size = max(size, set_genital_size)
	genital_size = min(genital_size, max_genital_size, BUTT_MAX_SIZE)
	update_sprite_suffix()

/obj/item/organ/genital/butt/build_from_dna(datum/dna/DNA, associated_key)
	set_genital_size = DNA.features["butt_size"]
	max_genital_size = DNA.features["max_butt_size"]

	return ..()

/obj/item/organ/genital/belly/update_size_from_weight(size_change)
	if (owner.inflation_stage > size_change)
		// setup_bodypart_overlay(/datum/sprite_accessory/genital/belly/round)
		simple_change_sprite(/datum/sprite_accessory/genital/belly/round)
		genital_type = /datum/sprite_accessory/genital/belly/round::icon_state
	else
		// setup_bodypart_overlay(/datum/sprite_accessory/genital/belly/normal_gs)
		simple_change_sprite(/datum/sprite_accessory/genital/belly/normal_gs)
		genital_type = /datum/sprite_accessory/genital/belly/normal_gs::icon_state
	var/desired_size = set_genital_size + size_change + owner.inflation_stage
	if (max_genital_size > 0 && desired_size >= max_genital_size)
		set_size(max_genital_size)
	else
		set_size(desired_size)

/obj/item/organ/genital/belly/set_size(size)
	var/old_size = genital_size
	if(size > old_size)
		to_chat(owner, span_warning("Your guts [pick("swell up to", "gurgle into", "expand into", "plump up into", "grow eagerly into", "fatten up into", "distend into")] a larger midsection."))
	else if (size < old_size)
		to_chat(owner, span_warning("Your guts [pick("shrink down to", "decrease into", "wobble down into", "diminish into", "deflate into", "contracts into")] a smaller midsection."))

	genital_size = max(size, set_genital_size)
	genital_size = min(genital_size, max_genital_size, BELLY_MAX_SIZE)
	update_sprite_suffix()

/obj/item/organ/genital/belly/build_from_dna(datum/dna/DNA, associated_key)
	set_genital_size = DNA.features["belly_size"]
	max_genital_size = DNA.features["max_belly_size"]

	return ..()

// The Tig Bitties.
/obj/item/organ/genital/breasts/set_size(size)
	genital_size = max(size, set_genital_size)
	genital_size = min(genital_size, max_genital_size, MAX_BREASTS_SIZE)
	var/breasts_capacity = 1
	switch(genital_type)
		if("pair")
			breasts_capacity = 2
		if("quad")
			breasts_capacity = 2.5
		if("sextuple")
			breasts_capacity = 3
	internal_fluid_maximum = genital_size * breasts_capacity * 60
	if(internal_fluid_maximum > 3500)
		internal_fluid_maximum = 3500
	reagents.maximum_volume = internal_fluid_maximum
	var/volume_to_remove = max(0, reagents.total_volume - reagents.maximum_volume)
	reagents.remove_reagent(internal_fluid_datum, volume_to_remove)
	update_sprite_suffix()

/obj/item/organ/genital/breasts/on_life(seconds_per_tick, times_fired)
	. = ..()
	if(!lactates)
		return

	var/mob/living/carbon/human/affected_human = owner
	if(owner.stat >= DEAD || !owner.client?.prefs?.read_preference(/datum/preference/toggle/erp) || !istype(affected_human))
		return

	if(reagents.total_volume >= reagents.maximum_volume)
		return

	var/regen = reagents.maximum_volume * 0.05 * seconds_per_tick
	var/free_space = reagents.maximum_volume - reagents.total_volume
	if(regen > free_space)
		regen = free_space // so we aren't draining nutrition for milk that isn't actually being generated
	reagents.add_reagent(internal_fluid_datum, regen)

/datum/sprite_accessory/genital/breasts/alt_GS13/pair
	name = "Pair (Alt GS13)"
	icon = 'modular_gs/icons/obj/genitals/breasts_onmob.dmi'
	icon_state = "pair_gs"
	max_size = 18

/datum/sprite_accessory/genital/breasts/alt_GS13/pair_smooth //smoother variant, no nipples
	name = "Pair (Alt GS13, No Nipples)"
	icon = 'modular_gs/icons/obj/genitals/breasts_smooth_onmob.dmi'
	icon_state = "pair_gs_smooth"
	max_size = 18

/datum/sprite_accessory/genital/breasts/alt_GS13/teshari // Teshari only (duh)
	name = "Pair (Teshari)"
	icon = 'modular_gs/icons/obj/genitals/teshbreasts.dmi'
	icon_state = "pair_tesh"
	max_size = 15
