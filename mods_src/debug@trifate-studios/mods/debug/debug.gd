extends CanvasLayer

var debug_open = false
signal cITEM

# Called when the node enters the scene tree for the first time.
func _ready():
	resize()
	cITEM.connect(Global.update_items)
	for i in Global.all_items:
		$debug_panel/vbox/items_opt.add_item(i, Global.all_items.find(i))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("debug"):
		if ! debug_open:
			if Global.ingame:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				Global.paused=true
				Global.can_move=false
			update_vars()
			$anim.play("open")
			debug_open = true
		else:
			if Global.ingame:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				Global.paused=false
				Global.can_move=true
			$anim.play_backwards("open")
			debug_open = false

func resize():
	$debug_panel.size.y = get_viewport().size.y
	$debug_panel/vbox.size.y = get_viewport().size.y

func update_vars():
	if Global.ingame:
		$debug_panel/vbox/items.show()
		$debug_panel/vbox/items_opt.show()
		$debug_panel/vbox/fov.show()
		$debug_panel/vbox/fov_slider.show()
		$debug_panel/vbox/ammo.show()
		$debug_panel/vbox/ammo_in.show()
		$debug_panel/vbox/health.show()
		$debug_panel/vbox/health_slider.show()
		$debug_panel/vbox/stam.show()
		$debug_panel/vbox/stam_slider.show()
		$debug_panel/vbox/pwr.show()
		$debug_panel/vbox/pwr_slider.show()
		$debug_panel/vbox/br.show()
		$debug_panel/vbox/br_slider.show()
		$debug_panel/vbox/bools.hide()
		$debug_panel/vbox/truefate.hide()
		$debug_panel/vbox/fov_slider.value = get_node("/root/World/Player/collision/neck/head/player_camera").fov
		$debug_panel/vbox/items_opt.selected = Global.all_items.find(Global.player_held_item)
		$debug_panel/vbox/ammo_in.value = Global.ammo
		$debug_panel/vbox/health_slider.value = Global.health
		$debug_panel/vbox/stam_slider.value = Global.stamina
		$debug_panel/vbox/pwr_slider.value = Global.power
	else:
		$debug_panel/vbox/items.hide()
		$debug_panel/vbox/items_opt.hide()
		$debug_panel/vbox/fov.hide()
		$debug_panel/vbox/fov_slider.hide()
		$debug_panel/vbox/ammo.hide()
		$debug_panel/vbox/ammo_in.hide()
		$debug_panel/vbox/health.hide()
		$debug_panel/vbox/health_slider.hide()
		$debug_panel/vbox/stam.hide()
		$debug_panel/vbox/stam_slider.hide()
		$debug_panel/vbox/pwr.hide()
		$debug_panel/vbox/pwr_slider.hide()
		$debug_panel/vbox/br.hide()
		$debug_panel/vbox/br_slider.hide()
		$debug_panel/vbox/bools.show()
		$debug_panel/vbox/truefate.show()


func _on_items_opt_pressed():
	Global.player_held_item = $debug_panel/vbox/items_opt.get_item_text($debug_panel/vbox/items_opt.selected)


func _on_health_slider_value_changed(value):
	Global.health = value


func _on_stam_slider_value_changed(value):
	Global.stamina = value


func _on_pwr_slider_value_changed(value):
	Global.power = value


func _on_fov_slider_value_changed(value):
	get_node("/root/World/Player/collision/neck/head/player_camera").fov = value


func _on_br_slider_value_changed(value):
	Global.env.adjustment_brightness = value
