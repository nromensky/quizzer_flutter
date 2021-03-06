class Question {
  String questionText;
  bool questionAnswer;

  Question(String q, bool a) {
    questionText = q;
    questionAnswer = a;
  }
}

List<Question> questionList = [
  // maximum 28 items
  Question('appetite could be defined as a desire for food', true),
  Question(
      'hunger is the bodys way of alerting you to a physiological need for food',
      true),
  Question(
      'many healthy people can consume less than the recommended amount of protein and still meet their bodies protein needs',
      true),
  Question('if I eat lots of fruit I don’t need to eat any vegetables', false),
  Question(
      'wholegrain bread, beans and lentils are a rich source of fibre', true),
  Question('turnips and oranges are a source of calcium', true),
  Question('sunlight is a source of vitamin D', true),
  Question(
      'saturated fat is better for you than monounsaturated or polyunsaturated fat',
      false),
  Question(
      'excess salt could cause high blood pressure and heart disease', true),
  Question(
      'walking and some household chores such as mowing the lawn is counted as physical activity',
      true),
  Question(
      ' A diet containing an adequate amount of calcium and vitamin D will help prevent against osteoporosis',
      true),
  Question(
      'there is more calcium in a pint of skimmed milk than in a pint of whole milk',
      false),
  Question(
      'people should consume at least 5 portions of fruit and vegetables per day',
      true),
  Question(
      'your fruit and vegetable intake must come from fresh fruit and vegetables only',
      false),
  Question('potato chips are a healthy way to eat potato', false),
  Question('thirst is a good indicator of dehydration', false),
  Question('olive oil prevents heart disease', true),
  Question('sugary soft drinks lead to diabetes', true),
  Question('nuts make you fat', false),
  Question('walking is as effective as running', true),
  Question('drinking fruit juice is as good for you as eating fruit', false),
  Question('yogurt can ease digestive problems', true),
  Question('you can drink too much water', true),
];
