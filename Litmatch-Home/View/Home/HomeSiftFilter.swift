//
//  HomeSiftFilter.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 14/10/23.
//

import SwiftUI

struct HomeSiftFilter: View {
    
    // var untuk multiple language (based on user device)
    
    let age: LocalizedStringKey = "age"
    let gender: LocalizedStringKey = "gender"
    let male: LocalizedStringKey = "male"
    let female: LocalizedStringKey = "female"
    let both: LocalizedStringKey = "both"
    let acceptInvitationGame: LocalizedStringKey = "acceptInvitationGame"
    let done: LocalizedStringKey = "done"
    
    
    // var state home sift male
    
    @State var selectedTab: String = "male"
    
    // var untuk state awal toggle terima undangan game
    
    @State var isFlaggingModeEnabled = false
    
    // var untuk Range sliderr....
    
    @State var width: CGFloat = 0
    @State var widthTow: CGFloat = 160
    let offsetValue: CGFloat = 40
    @State var totalScreen: CGFloat = 0
    let maxValue: CGFloat = 35
    @State var isDraggingLeft = false
    @State var isDraggingRight = false
    var lowerValue: Int {Int(map(value: width, from: 0...totalScreen, to: 17...maxValue))}
    var upperValue: Int {Int(map(value: widthTow, from: 0...totalScreen, to: 17...maxValue))}
    
    // var untuk tampilan bottom sheet
    
    @State private var showingBottomSheetSift = false
    @State var detentHeight: CGFloat = 0
    
    var body: some View {
        
        // All sift Bottom Sheet
        
        VStack(alignment: .leading) {
            
            // Umur + angka
            
            HStack {
                Text(age)
                Spacer()
                Text("\(lowerValue) - \(upperValue)")
                    .font(.system(size: 16, weight: .bold))
                    .opacity(0.9)
            }
            .font(.system(size: 16, weight: .semibold))
            .opacity(0.7)
            .padding(.top, 42)
            
            // Range Slider...
            
            HStack {
                ZStack {
                    Color("BG")
                    GeometryReader { geometry in
                        VStack(spacing: 0) {
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color("foreground_light_dark").opacity(0.1))
                                    .opacity(0.3)
                                    .frame(height: 6)
                                    .padding(.horizontal, 6)
                                Rectangle().foregroundStyle(Color("primary"))
                                    .frame(width: widthTow - width, height: 6)
                                    .offset(x: width + 20)
                                HStack(spacing: 0) {
                                    DraggableCircle(isLeft: true, isDragging: $isDraggingLeft, position: $width, otherPosition: $widthTow, limit: totalScreen)
                                    
                                    DraggableCircle(isLeft: false, isDragging: $isDraggingRight, position: $widthTow, otherPosition: $width, limit: totalScreen)

                                }
                            }
                            .offset(y: 8)
                        }
                        .onAppear(){
                            totalScreen = geometry.size.width - offsetValue
                        }
                    }
                }
                .frame(height: 50)
            }
            
            // Gender Title
            
            HStack {
                Text(gender)
                    .font(.system(size: 16, weight: .semibold))
                    .opacity(0.7)
            }
            
            // Choose gender
            
            HStack(spacing: 7) {
                
                // Male
                
                Button(action: {
                    selectedTab = "male"
                }) {
                    VStack {
                        
                        Image("sift_boy")
                            .resizable()
                            .renderingMode(.template)
                            .opacity(selectedTab == "male" ? 1 : 0.4)
                            .frame(width: 32, height: 32)
                        
                        Text(male)
                            .font(.system(size: 15, weight: selectedTab == "male" ? .semibold : .regular))
                    }
                    .frame(maxWidth: .infinity)
                    .tag("male")
                }
                .padding(.vertical, 32)
                .background(Color("foreground_light_dark").opacity(0.01))
                .foregroundColor(selectedTab == "male" ? Color("primary") : Color("foreground_light_dark"))
                .cornerRadius(8)
                
                // Female
                
                Button(action: {
                    selectedTab = "female"
                }) {
                    VStack {
                        Image("sift_girl")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 32, height: 32)
                            .opacity(selectedTab == "female" ? 1 : 0.4)
                        Text(female)
                            .font(.system(size: 15, weight: selectedTab == "female" ? .semibold : .regular))
                    }
                    .frame(maxWidth: .infinity)
                    .tag("female")
                }
                .padding(.vertical, 32)
                .background(Color("foreground_light_dark").opacity(0.01))
                .foregroundColor(selectedTab == "female" ? Color("primary") : Color("foreground_light_dark"))
                .cornerRadius(8)
                
                // Both
                
                Button(action: {
                    selectedTab = "both"
                }) {
                    VStack {
                        Image("sift_both")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 32, height: 32)
                            .opacity(selectedTab == "both" ? 1 : 0.4)
                        Text(both)
                            .font(.system(size: 15, weight: selectedTab == "both" ? .semibold : .regular))
                        
                    }
                    .frame(maxWidth: .infinity)
                    .tag("both")
                }
                .padding(.vertical, 32)
                .background(Color("foreground_light_dark").opacity(0.01))
                .foregroundColor(selectedTab == "both" ? Color("primary") : Color("foreground_light_dark"))
                .cornerRadius(8)
            }
            
            // Toggle Terima Undangan Game
            
            HStack {
                Button(action: { isFlaggingModeEnabled.toggle() },
                       label: {
                    switch isFlaggingModeEnabled {
                    case true:
                        Image("check_status_off")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color("primary"))
                            .frame(width: 22, height: 22)
                    default:
                        Image("check_status_off")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color("foreground_light_dark"))
                            .frame(width: 22, height: 22)
                            .opacity(0.5)
                        
                    }
                    Text(acceptInvitationGame)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color("foreground_light_dark"))
                        .opacity(0.5)
                })
                
            }
            .padding(.vertical, 12)
            
            // Submit Button
            
            HStack {
                Button(action: {
                    
                }) {
                    Text(done)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(Color.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("primary"))
                
                .clipShape(Capsule())
                .padding(.horizontal, 12)
            }
            
        }
        .padding(.horizontal, 28)
          
    }
    
    // func to get value slider
    
    func map(value: CGFloat, from: ClosedRange<CGFloat>, to: ClosedRange<CGFloat>) -> CGFloat {
        let inputRange = from.upperBound - from.lowerBound
        guard inputRange != 0 else { return 0 }
        let outputRange = to.upperBound - to.lowerBound
        return (value - from.lowerBound) / inputRange * outputRange + to.lowerBound
        
    }
}

struct HomeSiftFilter_Previews: PreviewProvider {
    static var previews: some View {
        HomeSiftFilter()
    }
}

// Tampilan Slider

struct DraggableCircle: View {
    
    var isLeft: Bool
    @Binding var isDragging: Bool
    @Binding var position: CGFloat
    @Binding var otherPosition: CGFloat
    var limit: CGFloat
    
    var body: some View {
        ZStack {
            Circle().frame(width: 25, height: 25).foregroundStyle(Color(UIColor.lightGray))
        }
        .offset(x: position + (isLeft ? 0 : -5))
        .gesture(
            DragGesture()
                .onChanged({value in
                    withAnimation {
                        isDragging = true
                    }
                    if isLeft {
                        position = min(max(value.location.x, 0 ), otherPosition)
                    } else {
                        position = min(max(value.location.x, otherPosition ), limit)
                    }
                })
                .onEnded({ value in
                    withAnimation {
                        isDragging = false
                    }
                })
        )
    }
}
