/datum/quirk/fat_aversion
	name = "Fat aversion"
	desc = "You dislike fat people. You are more bothered when fat, and having fat people around you will make you annoyed!"
	medical_record_text = "Patient seems to dislike themselves and others being at higher weights."
	icon = "fa-face-frown"
	value = -2
	// gain_text = span_notice("You feel like making someone your pet.")
	// lose_text = span_notice("You feel less assertive than before")
	quirk_flags = QUIRK_HIDE_FROM_SCAN | QUIRK_PROCESSES
	erp_quirk = FALSE // Disables on ERP config.
	mob_trait = TRAIT_FAT_BAD

/datum/mood_event/fat_aversion/self
	description = span_bolddanger("I'm so fat!")
	mood_change = -3
	timeout = 3 MINUTES

/datum/mood_event/fat_aversion/fat_other
	description = span_red("These people are so fat...")
	mood_change = -2
	timeout = 3 MINUTES

/datum/quirk/fat_aversion/process(seconds_per_tick)
	if(quirk_holder.stat == DEAD)
		return
	if(!TIMER_COOLDOWN_FINISHED(quirk_holder, FAT_AVERSION_COOLDOWN)) // 15 second Early return
		return
	if(!quirk_holder)
		return

	var/mob/living/carbon/fatty_holder = quirk_holder

	if (iscarbon(quirk_holder) && fatty_holder.fatness >= FATNESS_LEVEL_FATTER)
		fatty_holder.add_mood_event(TRAIT_FAT_BAD_SELF, /datum/mood_event/fat_aversion/self)

	// handles calculating nearby people
	var/list/mob/living/carbon/fat_freaks = viewers(world.view / 2, fatty_holder)

	for(var/mob/living/carbon/fat_freak in fat_freaks)
		if(fat_freak != fatty_holder) // ignore our player
			if(fat_freak.fatness > FATNESS_LEVEL_FATTER)
				fatty_holder.add_mood_event(TRAIT_FAT_BAD, /datum/mood_event/fat_aversion/fat_other)
				break

	TIMER_COOLDOWN_START(quirk_holder, FAT_AVERSION_COOLDOWN, 15 SECONDS)
