import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                Image("instagram_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)

                VStack {
                    TextField("Enter your email: ", text: $email)
                        .autocapitalization(.none)
                        .modifier(IGTextFieldModifier())

                    SecureField("Enter your password: ", text: $password)
                        .modifier(IGTextFieldModifier())
                }

                Button {
                    print("show forgot password")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)

                Button {
                    print("Log In")
                } label: {
                    Text("Log In")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                        )
                        .padding(.horizontal)
                        .padding(.top)
                }

                HStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width / 2 - 40, height: 0.5)

                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)

                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width / 2 - 40, height: 0.5)
                }
                .foregroundStyle(.gray)
                .padding()

                HStack {
                    Image("faceboook_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)

                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.blue)
                }
                .padding(.top, 8)

                Spacer()
                Divider()

                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    LoginView()
}

