extends Node

signal on_game_started # Emited When Game Is Started

func add_item(item_name:String, item_type:String, item_obj:Node): # Adds an item to the game
	pass

func add_save_menu_opt(value_name:String, type:String) -> Node: # (Requires full_game:true in mod config) (Enables Modded Save!) Adds a option to save. Supported types: bool
	return null

func add_save_dict_to_save(save_extras:Dictionary): # (full_game:true Recomended in mod config) (Enables Modded Save! May Break Other Mods!)
	pass

func add_quest(quest:Dictionary): # Adds a quest
	pass

func replace_questline(questline:Array): # Replaces questline
	pass

func set_env(enviorment:Environment, permanent:bool=true): # Sets Enviorment
	pass

func set_efficency(enabled:bool): # Sets Efficency Mode
	pass

func set_held_item(item_name:String): # Sets Held Item
	pass
