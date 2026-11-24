/mob/living/proc/do_gut_slap_animation(atom/slapped)
	do_attack_animation(slapped, no_effect=TRUE)
	var/image/gloveimg = image('icons/effects/effects.dmi', slapped, "slapglove", slapped.layer + 0.1)
	gloveimg.pixel_y = -5
	gloveimg.pixel_x = 0
	slapped.flick_overlay_view(gloveimg, 1 SECONDS)

	// And animate the attack!
	animate(gloveimg, alpha = 175, transform = matrix() * 0.75, pixel_x = 0, pixel_y = -5, pixel_z = 0, time = 0.3 SECONDS)
	animate(time = 0.1 SECONDS)
	animate(alpha = 0, time = 0.3 SECONDS, easing = CIRCULAR_EASING|EASE_OUT)
