extends Node2D

@export var bulletSpeed = 400;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= bulletSpeed * delta
	
	if position.y <= -5:
		queue_free()
