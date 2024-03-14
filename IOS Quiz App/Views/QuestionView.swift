//
//  QuestionView.swift
//  IOS Quiz App
//
//  Created by Chase Testwuide on 3/13/24.
//

import SwiftUI

struct QuestionView: View {
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    QuestionView(viewModel: QuizViewModel())
}
