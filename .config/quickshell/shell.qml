import Quickshell
import QtQuick
import QtQuick.Layouts

import Quickshell.Services.UPower
import Quickshell.Services.Pipewire
import Quickshell.Hyprland

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }

  implicitHeight: 30
  color: "#1e1e2e"

  RowLayout {
    anchors {
      left: parent.left
      verticalCenter: parent.verticalCenter
      leftMargin: 12
    }
    spacing: 8

    Repeater {
      model: Hyprland.workspaces
      Text { text: modelData.id; color: "#cdd6f4" }
    }
  }

  RowLayout {
    anchors.centerIn: parent
    spacing: 8

    Text {
      text: Qt.formatDateTime(clock.date, "hh:mm")
      color: "#94e2d5"
    }
  }


  RowLayout {
    anchors {
      right: parent.right
      verticalCenter: parent.verticalCenter
      rightMargin: 12
    }
    spacing: 16

    // vol, bat, net

    Text {
      text: "vol " + Math.round((Pipewire.defaultAudioSink?.audio?.volume ?? 0) * 100) + "%"
      color: "#e0af68"
    } PwObjectTracker { objects: [Pipewire.defaultAudioSink] }

    Text {
      text: "bat " + UPower.displayDevice.percentage * 100 + "%"
      color: "#9ece6a"
    }
  }

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }
}
