#---------------Grid--------------
class_name Grid
extends Node2D

#width e height serao o tamanho do grid nas cells
#cell_size e o tamanho de cada cell em pixels
@export var width: int = 12
@export var height: int = 12
@export var cell_size: int = 128

#vai ter Vector2 keys que correspondem a posicoes na cell e salva o que estiver naquela cell
var grid: Dictionary = {}

@export var show_debug: bool = false
#Vector(0,1...)
func generateGrid():
	for x in width:
		for y in height:
			grid[Vector2(x,y)] = null
			#Mostra os grids na tela ao ativar Show Debug no Grid
			if show_debug:
				var rect = ReferenceRect.new()
				rect.position = gridToWorld(Vector2(x,y))
				rect.size = Vector2(cell_size, cell_size)
				rect.editor_only = false
				add_child(rect)
				var label = Label.new()
				label.position = gridToWorld(Vector2(x,y))
				label.text = str(Vector2(x,y))
				add_child(label)

#helper function
#a primeira pega uma posicao como input e multiplica para retornar a posicao em pixels
#a segunda pega uma posicao como input e divide para retornar a posicao no grid
#floor arredonda pra baixo
func gridToWorld(_pos: Vector2) -> Vector2:
	return floor(_pos * cell_size)
func worldToGrid(_pos: Vector2) -> Vector2:
	return floor(_pos / cell_size)
#---------------Grid--------------
