extends Camera2D

var zoomSpeed: float = 0.05
var zoomMin: float = 0.001
var zoomMax: float = 2.0
var dragSensitivity: float = 1.0

func _input(event):
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
		#divide pelo zoom para a movimentação não ficar muito rapida ou lenta dependendo do zoom
		position -= event.relative * dragSensitivity / zoom
	if event.is_action_pressed("zoom_in"):
		zoom += Vector2(zoomSpeed, zoomSpeed)
	elif event.is_action_pressed("zoom_out"):
		zoom -= Vector2(zoomSpeed, zoomSpeed)
	zoom = clamp(zoom, Vector2(zoomMin, zoomMin), Vector2(zoomMax, zoomMax))
