/obj/structure/ladder
	name = "ladder"
	desc = "A ladder. You can climb it up and down."
	icon_state = "ladder01"
	icon = 'icons/obj/structures/multiz.dmi'
	density = 0
	opacity = 0
	anchored = 1

	var/allowed_directions = DOWN
	var/obj/structure/ladder/target_up
	var/obj/structure/ladder/target_down

	var/climb_time = 2 SECONDS

/obj/structure/ladder/Initialize(mapload)
	. = ..()
	// the upper will connect to the lower
	if(allowed_directions & DOWN) //we only want to do the top one, as it will initialize the ones before it.
		for(var/obj/structure/ladder/L in GetBelow(src))
			if(L.allowed_directions & UP)
				target_down = L
				L.target_up = src
				return
	update_icon()

/obj/structure/ladder/Destroy()
	if(target_down)
		target_down.target_up = null
		target_down = null
	if(target_up)
		target_up.target_down = null
		target_up = null
	return ..()

/obj/structure/ladder/attackby(obj/item/C as obj, mob/user as mob)
	attack_hand(user)
	return

/obj/structure/ladder/attack_hand(var/mob/M)
	if(!M.may_climb_ladders(src))
		return

	var/obj/structure/ladder/target_ladder = getTargetLadder(M)
	if(!target_ladder)
		return
	if(!(M.loc == loc) && !M.Move(get_turf(src)))
		to_chat(M, "<span class='notice'>You fail to reach \the [src].</span>")
		return

	climbLadder(M, target_ladder)

/obj/structure/ladder/attack_ghost(var/mob/M)
	. = ..()
	var/target_ladder = getTargetLadder(M)
	if(target_ladder)
		M.forceMove(get_turf(target_ladder))

/obj/structure/ladder/attack_robot(var/mob/M)
	attack_hand(M)

/obj/structure/ladder/proc/getTargetLadder(var/mob/M)
	if((!target_up && !target_down) || (target_up && !istype(target_up.loc, /turf) || (target_down && !istype(target_down.loc,/turf))))
		to_chat(M, "<span class='notice'>\The [src] is incomplete and can't be climbed.</span>")
		return
	if(target_down && target_up)
		var/direction = alert(M,"Do you want to go up or down?", "Ladder", "Up", "Down", "Cancel")

		if(direction == "Cancel")
			return

		if(!M.may_climb_ladders(src))
			return

		switch(direction)
			if("Up")
				return target_up
			if("Down")
				return target_down
	else
		return target_down || target_up

/mob/proc/may_climb_ladders(var/ladder)
	if(!Adjacent(ladder))
		to_chat(src, "<span class='warning'>You need to be next to \the [ladder] to start climbing.</span>")
		return FALSE
	if(incapacitated())
		to_chat(src, "<span class='warning'>You are physically unable to climb \the [ladder].</span>")
		return FALSE
	return TRUE

/mob/observer/ghost/may_climb_ladders(var/ladder)
	return TRUE

/obj/structure/ladder/proc/climbLadder(var/mob/M, var/obj/target_ladder)
	var/direction = (target_ladder == target_up ? "up" : "down")
	M.visible_message("<span class='notice'>\The [M] begins climbing [direction] \the [src]!</span>",
		"You begin climbing [direction] \the [src]!",
		"You hear the grunting and clanging of a metal ladder being used.")

	target_ladder.audible_message("<span class='notice'>You hear something coming [direction] \the [src]</span>")

	if(do_after(M, climb_time, src))
		var/turf/T = get_turf(target_ladder)
		for(var/atom/A in T)
			if(!A.CanPass(M, M.loc, 1.5, 0))
				to_chat(M, "<span class='notice'>\The [A] is blocking \the [src].</span>")
				return FALSE
		return M.forceMove(T)

/obj/structure/ladder/CanPass(obj/mover, turf/source, height, airflow)
	. = ..()
	return airflow || !density

/obj/structure/ladder/update_icon()
	icon_state = "ladder[!!(allowed_directions & UP)][!!(allowed_directions & DOWN)]"

/obj/structure/ladder/up
	allowed_directions = UP
	icon_state = "ladder10"

/obj/structure/ladder/updown
	allowed_directions = UP|DOWN
	icon_state = "ladder11"


// Meme Variants, Snake Eater. Used on Rift for that 3 meter difference between the base z level and the one above it -Bloop

/obj/structure/ladder/snake_eater
	name = "long ladder"
	desc = "A ladder. You can climb it up and down. This one looks really long, what a thrill..."
	climb_time = 120 SECONDS

/obj/structure/ladder/snake_eater/up
	allowed_directions = UP
	icon_state = "ladder10"

/obj/structure/ladder/snake_eater/updown
	allowed_directions = UP|DOWN
	icon_state = "ladder11"
