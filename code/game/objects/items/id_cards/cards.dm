/* Cards
 * Contains:
 *		DATA CARD
 *		ID CARD
 *		FINGERPRINT CARD HOLDER
 *		FINGERPRINT CARD
 */

/*
 * DATA CARDS - Used for the teleporter
 */
/obj/item/card
	name = "card"
	desc = "Does card things."
	icon = 'icons/obj/card_cit.dmi'
	icon_state = "generic"
	w_class = ITEMSIZE_TINY
	slot_flags = SLOT_ID | SLOT_EARS
	var/associated_account_number = 0

	var/list/initial_sprite_stack = list("")
	var/base_icon = 'icons/obj/card_cit.dmi'
	var/list/sprite_stack

	var/list/files = list(  )
	pickup_sound = 'sound/items/pickup/card.ogg'

/obj/item/card/Initialize(mapload)
	. = ..()
	reset_icon()

/obj/item/card/proc/reset_icon()
	sprite_stack = initial_sprite_stack
	update_icon()

/obj/item/card/update_icon()
	if(!sprite_stack || !istype(sprite_stack) || sprite_stack == list(""))
		icon = base_icon
		icon_state = initial(icon_state)

	var/icon/I = null
	for(var/iconstate in sprite_stack)
		if(!iconstate)
			iconstate = icon_state
		if(I)
			var/icon/IC = new(base_icon, iconstate)
			I.Blend(IC, ICON_OVERLAY)
		else
			I = new/icon(base_icon, iconstate)
	if(I)
		icon = I

/obj/item/card/data
	name = "data disk"
	desc = "A disk of data."
	icon_state = "data"
	var/function = "storage"
	var/data = "null"
	var/special = null
	item_state = "card-id"
	drop_sound = 'sound/items/drop/disk.ogg'
	pickup_sound = 'sound/items/pickup/disk.ogg'

/obj/item/card/data/verb/label(t as text)
	set name = "Label Disk"
	set category = "Object"
	set src in usr

	if (t)
		src.name = text("data disk- '[]'", t)
	else
		src.name = "data disk"
	src.add_fingerprint(usr)
	return

/obj/item/card/data/clown
	name = "\proper the coordinates to clown planet"
	icon_state = "rainbow"
	item_state = "card-id"
	level = 2
	desc = "This card contains coordinates to the fabled Clown Planet. Handle with care."
	function = "teleporter"
	data = "Clown Land"

/*
 * ID CARDS
 */

/obj/item/card/emag_broken
	desc = "It's a card with a magnetic strip attached to some circuitry. It looks too busted to be used for anything but salvage."
	name = "broken cryptographic sequencer"
	icon_state = "emag-spent"
	item_state = "card-id"
	origin_tech = list(TECH_MAGNET = 2, TECH_ILLEGAL = 2)

/obj/item/card/emag
	desc = "It's a card with a magnetic strip attached to some circuitry."
	name = "cryptographic sequencer"
	icon_state = "emag"
	item_state = "card-id"
	origin_tech = list(TECH_MAGNET = 2, TECH_ILLEGAL = 2)
	var/uses = 10

/obj/item/card/emag/resolve_attackby(atom/W, mob/user, params, attack_modifier = 1)
	var/used_uses = W.emag_act(uses, user, src)
	if(used_uses < 0)
		return ..(W, user)

	uses -= used_uses
	W.add_fingerprint(user)
	//V Because some things (read lift doors) don't get emagged
	if(used_uses)
		log_and_message_admins("emagged \an [W].")
	else
		log_and_message_admins("attempted to emag \an [W].")
	log_and_message_admins("emagged \an [W].")

	if(uses<1)
		to_chat(user, "<span class='warning'>\The [src] fizzles and sparks - it seems it's been used once too often, and is now spent.</span>")
		var/obj/item/card/emag_broken/junk = new(user.loc)
		junk.add_fingerprint(user)
		qdel(src)

	return 1

/obj/item/card/emag/attackby(obj/item/O as obj, mob/user as mob)
	if(istype(O, /obj/item/stack/telecrystal))
		var/obj/item/stack/telecrystal/T = O
		if(T.amount < 1)
			to_chat(usr, "<span class='notice'>You are not adding enough telecrystals to fuel \the [src].</span>")
			return
		uses += T.amount/2 //Gives 5 uses per 10 TC
		uses = CEILING(uses, 1) //Ensures no decimal uses nonsense, rounds up to be nice
		to_chat(usr, "<span class='notice'>You add \the [O] to \the [src]. Increasing the uses of \the [src] to [uses].</span>")
		qdel(O)
