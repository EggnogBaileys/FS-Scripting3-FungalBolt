extends Control

@onready var startButtonAnim = $Start
@onready var quitButtonAnim = $Quit


# Called when the node enters the scene tree for the first time.
func _ready():
	Singleton.inMenu = true
	Singleton.music.stream = Singleton.menuTheme
	Singleton.music.play()








func _on_start_pressed():
	Singleton.inMenu = false
	get_tree().change_scene_to_file("res://Scenes/Testing.tscn")




func _on_quit_pressed():
	get_tree().quit()
