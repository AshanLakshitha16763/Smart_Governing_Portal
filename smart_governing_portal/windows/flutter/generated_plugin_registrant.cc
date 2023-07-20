//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

<<<<<<< HEAD
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
=======
#include <file_selector_windows/file_selector_windows.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FileSelectorWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FileSelectorWindows"));
>>>>>>> 9fd67c529d782b36e7b88545513cb13e4e66b1c0
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
