import Quickshell
import QtQuick
import Singletons

Text {
	 text: (Battery.charging ? "⚡ " : " ") + Math.round(Battery.percentage) + "%"
	 color: Theme.text
	 font.pixelSize: Theme.fontSizeMd
	 font.family: Theme.fontMono
}