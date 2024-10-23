//
//  RootView.swift
//  cs184hw1
//
//  Created by Andy Jin on 10/23/24.
//

import SwiftUI


struct RootView: View {
    @State private var showSignInView: Bool = false
    var body: some View {
        ZStack{
            NavigationStack{
                SettingsView()
            }

            }
        
        .onAppear{
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented:$showSignInView){
            NavigationStack{
                AuthenticationView()
            }
        }
    }
}
struct RootView_Previews: PreviewProvider{
    static var previews: some View{
        RootView()
    }
}
