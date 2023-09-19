extends Node2D

var levelSection = 1

@onready var shroomScene = preload("res://Scenes/Shroom_dude.tscn")
@onready var shrimpScene = preload("res://Scenes/shrimpoons.tscn")
@onready var thisScene = get_parent()
var shroom
var enemies = []
var enemySpawned = false

var spawnNumber = 0

var elDroguas


func _ready():
	
	Singleton.thisScene = get_node("/root/Level")

	if Singleton.currentLevel == 1:
		
		Singleton.music.volume_db = -6
		Singleton.music.stream = Singleton.fungalCave
		Singleton.music.play()
		
		spawnNumber = 0
		
		await get_tree().create_timer(3.5).timeout

		enemies.append(shroomScene.instantiate())
		enemies[spawnNumber].position = Vector2(100,40)
		thisScene.add_child.call_deferred(enemies[spawnNumber])
		GiveEnemyIDs()
		enemySpawned = true

	if Singleton.currentLevel == 2:
		
		spawnNumber = 0
		
		await get_tree().create_timer(3.5).timeout

		while enemies.size() != spawnNumber:
			spawnNumber -= 1

		enemies.append(shrimpScene.instantiate())
		enemies[spawnNumber].position = Vector2(0,0)
		thisScene.add_child.call_deferred(enemies[spawnNumber])

		GiveEnemyIDs()
		
		spawnNumber+=1 

		await get_tree().create_timer(0.5).timeout

		while enemies.size() != spawnNumber:
			spawnNumber -= 1

		enemies.append(shrimpScene.instantiate())
		enemies[spawnNumber].position = Vector2(0,0)
		thisScene.add_child.call_deferred(enemies[spawnNumber])

		GiveEnemyIDs()
		
		spawnNumber+=1 

		await get_tree().create_timer(0.5).timeout

		while enemies.size() != spawnNumber:
			spawnNumber -= 1

		enemies.append(shrimpScene.instantiate())
		enemies[spawnNumber].position = Vector2(0,0)
		thisScene.add_child.call_deferred(enemies[spawnNumber])

		GiveEnemyIDs()
		
		spawnNumber+=1 	
		
		await get_tree().create_timer(1.5).timeout

		while enemies.size() != spawnNumber:
			spawnNumber -= 1

		enemies.append(shrimpScene.instantiate())
		enemies[spawnNumber].position = Vector2(0,0)
		thisScene.add_child.call_deferred(enemies[spawnNumber])

		GiveEnemyIDs()	
		
		spawnNumber+=1 	
		
		await get_tree().create_timer(0.5).timeout

		while enemies.size() != spawnNumber:
			spawnNumber -= 1

		enemies.append(shrimpScene.instantiate())
		enemies[spawnNumber].position = Vector2(0,0)
		thisScene.add_child.call_deferred(enemies[spawnNumber])

		GiveEnemyIDs()
		
		spawnNumber+=1 
		
		await get_tree().create_timer(0.5).timeout

		while enemies.size() != spawnNumber:
			spawnNumber -= 1

		enemies.append(shrimpScene.instantiate())
		enemies[spawnNumber].position = Vector2(0,0)
		thisScene.add_child.call_deferred(enemies[spawnNumber])
		
		GiveEnemyIDs()
		
		enemySpawned = true		
		
	if Singleton.currentLevel == 3: 
		
		await get_tree().create_timer(3.5).timeout
		
		elDroguas = get_parent().get_node("El Droguas")
		elDroguas.movement.play("Intro")
		
		await get_tree().create_timer(1.0).timeout
		
		print("lesgo")
		
		Singleton.music.volume_db = -6
		Singleton.music.stream = Singleton.bossTheme
		Singleton.music.play()




# When no more enemies are present, head to the next section.
func _process(_delta):
	if enemies.size() == 0 and enemySpawned:
		NextLevelSection()





func GiveEnemyIDs():
	var enemyCount = enemies.size()
	for i in enemyCount:
		enemies[i].GiveID(i)






