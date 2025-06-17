extends Button

var priceTable = [100, 300, 500, 999999]
var damagePurchased = 0
var rangePurchased = 0
var speedPurchased = 0

func _on_pressed() -> void:
	$"..".visible = false

func _on_damage_pressed() -> void:
	var coal = int($"../../../gameUI".coal)
	if coal >= priceTable[damagePurchased]:
		$"../../../gameUI".coal -= priceTable[damagePurchased]
		$"../../../gameUI/coalCounter".text = "%d" % $"../../../gameUI".coal
		damagePurchased += 1
		$"../../ChomikBulletSpawner".damage += 3
		$"../GridContainer/DamagePrice".text = "%d" % priceTable[damagePurchased]

func _on_range_pressed() -> void:
	var coal = int($"../../../gameUI".coal)
	if coal >= priceTable[rangePurchased]:
		print("lolololo")
		$"../../../gameUI/coalCounter".text = "%d" % $"../../../gameUI".coal
		$"../../../gameUI".coal -= priceTable[rangePurchased]
		rangePurchased += 1
		$"../../ChomikBulletSpawner".range *= 1.3
		$"../GridContainer/RangePrice".text = "%d" % priceTable[rangePurchased]

func _on_speed_pressed() -> void:
	var coal = int($"../../../gameUI".coal)
	if coal >= priceTable[speedPurchased]:
		$"../../../gameUI/coalCounter".text = "%d" % $"../../../gameUI".coal
		$"../../../gameUI".coal -= priceTable[speedPurchased]
		speedPurchased += 1
		$"../../ChomikBulletSpawner".reloadTime /= 1.5
		$"../GridContainer/SpeedPrice".text = "%d" % priceTable[speedPurchased]
