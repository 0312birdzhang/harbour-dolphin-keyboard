import QtQuick 2.0
import Sailfish.Silica 1.0
import com.jolla.keyboard 1.0

BackgroundItem {

    id: root
    property string caption
    property alias src: icon.source

    width: label.visible? label.width + Theme.paddingLarge * 2: icon.width + Theme.paddingMedium * 2
    height: 80

    Label {
        id: label
        visible: src ? false : true
        anchors.centerIn: parent
        text: caption
        font.pixelSize: Theme.fontSizeSmall
    }

    Image {
        id: icon
        visible: icon.status === Image.Error || icon.status === Image.Null || src === null || typeof src === "undefined"  ? false : true
        asynchronous: true
        width: Theme.itemSizeSmall/2
        height: Theme.itemSizeSmall/2
        anchors.centerIn: parent
    }

    Image {
        source: "graphic-keyboard-highlight-top.png"
        anchors.right: parent.right
    }


}
