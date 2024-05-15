    import SwiftUI
    import LocalAuthentication

    struct ContentView: View {
        
        @State private var number = ""
        @State private var isChecking = false
        
        var body: some View {
            
            VStack {
                GeometryReader { geo in
                    TextField("Enter Age", text: $number)
                        .keyboardType(.numberPad)
                        .frame(width: 150, height: 50) // fixed size
                        .position(x: geo.size.width/2, y: geo.size.height/2)
                        .onChange(of: number) { newValue in
                            
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            
                            if let value = Int(newValue), value <= 100 {
                                self.number = newValue
                            } else {
                                self.number = self.number
                            }
                            
                            
                        }
                    
                    
                
                    
                }
                
                Button("Check")
                {
                    
                    let messagee = "enter a number"
                    
                    
                    
                    if self.number.isEmpty {
                        let alert = UIAlertController(title: "Age Check", message: messagee, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "okie", style: .default))
                        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                    } else {
                        isChecking = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            
                            isChecking = false
                            
                            var message = "yea youre \(number)"
                            
                            
                            let alert = UIAlertController(title: "Age Check", message: message, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "okie", style: .default))
                            
                            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                            
                        }
                    }
                        
                    
                    
                    
                }
                if isChecking {
                      ProgressView()
                    }
            }
           
        }
    }
