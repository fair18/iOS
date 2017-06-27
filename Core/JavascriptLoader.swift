//
//  JavascriptLoader.swift
//  DuckDuckGo
//
//  Copyright © 2017 DuckDuckGo. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//


import Foundation
import WebKit


public class JavascriptLoader {
    
    public enum Script: String {
        case document
        case favicon
    }
    
    public func load(_ script: Script, withController controller: WKUserContentController) {
        let bundle = Bundle(for: JavascriptLoader.self)
        let path = bundle.path(forResource: script.rawValue, ofType: "js")!
        let scriptString = try! String(contentsOfFile: path)
        let script = WKUserScript(source: scriptString, injectionTime: .atDocumentStart, forMainFrameOnly: true)
        controller.addUserScript(script)
    }
}
