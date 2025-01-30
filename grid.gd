class_name DiamondGrid extends GridContainer

var empty_cell_scene: PackedScene = preload("res://empty_cell.tscn")
var filled_cell_scene: PackedScene = preload("res://filled_cell.tscn")


func _ready() -> void:
	create_diamond(5)


func create_diamond(grid_size: int) -> void:
	# remove old child cells
	for child in get_children():
		child.queue_free()
	
	columns = grid_size
	
	# Check if the grid size is even
	if grid_size % 2 == 0:
		# as written, algorithm only works for odd numbers
		return
	
	# top row always only has 1 cell in it
	var cells_in_row: int = 1
	
	# Starts positive as we go up until we reach the width of the grid, then negative to go down
	var cell_increment: int = 2
	
	for row in range(0, grid_size):
		# grid_size and cells_in_row are always odd, so subtraction always makes an even number
		@warning_ignore("integer_division")
		var empty_cells_each_side: int = (grid_size - cells_in_row) / 2
		
		# empty cells on left
		for left_col in range(empty_cells_each_side):
			add_child(empty_cell_scene.instantiate())
		
		# filled cells in the middle
		for middle_col in range(cells_in_row):
			add_child(filled_cell_scene.instantiate())
		
		# empty cells on right
		for right_col in range(empty_cells_each_side):
			add_child(empty_cell_scene.instantiate())
		
		# if cells in row is the grid size, flip to decrement
		if cells_in_row == grid_size:
			cell_increment = -2
		
		cells_in_row += cell_increment
	
