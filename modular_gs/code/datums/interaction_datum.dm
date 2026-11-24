/datum/interaction/breast_feed_self
	name = "Breast feed"
	description = "Feed yourself using your breasts!"
	user_messages = list(
		"You lift your breasts to your mouth and begin sucking...",
		"You gently bite on your nipples and begin sucking..."
		)
	message = list("lifts their breasts into their mouth and begins sucking...")
	category = "Sex"
	usage = INTERACTION_ONLY_SELF
	lewd = TRUE	// truth nuke
	user_required_parts = list(ORGAN_SLOT_BREASTS)
	user_pleasure = 1
	user_arousal = 2
	interaction_requires = list(INTERACTION_REQUIRE_SELF_HAND)
	color = "pink"
	// sexuality =

/datum/interaction/breast_feed_self/act(mob/living/carbon/human/user, mob/living/carbon/human/target, obj/body_relay)
	. = ..()
	var/obj/item/organ/genital/breasts/breasts = user.get_organ_slot(ORGAN_SLOT_BREASTS)
	if (!breasts.lactates)
		to_chat(user, span_warning("Your breasts do not produce anything!"))
		return

	if (!breasts.reagents.total_volume)
		to_chat(user, "There isn't any produce left in your breasts!")
		return

	breasts.reagents.trans_to(user, 5, transferred_by = user, methods = INGEST)
	to_chat(user, "You begin sucking on your own breasts, feeling their produce hit your tongue...")

/datum/interaction/breast_feed_other
	name = "Breast feed them"
	description = "Feed someone else using your breasts!"
	user_messages = list("You lift your breasts to %TARGET% 's mouth and start squeezing...")
	target_messages = list("%USER% brings their breasts to your mouth and starts squeezing...")
	message = list("lifts their breasts into %TARGET% 's mouth and starts squeezing...")
	category = "Sex"
	usage = INTERACTION_OTHER
	lewd = TRUE
	user_required_parts = list(ORGAN_SLOT_BREASTS)
	target_required_parts
	user_pleasure = 1	// values straight out of my ass
	user_arousal = 2
	target_pleasure = 2
	target_arousal = 2
	interaction_requires = list(INTERACTION_REQUIRE_SELF_HAND)
	color = "pink"
	// sexuality =

/datum/interaction/breast_feed_other/act(mob/living/carbon/human/user, mob/living/carbon/human/target, obj/body_relay)
	. = ..()
	var/obj/item/organ/genital/breasts/breasts = user.get_organ_slot(ORGAN_SLOT_BREASTS)
	if (!breasts.lactates)
		to_chat(user, span_warning("Your breasts do not produce anything!"))
		return

	if (!breasts.reagents.total_volume)
		to_chat(user, "There isn't any produce left in your breasts!")
		return

	breasts.reagents.trans_to(target, 5, transferred_by = user, methods = INGEST)
	to_chat(user, "You begin squeezing on your own breasts, and can feel your produce flowing out...")
	to_chat(target, "[user] puts their breasts against your mouth, and you can taste warm produce flowing out...")

/datum/interaction/breast_feed_from_other
	name = "Breast feed from them"
	description = "Wrap your mouth around those milkers and begin sucking!"
	user_messages = list("You grab onto %TARGET% breasts and begin sucking...")
	target_messages = list("%USER% brings your breasts into their mouth and begins sucking...")
	message = list("lifts %TARGET% breasts into their mouth and begins sucking...")
	category = "Sex"
	usage = INTERACTION_OTHER
	lewd = TRUE
	target_required_parts = list(ORGAN_SLOT_BREASTS)
	user_pleasure = 1
	user_arousal = 2
	interaction_requires = list(INTERACTION_REQUIRE_SELF_HAND)
	color = "pink"
	// sexuality =

/datum/interaction/breast_feed_from_other/act(mob/living/carbon/human/user, mob/living/carbon/human/target, obj/body_relay)
	. = ..()
	var/obj/item/organ/genital/breasts/breasts = target.get_organ_slot(ORGAN_SLOT_BREASTS)
	if (!breasts.lactates)
		to_chat(user, span_warning("Their breasts do not produce anything!"))
		return

	if (!breasts.reagents.total_volume)
		to_chat(user, "There isn't any produce left in their breasts!")
		return

	breasts.reagents.trans_to(user, 5, transferred_by = target, methods = INGEST)
	to_chat(user, "You begin sucking on [target]'s breasts, feeling their produce hit your tongue...")
	to_chat(target, "[user] puts their mouth against your breasts, and you can feel your produce flowing out...")

/datum/interaction/belly_rub_self
	name = "Belly rub (Self)"
	description = "Rub your own belly."
	user_messages = list(
		"You rub your belly softly.",
		"You gently rub your belly."
		)
	message = list("rubs their belly.")
	category = "Romance"
	usage = INTERACTION_ONLY_SELF
	lewd = FALSE	// truth obliteration
	interaction_requires = list(INTERACTION_REQUIRE_SELF_HAND)
	color = "green"

/datum/interaction/belly_rub_self/act(mob/living/carbon/human/user, mob/living/carbon/human/target, obj/body_relay)
	. = ..()
	target.reduce_fullness(20)

/datum/interaction/belly_rub_other
	name = "Belly rub"
	description = "Rub their belly."
	user_messages = list("You gently rub %TARGET% 's belly.")
	target_messages = list("%USER% puts their arms onto your belly and starts rubbing it.")
	message = list("rubs %TARGET% 's belly.")
	category = "Romance"
	usage = INTERACTION_OTHER
	lewd = FALSE
	target_required_parts
	interaction_requires = list(INTERACTION_REQUIRE_SELF_HAND)
	color = "green"

/datum/interaction/belly_rub_other/act(mob/living/carbon/human/user, mob/living/carbon/human/target, obj/body_relay)
	. = ..()
	target.reduce_fullness(20)

/datum/interaction/belly_rub_from_other
	name = "Belly rub"
	description = "Rub their belly."
	user_messages = list("You grab onto %TARGET% belly and rub it softly.")
	target_messages = list("%USER% gently rubs your belly.")
	message = list("rubs %TARGET%'s belly.")
	category = "Romance"
	usage = INTERACTION_OTHER
	lewd = FALSE
	interaction_requires = list(INTERACTION_REQUIRE_SELF_HAND)
	color = "green"

/datum/interaction/belly_rub_from_other/act(mob/living/carbon/human/user, mob/living/carbon/human/target, obj/body_relay)
	. = ..()
	target.reduce_fullness(20)
