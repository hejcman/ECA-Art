extends Camera2D

const MAX_ZOOM_LEVEL = 0.5
const MIN_ZOOM_LEVEL = 4.0
const ZOOM_INCREMENT = 0.05

signal moved()
signal move_start()
signal move_end()

signal zoomed()

var _current_zoom_level = 1
var _drag = false

var _movable = false

func _ready():
	self.set_position(Vector2(
		get_parent().size.x/2,
		get_parent().size.y/2
	))

func _input(event):
	
	if not _movable:
		return

	if event.is_action_pressed("cam_drag"):
		emit_signal("move_start")
		_drag = true
	elif event.is_action_released("cam_drag"):
		emit_signal("move_end")
		_drag = false
	elif event.is_action("cam_zoom_in"):
		_update_zoom(-ZOOM_INCREMENT, get_local_mouse_position())
	elif event.is_action("cam_zoom_out"):
		_update_zoom(ZOOM_INCREMENT, get_local_mouse_position())
	elif event is InputEventMouseMotion && _drag:
		set_offset(get_offset() - event.relative*_current_zoom_level)
		emit_signal("moved")

func _update_zoom(incr, zoom_anchor):
	var old_zoom = _current_zoom_level
	_current_zoom_level += incr
	if _current_zoom_level < MAX_ZOOM_LEVEL:
		_current_zoom_level = MAX_ZOOM_LEVEL
	elif _current_zoom_level > MIN_ZOOM_LEVEL:
		_current_zoom_level = MIN_ZOOM_LEVEL
	if old_zoom == _current_zoom_level:
		return
	
	var zoom_center = zoom_anchor - get_offset()
	var ratio = 1-_current_zoom_level/old_zoom
	set_offset(get_offset() + zoom_center*ratio)
	
	set_zoom(Vector2(_current_zoom_level, _current_zoom_level))
	emit_signal("zoomed")


func _on_ViewportContainer_mouse_entered():
	_movable = true


func _on_ViewportContainer_mouse_exited():
	_movable = false


func _on_ViewportContainer_focus_entered():
	_movable = true


func _on_ViewportContainer_focus_exited():
	_movable = false
