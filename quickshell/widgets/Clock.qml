import QtQuick 6.0
import Quickshell
import Singletons
Text {
	id: root 
	text: Time.time
	color: Theme.text
	font.pixelSize: Theme.fontSizeMd
	font.family: Theme.fontMono
}