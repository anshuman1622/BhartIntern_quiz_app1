import 'package:quiz_app1/models/quiz_model.dart';

class QuizService {
  List<Question> getQuestions() {
    return [
      Question(
        question: 'The nucleus of an atom consists of?',
        options: ['electrons and neutrons', 'electrons and protons', 'protons and neutrons', 'All of the above'],
        correctAnswerIndex: 1,
      ),
      Question(
        question: 'The Battle of Plassey was fought in?',
        options: ['1757', '1782', '1748', '1764'],
        correctAnswerIndex: 0,
      ),
      Question(
        question: 'In which decade was the American Institute of Electrical Engineers (AIEE) founded?',
        options: ["1850s","1880s","1930s","1950s"],
        correctAnswerIndex: 1,
      ),
      Question(
        question: 'What is part of a database that holds only one type of information?',
        options: ["Report","Field","Record","File"],
        correctAnswerIndex: 1,
      ),
      Question(question: "'OS' computer abbreviation usually means?",
      options: ["Order of Significance","Open Software","Operating System","Optical Sensor"], 
      correctAnswerIndex: 2),

      Question(question: "Radiocarbon is produced in the atmosphere as a result of?", 
      options: ["collision between fast neutrons and nitrogen nuclei present in the atmosphere",
      "action of ultraviolet light from the sun on atmospheric oxygen",
      "action of solar radiations particularly cosmic rays on carbon dioxide present in the atmosphere",
      "lightning discharge in atmosphere"], 
      correctAnswerIndex: 0)
      // Add more questions here
    ];
  }
}
