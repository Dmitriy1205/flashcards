import 'package:flashcards/core/const/icons.dart';
import 'package:flashcards/core/router/router.dart';
import 'package:flashcards/presentation/blocs/web_list/web_list_bloc.dart';
import 'package:flashcards/presentation/screens/web_screens/home/lists/web_collections.dart';
import 'package:flashcards/presentation/widgets/app_round_button.dart';
import 'package:flashcards/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/const/strings.dart';
import '../../../../../core/themes/theme.dart';
import '../../../../../core/utils/app_toast.dart';

class WebListsScreen extends StatefulWidget {
  const WebListsScreen({super.key});

  @override
  State<WebListsScreen> createState() => _WebListsScreenState();
}

class _WebListsScreenState extends State<WebListsScreen> {
  TextEditingController nameTextEditingController = TextEditingController();

  @override
  void initState() {
    context.read<WebListBloc>().add(const WebListEvent.fetchAllCollection());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebListBloc, WebListState>(
        listener: (context,state){
          state.maybeMap(
              loaded: (_){
                AppToast.showSuccess(context, "Success");
              },
              orElse: (){});
        },
        listenWhen: (prev,state){
          return prev.maybeMap(
              loading: (state) => true,
              orElse: () => false);
        },
        builder: (context, state) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 700) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: 64,
                        ),
                        Text(
                          AppStrings.collections,
                          style: AppTheme.themeData.textTheme.headlineLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              backgroundColor: AppColors.background,
              body: state.maybeMap(
                error: (e) => Center(child: Text(e.error)),
                loading: (_) => const LoadingIndicator(),
                orElse: () => WebCollections(),
              ),
              floatingActionButton: state.isEdit
                  ? Padding(
                      padding: const EdgeInsets.only(right: 18.0, bottom: 18),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppRoundButton(
                            onTap: () {
                              context.read<WebListBloc>().add(
                                  const WebListEvent.deleteCollection(
                                      collectionsList: []));
                            },
                            svgIcon: AppIcons.trash,
                            showBorder: false,
                            color: AppColors.red,
                          ),
                          const SizedBox(
                            width: 19,
                          ),
                          AppRoundButton(
                            onTap: () {
                              context.read<WebListBloc>().add(
                                  WebListEvent.editCollection(
                                      isEdit: !state.isEdit));
                            },
                            svgIcon: AppIcons.close,
                            showBorder: false,
                            color: AppColors.greyLight,
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 18.0, bottom: 18),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppRoundButton(
                            onTap: () {
                              buildShowDialog(context);
                            },
                            svgIcon: AppIcons.stackPlus,
                            showBorder: false,
                          ),
                          const SizedBox(
                            width: 19,
                          ),
                          AppRoundButton(
                            color: Colors.white,
                            onTap: () {
                              context.read<WebListBloc>().add(
                                  WebListEvent.editCollection(
                                      isEdit: !state.isEdit));
                            },
                            svgIcon: AppIcons.pen,
                            showBorder: true,
                          ),
                        ],
                      ),
                    ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        width: 64,
                      ),
                      Text(
                        AppStrings.collections,
                        style: AppTheme.themeData.textTheme.headlineLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            backgroundColor: AppColors.background,
            body: state.maybeMap(
              initial: (_) => const LoadingIndicator(),
              error: (e) => Center(child: Text(e.error)),
              loading: (_) => const LoadingIndicator(),
              orElse: () => const WebCollections(),
            ),
            floatingActionButton: state.isEdit
                ? Padding(
                    padding: const EdgeInsets.only(right: 80.0, bottom: 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppRoundButton(
                          onTap: () {
                            context.read<WebListBloc>().add(
                                const WebListEvent.deleteCollection(
                                    collectionsList: []));
                          },
                          svgIcon: AppIcons.trash,
                          showBorder: false,
                          color: AppColors.red,
                        ),
                        const SizedBox(
                          width: 19,
                        ),
                        AppRoundButton(
                          onTap: () {
                            // context.read<ListsBloc>().add(
                            //     const ListsEvent.deleteSelectedCollection(
                            //         collectionsList: []));
                            context.read<WebListBloc>().add(
                                WebListEvent.editCollection(
                                    isEdit: !state.isEdit));
                          },
                          svgIcon: AppIcons.close,
                          showBorder: false,
                          color: AppColors.greyLight,
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 80.0, bottom: 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppRoundButton(
                          onTap: () {
                            buildShowDialog(context);
                          },
                          svgIcon: AppIcons.stackPlus,
                          showBorder: false,
                        ),
                        const SizedBox(
                          width: 19,
                        ),
                        AppRoundButton(
                          color: Colors.white,
                          onTap: () {
                            context.read<WebListBloc>().add(
                                WebListEvent.editCollection(
                                    isEdit: !state.isEdit));
                          },
                          svgIcon: AppIcons.pen,
                          showBorder: true,
                        ),
                      ],
                    ),
                  ),
          );
        },
      );
    });
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 3.7,
              width: MediaQuery.of(context).size.width / 3.6,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, top: 12, right: 12, bottom: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            router.pop(context);
                          },
                          child: const FaIcon(
                            FontAwesomeIcons.chevronLeft,
                            size: 12,
                            color: AppColors.mainAccent,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              AppStrings.newCollection,
                              style: AppTheme.themeData.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(AppStrings.giveName,
                        style: AppTheme.themeData.textTheme.labelSmall!
                            .copyWith(color: Colors.black)),
                    const SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.top,
                        style: AppTheme.themeData.textTheme.labelMedium!
                            .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                        controller: nameTextEditingController,
                        decoration: InputDecoration(
                            filled: true,
                            focusColor: AppColors.mainAccent,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        AppColors.mainAccent.withOpacity(0.15)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        AppColors.mainAccent.withOpacity(0.15)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)))),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      child: Text(AppStrings.done,
                          style: AppTheme.themeData.textTheme.labelMedium!
                              .copyWith(color: AppColors.mainAccent)),
                      onPressed: () {
                        if (nameTextEditingController.text.isNotEmpty) {
                          if(context.read<WebListBloc>().state.collectionsList!.any((element) => element.collectionName == nameTextEditingController.text )){
                            AppToast.showError(context, 'Collection with same name exists');
                            router.pop();

                          }else{
                            context.read<WebListBloc>().add(
                                WebListEvent.createCollection(
                                    name: nameTextEditingController.text));
                            nameTextEditingController.clear();
                            router.pop();
                          }

                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
