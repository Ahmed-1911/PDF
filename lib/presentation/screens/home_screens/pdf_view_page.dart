import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/core/utils/constants.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../viewModel/contact&message/contacts_messages_model.dart';

class PdfViewPage extends ConsumerStatefulWidget {
  const PdfViewPage({Key? key}) : super(key: key);

  @override
  PdfViewPageState createState() => PdfViewPageState();
}

class PdfViewPageState extends ConsumerState<PdfViewPage> {
  StateProvider<bool> isLoadingProvider = StateProvider<bool>((ref) => true);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        SchedulerBinding.instance.addPostFrameCallback(
          (timeStamp) async {
            ///get contacts & messages
            final contactsListProvider = ref.read(contactsProvider.notifier);
            await contactsListProvider.getAndSendData(context);
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = ref.watch(isLoadingProvider);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    child: SfPdfViewer.asset(
                      Constants.pdfLink,
                      onDocumentLoaded: (details) {
                        if(details.document.pages.count>0) {
                          ref
                              .read(isLoadingProvider.notifier)
                              .state = false;
                        }},
                    ),
                  ),
                ],
              ),
            ),
         isLoading?
            const Center(child: CircularProgressIndicator(color: Colors.teal,)):SizedBox()
          ],
        ),
      ),
    );
  }
}
