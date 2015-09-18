Pod::Spec.new do |s|
s.name = 'SXWaveAnimate'
s.version = '1.3.6'
s.license = 'MIT'
s.summary = 'An Animate Water view on iOS.'
s.homepage = 'https://github.com/dsxNiubility/SXWaveAnimate'
s.authors = { '董尚先' => 'dantesx2012@gmail.com' }
s.source = { :git => 'https://github.com/dsxNiubility/SXWaveAnimate.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'SXWaveAnimate/*.{h,m}'
s.resources = 'SXWaveAnimate/images/*.{png,xib}'
end
