
import 'package:file_picker/file_picker.dart';
import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/core/utils/app_toast.dart';
import 'package:flashcards/core/utils/extract_filename.dart';
import 'package:flashcards/core/utils/files.dart';
import 'package:flashcards/domain/repositories/collection_pdf_repo/collection_pdf_repo_contract.dart';
import 'package:flashcards/presentation/blocs/auth/auth_bloc.dart';
import 'package:flashcards/presentation/blocs/collection_pdf/collection_pdf_bloc.dart';
import 'package:flashcards/presentation/widgets/app_elevated_button.dart';
import 'package:flashcards/presentation/widgets/custom_app_bar.dart';
import 'package:flashcards/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/const/icons.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/themes/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AttachPdf extends StatefulWidget {
  final String collectionId;
  final String collectionName;

  @override
  State<AttachPdf> createState() => _AttachPdfState();

  const AttachPdf({
    super.key,
    required this.collectionId,
    required this.collectionName,
  });
}

class _AttachPdfState extends State<AttachPdf> {
  final CollectionPdfBloc _collectionPdfBloc =
      CollectionPdfBloc(collectionPdfRepo: sl<CollectionPdfRepo>());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _collectionPdfBloc.add(CollectionPdfEvent.fetchPdfs(
        userUid: context.read<AuthBloc>().state.user!.uid,
        collectionUid: widget.collectionId));
  }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CollectionPdfBloc, CollectionPdfState>(
      bloc: _collectionPdfBloc,
      listener: (context,state){
        if(state.isSaved){
          AppToast.showSuccess(context, AppLocalizations.of(context)!.saved);
        }
      },
      builder: (context, state) => Scaffold(
          appBar: CustomAppBar(
            content: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                color: Colors.transparent,
                child: Row(children: [
                  SvgPicture.asset(
                    AppIcons.leftArrow,
                    color: Colors.black,
                    height: 21,
                    width: 19,
                  ),
                  const SizedBox(
                    width: 19,
                  ),
                  Text(
                    AppLocalizations.of(context)!.pdfFile,
                    style: AppTheme.themeData.textTheme.headlineLarge,
                  ),
                ]),
              ),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 27,
                  ),
                  state.isLoading
                      ? const LoadingIndicator()
                      : state.paths.isEmpty
                          ? _noFileAttached()
                          : _filesAttached(paths: state.paths, isEditingMode: state.isEditing, downloadedPaths: state.pathsDownloaded, downloadingPaths: state.pathsDownloading),
                  const Spacer(
                    flex: 3,
                  ),
                  _selectAFile(),
                  const Spacer(),
                  AppElevatedButton(
                      text: AppLocalizations.of(context)!.save,
                      color: state.isEditing ? AppColors.mainAccent : AppColors.greyLight,
                      onPressed: () {
                        if(!state.isEditing) return;
                        _collectionPdfBloc.add(CollectionPdfEvent.savePdf(
                            userUid: context.read<AuthBloc>().state.user!.uid,
                            collectionUid: widget.collectionId));
                      }),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget _noFileAttached() {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.noFileAttachedToCollection,
          style: TextStyle(
              color: AppColors.mainAccent,
              fontSize: 22,
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        Text(
          "“${widget.collectionName}”",
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _filesAttached({required List<String> paths, required bool isEditingMode, required List<String> downloadingPaths, required List<String> downloadedPaths}) {
    return Column(
        children: paths
            .map((e) {
              bool isDownloaded = downloadedPaths.contains(e);
              bool isDownloading = downloadingPaths.contains(e);
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: _pdfTile(
                    path: e,
                    isDownloaded: isDownloaded,
                    isLoading: isDownloading,
                    isEditingMode: isEditingMode,
                    onClose: () {
                      if(isDownloading) return;
                      _collectionPdfBloc.add(CollectionPdfEvent.removePdf(
                          userUid: context.read<AuthBloc>().state.user!.uid,
                          collectionUid: widget.collectionId,
                          pathToRemove: e));
                    },
                    onTap: () async{
                      if(isDownloading || isEditingMode) return;
                      if(isDownloaded){
                        await openFile(extractFilename(e));
                      }else{
                        AppToast.showSuccess(context, AppLocalizations.of(context)!.downloadingStarted);
                        _collectionPdfBloc.add(CollectionPdfEvent.downloadPdf(path: e));
                      }
                    }));
            })
            .toList());
  }

  Widget _pdfTile(
      {required String path,
      required VoidCallback onClose,
      required VoidCallback onTap,
        required bool isLoading,
      required bool isDownloaded,
      required bool isEditingMode}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: Colors.black, width: 2)),
        child: Padding(
          padding: const EdgeInsets.only(left: 23, right: 11),
          child: Row(
            children: [
              const Icon(
                FontAwesomeIcons.filePdf,
                color: Colors.black,
                size: 24,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: Text(
                extractFilename(path),
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              )),
              const SizedBox(
                width: 15,
              ),
              isEditingMode ? SizedBox.shrink() : isLoading ? LoadingIndicator() : Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  child: SvgPicture.asset(
                    isDownloaded ? AppIcons.openEye : AppIcons.download,
                    color: AppColors.mainAccent,
                  )),
              InkWell(
                  onTap: onClose,
                  child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      child: SvgPicture.asset(
                        AppIcons.close,
                        color: AppColors.red,
                        width: 14,
                        height: 14,
                      ))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectAFile() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: AppColors.borderGrey, width: 2),
          ),
          child: GestureDetector(
            onTap: () async {
              final result = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ["pdf"]);
              if (!mounted) return;
              if (result != null) {
                final path = result.paths.first!;
                _collectionPdfBloc.add(CollectionPdfEvent.addPdf(
                    userUid: context.read<AuthBloc>().state.user!.uid,
                    collectionUid: widget.collectionId,
                    pathToAdd: path));
              }
            },
            child: Container(
              color: Colors.transparent,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: const Icon(
                          FontAwesomeIcons.filePdf,
                          color: AppColors.borderGrey,
                          size: 30,
                        )),
                  ),
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.selectFile,
                      style: TextStyle(
                          color: AppColors.borderGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.attachPdfVersion,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: AppColors.borderGrey),
        )
      ],
    );
  }
}
