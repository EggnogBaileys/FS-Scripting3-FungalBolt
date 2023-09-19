extends Control

@onready var scoreText = $Score
@onready var deathText = $Deaths
@onready var timer = $Timer


var currentScore
var currentDeaths

var isScoreMoved = false


var minutes = 0
var seconds = 0

var timeCheck
var secondChange = 1

var stopTime = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#minutes = Singleton.timeTaken / 60
	
	currentScore = Singleton.score
	scoreText.text = (str(Singleton.score))
	currentDeaths = Singleton.playerDeaths
	deathText.text = (str(Singleton.playerDeaths))
	if Singleton.score > 999: 
		scoreText.position.x += 4
	timer.text = (str(minutes) + ":" + str(seconds))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if currentScore != Singleton.score:
		UpdateScore()
	if currentDeaths != Singleton.playerDeaths:
		UpdateDeaths()
		

	
	Singleton.timeTaken	+= delta
	
	timeCheck = fmod(Singleton.timeTaken, 9999)
	
	if timeCheck > secondChange:
		secondChange += 1
		seconds += 1
	
	if seconds == 59:
		seconds = 0 
		minutes += 1
	
	if stopTime == false:
		PrintSeconds()
		




func PrintSeconds():
	if seconds < 10:
		timer.text = (str(minutes) + ":0" + str(seconds))

	else:
		timer.text = (str(minutes) + ":" + str(seconds))
		
	if Singleton.inMenu: 
		await get_tree().create_timer(1).timeout
		stopTime = true



func UpdateScore():
	currentScore = Singleton.score
	scoreText.text = (str(Singleton.score))
	if Singleton.score > 999 and not isScoreMoved: 
		scoreText.position.x += 4
		isScoreMoved = true


func UpdateDeaths():
	currentDeaths = Singleton.playerDeaths
	deathText.text = (str(Singleton.playerDeaths))
