@tool
class_name TiledItemContainer
extends ItemContainer

@export var Size : Vector2i: 
	set(value):
		size = Tile.GridToPosition(value)
		RectBox = Rect2i(Vector2i.ZERO, value)
		Size = value

@onready var DisplayContainer : Control = $DisplaysContainer



class TileItemData extends ItemData:
	var Position : Vector2i
	var Display : ItemDisplay
	func GetRect() -> Rect2i:
		return Rect2i(Position, resource.Size)
	func _init(item : Item, pos : Vector2i) -> void:
		resource = item
		Position = pos

var RectBox : Rect2i :
	get:
		return Rect2i(Vector2i.ZERO, Size)

func _ready() -> void:
	AddItem(TileItemData.new(load("uid://p5yndwyaw07m"), Vector2i.ZERO))
#add item both adds and checks if it can add an item, be careful whilst using it to avoid unforseen consequences
#use like so
#match AddItem(item):
# ItemContainer.Returntype.BoundingError:
# ...
func AddItem(AddedItem : ItemData) -> ReturnType:
	assert(AddedItem is TileItemData)
	var AddedCollider : Rect2i = AddedItem.GetRect()
	#checks if the item is within the bounding box of the inventory
	if not RectBox.encloses(AddedCollider):
		return ReturnType.BoundingError
	#checks if the item collides with any other items, and if so, returns a collision error
	for item : ItemData in Inventory:
		if AddedCollider.intersects(item.GetRect()) and not AddedCollider.encloses(item.GetRect()):
			return ReturnType.CollidingError
	#pushes the item into the inventory array, then instances a child display
	AddedItem.Display = ItemDisplay.NewDisplay(AddedItem.resource, Tile.GridToPosition(AddedItem.resource.Size))
	DisplayContainer.add_child(AddedItem.Display)
	Inventory.push_back(AddedItem)
	return ReturnType.Successful

func RemoveItem(RemovedItem : ItemData) -> ReturnType:
	assert(RemovedItem is TileItemData)
	RemovedItem.Display.queue_free()
	Inventory.erase(RemovedItem)
	return ReturnType.Successful
