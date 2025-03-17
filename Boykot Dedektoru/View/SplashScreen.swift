import SwiftUI

struct SplashScreen: View {
    @State private var animateLogo = false
    @State private var animateTitle = false
    @State private var animateSlogan = false

    var body: some View {
        ZStack {
            // Arka plan beyaz
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Logo: scale, rotation ve opacity animasyonu (2.5 sn)
                Image("boykotdedektoru")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .scaleEffect(animateLogo ? 1.0 : 0.5)
                    .rotationEffect(.degrees(animateLogo ? 0 : -360))
                    .opacity(animateLogo ? 1.0 : 0.0)
                    .animation(.easeOut(duration: 2.5), value: animateLogo)
                
                // Başlık: 1 saniye gecikmeli, 2.0 sn animasyon
                Text("Boykot Dedektörü")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
                    .offset(y: animateTitle ? 0 : 20)
                    .opacity(animateTitle ? 1.0 : 0.0)
                    .animation(.easeIn(duration: 2.0).delay(1.0), value: animateTitle)
                
                // Slogan: 1.5 saniye gecikmeli, 2.0 sn animasyon
                Text("Bilinçli Alışveriş, Güçlü Toplum!")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.gray)
                    .offset(x: animateSlogan ? 0 : -50)
                    .opacity(animateSlogan ? 1.0 : 0.0)
                    .animation(.easeIn(duration: 2.0).delay(1.5), value: animateSlogan)
            }
        }
        .onAppear {
            animateLogo = true
            animateTitle = true
            animateSlogan = true
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
