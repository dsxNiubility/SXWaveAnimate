# SXWaveAnimate
##实现非常美观的灌水动画

![image](https://github.com/dsxNiubility/SXWaveAnimate/raw/master/screenshots/waveAnimate.gif)

####6月2日升级版本（建议更新下）
**将动画代码封装到了Cell的内部，提供了统一的接口及赋值方法**

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