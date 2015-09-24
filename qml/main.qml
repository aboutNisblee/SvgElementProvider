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
import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    title: qsTr("SvgElementProvider-Demo")
    width: 500
    height: 500

    Clock {
        id: clock
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        height: width
    }
}
