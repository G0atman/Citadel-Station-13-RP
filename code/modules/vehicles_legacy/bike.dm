// TODO: port to modern vehicles. If you're in this file, STOP FUCKING WITH IT AND PORT IT OVER.
/obj/vehicle_old/bike
	name = "space-bike"
	desc = "Space wheelies! Woo!"
	icon = 'icons/obj/bike.dmi'
	icon_state = "bike_off"
	dir = SOUTH

	load_item_visible = 1
	mob_offset_y = 5
	health = 100
	maxhealth = 100

	locked = 0
	powered = 1

	fire_dam_coeff = 0.6
	brute_dam_coeff = 0.5
	cell = /obj/item/cell/high
	var/protection_percent = 60

	var/land_speed = 0.5 //if 0 it can't go on turf
	var/space_speed = 0.4
	var/bike_icon = "bike"
	var/custom_icon = FALSE

	paint_color = "#ffffff"

	var/datum/effect_system/ion_trail_follow/ion
	var/kickstand = 1

/obj/vehicle_old/bike/Initialize(mapload)
	. = ..()
	if(ispath(cell))
		cell = new cell(src)
	ion = new /datum/effect_system/ion_trail_follow()
	ion.set_up(src)
	turn_off()
	icon_state = "[bike_icon]_off"
	update_icon()

/obj/vehicle_old/bike/built
	cell = null

/obj/vehicle_old/bike/random/Initialize(mapload)
	. = ..()
	paint_color = rgb(rand(1,255),rand(1,255),rand(1,255))

/obj/vehicle_old/bike/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/multitool) && open)
		var/new_paint = input("Please select paint color.", "Paint Color", paint_color) as color|null
		if(new_paint)
			paint_color = new_paint
			update_icon()
			return
	..()

/obj/vehicle_old/bike/CtrlClick(var/mob/user)
	if(Adjacent(user) && anchored)
		toggle()
	else
		return ..()

/obj/vehicle_old/bike/verb/toggle()
	set name = "Toggle Engine"
	set category = "Vehicle"
	set src in view(0)

	if(!isliving(usr) || ismouse(usr))
		return

	if(usr.incapacitated()) return

	if(!on && cell && cell.charge > charge_use)
		turn_on()
		src.visible_message("\The [src] rumbles to life.", "You hear something rumble deeply.")
	else
		turn_off()
		src.visible_message("\The [src] putters before turning off.", "You hear something putter slowly.")

/obj/vehicle_old/bike/AltClick(var/mob/user)
	if(Adjacent(user))
		kickstand(user)
	else
		return ..()

/obj/vehicle_old/bike/verb/kickstand(var/mob/user as mob)
	set name = "Toggle Kickstand"
	set category = "Vehicle"
	set src in view(0)

	if(!isliving(usr) || ismouse(usr))
		return

	if(usr.incapacitated()) return

	if(kickstand)
		src.visible_message("You put up \the [src]'s kickstand.")
	else
		if(istype(src.loc,/turf/space) || istype(src.loc, /turf/simulated/floor/water))
			to_chat(usr, "<span class='warning'> You don't think kickstands work here...</span>")
			return
		src.visible_message("You put down \the [src]'s kickstand.")
		if(pulledby)
			pulledby.stop_pulling()

	kickstand = !kickstand
	anchored = (kickstand || on)

/obj/vehicle_old/bike/load(var/atom/movable/C, var/mob/user as mob)
	var/mob/living/M = C
	if(!istype(C)) return 0
	if(M.buckled || M.restrained() || !Adjacent(M) || !M.Adjacent(src))
		return 0
	return ..(M, user)

/obj/vehicle_old/bike/MouseDroppedOnLegacy(var/atom/movable/C, var/mob/user as mob)
	if(!load(C, user))
		to_chat(user, "<span class='warning'> You were unable to load \the [C] onto \the [src].</span>")
		return

/obj/vehicle_old/bike/attack_hand(var/mob/user as mob)
	if(user == load)
		unload(load, user)
		to_chat(user, "You unbuckle yourself from \the [src].")
	else if(!load && load(user, user))
		to_chat(user, "You buckle yourself to \the [src].")

/obj/vehicle_old/bike/relaymove(mob/user, direction)
	if(user != load || !on)
		return 0
	if(Move(get_step(src, direction)))
		return 1
	return 0

