# Import module
tabKit = require "tabbar"

# Create some views
exploreView = new Layer
	width: Screen.width
	height: Screen.height
	image: "images/image1.jpg"
featuredView = new Layer
	width: Screen.width
	height: Screen.height
	image: "images/image2.jpg"
searchView = new Layer
	width: Screen.width
	height: Screen.height
	image: "images/image3.jpg"

# Create the tab bar
tabBar = new tabKit.tabBar
	Explore: {icon: "images/explore-icon@2x.png", iconSelected: "images/explore-selected@2x.png", view: exploreView}
	Featured: {icon: "images/featured-icon@2x.png", iconSelected: "images/featured-selected@2x.png", view: featuredView}
	Search: {icon: "images/search-icon@2x.png", iconSelected: "images/search-selected@2x.png", view: searchView}