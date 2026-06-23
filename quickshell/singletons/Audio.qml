pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
	PwObjectTracker {
		objects: [Pipewire.defaultAudioSink]
	}
	readonly property double volume: Pipewire.defaultAudioSink.audio.volume * 100
	readonly property bool muted: Pipewire.defaultAudioSink.audio.muted
}