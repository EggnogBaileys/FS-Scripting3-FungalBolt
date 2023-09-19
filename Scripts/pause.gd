extends Node2D

var isPaused = false

@onready var pauseText = $"Pause Screen"


# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Singleton.inMenu == false:
		if Input.is_action_just_pressed("Pause"):
			if isPaused:
				isPaused = false
				pauseText.hide()
				get_tree().paused = false
			else:
				isPaused = true
				pauseText.show()
				get_tree().paused = true



func _on_button_pressed():
	isPaused = false
	pauseText.hide()
	get_tree().paused = false
	Singleton.score = 0
	Singleton.currentLevel = 1
	Singleton.timeTaken = 0
	Singleton.playerDeaths = 0
	Singleton.inMenu = true 
	isPaused = false
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")


func _on_resume_pressed():
	isPaused = false
	pauseText.hide()
	get_tree().paused = false
