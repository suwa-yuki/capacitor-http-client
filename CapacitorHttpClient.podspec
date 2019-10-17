
  Pod::Spec.new do |s|
    s.name = 'CapacitorHttpClient'
    s.version = '0.0.1'
    s.summary = 'Native HTTP Client'
    s.license = 'MIT'
    s.homepage = 'git@github.com:suwa-yuki/capacitor-http-client.git'
    s.author = 'suwa,yuki'
    s.source = { :git => 'git@github.com:suwa-yuki/capacitor-http-client.git', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
  end