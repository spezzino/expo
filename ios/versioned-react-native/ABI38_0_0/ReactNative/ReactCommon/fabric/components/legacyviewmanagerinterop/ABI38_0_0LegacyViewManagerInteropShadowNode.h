/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#pragma once

#include <ABI38_0_0React/components/legacyviewmanagerinterop/LegacyViewManagerInteropState.h>
#include <ABI38_0_0React/components/legacyviewmanagerinterop/LegacyViewManagerInteropViewEventEmitter.h>
#include <ABI38_0_0React/components/legacyviewmanagerinterop/LegacyViewManagerInteropViewProps.h>
#include <ABI38_0_0React/components/view/ConcreteViewShadowNode.h>

namespace ABI38_0_0facebook {
namespace ABI38_0_0React {

extern const char LegacyViewManagerInteropComponentName[];

using LegacyViewManagerInteropShadowNode = ConcreteViewShadowNode<
    LegacyViewManagerInteropComponentName,
    LegacyViewManagerInteropViewProps,
    LegacyViewManagerInteropViewEventEmitter,
    LegacyViewManagerInteropState>;

} // namespace ABI38_0_0React
} // namespace ABI38_0_0facebook
