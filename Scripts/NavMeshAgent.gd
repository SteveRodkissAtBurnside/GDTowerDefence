extends Spatial

var path = []
var has_path = false
var destination = Vector3.ZERO
var current_waypoint = 0
export var speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_new_path(new_path):
	has_path = true
	path = new_path
	destination = path[current_waypoint]
	print(new_path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if we have the path follow it
	if has_path == true:
		move_along_path(delta)


func move_along_path(delta):
	destination = path[current_waypoint]
	var direction = (destination - translation).normalized()
	translate(direction*delta*speed)
	var d = translation.distance_to(destination)
	if d < 0.1:
		#move on to next one
		current_waypoint+=1
		#and loop if gone to end for now
		current_waypoint %= path.size()
