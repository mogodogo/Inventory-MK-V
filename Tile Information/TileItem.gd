class_name Tile
extends Object

const TileSize : int = 25

static func SnapToGrid(position : Vector2) -> Vector2i:
	return round(position / TileSize) * TileSize

static func GridToPosition(position : Vector2i) -> Vector2i:
	return position * TileSize
