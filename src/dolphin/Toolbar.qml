import QtQuick 2.0
import Sailfish.Silica 1.0
import com.meego.maliitquick 1.0
import com.jolla.keyboard 1.0

Flow {
    id: root
    property int count

    //Paste
    PasteButton {
        visible: keyboard.portraitMode && Clipboard.hasText && !inEmojiView && !fetchMany
        height: Theme.itemSizeSmall
        onClicked: commit(Clipboard.text)
    }

    PasteButtonVertical {
        visible: !keyboard.portraitMode && Clipboard.hasText && !inEmojiView && !fetchMany
        height: visible ? Theme.itemSizeSmall : 0
        width: visible ? parent.width : 0
        popupParent: container
        popupAnchor: 2 // center

        onClicked: commit(Clipboard.text)
    }

    //Emoji
    WidgetKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.emoji === 1 && count === 0 && !inEmojiView ? true : false
        caption: "☺"

        onClicked: {
            if ( !inEmojiView ) {
                keyboard.inSymView = false
                keyboard.inSymView2 = false
                fetchMany = false
                inEmojiView = true
            } else {
                inEmojiView = false
            }

            timer.restart()
        }
    }


    WidgetKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: inEmojiView && count === 0 ? true : false
        caption: "\uD83D\uDD50"
        onClicked: emojiDialog.type = 0
    }

    WidgetKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: inEmojiView && count === 0 ? true : false
        caption: "\uD83D\uDE04"
        onClicked: emojiDialog.type = 1
    }

    WidgetKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: inEmojiView && count === 0 ? true : false
        caption: "\uD83D\uDC36"
        onClicked: emojiDialog.type = 2

    }

    WidgetKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: inEmojiView && count === 0 ? true : false
        caption: "\u2615"
        onClicked: emojiDialog.type = 3
    }

    WidgetKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: inEmojiView && count === 0 ? true : false
        caption: "\uD83C\uDFE0"
        onClicked: emojiDialog.type = 4
    }

    WidgetKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: inEmojiView && count === 0 ? true : false
        caption: "1\u20E3"
        onClicked: emojiDialog.type = 5
    }

    //Cursor
    CursorKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 1 && count === 0 ? true : false
        direction: "left"
    }

    CursorKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 1 && count === 0 ? true : false
        direction: "right"
    }

    CursorKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 1 && count === 0 ? true : false
        direction: "up"
    }

    CursorKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 1 && count === 0 ? true : false
        direction: "down"
    }

    //Number
    CommitKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 2 && count === 0 ? true: false
        caption: "1"
        onClicked: MInputMethodQuick.sendCommit(caption)
    }

    CommitKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 2 && count === 0 ? true: false
        caption: "2"
        onClicked: MInputMethodQuick.sendCommit(caption)
    }

    CommitKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 2 && count === 0 ? true: false
        caption: "3"
        onClicked: MInputMethodQuick.sendCommit(caption)
    }

    CommitKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 2 && count === 0 ? true: false
        caption: "4"
        onClicked: MInputMethodQuick.sendCommit(caption)
    }

    CommitKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 2 && count === 0 ? true: false
        caption: "5"
        onClicked: MInputMethodQuick.sendCommit(caption)
    }

    CommitKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 2 && count === 0 ? true: false
        caption: "6"
        onClicked: MInputMethodQuick.sendCommit(caption)
    }

    CommitKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 2 && count === 0 ? true: false
        caption: "7"
        onClicked: MInputMethodQuick.sendCommit(caption)
    }

    CommitKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 2 && count === 0 ? true: false
        caption: "8"
        onClicked: MInputMethodQuick.sendCommit(caption)
    }

    CommitKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 2 && count === 0 ? true: false
        caption: "9"
        onClicked: MInputMethodQuick.sendCommit(caption)
    }

    CommitKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 2 && count === 0 ? true: false
        caption: "0"
        onClicked: MInputMethodQuick.sendCommit(caption)
    }

    //Function
    CommitKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 3 && count === 0 ? true: false
        caption: "HM"
        onClicked: MInputMethodQuick.sendKey(Qt.Key_Home, 0,  "", Maliit.KeyClick)
    }

    CommitKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 3 && count === 0 ? true: false
        caption: "ED"
        onClicked: MInputMethodQuick.sendKey(Qt.Key_End, 0,  "", Maliit.KeyClick)

    }

    CommitKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 3 && count === 0 ? true: false
        caption: "AL"
        onClicked: MInputMethodQuick.sendKey(Qt.Key_A, Qt.ControlModifier, 0,  "", Maliit.KeyClick)
    }

    CommitKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 3 && count === 0 ? true: false
        caption: "CP"
        onClicked: MInputMethodQuick.sendKey(Qt.Key_C, Qt.ControlModifier, 0,  "", Maliit.KeyClick)
    }

    CommitKey {
        width: visible ? Theme.itemSizeSmall : 0
        height: Theme.itemSizeSmall
        visible: config.toolbar === 3 && count === 0 ? true: false
        caption: "PS"
        onClicked:  MInputMethodQuick.sendKey(Qt.Key_V, Qt.ControlModifier, 0,  "", Maliit.KeyClick)
    }
}
