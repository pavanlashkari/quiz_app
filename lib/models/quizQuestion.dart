class quizQuestion{
  const quizQuestion(this.question,this.answer);
  final String question;
  final List<String> answer;

  List<String> getshuffledList(){
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}