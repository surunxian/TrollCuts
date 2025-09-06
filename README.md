# TrollCuts
适用于 iOS16.0+ 的快捷指令扩展。它利用 [TrollStore](https://github.com/opa334/TrollStore)的能力获取二进制文件的任意权限，从而执行通常沙盒应用无法执行的操作。

这个扩展是利用一种自动化的方法来切换 [TrollStore](https://github.com/opa334/TrollStore)安装的应用的注册状态，以便 iCloud 可以备份它们。假设这些应用处于“系统”状态时，半夜自动备份将会发生什么？之前备份的数据会再次消失吗？那么只有一种方法可以找到答案。

它只附带一些基本的快捷方式扩展。如果你想到其他有趣的东西可以扩展它的扩展功能，那就去做吧。

# 要求
iOS 16.0+（AppIntent 框架）和[TrollStore](https://github.com/opa334/TrollStore)。

# 鸣谢
[TrollStore](https://github.com/opa334/TrollStore) - 本仓库中的部分代码来自该仓库。

[@asdfugil](https://gist.github.com/asdfugil/e7b2fd92d8956716c46df54d4b1043e6)，[PureKFD](https://github.com/PureKFD/PureKFD) - 用于 `userspacereboot.c`。

[locsim](https://github.com/udevsharold/locsim)

# 许可证
从其他仓库获取的代码片段受其自身许可证约束，其他一切请自行决定。
