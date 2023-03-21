import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/presentation/themes/style.dart';
import 'package:todo_firestore/presentation/architecture/page_state.dart';
import 'package:todo_firestore/presentation/screens/sign_in/view_models/sign_in_bloc.dart';
import 'package:todo_firestore/presentation/widgets/widgets.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<SignInBloc, SignInState>(
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
                                  'Sign In to Flash Chat',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 40.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
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
                        onChanged: (value) => context.read<SignInBloc>().add(OnEmailChanged(value)),
                      ),
                      const SizedBox(height: 8.0),
                      TextField(
                        obscureText: !state.isPasswordVisible,
                        onChanged: (value) => context.read<SignInBloc>().add(OnEmailChanged(value)),
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your password.',
                          suffixIcon: IconButton(
                            icon: Icon(
                              state.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () => context.read<SignInBloc>().add(const OnTooglePasswordVisible()),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      CustomButton(
                        buttonLabel: 'Log In',
                        color: Colors.lightBlueAccent,
                        onPressed: () => context.read<SignInBloc>().add(const OnSignInPressed()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(onTap: () {}, child: const Text('Forget Your password ', textAlign: TextAlign.left)),
                          InkWell(
                            onTap: () => Navigator.pushNamed(context, 'sign_up'),
                            child: const Text('Sign Up ', textAlign: TextAlign.right),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
