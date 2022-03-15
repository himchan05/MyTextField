//
//  ContentView.swift
//  MyTextField
//
//  Created by 박힘찬 on 2022/03/14.
//

import SwiftUI

struct ContentView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var isSearched: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing : 10) {
            HStack {
                TextField("아이디를 입력하세요", text: $username) {
                    if $0 == true {
                        print("활성화")
                        self.isSearched = true
                    } else {
                        print("비활성화")
                        self.isSearched = false
                    }
                }
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none) // first char lower
                    .disableAutocorrection(true) // disable autocorrect
                Button(action: {
                    self.username = ""
                }) {
                    if self.username.count > 0 {
                        Image(systemName: "x.circle")
                            .foregroundColor(Color.red)
                    }
                }
            }
            HStack {
                SecureField("비밀번호를 입력하세요", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none) // first char lower
                    .disableAutocorrection(true) // disable autocorrect
                Button(action: {
                    self.password = ""
                }) {
                    if self.password.count > 0 {
                        Image(systemName: "x.circle")
                            .foregroundColor(Color.red)
                    }
                }
            }
            Text("password: \(self.password)")
            Button(action: {
                print("zzz")
                UIApplication.shared.dismissKeyboard()
            }) {
                Image(systemName: "cursorarrow.click")
                    .font(.system(size: 40))
            }
        }
        .padding()
        .background(Color.green)
        .cornerRadius(20)
    }
}
extension UIApplication { // 비활성화 (return Key)
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
