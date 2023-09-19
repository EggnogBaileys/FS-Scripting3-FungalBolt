extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Singleton.inMenu = true
	Singleton.music.stream = Singleton.menuTheme
	Singleton.music.play()




func _on_quit_pressed():
	get_tree().quit()



func _on_restart_pressed():
	Singleton.currentLevel = 1
	Singleton.score = 0 
	Singleton.playerDeaths = 0
	Singleton.timeTaken = 0
	Singleton.inMenu = false
	get_tree().change_scene_to_file("res://Scenes/Testing.tscn")
