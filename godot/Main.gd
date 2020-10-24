extends Node2D

var _is_server_mode := false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const SERVER_FLAG = "--server"


# Called when the node enters the scene tree for the first time.
func _ready():
	_sync_game_mode()


# Synchronizes the game mode from command line arguments.
func _sync_game_mode():
	var args: PoolStringArray
	args = OS.get_cmdline_args()
	if SERVER_FLAG in args:
		print("is server")
		_is_server_mode = true
		# No other functionality to provide yet, so quit to free resources.
		get_tree().quit()
	else:
		print("is not server")
