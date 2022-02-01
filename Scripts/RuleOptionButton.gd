extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(0, 256):
		self.add_item(str(x))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
