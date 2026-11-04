import QtQuick
import Quickshell
import Quickshell.Io

Scope {
    id: root

    property alias barThickness: data.barThickness
    property alias fontSize: data.fontSize
    property alias cornerRadius: data.cornerRadius
    property alias barColor: data.barColor
    property alias widgetColor: data.widgetColor
    property alias textColor: data.textColor
    property alias zones: data.zones
    property alias nextId: data.nextId

    function copyZones() {
        return {
            start: zones.start.slice(),
            center: zones.center.slice(),
            end: zones.end.slice()
        };
    }

    function addWidget(type, zone) {
        const entry = {
            id: nextId,
            type: type
        };

        const copy = copyZones();
        copy[zone].push(entry);
        nextId += 1;
        zones = copy;
    }

    function removeWidget(zone, index) {
        const copy = copyZones();
        copy[zone].splice(index, 1);
        zones = copy;
    }

    function moveWithinZone(zone, index, offset) {
        const copy = copyZones();
        const nextIndex = index + offset;
        const entry = copy[zone].splice(index, 1)[0];
        copy[zone].splice(nextIndex, 0, entry);
        zones = copy;
    }

    Timer {
        id: saveTimer
        interval: 250
        repeat: false
        onTriggered: file.writeAdapter()
    }

    FileView {
        id: file
        path: Quickshell.shellDir + "/config.json"
        watchChanges: true
        onFileChanged: reload()
        onAdapterUpdated: saveTimer.restart()

        JsonAdapter {
            id: data
            property int barThickness: 72
            property int fontSize: 14
            property int cornerRadius: 10
            property string barColor: "#181825"
            property string widgetColor: "#313244"
            property string textColor: "#cdd6f4"
            property int nextId: 1
            property var zones: ({
                    start: [],
                    center: [],
                    end: []
                })
        }
    }
}
