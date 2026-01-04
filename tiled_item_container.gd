@tool
extends ItemContainer
@export var Size : Vector2i: 
	set(value):
		size = Item.GridToPosition(value)
		Size = value

func AddItem(AddedItem : ItemData):
	pass

func RemoveItem(RemovedItem : ItemData):
	pass

func EditItem(EditedItem : ItemData):
	pass
