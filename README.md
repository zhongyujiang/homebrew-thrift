
### 使用 homebrew 安装指定版本的 thrift
1. 在 homebrew 仓库中找到 thrift 的 formula 文件 Formula/t/thrift.rb，根据 commit 记录找到对应 thrift 版本的 homebrew commit，比如 0.21.0 版本的 formula 文件：https://github.com/Homebrew/homebrew-core/commit/aea3263074317dd1ee0f7d5106044943c8a1e3cc
2. 把这个仓库下的 Formula/thrift@xx.rb 中的内容改成 homebrew 对应 commit 的 Formula/t/thrift.rb 的相应配置
3. 把变更 push 到自己 fork 的远程仓库
4. `brew install zhongyujiang/thrift/thrift@xxx`

### Homebrew for Thrift 0.21.0
`brew install zhongyujiang/thrift/thrift@0.21.0`

