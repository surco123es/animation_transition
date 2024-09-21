#ifndef FLUTTER_PLUGIN_ANIMATION_TRANSITION_PLUGIN_H_
#define FLUTTER_PLUGIN_ANIMATION_TRANSITION_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace animation_transition {

class AnimationTransitionPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  AnimationTransitionPlugin();

  virtual ~AnimationTransitionPlugin();

  // Disallow copy and assign.
  AnimationTransitionPlugin(const AnimationTransitionPlugin&) = delete;
  AnimationTransitionPlugin& operator=(const AnimationTransitionPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace animation_transition

#endif  // FLUTTER_PLUGIN_ANIMATION_TRANSITION_PLUGIN_H_
