pragma Singleton

import Quickshell
import QtQuick

Singleton {
	id: root 

	// background layers, darkest to lightest
	readonly property color crust:  "#11111b"
	readonly property color mantle: "#181825"
	readonly property color base:   "#1e1e2e"

	// surface layers (for panels, cards)
	readonly property color surface0: "#313244"
	readonly property color surface1: "#45475a"
	readonly property color surface2: "#585b70"

	// text
	readonly property color text:    "#cdd6f4"
	readonly property color subtext: "#a6adc8"

	// accents — pick one as your main accent
	readonly property color lavender: "#b4befe"
	readonly property color blue:     "#89b4fa"
	readonly property color mauve:    "#cba6f7"
	readonly property color pink:     "#f38ba8"
	readonly property color green:    "#a6e3a1"
	readonly property color yellow:   "#f9e2af"
	readonly property color red:      "#f38ba8" 

	//font sizes

	readonly property int hero: 40
	readonly property int heading1: 32
	readonly property int heading2: 24
	readonly property int heading3: 20
	readonly property int body: 15
	readonly property int ui: 13
	readonly property int caption: 11
}