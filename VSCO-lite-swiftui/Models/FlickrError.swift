//
//  FlickrError.swift
//  VSCO-lite
//
//  Created by Evana Margain Puig on 25/03/25.
//

import Foundation

enum FlickrError: Error {
  case parsing(description: String)
  case network(description: String)
}
