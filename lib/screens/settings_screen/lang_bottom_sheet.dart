import 'package:flutter/material.dart';
import 'package:newss_app/providers/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LangBottomSheet extends StatefulWidget {
  const LangBottomSheet({Key? key}) : super(key: key);

  @override
  State<LangBottomSheet> createState() => _LangBottomSheetState();
}

class _LangBottomSheetState extends State<LangBottomSheet> {
  @override
  Widget build(BuildContext context) {
    AppConfigLocale provider = Provider.of(context);
    return Container(
     child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  provider.changeLang('en');
                },
                child: provider.locale == 'en'
                    ? getSelectedLang(AppLocalizations.of(context)!.english)
                    : getUnSelectedLang(AppLocalizations.of(context)!.english)),
            SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () {
                  provider.changeLang('ar');
                },
                child: provider.locale == 'ar'
                    ? getSelectedLang(AppLocalizations.of(context)!.arabic)
                    : getUnSelectedLang(AppLocalizations.of(context)!.arabic))
          ],
        ),
      ),
    );
  }

  Widget getSelectedLang(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 25,
                color: Theme.of(context).primaryColor
            )
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  Widget getUnSelectedLang(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 22,
            )
        ),
      ],
    );
  }
}
