pragma Singleton

import Quickshell
import QtQuick
import Quickshell.Services.UPower

Singleton {
	id: root 

	readonly property double percentage : UPower.displayDevice.percentage
	readonly property bool charging: UPower.displayDevice.state === UPowerDeviceState.Charging
}

