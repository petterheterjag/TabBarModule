# Import module
tabKit = require "tabbar"

# Create some views
exploreView = new Layer
	width: Screen.width
	height: Screen.height
	image: "images/explore.jpg"
featuredView = new Layer
	width: Screen.width
	height: Screen.height
	image: "images/featured.jpg"
searchView = new Layer
	width: Screen.width
	height: Screen.height
	image: "images/search.jpg"

# Create the tab bar
tabBar = new tabKit.tabBar
	Explore: {icon: "images/explore-icon@2x.png", selectedIcon: "images/explore-selected@2x.png", view: exploreView}
	Featured: {icon: "images/featured-icon@2x.png", selectedIcon: "images/featured-selected@2x.png", view: featuredView}
	Search: {icon: "images/search-icon@2x.png", selectedIcon: "images/search-selected@2x.png", view: searchView}
	
tabBar2 = new tabKit.tabBar
	Explore: {icon: "images/explore-icon@2x.png", selectedIcon: "images/explore-selected@2x.png", view: exploreView}
	Featured: {icon: "images/featured-icon@2x.png", selectedIcon: "images/featured-selected@2x.png", view: featuredView}
	Search: {icon: "images/search-icon@2x.png", selectedIcon: "images/search-selected@2x.png", view: searchView}
	
tabBar2.y = 1100