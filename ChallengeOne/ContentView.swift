import SwiftUI

struct ContentView: View {
    @State private var checkValue = ""
    @State private var input_para = 1
    @State private var output_para = 1
    
    let selectPara = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var calculation: Double{
        let newCheckValue = Double(checkValue) ?? 0
        if selectPara[input_para] == selectPara[output_para] {
            return newCheckValue
        }
        if (selectPara[input_para] == "Fahrenheit"){
            if(selectPara[output_para] == "Celsius"){
                let cel_value = (newCheckValue - 32) * 5 / 9
                return cel_value
            }
            if(selectPara[output_para] == "Kelvin"){
                let kel_val = (newCheckValue - 32) * 5/9 + 273.15
                return kel_val
            }
        }
        
        if (selectPara[input_para] == "Celsius"){
            if(selectPara[output_para] == "Fahrenheit"){
                let fah_value = (newCheckValue * 9/5) + 32
                return fah_value
            }
            if(selectPara[output_para] == "Kelvin"){
                let kel_val = newCheckValue + 273.15
                return kel_val
            }
        }
        
        if (selectPara[input_para] == "Kelvin"){
            if(selectPara[output_para] == "Fahrenheit"){
                let fah_value = (newCheckValue - 273.15) * 9/5 + 32
                return fah_value
            }
            if(selectPara[output_para] == "Celsius"){
                let cel_val = newCheckValue - 273.15
                return cel_val
            }
        }
        return 2.222
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Select Input Parameter")){
                    
                    Picker("Select Input Parameter", selection: $input_para){
                        ForEach(0 ..< selectPara.count){
                            Text("\(self.selectPara[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    TextField("Enter the value", text: $checkValue)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Select Output Parameter")){
                    Picker("Select Input Parameter", selection: $output_para){
                        ForEach(0 ..< selectPara.count){
                            Text("\(self.selectPara[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("\(calculation, specifier: "%.2f") degree")
                }
            }
            .navigationTitle("Conversion")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
