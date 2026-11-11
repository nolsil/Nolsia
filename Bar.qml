import QtQuick
import Quickshell

PanelWindow {
    id: bar
    required property var config

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

            Repeater {
                model: bar.config.zones.start

                delegate: Loader {
                    required property var modelData

                    width: parent.width
                    height: 42

                    Component.onCompleted: {
                        setSource("widgets/" + modelData.type + ".qml", {
                            config: bar.config,
                            widgetData: modelData
                        });
                    }
                }
            }
        }

        // CENTER
        Column {
            width: parent.width
            anchors.verticalCenter: parent.verticalCenter
            spacing: 8

            Repeater {
                model: bar.config.zones.center

                delegate: Loader {
                    required property var modelData

                    width: parent.width
                    height: 42

                    Component.onCompleted: {
                        setSource("widgets/" + modelData.type + ".qml", {
                            config: bar.config,
                            widgetData: modelData
                        });
                    }
                }
            }
        }

        // END
        Column {
            width: parent.width
            anchors.bottom: parent.bottom
            spacing: 8

            Repeater {
                model: bar.config.zones.end

                delegate: Loader {
                    required property var modelData

                    width: parent.width
                    height: 42

                    Component.onCompleted: {
                        setSource("widgets/" + modelData.type + ".qml", {
                            config: bar.config,
                            widgetData: modelData
                        });
                    }
                }
            }
        }
    }
}
