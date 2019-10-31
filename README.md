# JRAssets
为项目的Assets.xcassets中的图片自动生成UIImage的Category

# 使用说明：
* 首次使用需要根据集成步骤操作
* Assets.xcassets中内容修改后，重新编译项目即可自动更新`UIImage+JRHelper.h`和`UIImage+JRHelper.m`文件内容
* 会自动处理多级目录
* 所有方法会自动添加jr_前缀

# 集成步骤：
* 下载Demo，将Demo根目录中的shell文件夹放入自己项目的根目录中；
* `TARGETS -> Build Phases -> New Run Script Phase`，复制下面代码：

    ```
    chmod +x ${SRCROOT}/shell/assets.sh
    chmod +x ${SRCROOT}/shell/create.sh
    ${SRCROOT}/shell/assets.sh ${SRCROOT}/JRAssetsDemo/Assets.xcassets
    ```
    **注意：** shell文件夹名称不能修改，`${SRCROOT}/JRAssetsDemo/Assets.xcassets`为Assets.xcassets路径，JRAssetsDemo为项目名称（需要修改为自己的项目名称）
* 将Run Script移动至Compile Sources前面
* 编译项目（command + B），编译成功后会在shell目录自动生成`UIImage+JRHelper.h`和`UIImage+JRHelper.m`文件
* 将生成的`UIImage+JRHelper.h`和`UIImage+JRHelper.m`文件拖入项目中
* 在需要用到的地方导入`#import "UIImage+JRHelper.h"`
* 使用：`[UIImage jr_imageName];`（jr_为方法前缀，imageName为图片名称，与Assets.xcassets中图片名称对应）