extends Node2D

@export var health = 100
@export var maxHealth = 100

@onready var healthbar = get_parent().get_node("HealthBar")


var id = 0

@onready var movement = $Movement

@onready var bulletLauncherScene = preload("res://Scenes/DrugBullet.tscn")
@onready var thisScene = get_parent()
var bulletLauncher

@onready var shootTimer = $Shoot
var bullets = [bulletLauncherScene, bulletLauncherScene, bulletLauncherScene, bulletLauncherScene, bulletLauncherScene]

var currentPhase = 1

var isIdle = false

@onready var camera = get_parent().get_node("Camera2D/AnimationPlayer")

var isAlive = true

func _ready():
	healthbar.max_value = maxHealth
	healthbar.value = health
	pass





func _process(delta):
	
	if health < 1 and isAlive:
		isAlive = false
		Die()
		
	if currentPhase == 1 and health < 60:
		currentPhase = 2
		shootTimer.stop()
		isIdle = true
		$Movement.play("Idle")
		$Body/Mouth/Mouth.play("Smile")
	
	if currentPhase == 2 and health < 38:
		currentPhase = 3
		shootTimer.stop()
		isIdle = true
		$Movement.play("Intro")
		$Body/Mouth/Mouth.play("Laugh")
			
		
	if isIdle: 
		position.y -= 180 * delta
		


func _on_hurtbox_area_entered(area):
	if area.name == "PlayerHitbox":
		area.get_parent().queue_free()
		DamageDroguas()

func DamageDroguas():
	health -= 1
	healthbar.value = health
	$Body/Damage.play("Damage")

func Die():

	var ship = get_parent().get_node("Ship")
	
	ship.hurtbox.monitoring = false
	
	$Body/Mouth/Mouth/Die.play()
	$Hurtbox.monitoring = false
	$"Body/Eyes/Eye Sprite/Eyes".play("Dead")
	shootTimer.stop()
	Singleton.score += 1000
	camera.play("UnFlip")
	$Movement.play("Death")
	$Body/Mouth/Mouth.play("Dead")
	Singleton.music.stop()
	
	
	


func _on_movement_animation_finished(anim_name):
	healthbar.show()
	if anim_name == "Intro" and currentPhase == 1:
		$Movement.play("Dance")
		shootTimer.start()
	elif anim_name == "Idle":
		isIdle = false
		$Movement.play("Phase2")
	elif anim_name == "Intro" and currentPhase == 3:
		isIdle = false
		$Movement.play("Flip")
		$Body/Mouth/Mouth.play("Boom")
	elif anim_name == "Flip":
		$Body/Mouth/Mouth/Flip.play()
		camera.play("Flip")
		$Movement.play("FlipDone")
	elif anim_name == "FlipDone":
		$Movement/Laugh.play()
		$Movement.play("Dance")
		$Body/Mouth/Mouth.play("Laugh")
		shootTimer.start()
	elif anim_name == "Death":
		Singleton.inMenu = true
		get_tree().change_scene_to_file("res://Scenes/you_win.tscn")



func ShootDrugs():

	bullets[0] = bulletLauncherScene.instantiate()
	bullets[0].position = position
	thisScene.add_child(bullets[0])
	bullets[0].SetDirections(-2, 1)
	
	bullets[1] = bulletLauncherScene.instantiate()
	bullets[1].position = position
	thisScene.add_child(bullets[1])
	bullets[1].SetDirections(0, 1)	
	
	bullets[2] = bulletLauncherScene.instantiate()
	bullets[2].position = position
	thisScene.add_child(bullets[2])
	bullets[2].SetDirections(2, 1)

	bullets[3] = bulletLauncherScene.instantiate()
	bullets[3].position = position
	thisScene.add_child(bullets[3])
	bullets[3].SetDirections(1, 1)	
	
	bullets[4] = bulletLauncherScene.instantiate()
	bullets[4].position = position
	thisScene.add_child(bullets[4])
	bullets[4].SetDirections(-1, 1)		
	
	GiveBulletIDs()



func GiveBulletIDs():
	var bulletCount = bullets.size()
	for i in bulletCount:
		bullets[i].GiveID(i)







func _on_shoot_timeout():
	ShootDrugs()
