import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_test_app/extension/media_query.dart';
import 'package:recipe_test_app/main.dart';
import 'package:recipe_test_app/screens/login/cubit/login_cubit.dart';
import 'package:recipe_test_app/utils/helper/validator.dart';
import 'package:recipe_test_app/utils/values/color_manager.dart';
import 'package:recipe_test_app/utils/values/const_strings.dart';
import 'package:recipe_test_app/utils/values/font_manager.dart';
import 'package:recipe_test_app/utils/values/values_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: const Scaffold(
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          margin: EdgeInsets.all(AppMargin.m16),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight -
                      MediaQuery.of(context).padding.top * 2),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _LogoImage(),
                    SizedBox(
                      height: WidgetHeight.h70,
                    ),
                    const _WelcomeTitle(),
                    SizedBox(
                      height: WidgetHeight.h10,
                    ),
                    const _WelcomeSubTitle(),
                    SizedBox(
                      height: WidgetHeight.h30,
                    ),
                    const _UserNameTextField(),
                    SizedBox(
                      height: WidgetHeight.h10,
                    ),
                    const _UserPasswordTextField(),
                    const _RemeberMe(),
                    const Spacer(),
                    const _LoginAction()
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }));
  }
}

class _LogoImage extends StatelessWidget {
  const _LogoImage();

  @override
  Widget build(BuildContext context) {
    return FlutterLogo(size: WidgetWidth.w85);
  }
}

class _WelcomeTitle extends StatelessWidget {
  const _WelcomeTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      ConstStrings.welcomeTo,
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(fontSize: FontSizeManager.s24, color: ColorManager.primary),
    );
  }
}

class _WelcomeSubTitle extends StatelessWidget {
  const _WelcomeSubTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      ConstStrings.introPage3Title,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: ColorManager.primary, fontSize: FontSizeManager.s16),
    );
  }
}

class _UserNameTextField extends StatelessWidget {
  const _UserNameTextField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ConstStrings.email,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ColorManager.textFieldNameColor),
          ),
          SizedBox(
            height: WidgetHeight.h4,
          ),
          TextFormField(
            validator: (value) {
              return Validator.isValidEmail(value)
                  ? ConstStrings.invalid
                  : null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: "${ConstStrings.enter} ${ConstStrings.email}",
            ),
          )
        ],
      ),
    );
  }
}

class _UserPasswordTextField extends StatelessWidget {
  const _UserPasswordTextField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ConstStrings.password,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: ColorManager.textFieldNameColor),
        ),
        SizedBox(
          height: WidgetHeight.h4,
        ),
        TextFormField(
          validator: (value) {
            return Validator.isPasswordValid(value)
                ? ConstStrings.invalid
                : null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: ConstStrings.password,
            suffixIcon: const Icon(Icons.remove_red_eye),
          ),
        )
      ],
    );
  }
}

class _RemeberMe extends StatelessWidget {
  const _RemeberMe();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: CheckboxListTile(
            visualDensity: const VisualDensity(horizontal: -4),
            contentPadding: EdgeInsets.zero,
            title: Text(
              ConstStrings.remeberMe,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            onChanged: (value) {},
            value: true,
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Text(ConstStrings.forgetPassword,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: ColorManager.secondary))),
      ],
    );
  }
}

class _LoginAction extends StatelessWidget {
  const _LoginAction();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: WidgetHeight.h50,
        width: context.width,
        child: ElevatedButton(
            onPressed: () => getIt<LoginCubit>().goToHome(),
            child: Text(ConstStrings.login)));
  }
}
