extends Node3D

var kpi_questline_enabled = false

var potato = load("res://mods/kpi/src/models/potato.tscn").instantiate()

var kpi_questline = [{
	"name":"The Kyle Potato",
	"map":"floor1",
	"segments":[{
		"name":"Talk to the potato",
		"color":"blue",
		"orb":false,
		"type":"talk"
	}]
}]

var questline_opt

func _ready():
	questline_opt = Game.add_save_menu_opt("Kyle Potato Questline", "bool")
	questline_opt.pressed.connect(self.questline_opt_pressed)
	Game.on_game_started.connect(self.on_game_start)


func _process(delta):
	pass


func on_game_start():
	Game.add_item("potato", "quest_item", potato)
	if kpi_questline_enabled:
		Game.set_held_item("potato")
		Game.replace_questline(kpi_questline)


func questline_opt_pressed():
	kpi_questline_enabled = questline_opt.button_pressed
