//
//  AboutUsView.swift
//  Weather
//
//  Created by Sandeep Reddy on 2023-08-02.
//

import Foundation
import SwiftUI
struct AboutUsView: View {
    var body: some View {
          VStack(spacing: 20) {
              Text("About Us")
                  .font(.title)
              Text("Developer Name: Sandeep Reddy Shegur")
                  .font(.headline)
              Text("Email: sandeep@example.com")
                  .font(.subheadline)
              Text("Website: www.sandeepdeveloper.com")
                  .font(.subheadline)
          }
          .padding()
      }
}
