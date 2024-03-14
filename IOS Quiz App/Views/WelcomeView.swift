//
//  WelcomeView.swift
//  IOS Quiz App
//
//  Created by Chase Testwuide on 3/13/24.
//

import SwiftUI

struct WelcomeView: View {
    
    @StateObject var viewModel = QuizViewModel()
//    @State var isReadyToStartQuiz = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.main.ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Select A Quiz")
                        .font(.title)
                        .bold()
                        .foregroundColor(AppColor.accent)
                    Spacer()
                    
                    Menu { // Menu creates a drop down menu component
                        ForEach(QuizType.allCases, id: \.self) { quizType in
                            /* \.self is used as the id because enums without associated values
                             are Hashable by default, satisfying the requirement
                             for identifiable data inForEach`. */
                            Button(quizType.rawValue) {
                                viewModel.selectedQuizType = quizType
                            } //Using a ForEach creates a "button"/selector for each quiz type
                        }
                    } label: {
                        Text(viewModel.selectedQuizType?.rawValue ?? "Available Quizzes")
                        /* The ? is used for optional chaining to access the rawValue if
                         selectedQuizType is not nil.
                         
                         Nil-Coalescing Operator (??): This operator provides a default value for
                         an optional. If the optional on the left side of ?? is nil, the expression
                         on the right side is used instead. */
                            .foregroundColor(AppColor.accent) // This sets the label color
                            .font(.title3)
                            .bold()
                    }
                    .padding()
                    .background(AppColor.main)
                    .border(AppColor.accent, width: 3)
                    
                    Spacer()
                    
                    if viewModel.selectedQuizType != nil {
                        NavigationLink("Start Quiz", destination: QuestionView(viewModel: viewModel))
                            .padding()
                            .background(AppColor.main)
                            .border(AppColor.accent, width: 3)
                            .foregroundColor(AppColor.accent)
                    } //End of Start Quiz Navigation
                    
                   Spacer()
                    
                } //End of VStack
                
            } //End of ZStack
        } //End of NavigationStack
    }
}

#Preview {
    WelcomeView()
}
