/datum/component/storage/concrete/pockets
	max_items = 2
	max_w_class = WEIGHT_CLASS_SMALL
	max_combined_w_class = 50
	use_sound = null

/datum/component/storage/concrete/pockets/handle_item_insertion(obj/item/I, prevent_warning, mob/user)
	. = ..()
	if(. && silent && !prevent_warning)
		if(quickdraw)
			to_chat(user, "<span class='notice'>You discreetly slip [I] into [parent]. Alt-click [parent] to remove it.</span>")
		else
			to_chat(user, "<span class='notice'>You discreetly slip [I] into [parent].</span>")

/datum/component/storage/concrete/pockets/small
	max_items = 1
	max_w_class = WEIGHT_CLASS_SMALL
	attack_hand_interact = FALSE

/datum/component/storage/concrete/pockets/tiny
	max_items = 1
	max_w_class = WEIGHT_CLASS_TINY
	attack_hand_interact = FALSE

//WS Begin - Exowear Pockets
/datum/component/storage/concrete/pockets/exo
	max_items = 2
	max_w_class = WEIGHT_CLASS_SMALL
	attack_hand_interact = FALSE
	quickdraw = FALSE
	silent = FALSE

/datum/component/storage/concrete/pockets/exo/cloak
	max_items = 1
	max_w_class = WEIGHT_CLASS_NORMAL
	quickdraw = TRUE

/datum/component/storage/concrete/pockets/exo/large
	max_items = 3
//WS End

/datum/component/storage/concrete/pockets/small/fedora/Initialize()
	. = ..()
	var/static/list/exception_cache = typecacheof(list(
		/obj/item/katana, /obj/item/toy/katana, /obj/item/nullrod/claymore/katana,
		/obj/item/energy_katana, /obj/item/gun/ballistic/automatic/tommygun
		))
	exception_hold = exception_cache

/datum/component/storage/concrete/pockets/small/fedora/detective
	attack_hand_interact = TRUE // so the detectives would discover pockets in their hats

//WS Begin - Any small item in shoes
/datum/component/storage/concrete/pockets/shoes
	max_items = 2
	attack_hand_interact = FALSE
	max_w_class = WEIGHT_CLASS_SMALL
	quickdraw = FALSE
	silent = TRUE
//WS End

/datum/component/storage/concrete/pockets/shoes/Initialize()
	. = ..()

/datum/component/storage/concrete/pockets/shoes/clown/Initialize()
	. = ..()

/datum/component/storage/concrete/pockets/pocketprotector
	max_items = 3
	max_w_class = WEIGHT_CLASS_TINY
	var/atom/original_parent

/datum/component/storage/concrete/pockets/pocketprotector/Initialize()
	original_parent = parent
	. = ..()
	set_holdable(list( //Same items as a PDA
		/obj/item/pen,
		/obj/item/toy/crayon,
		/obj/item/lipstick,
		/obj/item/flashlight/pen,
		/obj/item/clothing/mask/cigarette)
		)

/datum/component/storage/concrete/pockets/pocketprotector/real_location()
	// if the component is reparented to a jumpsuit, the items still go in the protector
	return original_parent

/datum/component/storage/concrete/pockets/helmet
	quickdraw = TRUE
	max_combined_w_class = 6

/datum/component/storage/concrete/pockets/helmet/Initialize()
	. = ..()
	set_holdable(list(
		/obj/item/reagent_containers/food/drinks/bottle/vodka,
		/obj/item/reagent_containers/food/drinks/bottle/molotov,
		/obj/item/reagent_containers/food/drinks/drinkingglass,
		/obj/item/ammo_box/a762
	))
