extends CharacterBody2D

var ACCELERATION = 1600
var SPEED = 160
var FRICTION = 1000 


@onready var bulletScene = preload("res://Scenes/PlayerBullet.tscn")
@onready var thisScene = get_parent()
var bullet

var positionToShootAt 

@onready var shipsplosionScene = preload("res://Scenes/ship_go_bye_bye.tscn")
var shipsplosion

@onready var invincibility = $Invincibility
@onready var hurtbox = $Area2D

var isShooting = false

func _ready():
	$Area2D.monitoring = false
	invincibility.start()
	position.y = 230


func _physics_process(delta):

	var input_vector = Vector2.ZERO

	input_vector.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	input_vector = input_vector.normalized()

	# IF MOVING
	if input_vector != Vector2.ZERO:
		
		velocity = velocity.move_toward(input_vector * SPEED, ACCELERATION * delta)
	
	# IF NOT MOVING
	else:
		
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	move_and_slide()
	
	if Input.is_action_pressed("Shoot") and !isShooting:
		Shoot()
		
		



func Shoot():
	$Shoot.play()
	$SpecialStateAnimator.play("Shoot")
	isShooting = true
	bullet = bulletScene.instantiate()
	bullet.position = position
	bullet.position.y -= 1
	thisScene.add_child(bullet)
	$ShootDelay.start()
	

func _on_timer_timeout():
	isShooting = false


func _on_area_2d_area_entered(area):
	if area.name == "EnemyHitbox":
		Die()
	elif area.name == "Shrimpoon":
		Die()
	elif area.name == "Hurtbox":
		Die()

func Die():
	
	Singleton.playerDeaths += 1
	
	Singleton.isPlayerDead = true
	shipsplosion = shipsplosionScene.instantiate()
	shipsplosion.position = position
	thisScene.add_child(shipsplosion)
	queue_free()


func _on_invincibility_timeout():
	$Area2D.monitoring = true
