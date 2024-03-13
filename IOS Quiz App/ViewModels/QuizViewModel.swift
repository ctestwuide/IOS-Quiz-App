//
//  QuizViewModel.swift
//  IOS Quiz App
//
//  Created by Chase Testwuide on 3/12/24.
//

import Foundation

class QuizViewModel: ObservableObject {
    @Published var selectedQuizType: QuizType?
    @Published var currentQuiz: Quiz?
    @Published var currentQuestionIndex = 0
    @Published var score = 0
    
    private var quizzes: [QuizType: Quiz] = [
        .pokemon: Quiz(type: .pokemon, questions: [

            Question(text: "Which Pokémon was the first to be created by Game Freak?", options: ["Pikachu", "Bulbasaur", "Rhydon", "Mew"], correctAnswer: "Rhydon"),

            Question(text: "What type of Pokémon is Jigglypuff?", options: ["Normal", "Fairy", "Normal/Fairy", "Psychic"], correctAnswer: "Normal/Fairy"),

            Question(text: "Which of these moves can put a Pokémon to sleep?", options: ["Thunder Wave", "Spore", "Flamethrower", "Ice Beam"], correctAnswer: "Spore"),

            Question(text: "What is the name of the device that Trainers use to keep their Pokémon with them when they're not in battle?", options: ["Pokéball", "Pokémon Capsule", "Monster Ball", "Capture Sphere"], correctAnswer: "Pokéball"),

            Question(text: "Which Pokémon does not evolve from or into any other Pokémon?", options: ["Tauros", "Pikachu", "Eevee", "Jigglypuff"], correctAnswer: "Tauros"),

            Question(text: "Which item is used to evolve Onix into Steelix?", options: ["Metal Coat", "King's Rock", "Upgrade", "Dragon Scale"], correctAnswer: "Metal Coat"),

            Question(text: "What is the weakness of Psychic-type Pokémon?", options: ["Bug", "Fire", "Ice", "Water"], correctAnswer: "Bug"),

            Question(text: "Who is the gym leader of Cerulean City in the original Pokémon games?", options: ["Brock", "Misty", "Lt. Surge", "Erika"], correctAnswer: "Misty"),

            Question(text: "In which Pokémon game were Mega Evolutions first introduced?", options: ["Pokémon Black and White", "Pokémon Diamond and Pearl", "Pokémon X and Y", "Pokémon Ruby and Sapphire"], correctAnswer: "Pokémon X and Y"),

            Question(text: "Which of these Pokémon is a Legendary Pokémon?", options: ["Garchomp", "Dragonite", "Salamence", "Lugia"], correctAnswer: "Lugia"),
        ]),
        
        .greekMythology: Quiz(type: .greekMythology, questions: [
        
            Question(text: "Who is the king of the Gods in Greek mythology?", options: ["Zeus", "Poseidon", "Hades", "Apollo"], correctAnswer: "Zeus"),

            Question(text: "What is the name of the winged horse in Greek mythology?", options: ["Pegasus", "Chimera", "Minotaur", "Cerberus"], correctAnswer: "Pegasus"),

            Question(text: "Who is the Greek goddess of love and beauty?", options: ["Athena", "Artemis", "Aphrodite", "Hera"], correctAnswer: "Aphrodite"),

            Question(text: "Which hero is known for completing 12 labors?", options: ["Theseus", "Perseus", "Hercules", "Jason"], correctAnswer: "Hercules"),

            Question(text: "What is the name of the underworld in Greek mythology?", options: ["Elysium", "Olympus", "Tartarus", "Hades"], correctAnswer: "Hades"),

            Question(text: "Who is the Greek god of the sea?", options: ["Zeus", "Poseidon", "Hades", "Apollo"], correctAnswer: "Poseidon"),

            Question(text: "Which mortal woman was said to be more beautiful than the goddess Hera, leading to the Trojan War?", options: ["Helen", "Penelope", "Andromeda", "Hestia"], correctAnswer: "Helen"),

            Question(text: "Who is the Greek goddess of wisdom?", options: ["Athena", "Artemis", "Aphrodite", "Hera"], correctAnswer: "Athena"),

            Question(text: "What was the name of Achilles' only vulnerable spot?", options: ["His heel", "His heart", "His head", "His hand"], correctAnswer: "His heel"),

            Question(text: "Which Greek hero slew the Minotaur in the labyrinth?", options: ["Theseus", "Perseus", "Hercules", "Odysseus"], correctAnswer: "Theseus"),
        ]),
        
        .office: Quiz(type: .office, questions: [
            
            Question(text: "What is the name of the paper company where 'The Office' is set?", options: ["Dunder Mifflin", "Wernham Hogg", "Pendleton Paper", "Scranton Paper Co."], correctAnswer: "Dunder Mifflin"),

            Question(text: "Who does Jim Halpert marry?", options: ["Pam Beesly", "Angela Martin", "Karen Filippelli", "Erin Hannon"], correctAnswer: "Pam Beesly"),

            Question(text: "What is Michael Scott's middle name?", options: ["Gary", "James", "Kurt", "Scott"], correctAnswer: "Gary"),

            Question(text: "Which of these is NOT a Michael Scott alter ego?", options: ["Date Mike", "Prison Mike", "Michael Klump", "Agent Michael Scarn"], correctAnswer: "Agent Michael Scarn"),

            Question(text: "What type of farm does Dwight Schrute own?", options: ["Beet farm", "Dairy farm", "Chicken farm", "Apple orchard"], correctAnswer: "Beet farm"),

            Question(text: "Who is the regional manager of Dunder Mifflin Scranton at the end of the series?", options: ["Jim Halpert", "Dwight Schrute", "Andy Bernard", "Michael Scott"], correctAnswer: "Dwight Schrute"),

            Question(text: "What is the name of Angela's cat that Dwight kills by putting it in the freezer?", options: ["Sprinkles", "Bandit", "Fluffy", "Mr. Ash"], correctAnswer: "Sprinkles"),

            Question(text: "Which office employee did Michael accidentally hit with his car?", options: ["Meredith Palmer", "Phyllis Vance", "Stanley Hudson", "Creed Bratton"], correctAnswer: "Meredith Palmer"),

            Question(text: "What does Jim put Dwight's stapler inside of?", options: ["A Jell-O mold", "A cake", "A locked drawer", "A vending machine"], correctAnswer: "A Jell-O mold"),

            Question(text: "What false name does Andy Bernard give himself when he briefly returns to Dunder Mifflin under an assumed identity?", options: ["Drew", "Rupert", "Lance", "Pete"], correctAnswer: "Drew"),
        ])
        
    ] //End of quizzes
    
    func checkAnswer(_ answer: String) {
        guard let currentQuiz = currentQuiz else { return }
        
        if answer == currentQuiz.questions[currentQuestionIndex].correctAnswer {
            score += 1
        }
        
        if currentQuestionIndex < currentQuiz.questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            //TODO: logic to end quiz
        }
    }
    
    func loadQuiz(forType quizType: QuizType) {
        selectedQuizType = quizType
        currentQuiz = quizzes[quizType]
        currentQuestionIndex = 0
        score = 0
    }
    
}
