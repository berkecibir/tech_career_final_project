import 'package:flutter/material.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  final Widget loadingWidget;

  AuthLoading({
    this.loadingWidget = const CircularProgressIndicator.adaptive(),
  });
}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
