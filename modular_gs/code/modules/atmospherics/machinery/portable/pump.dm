/obj/machinery/portable_atmospherics/inflation_pump
	name = "compressor pump"
	desc = "Pump with a cable attached to it. Used to inflate mattresses and... other things."
	icon = 'modular_gs/icons/obj/atmos.dmi'
	icon_state = "compressor"
	density = TRUE
	max_integrity = 250
	volume = 100
	///Is the machine on?
	var/on = FALSE
	///What direction is the machine pumping (into pump/port or out to the tank/area)?
	var/direction = PUMP_OUT
	///Player configurable, sets what's the release pressure
	var/target_pressure = ONE_ATMOSPHERE

	var/datum/inflation_pump_attachment/attachment

/obj/machinery/portable_atmospherics/inflation_pump/Destroy()
	. = ..()
	QDEL_NULL(attachment)

/obj/machinery/portable_atmospherics/inflation_pump/on_deconstruction(disassembled)
	var/turf/local_turf = get_turf(src)
	local_turf.assume_air(air_contents)
	return ..()

/obj/machinery/portable_atmospherics/inflation_pump/update_icon_state()
	icon_state = "[initial(icon_state)]_[on]"
	return ..()

/obj/machinery/portable_atmospherics/inflation_pump/update_overlays()
	. = ..()
	if(holding)
		. += "[icon_state]-open"
	if(connected_port)
		. += "[icon_state]-connector"

/obj/machinery/portable_atmospherics/inflation_pump/process_atmos(seconds_per_tick)
	if(take_atmos_damage())
		excited = TRUE
		return ..()

	if(!on)
		return ..()

	if (isnull(attachment))
		return ..()

	excited = TRUE

	var/mob/living/carbon/inflatee = attachment.attached_to
	var/datum/gas_mixture/sending
	var/datum/gas_mixture/receiving

	if (holding) //Work with tank when inserted, otherwise - with area
		sending = (direction == PUMP_IN ? holding.return_air() : air_contents)
		receiving = (direction == PUMP_IN ? air_contents : holding.return_air())
	else
		sending = (direction == PUMP_IN ? inflatee.air : air_contents)
		receiving = (direction == PUMP_IN ? air_contents : inflatee.air)

	if (receiving.return_pressure() > target_pressure)
		return

	// let's say we want 500 KPa max per tick
	var/pressure_to_move = min(500 * seconds_per_tick, target_pressure - receiving.return_pressure())
	var/moles_to_remove = pressure_to_move * STOMACH_VOLUME / (R_IDEAL_GAS_EQUATION * sending.return_temperature())
	var/datum/gas_mixture/removed = sending.remove(moles_to_remove)

	if(!removed?.total_moles())
		return

	receiving.merge(removed)
	// sending.pump_gas_to(receiving, target_pressure)

	return ..()

/obj/machinery/portable_atmospherics/inflation_pump/process(seconds_per_tick)
	if(!attachment)
		return PROCESS_KILL

	var/mob/living/carbon/attached_mob = attachment.attached_to

	if(!(get_dist(src, attached_mob) <= 1 && isturf(attached_mob.loc)))
		to_chat(attached_mob, span_notice("The tube detaches from you."))
		detach_pump()
		return PROCESS_KILL

/obj/machinery/portable_atmospherics/inflation_pump/mouse_drop_dragged(atom/over, mob/user, src_location, over_location, params)
	if(!isliving(user) || !iscarbon(over))
		to_chat(user, span_warning("You can't do that!"))
		return

	var/mob/living/carbon/inflatee = over
	if(inflatee.is_mouth_covered())
		inflatee.balloon_alert(user, "mouth is covered!")
		return

	if(attachment)
		visible_message(span_warning("[attachment.attached_to] is detached from [src]."))
		QDEL_NULL(attachment)
		update_appearance(UPDATE_ICON)

	attach_pump(inflatee, user)

/obj/machinery/portable_atmospherics/inflation_pump/proc/attach_pump(mob/living/carbon/target, mob/user)
	user.visible_message(span_warning("[usr] begins attaching [src] to [target]..."), span_warning("You begin attaching [src] to [target]."))
	if(!do_after(usr, 1 SECONDS, target))
		return

	usr.visible_message(span_warning("[usr] attaches [src] to [target]."), span_notice("You attach [src] to [target]."))
	// var/datum/reagents/container = get_reagents()
	// log_combat(usr, target, "attached", src, "containing: ([container.get_reagent_log_string()])")
	add_fingerprint(usr)
	// target.throw_alert(ALERT_IV_CONNECTED, alert_type)

	qdel(attachment)
	attachment = new(src, target)

	SSair.start_processing_machine(src)
	START_PROCESSING(SSmachines, src)
	update_appearance(UPDATE_ICON)

	// SEND_SIGNAL(src, COMSIG_IV_ATTACH, target)

/obj/machinery/portable_atmospherics/inflation_pump/proc/detach_pump()
	if(attachment)
		visible_message(span_notice("[attachment.attached_to] is detached from [src]."))
	QDEL_NULL(attachment)
	STOP_PROCESSING(SSmachines, src)

/obj/machinery/portable_atmospherics/inflation_pump/attack_hand_secondary(mob/user, list/modifiers)
	..()
	detach_pump()
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/machinery/portable_atmospherics/inflation_pump/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	if(!is_operational)
		return
	if(prob(50 / severity))
		on = !on
		if(on)
			SSair.start_processing_machine(src)
	if(prob(100 / severity))
		direction = PUMP_OUT
	target_pressure = rand(0, 100 * ONE_ATMOSPHERE)
	update_appearance()

