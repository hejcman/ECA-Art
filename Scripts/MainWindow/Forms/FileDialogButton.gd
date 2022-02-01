extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	 self.connect("pressed", self, "_button_pressed")

func _button_pressed():
	var dialog = get_parent().get_node("FileDialog")
	dialog.popup()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FileDialog_file_selected(path):
	self.text = path
