extends Navigation

#the enemy- will extend to enemies
onready var enemies = get_tree().get_nodes_in_group('enemies')

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#give every enemy the path if it does nt have it
	for enemy in enemies:
		if enemy.has_path == false:
			enemy.get_new_path(get_simple_path(enemy.translation,Vector3.ZERO))
	
