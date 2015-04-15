# Import module
tabKit = require "tabbar"

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
	
tabBar.setBadgeValue("Search", 2)

tabBar.setSelected "Explore"