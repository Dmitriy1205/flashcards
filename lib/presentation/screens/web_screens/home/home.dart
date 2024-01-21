import 'package:cached_network_image/cached_network_image.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/router/router.dart';
import 'package:flashcards/presentation/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/const/colors.dart';
import '../../../../core/themes/theme.dart';
import '../../../blocs/auth/auth_bloc.dart';

class WebHomeScreen extends StatefulWidget {
  final Widget child;

  const WebHomeScreen({super.key, required this.child});

  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Uri currentRoute = router.routeInformationProvider.value.uri;
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      body: LayoutBuilder(

        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 700) {
        return Stack(
          children: [
            widget.child,
            Positioned(
              left: 24,
              bottom: 34,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppIconButton(
                        onTap: () {
                          router.go('/web_lists');
                        },
                        color: currentRoute.toString() == '/web_lists'
                            ? AppColors.mainAccent
                            : AppColors.neutralGrey,
                        svgIcon: currentRoute.toString() == '/web_lists'
                            ? AppIcons.lists
                            : AppIcons.listsThin),
                    AppIconButton(
                        onTap: () {
                          router.go('/web_learn');
                        },
                        color: currentRoute.toString() == '/web_learn'
                            ? AppColors.mainAccent
                            : AppColors.neutralGrey,
                        svgIcon: currentRoute.toString() == '/web_learn'
                            ? AppIcons.solidHat
                            : AppIcons.learn),
                    context.read<AuthBloc>().state.user?.photoURL == null
                        ? AppIconButton(
                        onTap: () {
                          router.go('/web_profile');
                        },
                        color: currentRoute.toString() == '/web_profile'
                            ? AppColors.mainAccent
                            : AppColors.neutralGrey,
                        svgIcon: currentRoute.toString() == '/web_profile'
                            ? AppIcons.solidProfile
                            : AppIcons.profileThin)
                        : InkWell(
                      onTap: () {
                        router.go('/web_profile');
                      },
                      child: currentRoute.toString() == '/web_profile'
                          ? Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: AppColors.mainAccent,
                            borderRadius: BorderRadius.circular(70)),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CachedNetworkImage(
                                imageUrl: context
                                    .read<AuthBloc>()
                                    .state
                                    .user!
                                    .photoURL!,
                                progressIndicatorBuilder: (context, url,
                                    downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                      )
                          : SizedBox(
                        height: 40,
                        width: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: CachedNetworkImage(
                            imageUrl: context
                                .read<AuthBloc>()
                                .state
                                .user!
                                .photoURL!,
                            progressIndicatorBuilder: (context, url,
                                downloadProgress) =>
                                CircularProgressIndicator(
                                    value:
                                    downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }
          return Stack(
            children: [
              widget.child,
              Positioned(
                left: 87,
                bottom: 51,
                child: Container(
                  width: MediaQuery.of(context).size.width / 4.5,
                  height: MediaQuery.of(context).size.height / 9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppIconButton(
                          onTap: () {
                            router.go('/web_lists');
                          },
                          color: currentRoute.toString() == '/web_lists'
                              ? AppColors.mainAccent
                              : AppColors.neutralGrey,
                          svgIcon: currentRoute.toString() == '/web_lists'
                              ? AppIcons.lists
                              : AppIcons.listsThin),
                      AppIconButton(
                          onTap: () {
                            router.go('/web_learn');
                          },
                          color: currentRoute.toString() == '/web_learn'
                              ? AppColors.mainAccent
                              : AppColors.neutralGrey,
                          svgIcon: currentRoute.toString() == '/web_learn'
                              ? AppIcons.solidHat
                              : AppIcons.learn),
                      context.read<AuthBloc>().state.user?.photoURL == null
                          ? AppIconButton(
                          onTap: () {
                            router.go('/web_profile');
                          },
                          color: currentRoute.toString() == '/web_profile'
                              ? AppColors.mainAccent
                              : AppColors.neutralGrey,
                          svgIcon: currentRoute.toString() == '/web_profile'
                              ? AppIcons.solidProfile
                              : AppIcons.profileThin)
                          : InkWell(
                        onTap: () {
                          router.go('/web_profile');
                        },
                        child: currentRoute.toString() == '/web_profile'
                            ? Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: AppColors.mainAccent,
                              borderRadius: BorderRadius.circular(70)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: CachedNetworkImage(
                                  imageUrl: context
                                      .read<AuthBloc>()
                                      .state
                                      .user!
                                      .photoURL!,
                                  progressIndicatorBuilder: (context, url,
                                      downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        )
                            : SizedBox(
                          height: 40,
                          width: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: CachedNetworkImage(
                              imageUrl: context
                                  .read<AuthBloc>()
                                  .state
                                  .user!
                                  .photoURL!,
                              progressIndicatorBuilder: (context, url,
                                  downloadProgress) =>
                                  CircularProgressIndicator(
                                      value:
                                      downloadProgress.progress),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },

      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: const Text(
      'cancel',
      style: TextStyle(color: Colors.blue),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text(
      'logout',
      style: TextStyle(color: Colors.black),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    title: Text('warning', style: AppTheme.themeData.textTheme.titleSmall),
    content: Text('areYouSure',
        style: AppTheme.themeData.textTheme.bodySmall!
            .copyWith(color: Colors.black)),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
