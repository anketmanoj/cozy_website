/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String date;
  String name;
  String email;
  String mobileNo;
  String message;

  FeedbackForm(this.date, this.name, this.email, this.mobileNo, this.message);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm("${json['date']}", "${json['name']}",
        "${json['email']}", "${json['mobileNo']}", "${json['message']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
        'date': date,
        'name': name,
        'email': email,
        'mobileNo': mobileNo,
        'message': message
      };
}
