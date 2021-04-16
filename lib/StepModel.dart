class StepModel {
  final int id;
  final String text;

  StepModel({this.id, this.text});

  static List<StepModel> list = [
    StepModel(
      id: 1,
      text: "Browse the menu and order directly \nfrom the application",
    ),
    StepModel(
      id: 2,
      text: "Your order will be immediately collected and sent by our courier",
    ),
    StepModel(
      id: 3,
      text: "Pick update delivery at your door and enjoy groceries",
    ),
  ];
}
