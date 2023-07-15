//
//  ContentView.swift
//  InterestCalculator
//
//  Created by Salih Yusuf Göktaş on 14.07.2023.
//

import SwiftUI

struct ContentView: View {
	@State var anaPara = 0
	
	let formatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle  = .currency
		formatter.locale = Locale(identifier: "en_US")
		return formatter
	}()
	
	let faizOranlar: [Int:Double] = [3:0.2, 6: 0.25, 9: 0.30, 12: 0.50]
	@State var secilenVade = 12
	var toplamPara: String{
		let faizGetirisi = Double(anaPara) * faizOranlar[secilenVade]!
		
		let toplamGetiri = formatter.string(from: NSNumber(value: faizGetirisi + Double(anaPara) ))
		return toplamGetiri!
	}
	
	var body: some View {
		VStack{
			Image("bank")
				.resizable()
				.scaledToFit()
				.frame(width: 220)
			
			Text("Main Money")
				.font(.title)
				.fontWeight(.bold)
				.foregroundColor(.red)
			HStack{
				TextField("0$", value: $anaPara, formatter: formatter)
				
					.keyboardType(.numberPad)
					.padding()
					.frame(height: 60)
					.background(Color.gray.opacity(0.2))
					.cornerRadius(10)
			}
			.padding()
			
			
			
			Text("Select Term")
				.font(.title2)
				.fontWeight(.bold)
				.foregroundColor(.red)
			
			Picker("Select Term", selection: $secilenVade) {
				ForEach(Array(faizOranlar.keys.sorted()), id: \.self){ item in
					Text("\(item)")
					
					
				}
			}.pickerStyle(.segmented)
				.padding()
			
			
			Spacer()
			
			Text(toplamPara)
				.fontWeight(.bold)
				.padding()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
