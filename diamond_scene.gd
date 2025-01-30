extends MarginContainer

@onready var diamond_grid: DiamondGrid = %DiamondGrid
@onready var grid_width_slider: HSlider = %GridWidthSlider
@onready var slider_value_label: Label = %SliderValueLabel


func _ready() -> void:
	grid_width_slider.value_changed.connect(_on_grid_width_changed)


func _on_grid_width_changed(slider_value: float) -> void:
	var new_value: int = int(slider_value)
	
	slider_value_label.text = str(new_value)
	diamond_grid.create_diamond(new_value)
