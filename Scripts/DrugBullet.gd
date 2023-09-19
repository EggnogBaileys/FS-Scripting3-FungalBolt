extends Node2D

var xDirection
var yDirection

var bulletSpeed = 1.18
var id = 0

@onready var droguas = get_parent().get_node("El Droguas")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	xDirection += delta * bulletSpeed
	yDirection += delta * bulletSpeed
	
	position += Vector2(xDirection, yDirection)
	
	if position.y > 290:
				
		queue_free()


func SetDirections(xDir, yDir):
	
	xDirection = xDir 
	yDirection = yDir



func GiveID(yourId):
	id = yourId

