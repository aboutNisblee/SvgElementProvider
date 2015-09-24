/* Copyright (C) 2015  Moritz Nisblé <moritz.nisble@gmx.de>
**
** This file is part of SvgElementProvider.
**
** This program is free software: you can redistribute it and/or modify
** it under the terms of the GNU Lesser General Public License as published
** by the Free Software Foundation, either version 3 of the License,
** or (at your option) any later version.
**
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU Lesser General Public License for more details.
**
** You should have received a copy of the GNU Lesser General Public License
** along with this program.  If not, see <http://www.gnu.org/licenses/>.
**/
import QtQuick 2.0

Item {
    id: root

    property int interval: 1000

    Text {
        anchors {
            bottom: parent.bottom
            right: parent.right
            margins: 3
        }
        z: 1
        text: qsTr("SVG taken from ktouch")
        font.pointSize: 8
    }

    Image {
        id: background
        anchors.fill: parent
        sourceSize.width: 1024
        sourceSize.height: 1024
        fillMode: Image.PreserveAspectFit
        source: "image://svgelement/elapsedtimemeter.svgz#analog-center"
    }

    Image {
        id: dial
        anchors.fill: parent
        sourceSize.width: 1024
        sourceSize.height: 1024
        fillMode: Image.PreserveAspectFit
        source: "image://svgelement/elapsedtimemeter.svgz#background"
    }

    Image {
        id: minutehand
        anchors.centerIn: dial
        sourceSize.width: 1024
        sourceSize.height: 1024
        height: dial.height * 0.85
        width: dial.width * 0.85
        fillMode: Image.PreserveAspectFit
        source: "image://svgelement/elapsedtimemeter.svgz#minute-hand"
        rotation: 0

        Behavior on rotation {
            NumberAnimation {
                easing.type: Easing.InQuad
                duration: timer.interval
            }
        }
    }

    Image {
        id: secondhand
        anchors.centerIn: dial
        sourceSize.width: 1024
        sourceSize.height: 1024
        height: dial.height * 0.85
        width: dial.width * 0.85
        fillMode: Image.PreserveAspectFit
        source: "image://svgelement/elapsedtimemeter.svgz#second-hand"
        rotation: 0

        Behavior on rotation {
            NumberAnimation {
                easing.type: Easing.InQuad
                duration: timer.interval
            }
        }
    }

    Timer {
        id: timer
        interval: root.interval
        repeat: true
        running: true
        property int secs: 0
        property int mins: 0
        onTriggered: {
            secs++
            secondhand.rotation += 6
            if (0 === (secs % 60)) {
                mins++
                minutehand.rotation += 6
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: Qt.quit()
    }
}
