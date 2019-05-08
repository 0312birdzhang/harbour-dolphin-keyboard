/*
 * Copyright (C) 2012-2013 Jolla ltd and/or its subsidiary(-ies). All rights reserved.
 *
 * Contact: Pekka Vuorela <pekka.vuorela@jollamobile.com>
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice, this list
 * of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list
 * of conditions and the following disclaimer in the documentation and/or other materials
 * provided with the distribution.
 * Neither the name of Jolla Ltd nor the names of its contributors may be
 * used to endorse or promote products derived from this software without specific
 * prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 * THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

import QtQuick 2.0
import com.meego.maliitquick 1.0
import Sailfish.Silica 1.0
import com.jolla.keyboard 1.0
import harbour.dolphin.keyboard 1.0
import "../dolphin"

KeyboardLayout {
    id: layout
    splitSupported: true

    type: "quick5"
    primaryHandler: CangJieHandler {  }
    secondaryHandler: Xt9Handler {  }


    KeyboardRow {
        MultiCharacterKey { caption: "q"; key: "手"; captionShifted: "Q"; symView: "1"; symView2: "€"; symView3: "1"; symView4: "€" }
        MultiCharacterKey { caption: "w"; key: "田"; captionShifted: "W"; symView: "2"; symView2: "£"; symView3: "2"; symView4: "£" }
        MultiCharacterKey { caption: "e"; key: "水"; captionShifted: "E"; symView: "3"; symView2: "$"; symView3: "3"; symView4: "$" }
        MultiCharacterKey { caption: "r"; key: "口"; captionShifted: "R"; symView: "4"; symView2: "¥"; symView3: "4"; symView4: "¥" }
        MultiCharacterKey { caption: "t"; key: "廿"; captionShifted: "T"; symView: "5"; symView2: "₹"; symView3: "5"; symView4: "₹" }
        MultiCharacterKey { caption: "y"; key: "卜"; captionShifted: "Y"; symView: "6"; symView2: "%"; symView3: "6"; symView4: "%" }
        MultiCharacterKey { caption: "u"; key: "山"; captionShifted: "U"; symView: "7"; symView2: "<"; symView3: "7"; symView4: "<" }
        MultiCharacterKey { caption: "i"; key: "戈"; captionShifted: "I"; symView: "8"; symView2: ">"; symView3: "8"; symView4: "v" }
        MultiCharacterKey { caption: "o"; key: "人"; captionShifted: "O"; symView: "9"; symView2: "["; symView3: "9"; symView4: "[" }
        MultiCharacterKey { caption: "p"; key: "心"; captionShifted: "P"; symView: "0"; symView2: "]"; symView3: "0"; symView4: "]" }

    }

    KeyboardRow {
        splitIndex: 5
        MultiCharacterKey { caption: "a"; key: "日"; captionShifted: "A"; symView: "*"; symView2: "`"; symView3: "*"; symView4: "*" }
        MultiCharacterKey { caption: "s"; key: "尸"; captionShifted: "S"; symView: "#"; symView2: "^"; symView3: "#"; symView4: "#" }
        MultiCharacterKey { caption: "d"; key: "木"; captionShifted: "D"; symView: "+"; symView2: "|"; symView3: "《"; symView4: "+" }
        MultiCharacterKey { caption: "f"; key: "火"; captionShifted: "F"; symView: "-"; symView2: "_"; symView3: "》"; symView4: "-" }
        MultiCharacterKey { caption: "g"; key: "土"; captionShifted: "G"; symView: "="; symView2: "§"; symView3: "="; symView4: "=" }
        MultiCharacterKey { caption: "h"; key: "竹"; captionShifted: "H"; symView: "("; symView2: "{"; symView3: "（"; symView4: "(" }
        MultiCharacterKey { caption: "j"; key: "十"; captionShifted: "J"; symView: ")"; symView2: "}"; symView3: "）"; symView4: ")" }
        MultiCharacterKey { caption: "k"; key: "大"; captionShifted: "K"; symView: "!"; symView2: "¡"; symView3: "！"; symView4: "!" }
        MultiCharacterKey { caption: "l"; key: "中"; captionShifted: "L"; symView: "?"; symView2: "¿"; symView3: "？"; symView4: "?" }
    }

    KeyboardRow {
        splitIndex: 5
        ShiftKey {  }
        MultiCharacterKey { caption: "z"; key: "？"; captionShifted: "Z"; symView: "@"; symView2: "«"; symView3: "@"; symView4: "<" }
        MultiCharacterKey { caption: "x"; key: "難"; captionShifted: "X"; symView: "&"; symView2: "»"; symView3: "&"; symView4: ">" }
        MultiCharacterKey { caption: "c"; key: "金"; captionShifted: "C"; symView: "/"; symView2: "\""; symView3: "『"; symView4: "[" }
        MultiCharacterKey { caption: "v"; key: "女"; captionShifted: "V"; symView: "\\"; symView2: "“"; symView3: "』"; symView4: "]" }
        MultiCharacterKey { caption: "b"; key: "月"; captionShifted: "B"; symView: "'"; symView2: "”"; symView3: ":"; symView4: ":" }
        MultiCharacterKey { caption: "n"; key: "弓"; captionShifted: "N"; symView: ";"; symView2: "„"; symView3: "；"; symView4: ";" }
        MultiCharacterKey { caption: "m"; key: "一"; captionShifted: "M"; symView: ":"; symView2: "~"; symView3: "－"; symView4: "~" }
        BackspaceKey {  }
    }

    SpacebarRow {  }
}