/obj/vehicle_old/bike/Move(var/turf/destination)
	if(kickstand) return 0

	if(on && (!cell || cell.charge < charge_use))
		turn_off()
		visible_message("<span class='warning'>\The [src] whines, before its engines wind down.</span>")
		return 0

	//these things like space, not turf. Dragging shouldn't weigh you down.
	if(on && cell)
		cell.use(charge_use)

	if(istype(destination,/turf/space) || istype(destination, /turf/simulated/floor/water) || pulledby)
		if(!space_speed)
			return 0
		move_delay = space_speed
	else
		if(!land_speed)
			return 0
		move_delay = land_speed
	return ..()

/obj/vehicle_old/bike/turn_on()
	ion.start()
	anchored = 1

	update_icon()

	if(pulledby)
		pulledby.stop_pulling()
	..()

/obj/vehicle_old/bike/turn_off()
	ion.stop()
	anchored = kickstand

	update_icon()

	..()

/obj/vehicle_old/bike/bullet_act(var/obj/item/projectile/Proj)
	if(has_buckled_mobs() && prob(protection_percent))
		var/mob/living/L = pick(buckled_mobs)
		L.bullet_act(Proj)
		return
	..()

/obj/vehicle_old/bike/update_icon()
	overlays.Cut()

	if(custom_icon)
		if(on)
			var/image/bodypaint = image('icons/obj/custom_items_vehicle.dmi', "[bike_icon]_on_a", src.layer)
			bodypaint.color = paint_color
			overlays += bodypaint

			var/image/overmob = image('icons/obj/custom_items_vehicle.dmi', "[bike_icon]_on_overlay", MOB_LAYER + 1)
			var/image/overmob_color = image('icons/obj/custom_items_vehicle.dmi', "[bike_icon]_on_overlay_a", MOB_LAYER + 1)
			overmob.plane = MOB_PLANE
			overmob_color.plane = MOB_PLANE
			overmob_color.color = paint_color
			overlays += overmob
			overlays += overmob_color
			if(open)
				icon_state = "[bike_icon]_on-open"
			else
				icon_state = "[bike_icon]_on"
		else
			var/image/bodypaint = image('icons/obj/custom_items_vehicle.dmi', "[bike_icon]_off_a", src.layer)
			bodypaint.color = paint_color
			overlays += bodypaint

			var/image/overmob = image('icons/obj/custom_items_vehicle.dmi', "[bike_icon]_off_overlay", MOB_LAYER + 1)
			var/image/overmob_color = image('icons/obj/custom_items_vehicle.dmi', "[bike_icon]_off_overlay_a", MOB_LAYER + 1)
			overmob.plane = MOB_PLANE
			overmob_color.plane = MOB_PLANE
			overmob_color.color = paint_color
			overlays += overmob
			overlays += overmob_color
			if(open)
				icon_state = "[bike_icon]_off-open"
			else
				icon_state = "[bike_icon]_off"
		..()
		return

	if(on)
		var/image/bodypaint = image('icons/obj/bike.dmi', "[bike_icon]_on_a", src.layer)
		bodypaint.color = paint_color
		overlays += bodypaint

		var/image/overmob = image('icons/obj/bike.dmi', "[bike_icon]_on_overlay", MOB_LAYER + 1)
		var/image/overmob_color = image('icons/obj/bike.dmi', "[bike_icon]_on_overlay_a", MOB_LAYER + 1)
		overmob.plane = MOB_PLANE
		overmob_color.plane = MOB_PLANE
		overmob_color.color = paint_color
		overlays += overmob
		overlays += overmob_color
		if(open)
			icon_state = "[bike_icon]_on-open"
		else
			icon_state = "[bike_icon]_on"
	else
		var/image/bodypaint = image('icons/obj/bike.dmi', "[bike_icon]_off_a", src.layer)
		bodypaint.color = paint_color
		overlays += bodypaint

		var/image/overmob = image('icons/obj/bike.dmi', "[bike_icon]_off_overlay", MOB_LAYER + 1)
		var/image/overmob_color = image('icons/obj/bike.dmi', "[bike_icon]_off_overlay_a", MOB_LAYER + 1)
		overmob.plane = MOB_PLANE
		overmob_color.plane = MOB_PLANE
		overmob_color.color = paint_color
		overlays += overmob
		overlays += overmob_color
		if(open)
			icon_state = "[bike_icon]_off-open"
		else
			icon_state = "[bike_icon]_off"

	..()


/obj/vehicle_old/bike/Destroy()
	qdel(ion)

	..()
