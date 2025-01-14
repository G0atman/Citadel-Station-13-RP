/datum/asset/simple/namespaced/chem_master
	keep_local_name = TRUE

/datum/asset/simple/namespaced/chem_master/register()
	for(var/i = 1 to 24)
		assets["pill[i].png"] = icon('icons/obj/chemical.dmi', "pill[i]")

	for(var/i = 1 to 4)
		assets["bottle-[i].png"] = icon('icons/obj/chemical.dmi', "bottle-[i]")

	return ..()

/*
/datum/asset/spritesheet/simple/pills
	name = "pills"
	assets = list(
		"pill1" = 'icons/ui_icons/pills/pill1.png',
		"pill2" = 'icons/ui_icons/pills/pill2.png',
		"pill3" = 'icons/ui_icons/pills/pill3.png',
		"pill4" = 'icons/ui_icons/pills/pill4.png',
		"pill5" = 'icons/ui_icons/pills/pill5.png',
		"pill6" = 'icons/ui_icons/pills/pill6.png',
		"pill7" = 'icons/ui_icons/pills/pill7.png',
		"pill8" = 'icons/ui_icons/pills/pill8.png',
		"pill9" = 'icons/ui_icons/pills/pill9.png',
		"pill10" = 'icons/ui_icons/pills/pill10.png',
		"pill11" = 'icons/ui_icons/pills/pill11.png',
		"pill12" = 'icons/ui_icons/pills/pill12.png',
		"pill13" = 'icons/ui_icons/pills/pill13.png',
		"pill14" = 'icons/ui_icons/pills/pill14.png',
		"pill15" = 'icons/ui_icons/pills/pill15.png',
		"pill16" = 'icons/ui_icons/pills/pill16.png',
		"pill17" = 'icons/ui_icons/pills/pill17.png',
		"pill18" = 'icons/ui_icons/pills/pill18.png',
		"pill19" = 'icons/ui_icons/pills/pill19.png',
		"pill20" = 'icons/ui_icons/pills/pill20.png',
		"pill21" = 'icons/ui_icons/pills/pill21.png',
		"pill22" = 'icons/ui_icons/pills/pill22.png',
	)
*/