/obj/machinery/portable_atmospherics/inflation_pump/replace_tank(mob/living/user, close_valve)
	. = ..()
	if(!.)
		return
	if(close_valve)
		if(on)
			on = FALSE
			update_appearance()
	else if(on && holding && direction == PUMP_OUT)
		user.investigate_log("started a transfer into [holding].", INVESTIGATE_ATMOS)

/obj/machinery/portable_atmospherics/inflation_pump/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "PortablePump", name)
		ui.open()

/obj/machinery/portable_atmospherics/inflation_pump/ui_data()
	var/data = list()
	data["on"] = on
	data["direction"] = direction
	data["connected"] = !!connected_port
	data["pressure"] = round(air_contents.return_pressure() ? air_contents.return_pressure() : 0)
	data["targetPressure"] = round(target_pressure ? target_pressure : 0)
	data["defaultPressure"] = round(PUMP_DEFAULT_PRESSURE)
	data["minPressure"] = round(PUMP_MIN_PRESSURE)
	data["maxPressure"] = round(PUMP_MAX_PRESSURE)
	data["hasHypernobCrystal"] = !!nob_crystal_inserted
	data["reactionSuppressionEnabled"] = !!suppress_reactions

	if(holding)
		data["holding"] = list()
		data["holding"]["name"] = holding.name
		var/datum/gas_mixture/holding_mix = holding.return_air()
		data["holding"]["pressure"] = round(holding_mix.return_pressure())
	else
		data["holding"] = null
	return data

/obj/machinery/portable_atmospherics/inflation_pump/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	switch(action)
		if("power")
			on = !on
			if(on)
				SSair.start_processing_machine(src)
			if(on && !holding)
				var/plasma_moles = air_contents.moles[/datum/gas/plasma]
				var/n2o_moles = air_contents.moles[/datum/gas/nitrous_oxide]
				if(n2o_moles || plasma_moles)
					message_admins("[ADMIN_LOOKUPFLW(usr)] turned on a pump that contains [n2o_moles ? "N2O" : ""][n2o_moles && plasma_moles ? " & " : ""][plasma_moles ? "Plasma" : ""] at [ADMIN_VERBOSEJMP(src)]")
					log_admin("[key_name(usr)] turned on a pump that contains [n2o_moles ? "N2O" : ""][n2o_moles && plasma_moles ? " & " : ""][plasma_moles ? "Plasma" : ""] at [AREACOORD(src)]")
			else if(on && direction == PUMP_OUT)
				usr.investigate_log("started a transfer into [holding].", INVESTIGATE_ATMOS)
			. = TRUE
		if("direction")
			if(direction == PUMP_OUT)
				direction = PUMP_IN
			else
				if(on && holding)
					usr.investigate_log("started a transfer into [holding].", INVESTIGATE_ATMOS)
				direction = PUMP_OUT
			. = TRUE
		if("pressure")
			var/pressure = params["pressure"]
			if(pressure == "reset")
				pressure = PUMP_DEFAULT_PRESSURE
				. = TRUE
			else if(pressure == "min")
				pressure = PUMP_MIN_PRESSURE
				. = TRUE
			else if(pressure == "max")
				pressure = PUMP_MAX_PRESSURE
				. = TRUE
			else if(text2num(pressure) != null)
				pressure = text2num(pressure)
				. = TRUE
			if(.)
				target_pressure = clamp(pressure, PUMP_MIN_PRESSURE, PUMP_MAX_PRESSURE)
				investigate_log("was set to [target_pressure] kPa by [key_name(usr)].", INVESTIGATE_ATMOS)
		if("eject")
			if(holding)
				replace_tank(usr, FALSE)
				. = TRUE
		if("reaction_suppression")
			if(!nob_crystal_inserted)
				stack_trace("[usr] tried to toggle reaction suppression on a pump without a noblium crystal inside, possible href exploit attempt.")
				return
			suppress_reactions = !suppress_reactions
			SSair.start_processing_machine(src)
			message_admins("[ADMIN_LOOKUPFLW(usr)] turned [suppress_reactions ? "on" : "off"] the [src] reaction suppression.")
			usr.investigate_log("turned [suppress_reactions ? "on" : "off"] the [src] reaction suppression.", INVESTIGATE_ATMOS)
			. = TRUE
	update_appearance()

/obj/machinery/portable_atmospherics/inflation_pump/unregister_holding()
	on = FALSE
	return ..()

// literally copy and paster `/datum/iv_drip_attachment` and replaced shit for inflation pumps
/datum/inflation_pump_attachment
	var/obj/machinery/portable_atmospherics/inflation_pump/inflation_pump
	var/mob/living/carbon/attached_to

	VAR_PRIVATE
		datum/beam/beam
		datum/component/tug_towards/tug_to_me

/datum/inflation_pump_attachment/New(
	obj/machinery/portable_atmospherics/inflation_pump/inflation_pump,
	mob/living/carbon/attached_to
)
	src.inflation_pump = inflation_pump
	src.attached_to = attached_to

	tug_to_me = attached_to.AddComponent(/datum/component/tug_towards, inflation_pump)

	beam = inflation_pump.Beam(
		attached_to,
		icon_state = "1-full",
		beam_color = COLOR_SILVER,
		layer = BELOW_MOB_LAYER,

		// Come out from the spout
		override_origin_pixel_x = 9,
		override_origin_pixel_y = 2,
	)

/datum/inflation_pump_attachment/Destroy(force)
	tug_to_me.remove_tug_target(inflation_pump)
	tug_to_me = null

	inflation_pump = null
	attached_to = null

	QDEL_NULL(beam)

	return ..()
