/datum/quirk/demonic
	name = "Demonic"
	desc = "Your nature is that of a hellish beast."
	medical_record_text = "Subject is not from this realm."
	icon = "fa-skull"
	value = -1
	gain_text = span_notice("You feel a connection to the dark realm forming.")
	lose_text = span_notice("You no longer feel the call of hell.")
	quirk_flags = QUIRK_HIDE_FROM_SCAN
	mob_trait = TRAIT_DEMONIC

/datum/mood_event/demon_in_church
	description = "The holyness of this place is upsetting."
	mood_change = -2

/datum/quirk/demonic/add(client/client_source)
	var/mob/living/carbon/demon = quirk_holder

	demon.apply_status_effect(/datum/status_effect/moodlet_in_area, /datum/mood_event/demon_in_church, list(/area/station/service/chapel))

/datum/quirk/demonic/remove(client/client_source)
	var/mob/living/carbon/demon = quirk_holder

	demon.remove_status_effect(/datum/status_effect/moodlet_in_area, /datum/mood_event/demon_in_church)
