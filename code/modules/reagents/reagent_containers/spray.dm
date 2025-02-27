/obj/item/reagent_containers/spray
	name = "spray bottle"
	desc = "A spray bottle, with an unscrewable top."
	icon = 'icons/obj/janitor.dmi'
	icon_state = "cleaner"
	item_state = "cleaner"
	item_flags = ITEM_NOBLUDGEON
	flags = OPENCONTAINER
	slot_flags = SLOT_BELT | SLOT_HOLSTER
	throw_force = 3
	w_class = ITEMSIZE_SMALL
	throw_speed = 2
	throw_range = 10
	amount_per_transfer_from_this = 10
	unacidable = 1 //plastic
	possible_transfer_amounts = list(5,10) //Set to null instead of list, if there is only one.
	var/spray_size = 3
	var/list/spray_sizes = list(1,3)
	volume = 250

/obj/item/reagent_containers/spray/Initialize(mapload)
	. = ..()
	src.verbs -= /obj/item/reagent_containers/verb/set_APTFT

/obj/item/reagent_containers/spray/afterattack(atom/A as mob|obj, mob/user as mob, proximity)
	if(istype(A, /obj/item/storage) || istype(A, /obj/structure/table) || istype(A, /obj/structure/closet) || istype(A, /obj/item/reagent_containers) || istype(A, /obj/structure/sink) || istype(A, /obj/structure/janitorialcart))
		return

	if(istype(A, /spell))
		return

	if(proximity)
		if(standard_dispenser_refill(user, A))
			return

	if(reagents.total_volume < amount_per_transfer_from_this)
		to_chat(user, "<span class='notice'>\The [src] is empty!</span>")
		return

	Spray_at(A, user, proximity)

	user.setClickCooldown(4)

	if(reagents.has_reagent("sacid"))
		message_admins("[key_name_admin(user)] fired sulphuric acid from \a [src].")
		log_game("[key_name(user)] fired sulphuric acid from \a [src].")
	if(reagents.has_reagent("pacid"))
		message_admins("[key_name_admin(user)] fired Polyacid from \a [src].")
		log_game("[key_name(user)] fired Polyacid from \a [src].")
	if(reagents.has_reagent("lube"))
		message_admins("[key_name_admin(user)] fired Space lube from \a [src].")
		log_game("[key_name(user)] fired Space lube from \a [src].")
	return

/obj/item/reagent_containers/spray/proc/Spray_at(atom/A as mob|obj, mob/user as mob, proximity)
	playsound(src.loc, 'sound/effects/spray2.ogg', 50, 1, -6)
	if (A.density && proximity)
		A.visible_message("[usr] sprays [A] with [src].")
		reagents.splash(A, amount_per_transfer_from_this)
	else
		spawn(0)
			var/obj/effect/water/chempuff/D = new/obj/effect/water/chempuff(get_turf(src))
			var/turf/my_target = get_turf(A)
			D.create_reagents(amount_per_transfer_from_this)
			if(!src)
				return
			reagents.trans_to_obj(D, amount_per_transfer_from_this)
			D.set_color()
			D.set_up(my_target, spray_size, 10)
	return

/obj/item/reagent_containers/spray/attack_self(var/mob/user)
	if(!possible_transfer_amounts)
		return
	amount_per_transfer_from_this = next_list_item(amount_per_transfer_from_this, possible_transfer_amounts)
	spray_size = next_list_item(spray_size, spray_sizes)
	to_chat(user, "<span class='notice'>You adjusted the pressure nozzle. You'll now use [amount_per_transfer_from_this] units per spray.</span>")

/obj/item/reagent_containers/spray/examine(mob/user)
	. = ..()
	if(loc == user)
		. += "[round(reagents.total_volume)] units left."

/obj/item/reagent_containers/spray/verb/empty()

	set name = "Empty Tank"
	set category = "Object"
	set src in usr

	if (alert(usr, "Are you sure you want to empty that?", "Empty Tank:", "Yes", "No") != "Yes")
		return
	if(isturf(usr.loc))
		to_chat(usr, "<span class='notice'>You empty \the [src] onto the floor.</span>")
		reagents.splash(usr.loc, reagents.total_volume)

//space cleaner
/obj/item/reagent_containers/spray/cleaner
	name = "space cleaner"
	desc = "BLAM!-brand non-foaming space cleaner!"

/obj/item/reagent_containers/spray/cleaner/drone
	name = "space cleaner"
	desc = "BLAM!-brand non-foaming space cleaner!"
	volume = 50

/obj/item/reagent_containers/spray/cleaner/Initialize(mapload)
	. = ..()
	reagents.add_reagent("cleaner", volume)

/obj/item/reagent_containers/spray/sterilizine
	name = "sterilizine"
	desc = "Great for hiding incriminating bloodstains and sterilizing scalpels."

/obj/item/reagent_containers/spray/sterilizine/Initialize(mapload)
	. = ..()
	reagents.add_reagent("sterilizine", volume)

/obj/item/reagent_containers/spray/pepper
	name = "pepperspray"
	desc = "Manufactured by UhangInc, used to blind and down an opponent quickly."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "pepperspray"
	item_state = "pepperspray"
	possible_transfer_amounts = null
	volume = 40
	var/safety = TRUE

