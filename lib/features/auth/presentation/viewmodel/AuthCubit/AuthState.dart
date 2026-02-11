part of 'AuthCubit.dart';

sealed class Authstate {}

class AuthInitial extends Authstate {}

class AuthLoading extends Authstate {}

class AuthSuccess extends Authstate {
  final User user;
  AuthSuccess({required this.user});
}

class AuthFailed extends Authstate {
  final String message;
    AuthFailed({required this.message});
   
}
