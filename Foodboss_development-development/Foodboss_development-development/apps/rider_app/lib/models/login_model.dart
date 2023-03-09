class LoginRequestModel {
  String? phone;
  String? signature;

  LoginRequestModel({this.phone, this.signature});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['signature'] = this.signature;
    return data;
  }
}

class AuthResponseModel {
  bool? success;
  String? message;

  AuthResponseModel({this.message});

  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }
}



// class LoginState extends Equatable {
//   @override
//   List<Object> get props => [];
// }

// class LoginLoading extends LoginState {}

// class LoginFailure extends LoginState {
//   final String error;

//   LoginFailure({required this.error});

//   @override
//   List<Object> get props => [error];
// }