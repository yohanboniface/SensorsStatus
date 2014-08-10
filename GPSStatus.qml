import QtQuick 2.2
import Ubuntu.Components 1.1
import QtPositioning 5.2

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "me.yohanboniface.gpsstatus"
    automaticOrientation: true

    width: units.gu(100)
    height: units.gu(75)

    Page {
        title: i18n.tr("GPS Status")

        Column {
            spacing: units.gu(1)
            anchors {
                margins: units.gu(2)
                fill: parent
            }

            Row {
                width: parent.width
                spacing: units.gu(1)
                anchors.margins: units.gu(0.5)

                Label {
                    text: i18n.tr('Found supported backend')
                    anchors.verticalCenter: backendFound.verticalCenter
                }

                CheckBox {
                    id: backendFound
                    checked: geoposition.valid
                    enabled: false
                }
            }

            RowField {
                title: i18n.tr('Latitude')
                text: geoposition.position.coordinate.latitude || '—'
            }

            RowField {
                title: i18n.tr('Longitude')
                text: geoposition.position.coordinate.longitude || '—'
            }

            RowField {
                title: i18n.tr('Horizontal accuracy')
                text: geoposition.position.horizontalAccuracy || '—'
            }

            RowField {
                title: i18n.tr('Altitude')
                text: geoposition.position.coordinate.altitude || '—'
            }

            RowField {
                title: i18n.tr('Vertical accuracy')
                text: geoposition.position.verticalAccuracy || '—'
            }

            RowField {
                title: i18n.tr('Speed (m/s)')
                text: geoposition.position.speed === -1 ? '—' : geoposition.position.speed
            }

            RowField {
                title: i18n.tr('Last updated')
                text: geoposition.position.timestamp ? geoposition.position.timestamp : '—'
            }

            PositionSource {
                id: geoposition
                active: true
                updateInterval: 1000
                onPositionChanged: function (position) {
                    console.log(position)
                }
            }
        }
    }
}

