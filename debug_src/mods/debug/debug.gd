extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var global = get_node("/root/Playerglobal")
var menu = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$ui/menu.rect_size.y = get_viewport().size.y
	$ui/menu/vb.rect_min_size.y = get_viewport().size.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if Input.is_action_just_pressed("debug"):
		if menu:
			$ui/menu.hide()
			menu = false
		else:
			check_rooms()
			$ui/menu.show()
			menu=true

func _on_tf_pressed():
	global.achivements.yourtruefate = $ui/menu/vb/tf.pressed


func _on_fl_pressed():
	if $ui/menu/vb/fl.pressed:
		global.inv.append("flashlight")
	else:
		global.inv.erase("flashlight")


func _on_ak_pressed():
	if $ui/menu/vb/ak.pressed:
		global.inv.append("ak47")
	else:
		global.inv.erase("ak47")


func _on_ih_pressed():
	global.ihealth = $ui/menu/vb/ih.pressed

func _on_is_pressed():
	global.istam = get_node("ui/menu/vb/is").pressed #\
# errors-disable

func _on_ia_pressed():
	global.iammo = $ui/menu/vb/ia.pressed

func blank():
	pass

func check_rooms():
	global.save()
	if "room1" in global.loaded_rooms:
		$ui/menu/vb/room1.pressed = true
	else:
		$ui/menu/vb/room1.pressed = false
	if "room2" in global.loaded_rooms:
		$ui/menu/vb/room2.pressed = true
	else:
		$ui/menu/vb/room2.pressed = false
	if "room3" in global.loaded_rooms:
		$ui/menu/vb/room3.pressed = true
	else:
		$ui/menu/vb/room3.pressed = false
	if "room4" in global.loaded_rooms:
		$ui/menu/vb/room4.pressed = true
	else:
		$ui/menu/vb/room4.pressed = false
	if "room5" in global.loaded_rooms:
		$ui/menu/vb/room5.pressed = true
	else:
		$ui/menu/vb/room5.pressed = false
	if "room6" in global.loaded_rooms:
		$ui/menu/vb/room6.pressed = true
	else:
		$ui/menu/vb/room6.pressed = false
	if "room7" in global.loaded_rooms:
		$ui/menu/vb/room7.pressed = true
	else:
		$ui/menu/vb/room7.pressed = false

func _on_room1_pressed():
	global.save()
	if "room1" in global.loaded_rooms:
		global.loaded_rooms.erase("room1")
	else:
		global.loaded_rooms.append("room1")
	global.reload()

func _on_room2_pressed():
	global.save()
	if "room2" in global.loaded_rooms:
		global.loaded_rooms.erase("room2")
	else:
		global.loaded_rooms.append("room2")
	global.reload()


func _on_room3_pressed():
	global.save()
	if "room3" in global.loaded_rooms:
		global.loaded_rooms.erase("room3")
	else:
		global.loaded_rooms.append("room3")
	global.reload()


func _on_room4_pressed():
	global.save()
	if "room4" in global.loaded_rooms:
		global.loaded_rooms.erase("room4")
	else:
		global.loaded_rooms.append("room4")
	global.reload()


func _on_room5_pressed():
	global.save()
	if "room5" in global.loaded_rooms:
		global.loaded_rooms.erase("room5")
	else:
		global.loaded_rooms.append("room5")
	global.reload()


func _on_room6_pressed():
	global.save()
	if "room6" in global.loaded_rooms:
		global.loaded_rooms.erase("room6")
	else:
		global.loaded_rooms.append("room6")
	global.reload()


func _on_room7_pressed():
	global.save()
	if "room7" in global.loaded_rooms:
		global.loaded_rooms.erase("room7")
	else:
		global.loaded_rooms.append("room7")
	global.reload()


func _on_end_pressed():
	global.dend = $ui/menu/vb/end.pressed
