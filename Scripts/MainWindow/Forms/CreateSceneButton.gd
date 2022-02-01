extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self, "_button_pressed")

func _button_pressed():
	# TODO: Check inputs
	var scene_name = get_parent().get_node("HBoxContainer/Form/NameForm").text
	var img_width = int(get_parent().get_node("HBoxContainer/Form/WidthForm").get_line_edit().text)
	var img_height = int(get_parent().get_node("HBoxContainer/Form/HeightForm").get_line_edit().text)
	var img_background = get_parent().get_node("HBoxContainer/Form/ColorPicker").color
	var img_path = get_parent().get_node("HBoxContainer/Form/FileDialogButton").text

	if scene_name == "" or img_path == "" or img_width == 0 or img_height == 0:
		self.get_node("WarningDialog").popup_centered()
	else:
		get_node("../../..").new_drawing(
			scene_name,
			img_width,
			img_height,
			img_background,
			img_path
		)
		get_node("../..").hide()
