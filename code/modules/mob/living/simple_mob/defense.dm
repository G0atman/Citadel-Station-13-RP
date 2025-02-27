// When someone clicks us with an empty hand
/mob/living/simple_mob/attack_hand(mob/living/L)
	..()

	switch(L.a_intent)
		if(INTENT_HELP)
			if(health > 0)
				L.visible_message("<span class='notice'>\The [L] [response_help] \the [src].</span>")

		if(INTENT_DISARM)
			L.visible_message("<span class='notice'>\The [L] [response_disarm] \the [src].</span>")
			L.do_attack_animation(src)
			//TODO: Push the mob away or something

		if(INTENT_GRAB)
			if (L == src)
				return
			if (!(status_flags & CANPUSH))
				return
			if(!incapacitated(INCAPACITATION_ALL) && prob(grab_resist))
				L.visible_message("<span class='warning'>\The [L] tries to grab \the [src] but fails!</span>")
				return

			var/obj/item/grab/G = new /obj/item/grab(L, src)

			L.put_in_active_hand(G)

			G.synch()
			G.affecting = src
			LAssailant = L

			L.visible_message("<span class='warning'>\The [L] has grabbed [src] passively!</span>")
			L.do_attack_animation(src)

		if(INTENT_HARM)
			var/armor = run_armor_check(def_zone = null, attack_flag = "melee")
			apply_damage(damage = harm_intent_damage, damagetype = BURN, def_zone = null, blocked = armor, blocked = resistance, used_weapon = null, sharp = FALSE, edge = FALSE)
			L.visible_message("<span class='warning'>\The [L] [response_harm] \the [src]!</span>")
			L.do_attack_animation(src)

	return


// When somoene clicks us with an item in hand
/mob/living/simple_mob/attackby(var/obj/item/O, var/mob/user)
	if(istype(O, /obj/item/stack/medical))
		if(stat != DEAD)
			// This could be done better.
			var/obj/item/stack/medical/MED = O
			if(health < getMaxHealth())
				if(MED.amount >= 1)
					adjustBruteLoss(-MED.heal_brute)
					MED.amount -= 1
					if(MED.amount <= 0)
						qdel(MED)
					visible_message("<span class='notice'>\The [user] applies the [MED] on [src].</span>")
		else
			var/datum/gender/T = GLOB.gender_datums[src.get_visible_gender()]
			// the gender lookup is somewhat overkill, but it functions identically to the obsolete gender macros and future-proofs this code
			to_chat(user, "<span class='notice'>\The [src] is dead, medical items won't bring [T.him] back to life.</span>")
	if(can_butcher(user, O))	//if the animal can be butchered, do so and return. It's likely to be gibbed.
		harvest(user, O)
		return

	return ..()


// Handles the actual harming by a melee weapon.
/mob/living/simple_mob/hit_with_weapon(obj/item/O, mob/living/user, var/effective_force, var/hit_zone)
	effective_force = O.force

	//Animals can't be stunned(?)
	if(O.damtype == HALLOSS)
		effective_force = 0
	if(supernatural && istype(O,/obj/item/nullrod))
		effective_force *= 2
		purge = 3
	if(O.force <= resistance)
		to_chat(user,"<span class='danger'>This weapon is ineffective, it does no damage.</span>")
		return 2 //???

	. = ..()


// Exploding.
/mob/living/simple_mob/ex_act(severity)
	if(!blinded)
		flash_eyes()
	var/armor = run_armor_check(def_zone = null, attack_flag = "bomb")
	var/bombdam = 500
	switch (severity)
		if (1.0)
			bombdam = 500
		if (2.0)
			bombdam = 60
		if (3.0)
			bombdam = 30

	apply_damage(damage = bombdam, damagetype = BRUTE, def_zone = null, blocked = armor, blocked = resistance, used_weapon = null, sharp = FALSE, edge = FALSE)

	if(bombdam > maxHealth)
		gib()

// Cold stuff.
/mob/living/simple_mob/get_cold_protection()
	return cold_resist


// Fire stuff. Not really exciting at the moment.
/mob/living/simple_mob/handle_fire()
	return
/mob/living/simple_mob/update_fire()
	return
/mob/living/simple_mob/IgniteMob()
	return
/mob/living/simple_mob/ExtinguishMob()
	return

/mob/living/simple_mob/get_heat_protection()
	return heat_resist

