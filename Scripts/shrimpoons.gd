extends Node2D

@export var health = 3

@onready var ship = get_parent().get_node("Ship")


var id = 0


@onready var enemySpawner = get_parent().get_node("Enemy Spawner")




func _process(_delta):
	
	if health < 1:
		Die()
	


func _on_shrimpoon_area_entered(area):
	if area.name == "PlayerHitbox":
		area.get_parent().queue_free()
		DamageShrimp()
		

func DamageShrimp():
	health -= 1
	if health > 0:
		$Sprite2D/Damage.play("Damage")
	else:
		Singleton.score += 20
	
	
func Die():
	
	$Sprite2D/Movement.play("Death")
	
	await get_tree().create_timer(0.5).timeout

	var notDespawned = true
	
	while notDespawned:
		
		for i in range(enemySpawner.enemies.size()):
			if !range(enemySpawner.enemies.size()).has(id):
				id -=1
			else:
				notDespawned = false
			
	enemySpawner.enemies.remove_at(id)
	queue_free()




# Enemy Spawner gives this enemy an ID.
func GiveID(yourId):
	id = yourId

