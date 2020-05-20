Pod::Spec.new do |s|
    s.name             = 'AKProcessIndicator'
    s.version          = '0.0.4'
    s.summary          = '⏳ It provides a Network Indicator for device that have a Safe Area'

    s.homepage         = 'https://github.com/AkkeyLab/AKProcessIndicator'
    s.license          = 'MIT'
    s.author           = 'AkkeyLab'
    s.source           = { :git => 'https://github.com/AkkeyLab/AKProcessIndicator.git', :tag => "#{s.version}" }
    s.social_media_url = 'https://twitter.com/AkkeyLab'

    s.platform         = :ios, "11.0"
    s.swift_version    = "5.0"

    s.module_name      = "AKProcessIndicator"

    s.source_files     = 'Source/**/*'
end
