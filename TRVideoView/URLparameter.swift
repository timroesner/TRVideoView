//
//  URLparameter.swift
//  TRVideoView
//
//  Created by Tim Roesner on 12/8/17.
//  Copyright © 2017 Tim Roesner. All rights reserved.
//

import Foundation

extension URL {
    
    subscript(queryParam: String) -> String {
        guard let url = URLComponents(string: self.absoluteString) else { return "" }
        return url.queryItems?.first(where: { $0.name == queryParam })?.value ?? ""
    }
    
}
