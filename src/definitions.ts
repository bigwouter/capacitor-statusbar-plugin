export interface IosStatusBarTransparencyPlugin {
  /**
   * Makes the web view extend under the iOS status bar.
   * @param options.style Status bar text colour: "light", "dark" or "default".
   */
  enableTransparency(options?: { style?: 'light' | 'dark' | 'default' }): Promise<{ status: string; message: string }>;
}
