//
//  LaunchScreenView.swift
//  MovieSearcherAPP
//
//  Created by Ismael Kabore on 12/9/23.
//

import SwiftUI
//
//struct LaunchScreenView: View {
//    
//    @EnvironmentObject var launchScreenManager: LaunchScreenManager
//    @State private var firstPhaseIsAnimating: Bool = false
//    @State private var secondPhaseIsAnimating: Bool = false
//    private let timer = Timer.publish(every: 0.65,
//                                      on: .main,
//                                      in: .common).autoconnect()
//    
//    
//    var body: some View {
//        ZStack{
//            background
//            logo
//            
//        }
//        .onReceive(timer) { input in
//            
//            switch launchScreenManager.state {
//            case .first:
//                withAnimation(.spring()){
//                    // First phase with continous scaling
//                    firstPhaseIsAnimating.toggle()
//                }
//            case .second:
//                withAnimation(.easeInOut) {
//                    // First pahse with continous scaling
//                    secondPhaseIsAnimating.toggle()
//                }
//            default: break
//            }
//        }
//        .opacity(secondPhaseIsAnimating ? 0 : 1)
//    }
//}
//
//
//struct LaunchScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        LaunchScreenView()
//            .environmentObject(LaunchScreenManager())
//    }
//}
//
//private extension LaunchScreenView {
//    var background: some View {
//        Color("Launch-screen-background")
//            .edgesIgnoringSafeArea(.all)
//    }
//    
//    var logo: some View {
//        Image("logo")
//            .scaleEffect(firstPhaseIsAnimating ? 0.6 : 1)
//            .scaleEffect(secondPhaseIsAnimating ? UIScreen.main.bounds.size.height / 4 : 1)
//        
//    }
//}


//struct BouncingButton: View {
//    @State private var pressed = false
//
//    var body: some View {
//        Button("Press Me") {
//            pressed.toggle()
//        }
//        .padding()
//        .background(pressed ? Color("logo") : Color("logo"))
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .scaleEffect(pressed ? 1.1 : 1.0)
//        .animation(.spring(response: 0.3, dampingFraction: 0.5), value: pressed)
//    }
//}

struct FadeInView: View {
    @State private var visible = false

    var body: some View {
        ZStack {
            Color("Launch-screen-background")
                .ignoresSafeArea()

            VStack {
                Spacer()
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .opacity(visible ? 1 : 0)

                Text("Movie Search APP!")
                    .opacity(visible ? 1 : 0)
                    .foregroundColor(Color("TertiaryColor"))
                    .font(.largeTitle)
                    .padding()

                Spacer()
            }
        }
        .ignoresSafeArea() // Ignore the safe area for the entire ZStack
        .onAppear {
            withAnimation(.easeIn(duration: 2.0)) {
                visible = true
            }
        }
    }
}
