//
//  LaunchScreenManager.swift
//  MovieSearcherAPP
//
//  Created by Ismael Kabore on 12/9/23.
//

//import SwiftUI
//
//
//enum LaunchScreenPhase {
//    case first
//    case second
//    case completed
//}
//
//final class LaunchScreenManager: ObservableObject {
//    @Published private(set) var state: LaunchScreenPhase = .first
//    
//    func dismiss() {
//        
//        self.state = .second
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.state = .completed
//            
//            
//        }
//    }
//    
//    //struct LaunchScreenManager: View {
//    //    var body: some View {
//    //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    //    }
//    //}
//    //
//    //struct LaunchScreenManager_Previews: PreviewProvider {
//    //    static var previews: some View {
//    //        LaunchScreenManager()
//    //    }
//    //}
//    
//    
//}
