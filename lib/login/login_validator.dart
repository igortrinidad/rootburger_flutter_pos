import 'dart:async';

mixin LoginValidator{

  var emailValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
      if(email.contains("@") && email.length > 6 ){
        sink.add(email);
      }else{
        sink.addError("Email is not valid");
      }
    }
  );

  var passwordValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (password,sink){
      if(password.length > 6){
        sink.add(password);
      }else{
        sink.addError("Password length should be greater than 6 chars.");
      }
    }
  );

}