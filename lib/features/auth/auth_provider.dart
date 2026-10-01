import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isAuthenticated;
  final String? userEmail;
  final String? userName;
  final String? userRole;
  final bool isLoading;
  final String? errorMessage;

  const AuthState({
    this.isAuthenticated = true,
    this.userEmail = 'admin@company-erp.com',
    this.userName = 'Marcus Vance',
    this.userRole = 'Lead System Architect & Admin',
    this.isLoading = false,
    this.errorMessage,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    String? userEmail,
    String? userName,
    String? userRole,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      userEmail: userEmail ?? this.userEmail,
      userName: userName ?? this.userName,
      userRole: userRole ?? this.userRole,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return const AuthState();
  }

  void login({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    await Future.delayed(const Duration(milliseconds: 600));

    if (email.isNotEmpty && password.isNotEmpty) {
      state = state.copyWith(
        isAuthenticated: true,
        userEmail: email,
        userName: email.split('@').first.toUpperCase(),
        userRole: 'Enterprise Administrator',
        isLoading: false,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Please enter valid email and password.',
      );
    }
  }

  void logout() {
    state = const AuthState(
      isAuthenticated: false,
      userEmail: null,
      userName: null,
      userRole: null,
    );
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);
