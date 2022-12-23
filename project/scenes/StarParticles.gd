extends Particles


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translation.x = get_parent().get_node("Player").translation.x;
	translation.z = get_parent().get_node("Player").translation.z;
