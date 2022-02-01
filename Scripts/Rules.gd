extends ColorPickerButton


# Called when the node enters the scene tree for the first time.
func _ready():
	self.color = get_node("../../../..").generate_random_color()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
