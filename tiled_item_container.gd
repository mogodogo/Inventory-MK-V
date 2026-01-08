@tool
class_name TiledItemContainer
extends ItemContainer
@export var Size : Vector2i: 
	set(value):
		size = Item.GridToPosition(value)
		Size = value

class TileItemData extends ItemData:
	var Position : Vector2i
	func GetRect() -> Rect2i:
		return Rect2i(Position, resource.Size)

func AddItem(AddedItem : ItemData):
	assert(AddedItem is TileItemData)
	Inventory.push_back(AddedItem)
	$DisplaysContainer.add_child(ItemDisplay.NewDisplay(AddedItem.resource))

func RemoveItem(RemovedItem : ItemData):
	assert(RemovedItem is TileItemData)

func EditItem(EditedItem : ItemData):
	assert(EditedItem is TileItemData)

func CanAddItem(AddedItem : ItemData) -> bool:
	assert(AddedItem is TileItemData)
	var AddedCollider : Rect2i = AddedItem.GetRect()
	for item : ItemData in Inventory:
		if AddedCollider.intersects(item.GetRect()):
			return false
	return true

func CanRemoveItem(RemovedItem : ItemData) -> bool:
	assert(RemovedItem is TileItemData)
	return true

func CanEditItem(EditedItem : ItemData) -> bool:
	assert(EditedItem is TileItemData)
	return true
