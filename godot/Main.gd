extends Node2D

var _is_server_mode := false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const SERVER_FLAG = "--server"

const MyProto = preload("res://protobuff_out/game_server.gd")


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
		_register_server()
		# No other functionality to provide yet, so quit to free resources.
		
	else:
		print("is not server")
		
func _register_server():
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.connect("request_completed", self, "_on_request_completed")
	var error = http_request.request("http://localhost:8080/game-server2", [], true, HTTPClient.Method_PUT)
	if error != OK:
		push_error("An error ocurred in the HTTP request.")
		print("error making request")
		get_tree().quit()

	print("registering")

func _on_request_completed(result, response_code, headers, body):
	if result != HTTPRequest.RESULT_SUCCESS:
		push_error("Error communicating with server")
		get_tree().quit()
	var message = MyProto.GameServer.new()
	var result_code = message.from_bytes(body)
	if result_code == MyProto.PB_ERR.NO_ERRORS:
		print("Got result: OK")
	else:
		push_error("An error occurred demarshalling a GameServer protobuff")
		get_tree().quit()
	var message_id = message.get_id()
	print("id: %s" % message_id)
	print("created_time: %d" % message.get_created_time())
	get_tree().quit()