/obj/item/reagent_containers/spray/pepper/Initialize(mapload)
	. = ..()
	reagents.add_reagent("condensedcapsaicin", 40)

/obj/item/reagent_containers/spray/pepper/examine(mob/user)
	. = ..()
	. += "The safety is [safety ? "on" : "off"]."

/obj/item/reagent_containers/spray/pepper/attack_self(var/mob/user)
	safety = !safety
	to_chat(usr, "<span class = 'notice'>You switch the safety [safety ? "on" : "off"].</span>")

/obj/item/reagent_containers/spray/pepper/Spray_at(atom/A as mob|obj)
	if(safety)
		to_chat(usr, "<span class = 'warning'>The safety is on!</span>")
		return
	. = ..()

/obj/item/reagent_containers/spray/waterflower
	name = "water flower"
	desc = "A seemingly innocent sunflower...with a twist."
	icon = 'icons/obj/device.dmi'
	icon_state = "sunflower"
	item_state = "sunflower"
	amount_per_transfer_from_this = 1
	possible_transfer_amounts = null
	volume = 10
	drop_sound = 'sound/items/drop/herb.ogg'
	pickup_sound = 'sound/items/pickup/herb.ogg'

/obj/item/reagent_containers/spray/waterflower/Initialize(mapload)
	. = ..()
	reagents.add_reagent("water", 10)

/obj/item/reagent_containers/spray/chemsprayer
	name = "chem sprayer"
	desc = "A utility used to spray large amounts of reagent in a given area."
	icon = 'icons/obj/gun/launcher.dmi'
	icon_state = "chemsprayer"
	item_state = "chemsprayer"
	throw_force = 3
	w_class = ITEMSIZE_NORMAL
	possible_transfer_amounts = null
	volume = 600
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3, TECH_ENGINEERING = 3)

/obj/item/reagent_containers/spray/chemsprayer/Spray_at(atom/A as mob|obj)
	var/direction = get_dir(src, A)
	var/turf/T = get_turf(A)
	var/turf/T1 = get_step(T,turn(direction, 90))
	var/turf/T2 = get_step(T,turn(direction, -90))
	var/list/the_targets = list(T, T1, T2)

	for(var/a = 1 to 3)
		spawn(0)
			if(reagents.total_volume < 1) break
			var/obj/effect/water/chempuff/D = new/obj/effect/water/chempuff(get_turf(src))
			var/turf/my_target = the_targets[a]
			D.create_reagents(amount_per_transfer_from_this)
			if(!src)
				return
			playsound(src.loc, 'sound/effects/spray2.ogg', 50, 1, -6)
			reagents.trans_to_obj(D, amount_per_transfer_from_this)
			D.set_color()
			D.set_up(my_target, rand(6, 8), 2)
	return

/obj/item/reagent_containers/spray/plantbgone
	name = "Plant-B-Gone"
	desc = "Kills those pesky weeds!"
	icon = 'icons/obj/hydroponics_machines.dmi'
	icon_state = "plantbgone"
	item_state = "plantbgone"
	volume = 100

/obj/item/reagent_containers/spray/plantbgone/Initialize(mapload)
	. = ..()
	reagents.add_reagent("plantbgone", 100)

/obj/item/reagent_containers/spray/pestbgone
	name = "Pest-B-Gone"
	desc = "Rated for pests up to 1:3 scale!"
	icon = 'icons/obj/hydroponics_machines.dmi'
	icon_state = "pestbgone"
	item_state = "pestbgone"
	volume = 100

/obj/item/reagent_containers/spray/pestbgone/Initialize(mapload)
	. = ..()
	reagents.add_reagent("pestbgone", 100)

/obj/item/reagent_containers/spray/squirt
	name = "HydroBlaster 4000"
	desc = "A popular toy produced by Donk Co, the HydroBlaster 4000 is the latest in a long line of recreational pressurized water delivery systems."
	icon = 'icons/obj/toy.dmi'
	icon_state = "squirtgun"
	item_state = "squirtgun"
	w_class = ITEMSIZE_NORMAL
	volume = 100
	var/pumped = TRUE

/obj/item/reagent_containers/spray/squirt/Initialize(mapload)
	. = ..()
	reagents.add_reagent("water", 100)

/obj/item/reagent_containers/spray/squirt/examine(mob/user)
	. = ..()
	. += "The tank is [pumped ? "depressurized" : "pressurized"]."

/obj/item/reagent_containers/spray/squirt/attack_self(var/mob/user)
	pumped = !pumped
	to_chat(usr, "<span class = 'notice'>You pump the handle [pumped ? "to depressurize" : "to pressurize"] the tank.</span>")

/obj/item/reagent_containers/spray/squirt/Spray_at(atom/A as mob|obj)
	if(pumped)
		to_chat(usr, "<span class = 'warning'>The tank has no pressure!</span>")
		return
	. = ..()

/obj/item/reagent_containers/spray/squirt/nt
	name = "HydroBlaster 4001"
	desc = "A popular toy produced by Donk Co, the HydroBlaster 4001 is modeled in NanoTrasen corporate colors. This is largely considered a sarcastic gesture."
	icon = 'icons/obj/toy.dmi'
	icon_state = "squirtgun_nt"
	item_state = "squirtgun_nt"
	w_class = ITEMSIZE_NORMAL
	volume = 101
