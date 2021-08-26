extends Spatial

#turn to face stuff
export (NodePath) var target
export var turn_speed = 0.02
var target_object;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	target_object = get_node(target)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	var desired_transform = transform.looking_at(target_object.translation,Vector3.UP)
	transform = transform.interpolate_with(desired_transform,turn_speed)
