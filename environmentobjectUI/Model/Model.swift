//
//  Model.swift
//  environmentobjectUI
//
//  Created by Mufti Ramdhani on 19/06/21.
//

import Foundation
import SwiftUI

//4 buat model
struct UserLogin : Codable, Identifiable {
  let id = UUID()
  let success: Bool
  let token: String
  let expires: Int
  let currUser: Int
  let user: String
  let role: Int
  let isverified: Int
  
  
  
  
  
  
  
}