func NextLevelSection():
	
	enemySpawned = false
	levelSection += 1
	
	if Singleton.currentLevel == 1:
		
		if levelSection == 2:
			
			spawnNumber = 0
			
			await get_tree().create_timer(1).timeout
			
			enemies.append(shroomScene.instantiate())
			enemies[spawnNumber].position = Vector2(50,40)
			thisScene.add_child(enemies[spawnNumber])
			
			GiveEnemyIDs()
			spawnNumber+=1 
			
			await get_tree().create_timer(1).timeout
			
			enemies.append(shroomScene.instantiate())
			enemies[spawnNumber].position = Vector2(150,40)
			thisScene.add_child(enemies[spawnNumber])
			
			GiveEnemyIDs()
			
				
		elif levelSection == 3:
			
			spawnNumber = 0
			
			await get_tree().create_timer(1).timeout
			
			enemies.append(shroomScene.instantiate())
			enemies[spawnNumber].position = Vector2(100,30)
			thisScene.add_child(enemies[spawnNumber])
			
			GiveEnemyIDs()
			spawnNumber+=1 
			
			await get_tree().create_timer(0.5).timeout
			
			enemies.append(shroomScene.instantiate())
			enemies[spawnNumber].position = Vector2(40,45)
			thisScene.add_child(enemies[spawnNumber])
			
			GiveEnemyIDs()
			spawnNumber+=1 
		
			await get_tree().create_timer(0.5).timeout
			
			enemies.append(shroomScene.instantiate())
			enemies[spawnNumber].position = Vector2(160,45)
			thisScene.add_child(enemies[spawnNumber])
			
			GiveEnemyIDs()	
			spawnNumber+=1 
		
			await get_tree().create_timer(1).timeout
			
			while enemies.size() != spawnNumber:
				spawnNumber -= 1
			
			enemies.append(shroomScene.instantiate())
			enemies[spawnNumber].position = Vector2(100,65)
			thisScene.add_child(enemies[spawnNumber])
			
			GiveEnemyIDs()	


		elif levelSection == 4:
			
			await get_tree().create_timer(1.5).timeout
	
			Singleton.currentLevel += 1
			get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
			
			
			
	elif Singleton.currentLevel == 2:
		
		if levelSection == 2: 
			
			
			spawnNumber = 0
			
			await get_tree().create_timer(0.5).timeout
			
			enemies.append(shrimpScene.instantiate())
			enemies[spawnNumber].position = Vector2(0,0)
			thisScene.add_child(enemies[spawnNumber])
			
			GiveEnemyIDs()	
			spawnNumber+=1 
			
			await get_tree().create_timer(0.3).timeout
			
			while enemies.size() != spawnNumber:
				spawnNumber -= 1
			
			enemies.append(shrimpScene.instantiate())
			enemies[spawnNumber].position = Vector2(0,0)
			thisScene.add_child(enemies[spawnNumber])
			
			GiveEnemyIDs()	
			spawnNumber+=1 	

			await get_tree().create_timer(0.5).timeout

			while enemies.size() != spawnNumber:
				spawnNumber -= 1
	
			enemies.append(shroomScene.instantiate())
			enemies[spawnNumber].position = Vector2(100,30)
			thisScene.add_child(enemies[spawnNumber])
			
			GiveEnemyIDs()
			spawnNumber+=1 
			
			await get_tree().create_timer(0.5).timeout
		
			while enemies.size() != spawnNumber:
				spawnNumber -= 1
			
			enemies.append(shroomScene.instantiate())
			enemies[spawnNumber].position = Vector2(40,45)
			thisScene.add_child(enemies[spawnNumber])
			
			GiveEnemyIDs()
			spawnNumber+=1 
		
			await get_tree().create_timer(0.5).timeout
			
			while enemies.size() != spawnNumber:
				spawnNumber -= 1
			
			enemies.append(shroomScene.instantiate())
			enemies[spawnNumber].position = Vector2(160,45)
			thisScene.add_child(enemies[spawnNumber])
			
			GiveEnemyIDs()	
			spawnNumber+=1 
		
			await get_tree().create_timer(0.5).timeout
		
			while enemies.size() != spawnNumber:
				spawnNumber -= 1
			
			enemies.append(shrimpScene.instantiate())
			enemies[spawnNumber].position = Vector2(0,0)
			thisScene.add_child(enemies[spawnNumber])
			
			GiveEnemyIDs()	
			spawnNumber+=1 
			
			await get_tree().create_timer(0.3).timeout
			
			while enemies.size() != spawnNumber:
				spawnNumber -= 1
			
			enemies.append(shrimpScene.instantiate())
			enemies[spawnNumber].position = Vector2(0,0)
			thisScene.add_child(enemies[spawnNumber])
			
			GiveEnemyIDs()	
			spawnNumber+=1 	
			

			await get_tree().create_timer(1).timeout
			
			while enemies.size() != spawnNumber:
				spawnNumber -= 1
			
			enemies.append(shrimpScene.instantiate())
			enemies[spawnNumber].position = Vector2(0,0)
			thisScene.add_child(enemies[spawnNumber])
			
			GiveEnemyIDs()	
			spawnNumber+=1 	
			
			await get_tree().create_timer(0.3).timeout
			
			while enemies.size() != spawnNumber:
				spawnNumber -= 1
			
			enemies.append(shrimpScene.instantiate())
			enemies[spawnNumber].position = Vector2(0,0)
			thisScene.add_child(enemies[spawnNumber])
			
			GiveEnemyIDs()


		if levelSection == 3: 
			
			Singleton.musicPlayer.play("Fadeout")

			await get_tree().create_timer(1.0).timeout
	
			Singleton.currentLevel += 1
			get_tree().change_scene_to_file("res://Scenes/level_3.tscn")
			
			
			

		
		
	enemySpawned = true
	
	
	
	



