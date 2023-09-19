extends Sprite2D

@onready var ship = get_parent().get_parent().get_parent().get_node("Ship")
#@onready var respawnTimer = get_parent().get_parent().get_node("TrackPlayerAferDeath")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if ship != null:
		look_at(ship.position)
		






func TrackNewShip():
	ship = get_parent().get_parent().get_parent().get_node("Ship")
