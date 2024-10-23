//
//  AuthenticationView.swift
//  cs184hw1
//
//  Created by Andy Jin on 10/23/24.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View{
        VStack{
            NavigationLink{
                SignInEmailView()
            } label: {
                Text("Sign In With Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Sign In")
    }
}

struct AuthenticationView_Previews: PreviewProvider{
    static var previews: some View{
        NavigationStack{
            AuthenticationView()
        }
    }
}
