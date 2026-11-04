import QtQuick
import Quickshell

Item {
    id: root
    required property var config
    required property var widgetData

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    Text {
        anchors.centerIn: parent
        text: Qt.formatDateTime(clock.date, "hh:mm")
        color: root.config.textColor
        font.pixelSize: root.widgetData.fontSize ?? root.config.fontSize
    }
}
