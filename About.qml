import QtQuick 2.12
import QtQuick.Controls 2.5
import QtWebEngine 1.8
import QtQuick.Window 2.2
import QtQuick.Layouts 1.11

Page {
    width: screen.width
    height: screen.height

    title: qsTr("About Home Assistant")

    Rectangle {
        id: webViewPlaceholder
        anchors.fill: parent
        color: "white"

        ColumnLayout {
            id: rowLayout
            anchors.centerIn: parent
            spacing: 10

            Column{
                Label{
                    text: "Developer - Praveen Satyanarayana"
                    font.pixelSize: AppTheme.menuTextSize
                    color: "black"
                }
            }
        }
    }
}
