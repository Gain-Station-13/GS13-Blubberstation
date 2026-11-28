#define MIN_PUMP_SLOW 1
#define MAX_PUMP_SLOW 4
#define PUMP_SLOW_RANGE (MAX_PUMP_SLOW - MIN_PUMP_SLOW)
#define MAX_MIN_PRESSURE_DIFF (VOLUME_PUMP_MAX_OUTPUT_PRESSURE - PUMP_MAX_PRESSURE)

/obj/item/handpump
	name = "handpump"
	desc = "You use this to pump things with the power of your hands."
	icon = 'modular_gs/icons/obj/items/devices.dmi'
	icon_state = "handpump"

/obj/item/handpump/attack_self(mob/user, modifiers)
	. = ..()

	if (!iscarbon(user))
		return

	if(!isturf(user.loc))
		balloon_alert(user, "not on a turf!")

	var/mob/living/carbon/carbon_user = user
	var/pressure = carbon_user.air.return_pressure()
	while(do_after(carbon_user, calculate_pumping_slowdown(pressure) SECONDS, target = user))
		var/breath_moles = 0
		var/datum/gas_mixture/environment = carbon_user.loc.return_air()
		if(environment)
			breath_moles = environment.total_moles() * INHALE_PERCENTAGE
		var/datum/gas_mixture/pumped = carbon_user.loc.remove_air(breath_moles)
		carbon_user.air.merge(pumped)
		pressure = carbon_user.air.return_pressure()

/obj/item/handpump/proc/calculate_pumping_slowdown(pressure)
	if (pressure <= PUMP_MAX_PRESSURE)
		return MIN_PUMP_SLOW
	if (pressure >= VOLUME_PUMP_MAX_OUTPUT_PRESSURE)
		return MAX_PUMP_SLOW
	
	// linear function. Will equal to `MIN_PUMP_SLOW` at `PUMP_MAX_PRESSURE`. Will equal to `MAX_PUMP_SLOW` at `VOLUME_PUMP_MAX_OUTPUT_PRESSURE`.
	return ((PUMP_SLOW_RANGE) * (pressure - MIN_PUMP_SLOW) / (MAX_MIN_PRESSURE_DIFF)) + MIN_PUMP_SLOW
