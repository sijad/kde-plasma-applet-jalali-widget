import QtQuick 2.0
import QtQuick.Layouts 1.1
import org.kde.plasma.components 2.0 as Components

Item {
  id: main

  width: label.width + 5
  height: label.height

  Components.Label {
    id: label
    wrapMode: Text.NoWrap
    text: timeString()
    anchors {
      centerIn: parent
      leftMargin: units.smallSpacing
      rightMargin: units.smallSpacing
    }
  }
}
