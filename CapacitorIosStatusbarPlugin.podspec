Pod::Spec.new do |s|
  s.name             = 'CapacitorIosStatusbarPlugin'
  s.version          = '1.0.0'
  s.summary          = 'iOS Statusbar Transparency Plugin for Capacitor'
  s.license          = { :type => 'MIT' }
  s.author           = { 'Your Name' => 'email@example.com' }
  s.source           = { :git => 'https://github.com', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.source_files     = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
  s.dependency 'Capacitor'
  s.swift_version = '5.1'
end
