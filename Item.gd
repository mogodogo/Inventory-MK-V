@abstract
class_name Item
extends Resource

const TileSize : int = 25

@export_category("Item Internal Data")
@export var Name : String
@export var Size : Vector2i
@export var Icon : Texture2D
@export var Stack : int
@export var StackLimit : int
@export var Scene : PackedScene

static func SnapToGrid(position : Vector2) -> Vector2i:
	return round(position / TileSize) * TileSize

static func GridToPosition(position : Vector2i) -> Vector2i:
	return position * TileSize
