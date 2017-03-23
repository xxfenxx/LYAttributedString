Pod::Spec.new do |s|
  s.name             = 'LYAttributedString'
  s.version          = '0.1.0'
  s.summary          = 'This is a about NSString Category of LYAttributedString.'
  s.description      = <<-DESC
  基于NSMutableAttributedString封装的处理NSString的富文本Cagegory，能够满足大部分需求！
    1. 设置某一段NSString字体大小
    2. 设置某一段NSString字体颜色
    3. 设置某一段NSString字体大小/颜色
    4. 设置某一段NSString字体背景色
    5. 设置某一段NSString字距
    6. 设置某一段NSString对齐方式
    7. 设置某一段NSString行间距/段落间距
    8. 设置某一段NSString字距/行间距/段落间距
    9. 给某一段NSString添加下划线
    10. 给某一段NSString添加删除线 - 实线
    11. 给某一段NSString添加删除线 - 虚线
    12. 给某一段NSString设置字体阴影
    13. 给某一段NSString设置字体横竖
    14. 给某一段NSString设置字体描边宽度这样就能使"文字空心"
    15. 给某一段NSString设置文字下沉偏移其他文字
    16. 给某一段NSString设置文字倾斜
    17. 给某一段NSString设置文字扁平
    18. 给某一段NSString设置超链接样式
                       DESC

  s.homepage         = 'https://github.com/信勇哥得水牛/LYAttributedString'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '信勇哥得水牛' => '517661395@qq.com' }
  s.source           = { :git => 'https://github.com/信勇哥得水牛/LYAttributedString.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'LYAttributedString/Classes/**/*'
end
