extends Node2D

@export var health = 6

@onready var ship = get_parent().get_node("Ship")

@onready var gun = get_node("Sprite2D/GunSprite")

var id = 0


@onready var bulletScene = preload("res://Scenes/Shroom_bullet.tscn")
@onready var thisScene = get_parent()
var bullet

@onready var shroomsplosionScene = preload("res://Scenes/shroom_go_bye_bye.tscn")
var shroomsplosion

var isTrackingPlayer = true


@onready var enemySpawner = get_parent().get_node("Enemy Spawner")



func _ready():
	$Sprite2D/GunSprite/ShootDelay.start()



func _process(_delta):
	
	if health < 1:
		Die()
		
	if isTrackingPlayer == false:
		RetrackPlayer()

	if get_parent().get_node("Ship") == null and isTrackingPlayer == true:
		isTrackingPlayer = false
		


func _on_shoot_delay_timeout():
	if ship != null:
		Shoot()


func Shoot():
	$Sprite2D/GunSprite/ShroomShoot.play("Shoot")
	bullet = bulletScene.instantiate()
	bullet.position = position
	bullet.position.y += 18
	bullet.position.x += 9
	thisScene.add_child(bullet)


func _on_hurtbox_area_entered(area):
	if area.name == "PlayerHitbox":
		area.get_parent().queue_free()
		DamageShroom()
		

func DamageShroom():
	health -= 1
	$Sprite2D/DamageShroom.play("Damage")
	
	
func Die():
	
	Singleton.score += 100
	
	var notDespawned = true
	
	while notDespawned:
		
		for i in range(enemySpawner.enemies.size()):
			if !range(enemySpawner.enemies.size()).has(id):
				id -=1
			else:
				notDespawned = false
			
	enemySpawner.enemies.remove_at(id)
	
	shroomsplosion = shroomsplosionScene.instantiate()
	shroomsplosion.position = position
	thisScene.add_child(shroomsplosion)
	queue_free()

func RetrackPlayer():
	if get_parent().get_node("Ship") != null:
		ship = get_parent().get_node("Ship")
		gun.TrackNewShip()
		isTrackingPlayer = true

	#Singleton.newPlayer = false

# Enemy Spawner gives this enemy an ID.
func GiveID(yourId):
	id = yourId
