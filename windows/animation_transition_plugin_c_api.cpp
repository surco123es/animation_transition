#include "include/animation_transition/animation_transition_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "animation_transition_plugin.h"

void AnimationTransitionPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  animation_transition::AnimationTransitionPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