// Electricity
/mob/living/simple_mob/electrocute_act(var/shock_damage, var/obj/source, var/siemens_coeff = 1.0, var/def_zone = null)
	shock_damage *= siemens_coeff
	if(shock_damage < 1)
		return 0

	apply_damage(damage = shock_damage, damagetype = BURN, def_zone = null, blocked = null, blocked = resistance, used_weapon = null, sharp = FALSE, edge = FALSE)
	playsound(loc, "sparks", 50, 1, -1)

	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(5, 1, loc)
	s.start()

/mob/living/simple_mob/get_shock_protection()
	return shock_resist

// Shot with taser/stunvolver
/mob/living/simple_mob/stun_effect_act(var/stun_amount, var/agony_amount, var/def_zone, var/used_weapon=null)
	if(taser_kill)
		var/stunDam = 0
		var/agonyDam = 0
		var/armor = run_armor_check(def_zone = null, attack_flag = "energy")

		if(stun_amount)
			stunDam += stun_amount * 0.5
			apply_damage(damage = stunDam, damagetype = BURN, def_zone = null, blocked = armor, blocked = resistance, used_weapon = used_weapon, sharp = FALSE, edge = FALSE)

		if(agony_amount)
			agonyDam += agony_amount * 0.5
			apply_damage(damage = agonyDam, damagetype = BURN, def_zone = null, blocked = armor, blocked = resistance, used_weapon = used_weapon, sharp = FALSE, edge = FALSE)


// Electromagnetism
/mob/living/simple_mob/emp_act(severity)
	..() // To emp_act() its contents.
	if(!isSynthetic())
		return
	switch(severity)
		if(1)
		//	adjustFireLoss(rand(15, 25))
			adjustFireLoss(min(60, getMaxHealth()*0.5)) // Weak mobs will always take two direct EMP hits to kill. Stronger ones might take more.
		if(2)
			adjustFireLoss(min(30, getMaxHealth()*0.25))
		//	adjustFireLoss(rand(10, 18))
		if(3)
			adjustFireLoss(min(15, getMaxHealth()*0.125))
		//	adjustFireLoss(rand(5, 12))
		if(4)
			adjustFireLoss(min(7, getMaxHealth()*0.0625))
		//	adjustFireLoss(rand(1, 6))

// Water
/mob/living/simple_mob/get_water_protection()
	return water_resist

// "Poison" (aka what reagents would do if we wanted to deal with those).
/mob/living/simple_mob/get_poison_protection()
	return poison_resist

// Armor
/mob/living/simple_mob/getarmor(def_zone, type)
	var/armorval = armor[type]
	if(!armorval)
		return 0
	else
		return armorval

/mob/living/simple_mob/getsoak(def_zone, attack_flag)
	var/armorval = armor_soak[attack_flag]
	if(!armorval)
		return 0
	else
		return armorval

// Lightning
/mob/living/simple_mob/lightning_act()
	..()
	// If a non-player simple_mob was struck, inflict huge damage.
	// If the damage is fatal, it is turned to ash.
	if(!client)
		inflict_shock_damage(200) // Mobs that are very beefy or resistant to shock may survive getting struck.
		updatehealth()
		if(health <= 0)
			visible_message(SPAN_CRITICAL("\The [src] disintegrates into ash!"))
			ash()
			return // No point deafening something that wont exist.

// Lava
/mob/living/simple_mob/lava_act()
	..()
	// Similar to lightning, the mob is turned to ash if the lava tick was fatal and it isn't a player.
	// Unlike lightning, we don't add an additional damage spike (since lava already hurts a lot).
	if(!client)
		updatehealth()
		if(health <= 0)
			visible_message(SPAN_CRITICAL("\The [src] flashes into ash as the lava consumes them!"))
			ash()

//Acid
/mob/living/simple_mob/acid_act()
	..()
	// If a non-player simple_mob was submerged, inflict huge damage.
	// If the damage is fatal, it is turned to gibs.
	if(!client)
		inflict_heat_damage(30)
		inflict_poison_damage(10)
		updatehealth()
		if(health <= 0)
			visible_message(SPAN_CRITICAL("\The [src] melts into slurry!"))
			gib()
			return // No point deafening something that wont exist.

// Injections.
/mob/living/simple_mob/can_inject(mob/user, error_msg, target_zone, ignore_thickness)
	if(ignore_thickness)
		return TRUE
	return !thick_armor
