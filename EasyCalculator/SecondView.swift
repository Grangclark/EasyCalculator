//
//  SecondView.swift
//  EasyCalculator
//
//  Created by 長橋和敏 on 2025/01/18.
//

import SwiftUI

struct SecondView: View {
    // 入力値を保持する状態変数
    @State private var firstValue: String = ""
    @State private var secondValue: String = ""
    @State private var result: String = "結果がここに表示されます"
    
    var body: some View {
        VStack(spacing: 20){
            Text("簡単な計算機")
                .font(.largeTitle)
                .padding()
            
            // １つ目のテキストフィールド
            TextField("１つ目の値を入力", text: $firstValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()
            
            // ２つ目のテキストフィールド
            TextField("２つ目の値を入力", text: $secondValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()
            
            // 結果を表示するラベル
            Text(result)
                .font(.title)
                .padding()
            
            // 計算ボタンとクリアボタン
            HStack(spacing: 20) {
                // 計算ボタン
                Button(action: calculate) {
                    Text("計算する")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                // クリアボタン
                Button(action: clear) {
                    Text("クリア")
                        .font(.title)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
    
    // 計算処理
    func calculate() {
        // 入力値を数値に変換
        if let firstNumber = Double(firstValue), let secondNumber = Double(secondValue) {
                let sum = firstNumber + secondNumber
                result = "結果: \(sum)"
        } else {
            // 入力が不正な場合のエラーメッセージ
            result = "入力が正しくありません"
        }
    }
    
    // 入力値と結果をリセット
    func clear() {
        firstValue = ""
        secondValue = ""
        result = "結果がここに表示されます"
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
