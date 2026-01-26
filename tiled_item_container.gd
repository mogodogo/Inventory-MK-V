@tool
class_name TiledItemContainer
extends ItemContainer

@export var Size : Vector2i: 
	set(value):
		size = Item.GridToPosition(value)
		RectBox = Rect2i(Vector2i.ZERO, value)
		Size = value

@onready var DisplayContainer : Control = $DisplaysContainer

class TileItemData extends ItemData:
	var Position : Vector2i
	func GetRect() -> Rect2i:
		return Rect2i(Position, resource.Size)

var RectBox : Rect2i

##add item both adds and checks if it can add an item, be careful whilst using it to avoid unforseen consequences
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
	#pushes the item into the inventory array, then instanciates a child display
	Inventory.push_back(AddedItem)
	DisplayContainer.add_child(ItemDisplay.NewDisplay(AddedItem.resource))
	return ReturnType.Successful

func RemoveItem(RemovedItem : ItemData) -> ReturnType:
	assert(RemovedItem is TileItemData)
	
	Inventory.erase(RemovedItem)
	return ReturnType.Successful

func EditItem(EditedItem : ItemData, ItemEditData : ItemData) -> ReturnType:
	assert(EditedItem is TileItemData)
	assert(ItemEditData is TileItemData)
	return ReturnType.Successful
