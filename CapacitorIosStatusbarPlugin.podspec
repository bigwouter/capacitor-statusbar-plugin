Pod::Spec.new do |s|
  s.name             = 'CapacitorIosStatusbarPlugin'
  s.version          = '1.0.0'
  s.summary          = 'iOS Statusbar Transparency Plugin for Capacitor'
  s.license          = { :type => 'MIT' }
  s.author           = { 'Wouter Baeten' => 'bigwouterstyle@hotmail.com' }
  s.source           = { :git => 'https://github.com/bigwouter/capacitor-statusbar-plugin.git', :tag => s.version.to_s }
  s.ios.deployment_target = '14.0'
  s.source_files     = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
  s.dependency 'Capacitor'
  s.swift_version = '5.1'
end
