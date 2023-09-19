extends Node

var inMenu = true
var currentLevel = 1

var playerDeaths = 0

var timeTaken = 0


var isPlayerDead = false  
var newPlayer = false

@onready var shipScene = preload("res://Scenes/Ship.tscn")
@onready var thisScene = get_node("/root/Level")
var ship

@onready var music = $Music
@onready var musicPlayer = $Music/MusicPlayer


var bossTheme = load("res://Audio/Music/El Droguas.mp3")
var fungalCave = load("res://Audio/Music/Fungal Cave.mp3")
var menuTheme = load("res://Audio/Music/Menu.mp3")

var score = 000





func _ready():	
	if inMenu != true:
		if get_node("/root/Level/Ship") != null:
			ship = get_node("/root/Level/Ship")
	

func _process(_delta):
	
	if isPlayerDead == true:
		RespawnPlayer()
		pass


func RespawnPlayer():
	isPlayerDead = false 
	$RespawnTimer.start()
	print("Player is dead")



func _on_respawn_timer_timeout():
	ship = shipScene.instantiate()
	ship.position = Vector2(100, 200)
	thisScene.add_child(ship)
	newPlayer = true
