import { registerPlugin } from '@capacitor/core';

import type { IosStatusBarTransparencyPlugin } from './definitions';

const IosStatusBarTransparency = registerPlugin<IosStatusBarTransparencyPlugin>('IosStatusBarTransparency', {
  web: () => import('./web').then((m) => new m.IosStatusBarTransparencyWeb()),
});

export * from './definitions';
export { IosStatusBarTransparency };
