import SwiftUI
import AVFoundation

struct CameraView: View {
    @Environment(\.presentationMode) var presentationMode
    let completion: (String) -> Void
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var scannedCode = ""
    
    func getCountryFromBarcode(_ barcode: String) -> String {
        // Barkodun ilk 3 karakterini al
        let prefix = String(barcode.prefix(3))
        
        // Ülke kodlarını kontrol et
        switch prefix {
        case "729": return "İsrail"
        case "869": return "Türkiye"
        case "400", "401", "402", "403", "404", "405", "406", "407", "408", "409", "410", "411", "412", "413", "414", "415", "416", "417", "418", "419", "420", "421", "422", "423", "424", "425", "426", "427", "428", "429", "430", "431", "432", "433", "434", "435", "436", "437", "438", "439", "440": return "Almanya"
        case "300", "301", "302", "303", "304", "305", "306", "307", "308", "309", "310", "311", "312", "313", "314", "315", "316", "317", "318", "319", "320", "321", "322", "323", "324", "325", "326", "327", "328", "329", "330", "331", "332", "333", "334", "335", "336", "337", "338", "339", "340", "341", "342", "343", "344", "345", "346", "347", "348", "349", "350", "351", "352", "353", "354", "355", "356", "357", "358", "359", "360", "361", "362", "363", "364", "365", "366", "367", "368", "369", "370", "371", "372", "373", "374", "375", "376", "377", "378", "379": return "Fransa"
        case "690", "691", "692", "693", "694", "695", "696", "697", "698", "699": return "Çin"
        case "471": return "Tayvan"
        case "474": return "Estonya"
        case "475": return "Letonya"
        case "477": return "Litvanya"
        case "479": return "Sri Lanka"
        case "480": return "Filipinler"
        case "482": return "Ukrayna"
        case "484": return "Moldovya"
        case "485": return "Ermenistan"
        case "486": return "Gürcistan"
        case "487": return "Kazakistan"
        case "489": return "Hong Kong"
        case "520": return "Yunanistan"
        case "528": return "Lübnan"
        case "529": return "Kıbrıs Rum Kesimi"
        case "531": return "Makedonya"
        case "535": return "Malta"
        case "539": return "İrlanda"
        case "560": return "Portekiz"
        case "569": return "İzlanda"
        case "590": return "Polonya"
        case "594": return "Romanya"
        case "599": return "Macaristan"
        case "600", "601": return "Güney Afrika"
        case "609": return "Mauritius"
        case "611": return "Fas"
        case "613": return "Cezayir"
        case "619": return "Tunus"
        case "622": return "Mısır"
        case "625": return "Ürdün"
        case "626": return "İran"
        case "750": return "Meksika"
        case "759": return "Venezuela"
        case "770": return "Kolombiya"
        case "773": return "Uruguay"
        case "775", "785": return "Peru"
        case "777": return "Bolivya"
        case "779": return "Arjantin"
        case "780": return "Şili"
        case "784": return "Paraguay"
        case "786": return "Ekvador"
        case "789": return "Brezilya"
        case "850": return "Küba"
        case "858": return "Slovakya"
        case "859": return "Çek Cumhuriyeti"
        case "860": return "Yugoslavya"
        case "880": return "Güney Kore"
        case "885": return "Tayland"
        case "888": return "Singapur"
        case "890": return "Hindistan"
        case "893": return "Vietnam"
        case "899": return "Endonezya"
        case "955": return "Malezya"
        case "977": return "Uluslararası periyodik yayınlar"
        case "978": return "Uluslararası standart kitap numarası"
        case "979": return "Uluslararası müzik numarası"
        case "000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013": return "ABD/Kanada"
        case "450", "490": return "Japonya"
        case "500": return "Birleşik Krallık"
        case "540": return "Belçika & Lüksemburg"
        case "570": return "Danimarka"
        case "640": return "Finlandiya"
        case "700": return "Norveç"
        case "730": return "İsveç"
        case "760": return "İsviçre"
        case "800", "801", "802", "803": return "İtalya"
        case "840": return "İspanya"
        case "870": return "Hollanda"
        case "900", "901": return "Avusturya"
        case "930": return "Avustralya"
        case "940": return "Yeni Zelanda"
        default: return "Bilinmeyen"
        }
    }
    
