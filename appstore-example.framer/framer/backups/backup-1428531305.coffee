# Import module
tabKit = require "tabbar"

# Make background white
new BackgroundLayer({backgroundColor:"#fff"})

# Create scrollComponents for the views that should scroll
featuredScroll = new ScrollComponent({width: 750, height: 1334, scrollHorizontal: false})
topChartsScroll = new ScrollComponent({width: 750, height: 1334, scrollHorizontal: false})
exploreScroll = new ScrollComponent({width: 750, height: 1334, scrollHorizontal: false})
updatesScroll = new ScrollComponent({width: 750, height: 1334, scrollHorizontal: false})

# Create the views
featuredView = new Layer
	width: 750
	height: 3800
	image: "images/featured.jpg"
	superLayer: featuredScroll.content
topChartsView = new Layer
	width: 750
	height: 4300
	image: "images/top-charts.png"
	superLayer: topChartsScroll.content
exploreView = new Layer
	width: 750
	height: 3000
	image: "images/explore.png"
	superLayer: exploreScroll.content
searchView = new Layer
	width: 750
	height: 1334
	image: "images/search.png"
updatesView = new Layer
	width: 750
	height: 1334
	image: "images/updates.png"
	superLayer: updatesScroll.content
	
# Create the tab bar
tabBar = new tabKit.tabBar
	Featured: {icon: "images/featured-icon@2x.png", selectedIcon: "images/featured-selected@2x.png", view: featuredScroll}
	"Top Charts": {icon: "images/topcharts-icon@2x.png", selectedIcon: "images/topcharts-selected@2x.png", view: topChartsScroll}
	Explore: {icon: "images/explore-icon@2x.png", selectedIcon: "images/explore-selected@2x.png", view: exploreScroll}
	Search: {icon: "images/search-icon@2x.png", selectedIcon: "images/search-selected@2x.png", view: searchView}
	Updates: {icon: "images/updates-icon@2x.png", selectedIcon: "images/updates-selected@2x.png", view: updatesScroll}

# Add a badge to the Updates tab
tabBar.setBadgeValue("Updates", 2)

# Set up events to get the blur layer inside the tab bar to scroll with the scrollComponents
featuredScroll.on Events.Move, ->
	tabBar.getItemFromName("Featured").blurView.content.y = -featuredScroll.scrollY
topChartsScroll.on Events.Move, ->
	tabBar.getItemFromName("Top Charts").blurView.content.y = -topChartsScroll.scrollY
exploreScroll.on Events.Move, ->
	tabBar.getItemFromName("Explore").blurView.content.y = -exploreScroll.scrollY
updatesScroll.on Events.Move, ->
	tabBar.getItemFromName("Updates").blurView.content.y = -updatesScroll.scrollY

# Set Top Charts as the start tab
tabBar.setSelected("Top Charts")
