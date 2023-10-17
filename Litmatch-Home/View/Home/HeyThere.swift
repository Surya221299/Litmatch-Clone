//
//  HeyThere.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 15/10/23.
//

import SwiftUI

struct HeyThere: View {

    // var untuk multiple language (based on user device)
    
    let heyThereDesc: LocalizedStringKey = "heyThereDesc"
    
    @Binding var show: Bool

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        show.toggle()
                    }, label: {
                        Image("ic_call_ended_close")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 36, height: 36)
                            .foregroundColor(Color("foreground_light_dark").opacity(0.8))
                    })
                }
                .padding(.top, 16)
                .padding(.trailing, 16)

                Image("hey_there_gps_banner")
                    .resizable()
                    .frame(width: 274, height: 250)
                    .padding(.top, -36)
                HStack {
                    Image("ic_hand")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .hidden()
                    Text("Hey There")
                        .font(.system(size: 20, weight: .semibold))

                    Image("ic_hand")
                        .resizable()
                        .frame(width: 36, height: 36)
                }

                Text(heyThereDesc)
                    .font(.system(size: 13, weight: .medium))
                    .multilineTextAlignment(.center)
                    .opacity(0.5)
                HStack {
                    Button(action: {

                    }) {
                        Text("Submit")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(Color.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("primary"))

                    .clipShape(Capsule())
                    .padding(.horizontal, 24)
                }
                .padding(.bottom, 24)

            }
            .background(Color("background_light_dark"))
            .cornerRadius(17)
            .padding(.horizontal, 38)


        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.black.opacity(0.5)
                .onTapGesture {

                        // closing pop up when tapped outside area

                    show.toggle()

                }
        )
        .ignoresSafeArea()
    }
}

struct BlurView : UIViewRepresentable {

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))

        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {

    }
}
