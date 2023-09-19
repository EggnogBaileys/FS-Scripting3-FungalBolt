extends CharacterBody2D


var bulletGoHere

var ACCELERATION = 500
var MAX_SPEED = 200

var xOffset = 0
var yOffset = 0

var spawnPos = Vector2(0, 0)



@onready var ship = get_parent().get_node("Ship")


func _ready():
	if ship != null:
		

		xOffset = spawnPos.x - ship.position.x
		yOffset = spawnPos.y  
		
		var P1 = pow(yOffset,2)
		var P2 = pow(xOffset,2)
		var Hyp = sqrt(P1 + P2)
					
		bulletGoHere = Vector2(Hyp, ship.position.y + 25)

func _process(delta):

	# BULLET TRAVEL

	velocity = (bulletGoHere - position).normalized()*MAX_SPEED
	position += velocity * delta
	look_at(bulletGoHere)
	

	
	# DESTROY BULLET IF IT'S OFF-SCREEN
	if position.y >= 253:
		$Explosion.show()
		$Explosion/AnimationPlayer.play("Explosion")


func DetectShipPos():
	if ship.position.x > 70 and ship.position.x < 130:
		xOffset = 0
	elif ship.position.x < 70:
		xOffset = -10
	elif ship.position.x < 30:
		xOffset = -35
	elif ship.position.x > 130:
		xOffset = 10
	elif ship.position.x > 170:
		xOffset = 35





func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Explosion":
		queue_free()