    var body: some View {
        ZStack {
            // Kamera görünümü
            CodeScannerView(
                codeTypes: [.ean8, .ean13, .upce],
                completion: handleScan
            )
            
            // Barkod tarama çerçevesi
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Rectangle()
                        .stroke(Color.white, lineWidth: 2)
                        .frame(width: 250, height: 150)
                        .overlay(
                            Rectangle()
                                .stroke(Color(red: 0.2, green: 0.4, blue: 0.8), lineWidth: 3)
                                .padding(2)
                        )
                        .overlay(
                            Image(systemName: "barcode.viewfinder")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .opacity(0.7)
                        )
                    Spacer()
                }
                
                // Bilgi metni
                Text("Barkodu çerçevenin içine getirin")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .padding(.top, 20)
                    .padding(.bottom, 50)
            }
            
            // Kapatma butonu
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .padding()
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("Tamam")) {
                    completion(scannedCode)
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        switch result {
        case .success(let result):
            scannedCode = result.string
            let country = getCountryFromBarcode(result.string)
            
            // Barkod 729 ile başlıyorsa uyarı ver
            if result.string.hasPrefix("729") {
                alertTitle = "DİKKAT"
                alertMessage = "Bu ürün İsrail menşeili olabilir. Satın almanız önerilmez.\n\nBarkod: \(result.string)\nMenşei: \(country)"
                showingAlert = true
            } else {
                alertTitle = "Ürün Bilgisi"
                alertMessage = "Barkod: \(result.string)\nMenşei: \(country)"
                showingAlert = true
            }
        case .failure(let error):
            alertTitle = "Hata"
            alertMessage = error.localizedDescription
            showingAlert = true
        }
    }
}

// Barkod tarayıcı için gerekli yapılar
struct ScanResult {
    let string: String
}

enum ScanError: Error {
    case badInput, badOutput
    case initializationError
    case captureError
    
    var localizedDescription: String {
        switch self {
        case .badInput:
            return "Geçersiz giriş"
        case .badOutput:
            return "Geçersiz çıkış"
        case .initializationError:
            return "Kamera başlatılamadı"
        case .captureError:
            return "Görüntü yakalanamadı"
        }
    }
}

struct CodeScannerView: UIViewControllerRepresentable {
    let codeTypes: [AVMetadataObject.ObjectType]
    let completion: (Result<ScanResult, ScanError>) -> Void
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let session = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            completion(.failure(.initializationError))
            return viewController
        }
        
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            completion(.failure(.initializationError))
            return viewController
        }
        
        if session.canAddInput(videoInput) {
            session.addInput(videoInput)
        } else {
            completion(.failure(.initializationError))
            return viewController
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if session.canAddOutput(metadataOutput) {
            session.addOutput(metadataOutput)
            
            // Tarama alanını sınırla
            let scanRect = CGRect(x: 0.2, y: 0.3, width: 0.6, height: 0.4)
            metadataOutput.rectOfInterest = scanRect
            
            metadataOutput.setMetadataObjectsDelegate(context.coordinator, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = codeTypes
        } else {
            completion(.failure(.initializationError))
            return viewController
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = viewController.view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        viewController.view.layer.addSublayer(previewLayer)
        
        // Kamera başlatma işlemini arka planda yap
        DispatchQueue.global(qos: .userInitiated).async {
            session.startRunning()
        }
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(completion: completion)
    }
    
    class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
        let completion: (Result<ScanResult, ScanError>) -> Void
        
        init(completion: @escaping (Result<ScanResult, ScanError>) -> Void) {
            self.completion = completion
        }
        
        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            if let metadataObject = metadataObjects.first,
               let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject,
               let stringValue = readableObject.stringValue {
                completion(.success(ScanResult(string: stringValue)))
            }
        }
    }
}

#Preview {
    CameraView(completion: { _ in })
} 
