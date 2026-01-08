@abstract
class_name Item
extends Resource

const TileSize : int = 25

@export_category("Item Internal Data")
@export var Name : String
@export var Size : Vector2i
@export var Icon : Texture2D
@export_range(1, 99, 1, "or_greater")  var Stack : int
@export_range(1, 99, 1, "or_greater") var StackLimit : int
@export var Scene : PackedScene

static func SnapToGrid(position : Vector2) -> Vector2i:
	return round(position / TileSize) * TileSize

static func GridToPosition(position : Vector2i) -> Vector2i:
	return position * TileSize

func GetDisplay() -> Texture2D:
	if Icon:
		return Icon
	else:
		return null #replace with a sideways view of scene
