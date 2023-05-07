extends Node

const FILE_NAME = "user://game-data.json"
var Score = 0
var Record = 0
var coins = 0
var callback_rewarded_ad = JavaScript.create_callback(self, '_rewarded_ad')
var callback_ad = JavaScript.create_callback(self, '_ad')
onready var win = JavaScript.get_interface("window")

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_FOCUS_IN: AudioServer.set_bus_mute(0, false)
	elif what == MainLoop.NOTIFICATION_WM_FOCUS_OUT: AudioServer.set_bus_mute(0, true)

func js_show_ad():
	win.ShowAd(callback_ad)
	pass
# Здесь можно приостановить музыку / звуки
func js_show_rewarded_ad():
	win.ShowAdRewardedVideo(callback_rewarded_ad)
# Здесь можно приостановить музыку / звуки
func _rewarded_ad(args):
	print(args[0])
	coins += 10
# Здесь можно возобновить музыку / звуки
func _ad(args):
	print(args[0])
# Здесь можно возобновить музыку / звуки

func save(saveJson):
	var file = File.new()
	file.open(FILE_NAME, File.WRITE)
	file.store_string(to_json(saveJson))
	file.close()

func load():
	var file = File.new()
	if file.file_exists(FILE_NAME):
		file.open(FILE_NAME, File.READ)
		var data = parse_json(file.get_as_text())
		print(data)
		Record = data.score
		file.close()
	else:
		print("No saved data!")
