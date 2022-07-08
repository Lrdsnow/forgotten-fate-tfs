extends Node
onready var pglobal = get_node("/root/Playerglobal")
func _ready():
	pglobal.inv.append("flashlight")
