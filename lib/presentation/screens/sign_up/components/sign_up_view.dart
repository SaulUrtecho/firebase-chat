import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/application/themes/style.dart';
import 'package:todo_firestore/presentation/architecture/page_state.dart';
import 'package:todo_firestore/presentation/screens/sign_up/view_models/sign_up_bloc.dart';
import 'package:todo_firestore/presentation/widgets/widgets.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return state.pageState == PageState.loading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        child: Hero(
                          tag: 'logo',
                          child: Row(
                            children: [
                              Expanded(child: Image.asset('assets/images/logo.png')),
                              const Expanded(
                                child: Text(
                                  'Create a Flash Chat Account',
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 48.0),
                      TextField(
                        decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => context.read<SignUpBloc>().add(OnEmailChanged(value)),
                      ),
                      const SizedBox(height: 8.0),
                      TextField(
                        decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password.'),
                        obscureText: true,
                        onChanged: (value) => context.read<SignUpBloc>().add(OnPasswordChanged(value)),
                      ),
                      const SizedBox(height: 24.0),
                      CustomButton(
                        color: Colors.lightBlueAccent,
                        buttonLabel: 'Register',
                        onPressed: state.isSubmitEnabled
                            ? () => context.read<SignUpBloc>().add(const OnSignUpPressed())
                            : null,
                      ),
                      InkWell(
                        child: const Text('Already have an account? Sign In ', textAlign: TextAlign.right),
                        onTap: () => Navigator.pushNamed(context, 'sign_in'),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
