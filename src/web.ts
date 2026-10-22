import { WebPlugin } from '@capacitor/core';

import type { IosStatusBarTransparencyPlugin } from './definitions';

export class IosStatusBarTransparencyWeb extends WebPlugin implements IosStatusBarTransparencyPlugin {
  async enableTransparency(): Promise<{ status: string; message: string }> {
    // The status bar is a native concept, so nothing to do in the browser.
    return { status: 'success', message: 'Web: no status bar to change.' };
  }
}
