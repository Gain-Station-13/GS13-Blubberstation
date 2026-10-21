/datum/action/innate/wg_toggle
	name = "Weight Gain toggle"
	desc = "Click to toggle the master weight gain pref on and off. (Certain quirks will force this to always be on.)"
	// Use the button location for the vore button (modular_zubbers/code/datums/components/vore/vore.dm) but move it up a few pixels :3
	default_button_position = "EAST-4:-10,SOUTH:23"

	background_icon = 'modular_zubbers/icons/mob/actions/vore.dmi'
	background_icon_state = "bg"
	button_icon = 'modular_gs/icons/mob/actions/ui.dmi' // Sprite by @pavvoulagem999-afk
	button_icon_state = "weight"

// Need to do this so that the icon properly shows up as active when spawning in
/datum/action/innate/wg_toggle/Grant(mob/grant_to)
	build_all_button_icons(UPDATE_BUTTON_BACKGROUND)
	return ..()


// Mostly copied from the bubber vore button
/datum/action/innate/wg_toggle/apply_button_background(atom/movable/screen/movable/action_button/current_button, force = FALSE)
	background_icon_state = is_action_active(current_button) ? "bg_active" : "bg"
	if(current_button.active_underlay_icon_state == background_icon_state && !force)
		return

	current_button.underlays.Cut()
	current_button.underlays += image(icon = background_icon, icon_state = background_icon_state)
	current_button.active_underlay_icon_state = background_icon_state

/// Returns the prefs datum of the owner. If none are found, return FALSE
/datum/action/innate/wg_toggle/proc/get_prefs()
	var/datum/preferences/prefs = owner?.client?.prefs
	if(!istype(prefs))
		return FALSE

	return prefs

/datum/action/innate/wg_toggle/is_action_active(atom/movable/screen/movable/action_button/current_button)
	var/datum/preferences/prefs = get_prefs()
	if(!prefs)
		return FALSE

	var/master_toggle_on = prefs.read_preference(/datum/preference/toggle/master_wg_pref)
	if(HAS_TRAIT(owner, TRAIT_UNIVERSAL_GAINER))
		master_toggle_on = TRUE // master weight gain is always on with a quirk like this.


	return master_toggle_on

/datum/action/innate/wg_toggle/Trigger(mob/clicker, trigger_flags)
	. = ..()
	var/datum/preferences/prefs = get_prefs()
	if(!. || !prefs)
		return

	if(HAS_TRAIT(owner, TRAIT_UNIVERSAL_GAINER))
		to_chat(owner, span_warning("You are unable to disable WG due to one of your quirks or something else."))
		build_all_button_icons(UPDATE_BUTTON_BACKGROUND) // Just incase the background isn't already toggled.
		return ..()

	var/datum/preference/toggle/master_wg_pref/master_wg_pref = GLOB.preference_entries[/datum/preference/toggle/master_wg_pref]
	var/new_pref_value = !(prefs.read_preference(/datum/preference/toggle/master_wg_pref))
	prefs.write_preference(master_wg_pref, new_pref_value)

	to_chat(owner, span_notice("Weight Gain is now [new_pref_value ? "enabled" : "disabled"]"))
	build_all_button_icons(UPDATE_BUTTON_BACKGROUND)
	return ..()


