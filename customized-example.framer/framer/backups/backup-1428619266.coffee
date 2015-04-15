# Import module
tabKit = require "tabbar"

# Override default styling before creating the tab bar
tabKit.defaults.backgroundColor = "#000"
tabKit.defaults.opacity = 1.0
tabKit.defaults.blur = 0
tabKit.defaults.tintColor = "#fff"
tabKit.defaults.showLabels = false
tabKit.defaults.iconOffset = 0

# Create some views
musicView = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: "#323D4C"
exploreView = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: "#4C4846"
activityView = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: "#463C49"
searchView = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: "#3D494C"

# Create the tab bar
tabBar = new tabKit.tabBar
	Music: {icon: "images/music.png", view: musicView}
	Explore: {icon: "images/explore-icon@2x.png", view: exploreView}
	Activity: {icon: "images/activity.png", view: activityView}
	Search: {icon: "images/search-icon@2x.png", view: searchView}

# Create the line
line = new Layer
	width: tabBar.items[0].width
	height: 4
	maxY: Screen.height
	backgroundColor: "#FF463D"

# Make it follow the selected tab bar item by listening for the switch event
tabBar.on "tabBarDidSwitch", (name) ->
	line.animate({
			properties: {x: tabBar.getItemFromName(name).x}
			curve: "spring(200, 23, 0)"
		})
		