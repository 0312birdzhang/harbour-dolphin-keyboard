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
    type: "wubi86"
    primaryHandler: WubiHandler {  }
    secondaryHandler: Xt9Handler {  }

    KeyboardRow {
        MultiCharacterKey { key: "q"; caption: "q"; captionShifted: "Q"; symView: "1"; symView2: "€"; symView3: "1"; symView4: "€" }
        MultiCharacterKey { key: "w"; caption: "w"; captionShifted: "W"; symView: "2"; symView2: "£"; symView3: "2"; symView4: "£" }
        MultiCharacterKey { key: "e"; caption: "e"; captionShifted: "E"; symView: "3"; symView2: "$"; symView3: "3"; symView4: "$" }
        MultiCharacterKey { key: "r"; caption: "r"; captionShifted: "R"; symView: "4"; symView2: "¥"; symView3: "4"; symView4: "¥" }
        MultiCharacterKey { key: "t"; caption: "t"; captionShifted: "T"; symView: "5"; symView2: "₹"; symView3: "5"; symView4: "₹" }
        MultiCharacterKey { key: "y"; caption: "y"; captionShifted: "Y"; symView: "6"; symView2: "%"; symView3: "6"; symView4: "%" }
        MultiCharacterKey { key: "u"; caption: "u"; captionShifted: "U"; symView: "7"; symView2: "<"; symView3: "7"; symView4: "<" }
        MultiCharacterKey { key: "i"; caption: "i"; captionShifted: "I"; symView: "8"; symView2: ">"; symView3: "8"; symView4: "v" }
        MultiCharacterKey { key: "o"; caption: "o"; captionShifted: "O"; symView: "9"; symView2: "["; symView3: "9"; symView4: "[" }
        MultiCharacterKey { key: "p"; caption: "p"; captionShifted: "P"; symView: "0"; symView2: "]"; symView3: "0"; symView4: "]" }

    }

    KeyboardRow {
        splitIndex: 5
        MultiCharacterKey { key: "a"; caption: "a"; captionShifted: "A"; symView: "*"; symView2: "`"; symView3: "*"; symView4: "*" }
        MultiCharacterKey { key: "s"; caption: "s"; captionShifted: "S"; symView: "#"; symView2: "^"; symView3: "#"; symView4: "#" }
        MultiCharacterKey { key: "d"; caption: "d"; captionShifted: "D"; symView: "+"; symView2: "|"; symView3: "+"; symView4: "+" }
        MultiCharacterKey { key: "f"; caption: "f"; captionShifted: "F"; symView: "-"; symView2: "_"; symView3: "-"; symView4: "-" }
        MultiCharacterKey { key: "g"; caption: "g"; captionShifted: "G"; symView: "="; symView2: "§"; symView3: "="; symView4: "=" }
        MultiCharacterKey { key: "h"; caption: "h"; captionShifted: "H"; symView: "("; symView2: "{"; symView3: "("; symView4: "（" }
        MultiCharacterKey { key: "j"; caption: "j"; captionShifted: "J"; symView: ")"; symView2: "}"; symView3: ")"; symView4: "）" }
        MultiCharacterKey { key: "k"; caption: "k"; captionShifted: "K"; symView: "!"; symView2: "¡"; symView3: "!"; symView4: "！" }
        MultiCharacterKey { key: "l"; caption: "l"; captionShifted: "L"; symView: "?"; symView2: "¿"; symView3: "?"; symView4: "？" }
    }

    KeyboardRow {
        splitIndex: 5
         ShiftKey {  }
        MultiCharacterKey { key: "?"; caption: "z"; captionShifted: "Z"; symView: "@"; symView2: "«"; symView3: "@"; symView4: "《" }
        MultiCharacterKey { key: "x"; caption: "x"; captionShifted: "X"; symView: "&"; symView2: "»"; symView3: "&"; symView4: "》" }
        MultiCharacterKey { key: "c"; caption: "c"; captionShifted: "C"; symView: "/"; symView2: "\""; symView3: "/"; symView4: "『" }
        MultiCharacterKey { key: "v"; caption: "v"; captionShifted: "V"; symView: "\\"; symView2: "“"; symView3: "\\"; symView4: "』" }
        MultiCharacterKey { key: "b"; caption: "b"; captionShifted: "B"; symView: "'"; symView2: "”"; symView3: "'"; symView4: "「" }
        MultiCharacterKey { key: "n"; caption: "n"; captionShifted: "N"; symView: ";"; symView2: "„"; symView3: ";"; symView4: "」" }
        MultiCharacterKey { key: "m"; caption: "m"; captionShifted: "M"; symView: ":"; symView2: "~"; symView3: ":"; symView4: "~" }
        BackspaceKey {  }
    }

    SpacebarRow {  }

}
