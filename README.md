# SXWaveAnimate
##实现非常美观的灌水动画
<br />
[![Platform](https://img.shields.io/badge/platform-iOS-red.svg)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-OC-yellow.svg?style=flat
)](https://en.wikipedia.org/wiki/Objective-C)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](http://mit-license.org)
![CocoaPods Version](https://img.shields.io/badge/pod-v1.3.6-brightgreen.svg)

####本库已经配置到cocoapods。
_在podfile文件中加入_ `pod "SXWaveAnimate", "~> 1.3.6"` _或_ `pod "SXWaveAnimate"`
<br />_使用_ `pod install`_即可一键引入_

####7月30日升级版本（建议更新下）
**与以往的只有自定义cell相比，开通了粒度更小的自定义View-SXWaveView**

![image](https://github.com/dsxNiubility/SXWaveAnimate/raw/master/screenshots/waveAnimate0.gif)

######主要更新有：
* 修改整体UI样式
* 增加了SXWaveView。使得项目的泛用性和灵活性更好
* 添加动画的type修改后为3种 1-缓慢上升 2-缓慢下降 3-先升后降 
* 考虑到引入的方便waveView废除了xib使用纯手码创建
* 添加了半圆性灌水动画halfWaveView。
<br />（半圆类依赖于圆类，反之不依赖。可以根据个人喜好决定是否引入半圆类）
* 增加开放API和新的字段，定制化程度更高
<br />（不用担心以前有的接口还是有的，没做改变）

_SXWaveView使用方法_
>1.将代码中的classes文件夹拖入项目中，里面包含了可重用的文件，及一个便利计算frame的类<br />
2.在需要用到的类中（就是你要写tableView数据源方法和代理方法的类）引入头文件<br />`#import "SXWaveView.h"`或者是`#import "SXHalfWaveView.h"`<br />
3.建一个成员变量<br />
`@property(nonatomic,strong)SXWaveView *animateView1; `<br />
4.用你正常创建自定义view的方法建一个,并使用setPrecent开头的方法,不想传的参数可以传nil<br />
`    SXWaveView *animateView1 = [[SXWaveView alloc]initWithFrame:CGRectMake(0+MARGIN, 100+MARGIN,SIDES, SIDES)];`<br />`
    [self.view addSubview:animateView1];`<br />`
    self.animateView1 = animateView1;`<br />`
    [self.animateView1 setPrecent:self.precent description:@"董铂然" textColor:[UIColor orangeColor] bgColor:COLOR(31, 187, 170, 1) alpha:1 clips:NO];`<br />
5.在`viewDidAppear`或`viewWillAppear`方法中加入一行开始动画的方法`[self.animateView1 addAnimateWithType:0];`也可以自行选择动画触发的地点。

![image](https://github.com/dsxNiubility/SXWaveAnimate/raw/master/screenshots/0001.png)

#####精心设计了12种配色。现在的自定义配置已经很多，可自行发挥

![image](https://github.com/dsxNiubility/SXWaveAnimate/raw/master/screenshots/0002.png)

_看下代码就知道了里面写的很清楚_

---
####6月2日升级版本（建议更新下）
**将动画代码封装到了Cell的内部，提供了统一的接口及赋值方法**

![image](https://github.com/dsxNiubility/SXWaveAnimate/raw/master/screenshots/waveAnimate.gif)

_使用方法_
>1.将代码中的classes文件夹拖入项目中，里面包含了自定义Cell，及一个便利计算frame的类<br />
2.在需要用到的类中（就是你要写tableView数据源方法和代理方法的类）引入头文件<br />`#import "SXWaveCell.h"`<br />
3.在数据源方法的cellforRow中在你需要的位置，把以往的UITableView
Cell *cell 等等换成<br />
`SXWaveCell *cell = [SXWaveCell cell];`<br />
`self.waveCell = cell;`<br />
`[cell setPrecent:self.precent textColor:[UIColor orangeColor] type:0 alpha:1];  `<br />
`return cell;`<br />
4.其中第三行的这个 setPrecent: textColor: type: alpha:方法 是一个赋值方法，现在必须四个参数都传，后续会设置多个接口 可以只传需要的值。<br />
5.现在源码里有两种方法一个是在页面显示之后点击cell触发动画，一个是一进去就显示动画，如果想要这么设置 需要在`viewDidAppear`方法中加入一行开始动画的方法`[self.waveCell addAnimateWithType:0];`

_具体代码在示例程序中写的都很清晰非常易上手_


---
####初始版本
**因为前期主要以实现功能为主，暂时接口封装的还不是很完善，很快会不断完善。并且现在的代码结构也非常清晰了完全可以复用 欢迎关注。**

暂时提供三种样式。

```
第一种是，纯白背景橙色文字。
第二种是，半透明背景深绿文字。 后续会提供颜色的接口。
第三种是，颜色纯白，背景较深，相比于前两种，第三种是先把水位灌满再降到指定的高度。
```

---
**也可以根据使用者喜好自行修改**