import QtQuick 2.12
import QtQuick.Controls 2.5
import QtWebEngine 1.8
import QtQuick.Window 2.2
import QtQml 2.15

Page {
    width: screen.width
    height: screen.height
    title: qsTr("Sweet Home")

    WebEngineView {
        id:homepagewebengine
        url: "http://homeassistant.local:8123/sweet-home/0"
        anchors.fill: parent

        onContextMenuRequested: {
             request.accepted = true;
         }

        property bool firstLoadComplete: false
        onLoadingChanged: function(loadRequest) {
            if (loadRequest.status === WebEngineView.LoadSucceededStatus && !firstLoadComplete) {
                busy.running = true
                showTimer.start()
            }
        }

        Timer {
            id: showTimer
            interval: 10000
            repeat: false
            onTriggered: {
                homepagewebengine.show(true)
                homepagewebengine.firstLoadComplete = true
            }
        }

        Rectangle {
            id: webViewPlaceholder
            anchors.fill: parent
            z: 1
            color: "white"
            Label{
                text: "Welcome to Home Assistant, please wait..."
                anchors.centerIn: parent
                font.pixelSize: AppTheme.menuTextSize
                color: "black"
            }

            BusyIndicator {
                id: busy
                anchors.centerIn: parent
            }
        }

        function show(show) {
            if (show === true) {
                busy.running = false
                webViewPlaceholder.visible = false
            } else {
                webViewPlaceholder.visible = true
                busy.running = true
            }
        }
    }
}
