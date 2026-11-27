/obj/item/organ/genital/anus/get_sprite_size_string()
	. = "[genital_type]_[floor(genital_size)]"
	if(uses_skintones)
		. += "_s"

/obj/item/organ/genital/anus/set_size(size)
	var/old_size = genital_size
	. = ..()
	if(size > old_size)
		to_chat(owner, span_warning("Your guts [pick("swell up to", "gurgle into", "expand into", "plump up into", "grow eagerly into", "fatten up into", "distend into")] a larger midsection."))
	else
		to_chat(owner, span_warning("Your guts [pick("shrink down to", "decrease into", "wobble down into", "diminish into", "deflate into", "contracts into")] a smaller midsection."))

/obj/item/organ/genital/anus/build_from_dna(datum/dna/DNA, associated_key)
	uses_skin_color = DNA.features["anus_uses_skincolor"]
	set_size(DNA.features["anus_size"])
	return ..()

/obj/item/organ/genital/anus/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	if(DNA.features["anus_uses_skintones"])
		uses_skintones = accessory.has_skintone_shading
	return ..()

/datum/bodypart_overlay/mutant/genital/anus
	feature_key = ORGAN_SLOT_ANUS
	layers = list(EXTERNAL_ADJACENT = BODY_ADJ_LAYER, EXTERNAL_FRONT = ANUS_LAYER_FRONT)
	layer_offset = ANUS_LAYER_OFFSET
	offset_location = ENTIRE_BODY
