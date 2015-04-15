###
	tabBarModule
	–
	Created by Petter Nilsson
	http://petter.pro
###

# Default styles
defaults = {
	screenWidth: Screen.width
	screenHeight: Screen.height
	barHeight: 98
	labelOffset: -28
	iconOffset: -12
	tintColor: "#007aff"
	tintColorUnselected: "#929292"
	blur: 40
	opacity: 0.75
	borderShadow: "0px -1px 0px 0px rgba(0,0,0,0.32)"
	backgroundColor: "#f8f8f8"
	showLabels: true
	badgeSize: 36
	badgeColor: "#FF3B30"
}
defaults.labelTextStyle = {
	fontSize: "20px"
	textAlign: "center"
	fontFamily: "Helvetica Neue', sans-serif"
}
defaults.badgeTextStyle = {
	fontSize: "26px"
	lineHeight: "36px"
	color: "#fff"
	textAlign: "center"
	fontFamily: "Helvetica Neue', sans-serif"
}
exports.defaults = defaults


getItemFromName = (name) ->
	# Returns a tab bar item if names matches

	for item in @items
		return item if item.name is name


updateViews = (selectedItem) ->
	# Shows/hides views based on selected tab bar item

	for item in @items
		if item.view?
			if item.view is selectedItem.view then item.view.visible = true else item.view.visible = false
			if item.blurView is selectedItem.blurView then item.blurView.visible = true else item.blurView.visible = false


setSelected = (name) ->
	# Sets selected tab item from the key (name) used when creating it

	if name != @selected
		for item in @items
			if item.name is name
				item.iconLayer.backgroundColor = defaults.tintColor
				item.labelLayer.style = "color": defaults.tintColor if item.labelLayer
				item.iconLayer.style = "-webkit-mask-image": "url(" + item.iconLayer.selectedIcon + ")" if item.iconLayer.selectedIcon
				@selected = item.name
				@updateViews(item)
				@.emit("tabBarDidSwitch", item.name)
			else
				item.iconLayer.backgroundColor = defaults.tintColorUnselected
				item.labelLayer.style = "color": defaults.tintColorUnselected if item.labelLayer
				item.iconLayer.style = "-webkit-mask-image": "url(" + item.iconLayer.icon + ")" if item.iconLayer.selectedIcon


setBadgeValue = (name, value) ->
	# Adds a badge to the tab item if value is a number > 0 and removes the badge if null

	for item in @items
		if item.name is name
			if value
				item.badgeLayer.html = value
				item.badgeLayer.visible = true
			else
				item.badgeLayer.visible = false


exports.tabBar = (barItems) ->
	# Creates and set-ups the tab bar

	tabBar = new Layer
		x: 0
		y: defaults.screenHeight - defaults.barHeight
		width: defaults.screenWidth
		height: defaults.barHeight
		backgroundColor: defaults.backgroundColor

	tabBar.style = "box-shadow": defaults.borderShadow
	tabBar.getItemFromName = getItemFromName
	tabBar.updateViews = updateViews
	tabBar.setSelected = setSelected
	tabBar.setBadgeValue = setBadgeValue
	tabBar.selected = null
	tabBar.items = []

	background = new Layer
		x: 0
		y: 0
		width: defaults.screenWidth
		height: defaults.barHeight
		backgroundColor: defaults.backgroundColor
		opacity: defaults.opacity
		superLayer: tabBar

	itemCount = Object.keys(barItems).length
	i = 0

	for name,params of barItems
		itemLayer = new Layer
			backgroundColor: "none"
			width: defaults.screenWidth / itemCount
			height: defaults.barHeight
			x: i * (defaults.screenWidth / itemCount)
			y: 0
			superLayer: tabBar
			name: name

		if params.view?
			# Create a copy of the view, blur it and use it as a background
			blurView = params.view.copy()
			if ScrollComponent.prototype.isPrototypeOf(blurView)
				blurView.content.blur = defaults.blur
			else
				blurView.blur = defaults.blur
			blurView.superLayer = tabBar
			blurView.index = 0
			blurView.y = blurView.y - (defaults.screenHeight - defaults.barHeight)

			itemLayer.view = params.view
			itemLayer.blurView = blurView

		iconLayer = new Layer
			width: 60
			height: 60
			superLayer: itemLayer
		iconLayer.icon = params.icon
		iconLayer.selectedIcon = params.selectedIcon if params.selectedIcon?

		# This black magic is used to tint the PNG images. Only works on webkit browsers :/
		iconLayer.style =
			"-webkit-mask-image": "url(" + iconLayer.icon + ")"
			"-webkit-mask-repeat": "no-repeat"
			"-webkit-mask-position": "center center"
		iconLayer.centerX()
		iconLayer.centerY(defaults.iconOffset)
		itemLayer.iconLayer = iconLayer

		if defaults.showLabels
			labelLayer = new Layer
				width: itemLayer.width
				x: 0
				y: defaults.barHeight + defaults.labelOffset
				superLayer: itemLayer
				backgroundColor: "none"
			labelLayer.html = name
			labelLayer.style = defaults.labelTextStyle
			itemLayer.labelLayer = labelLayer

		badgeLayer = new Layer
			width: defaults.badgeSize
			height: defaults.badgeSize
			x: 0
			y: 6
			borderRadius: 18
			superLayer: itemLayer
			backgroundColor: defaults.badgeColor
		badgeLayer.style = defaults.badgeTextStyle
		badgeLayer.centerX(26)

		itemLayer.badgeLayer = badgeLayer
		itemLayer.badgeLayer.visible = false

		tabBar.items.push(itemLayer)

		itemLayer.on Events.Click, ->
			tabBar.setSelected(@name)

		i++

	# Select the first item in the tab bar
	tabBar.setSelected(tabBar.items[0].name)

	return tabBar
