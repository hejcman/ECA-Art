extends Control

var _current_row = 0
var _color_button_path = "../../../PanelContainer/HBoxContainer/Rule"
var _play_button_path = "../../../PanelContainer/HBoxContainer/Play"
var _system_viewport_path = "../../../.."

var img = Image.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	img.create(
		get_node(_system_viewport_path).width,
		get_node(_system_viewport_path).height,
		false,
		Image.FORMAT_RGBA8
	)
	img.fill(
		get_node(_system_viewport_path).background
	)
	_insert_seed()
	_update_texture()


func _increment_row():
	_current_row = (_current_row + 1) % int(img.get_size().y)
	if _current_row == 0:
		get_node(_system_viewport_path).playing = get_node(_system_viewport_path).continuous
		get_node(_play_button_path).pressed = false


func _update_texture():
	var texture = ImageTexture.new()
	texture.create_from_image(img)
	self.texture = texture


func _eval_rule(parents: Vector3) -> Color:

	var left = false
	var right = false
	var center = false

	var threshold = get_node(_system_viewport_path).color_threshold

	if parents.x >= threshold:
		left = true
	if parents.y >= threshold:
		center = true
	if parents.z >= threshold:
		right = true

	if left && right && center: # 111
		return get_node(_color_button_path + "7").color
	elif left && right && not center: # 110
		return get_node(_color_button_path + "6").color
	elif left && not right && center: # 101
		return get_node(_color_button_path + "5").color
	elif not left && right && center: # 011
		return get_node(_color_button_path + "4").color
	elif left && not right && not center: # 100
		return get_node(_color_button_path + "3").color
	elif not left && right && not center: # 010
		return get_node(_color_button_path + "2").color
	elif not left && not right && center: # 001
		return get_node(_color_button_path + "1").color
	elif not left && not right && not center: # 000
		return get_node(_color_button_path + "0").color
	else:
		return Color.black


func _on_Timer_timeout():
	
	if not get_node(_system_viewport_path).playing:
		return
	
	# Getting the two row indexes, the first to decide how to fill the second.
	var previous_row = _current_row
	_increment_row()
	var current_row = _current_row
	
	if not get_node(_system_viewport_path).playing:
		return
	
	img.lock()
	for x in range(img.get_size().x):
		var parents = Vector3()
		parents.y = img.get_pixel(x, previous_row).v
		if x <= 0:
			parents.x = 0.0
			parents.z = img.get_pixel(x+1, previous_row).v
		elif x >= self.rect_size.x-1:
			parents.x = img.get_pixel(x-1, previous_row).v
			parents.z = 0.0
		else:
			parents.x = img.get_pixel(x-1, previous_row).v
			parents.z = img.get_pixel(x+1, previous_row).v
		
		# Setting the new color
		var new_color = _eval_rule(parents)
		img.set_pixel(x, current_row, new_color)
	img.unlock()
	_update_texture()


func _on_SpeedSlider_value_changed(value):
	var timer = self.get_node("Timer")
	timer.wait_time = value
	timer.start(value)


func _insert_seed():
	img.lock()
	for x in range(img.get_size().x):
		
		img.set_pixel(x, _current_row, get_node(_system_viewport_path).get_random_rule_color())
	img.unlock()
