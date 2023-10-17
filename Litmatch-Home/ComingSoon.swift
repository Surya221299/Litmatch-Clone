//
//  ComingSoon.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 23/09/23.
//

import SwiftUI

struct ComingSoon: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Coming Soon!!")
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    // 2
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            // 4
                            HStack {
                                Image("profile_back_button")
                            }
                        }
                    }
                }
        }
        .frame(maxHeight: .infinity)
        .frame(maxWidth: .infinity)
    }
}

struct ComingSoon_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoon()
    }
}
