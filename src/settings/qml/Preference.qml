/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import Qt.labs.folderlistmodel 1.0
import harbour.dolphin.keyboard 1.0

Page {
    id: root

    /*onStatusChanged: {
        if ( status === PageStatus.Active ) {
            pageStack.pushAttached(editor)
        }
    }*/

    RemorsePopup { id: remorse }

    SilicaFlickable {
        anchors.fill: parent
        clip: true
        contentHeight: header.height + column.height

        VerticalScrollDecorator {  }

        PageHeader {
            id: header
            title: qsTr("Dolphin Keyboard Settings")
        }

        Column {
            id: column
            width: parent.width
            anchors.top: header.bottom
            spacing: Theme.paddingMedium

            SectionHeader { text: qsTr("Testing TextField") }

            TextField {
                width: parent.width
                placeholderText: qsTr("Enter something here")
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Restart Keyboard Service")
                onClicked: {
                    remorse.execute(qsTr("Processing..."), function() { config.restart() }, 2000 )
                }
            }

            Label {
                anchors.left: parent.left
                anchors.leftMargin: Theme.paddingLarge
                font.pixelSize: Theme.fontSizeExtraSmall
                color: Theme.highlightColor
                text: qsTr("* All settings require restart to take effect")
            }

            SectionHeader {
                text: qsTr("Appearance Settings")
            }


            Slider {
                width: parent.width
                minimumValue: 0.6
                maximumValue: 1.6
                stepSize: 0.08
                label: qsTr("Keyboard Height")
                valueText: value
                onValueChanged: config.save("ui-scale", value)
                Component.onCompleted: {
                    value = config.scale
                }
            }

            Slider {
                width: parent.width
                minimumValue: 0
                maximumValue: 1
                stepSize: 0.2
                label: qsTr("Background Transaprency")
                valueText: value
                onValueChanged: config.save("ui-opacity", value)
                Component.onCompleted: {
                    value = config.transparency
                }
            }

//            SectionHeader { text: qsTr("Background Picture ( /home/nemo/Pictures/ )") }

//            Item{
//                width: parent.width
//                height: Theme.itemSizeMedium
//            }

//            GridView {
//                id: background
//                width: parent.width
//                height: parent.width/3
//                cellHeight: parent.width / 3
//                cellWidth: cellHeight
//                clip: true
//                highlightFollowsCurrentItem: true
//                focus: true

//                model: FolderListModel {
//                    id: folderModel
//                    folder: "/home/nemo/Pictures/"
//                    showDirs: false
//                    showOnlyReadable: true
//                    nameFilters: ["*.jpg", "*.png"]
//                }

//                highlight: Component {
//                    Rectangle {
//                        width: background.cellWidth
//                        height: width
//                        color: Theme.highlightColor
//                        opacity: 0.4
//                    }
//                }

//                delegate: Image {
//                    width: background.cellWidth
//                    height: width
//                    fillMode: Image.PreserveAspectCrop
//                    cache: true
//                    asynchronous: true
//                    smooth: false
//                    source: "/home/nemo/Pictures/" + fileName
//                    MouseArea {
//                        anchors.fill: parent
//                        onClicked: config.save("ui-background", parent.source)
//                    }

//                }
//            }


            SectionHeader { text: qsTr("General Typing Settings") }

            TextSwitch {
                text: qsTr("English Keyboard As Primary")
                description: qsTr("English keyboard will be the main keyboard")
                checked: config.enMode === 1? true: false
                onCheckedChanged: checked? config.save("enMode", 1): config.save("enMode", 0)
            }

            TextSwitch {
                text: qsTr("Fusion Typing")
                description: "Use English characters to type Cangjie and Quick instead of Chinese symbols"
                checked: config.fusion === 1? true: false
                onCheckedChanged: checked? config.save("fusion", 1): config.save("fusion", 0)
            }

            TextSwitch {
                text: qsTr("Spacebar Auto Commit")
                description: "Use Spacebar to commit the first candidate word"
                checked: config.spacebar === 1? true: false
                onCheckedChanged: checked? config.save("spacebar", 1): config.save("spacebar", 0)
            }

            TextSwitch {
                text: qsTr("Emoji Keyboard")
                description: qsTr("Type emoji in WhatsUp or Message")
                checked: config.emoji === 1? true: false
                onCheckedChanged: checked? config.save("emoji", 1): config.save("emoji", 0)
            }


            SectionHeader { text: qsTr("Database Settings") }

            TextSwitch {
                text: qsTr("Dynamic Adjust Frequent Words")
                description: qsTr("Frequently typed words first")
                checked: config.keys === 1? true: false
                onCheckedChanged: checked? config.save("keys", 1): config.save("keys", 0)
            }

            TextSwitch {
                text: qsTr("Dynamic Adjust Frequent Prediction")
                description: qsTr("Frequently typed prediction first")
                checked: config.word === 1? true: false
                onCheckedChanged: checked? config.save("word", 1): config.save("word", 0)
            }

            SectionHeader { text: qsTr("Widgets Settings") }

            ComboBox {
                width: parent.width
                label: qsTr("Widget Type")

                Component.onCompleted: {
                    currentIndex = config.toolbar
                }

                menu: ContextMenu {
                    MenuItem { text: qsTr("None"); onClicked: config.save("toolbar", "0") }
                    MenuItem { text: qsTr("Cursor Keys"); onClicked: config.save("toolbar", "1") }
                    MenuItem { text: qsTr("Number Keys"); onClicked: config.save("toolbar", "2") }
                    MenuItem { text: qsTr("Function Keys"); onClicked: config.save("toolbar", "3") }
                }
            }

            SectionHeader { text: qsTr("Quick & CangJie Settings") }


            SectionHeader { text: qsTr("Wubi Settings") }


            SectionHeader { text: qsTr("Donation") }


            BackgroundItem {
                width: parent.width
                Label { anchors.centerIn: parent; text: "Paypal" }
                onClicked: Qt.openUrlExternally("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=XWZEYXJYWQ8UU")
            }

            BackgroundItem {
                width: parent.width
                Label { anchors.centerIn: parent; text: "Taobao : saberartoria@outlook.com" }
                onClicked: Qt.openUrlExternally("http://saberaltria.co.uk")
            }
        }
    }
}



