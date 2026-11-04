import QtQuick
import Quickshell

PanelWindow {
    id: bar

    anchors {
        left: true
        top: true
        bottom: true
    }

    implicitWidth: 70
    color: "#181825"

    Item {
        id: layout
        anchors.fill: parent
        anchors.margins: 8

        // START
        Column {
            width: parent.width
            anchors.top: parent.top
            spacing: 8

            Rectangle {
                width: parent.width
                height: 42
                color: "#313244"
            }
        }

        // CENTER
        Column {
            width: parent.width
            anchors.verticalCenter: parent.verticalCenter
            spacing: 8

            Rectangle {
                width: parent.width
                height: 42
                color: "#313244"
            }
        }

        // END
        Column {
            width: parent.width
            anchors.bottom: parent.bottom
            spacing: 8

            Rectangle {
                width: parent.width
                height: 42
                color: "#313244"
            }
        }
    }
}
