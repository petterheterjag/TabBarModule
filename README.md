# TabBarModule

TabBarModule is a module for the prototyping tool Framer. It makes it super easy to set up a tab bar navigation.

Created by Petter Nilsson  
[petter.pro](http://petter.pro) / [@petterheterjag](http://twitter.com/petterheterjag)

![Screenshot](https://raw.githubusercontent.com/petterheterjag/tabBarModule/master/screenshot.png)

**Features:**

* It looks just like the default iOS tab bar (with background blur out of the box).
* But it's very easy to customize.
* It automatically shows the view/screen associated with the selected tab.
* It has support for tinting icons (that means you can transform a transparent PNG with a black icon into any color you want by setting a property).
* You can add badges to tab bar items.

Only works in Framer Studio/Chrome/Safari.


## Examples

#### [Basic](http://share.framerjs.com/bsaw6yj3090m/)
#### [App store (with scrollComponents)](http://share.framerjs.com/37f8ggj6q01q/)
#### [Customized](http://share.framerjs.com/6kf6f60h816b/)


## Basic usage

Download tabBarModule.coffee and put it in the /modules folder of your Framer project. Then add this line at the top of your project in Framer Studio.

```coffeescript
tabBarModule = require "tabBarModule"
```

Then to create the tab bar you do this:

```coffeescript
tabBar = tabBarModule.tabBar
	Explore: {icon: "images/explore.png", selectedIcon: "images/explore-selected.png", view: exploreView}
	Featured: {icon: "images/featured.png", selectedIcon: "images/featured-selected", view: featuredView}
	Search: {icon: "images/search.png", selectedIcon: "images/search-selected.png", view: searchView}
```

## Functions

#### tabBarModule.tabBar(items *object*)
Creates the tab bar.

`icon` Path to icon *(required)*  
`selectedIcon` Path to icon to use when selected *(optional)*  
`view` Layer to show when item is selected *(optional)*

```coffeescript
tabBar = tabBarModule.tabBar
    Explore: {icon: "images/explore.png", selectedIcon: "images/explore-selected.png", view: exploreView}
    Featured: {icon: "images/featured.png", selectedIcon: "images/featured-selected", view: featuredView}
    Search: {icon: "images/search.png", selectedIcon: "images/search-selected.png", view: searchView}
```

#### tabBar.setSelected(name *string*)
Sets selected tab item from the key (name) used when creating it

```coffeescript
tabBar.setSelected("Explore")
```

#### tabBar.setBadgeValue(name *string*, value *number*)
Adds a badge to the tab item if value is a number > 0 and removes the badge if null

```coffeescript
tabBar.setBadgeValue("Explore", 2)
```

#### tabBar.getItemFromName(name *string*)
Returns a tab bar item if names matches

```coffeescript
tabBar.getItemFromName("Explore")
```

## Events

#### "tabBarDidSwitch" (name *string*)
Triggers when the tab bar switches selected tab

```coffeescript
tabBar.on "tabBarDidSwitch", (name) ->
	print name
```


## Change styling

To change the default look, change these defaults before you create the tabBar. Like this:

```coffeescript
tabBarModule.defaults.tintColor = "#FEC200"
```

**defaults.screenWidth** *number*  
**defaults.screenHeight** *number*  
**defaults.barHeight** *number*  
**defaults.labelOffset** *number*  
**defaults.iconOffset** *number*  
**defaults.tintColor** *string*  
**defaults.tintColorUnselected** *string*  
**defaults.blur** *number*  
**defaults.opacity** *number*  
**defaults.borderShadow** *string*  
**defaults.backgroundColor** *string*  
**defaults.showLabels** *Boolean*  
**defaults.labelTextStyle** *object*  
**defaults.badgeTextStyle** *object*  
