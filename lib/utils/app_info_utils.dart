import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

Future<bool> checkIfVersionGreater(String latestVersionString) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  Version currentVersion = Version.parse(packageInfo.version);
  Version latestVersion = Version.parse(latestVersionString);

  return latestVersion > currentVersion;
}
