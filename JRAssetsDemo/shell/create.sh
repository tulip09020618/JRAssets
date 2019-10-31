#!/bin/bash
  
# 创建UIImage+JRHelper.h文件
file_h="shell/UIImage+JRHelper.h"
echo "#import <UIKit/UIKit.h>" > $file_h
echo "" >> $file_h
echo "NS_ASSUME_NONNULL_BEGIN" >> $file_h
echo "" >> $file_h
echo "@interface UIImage (JRHelper)" >> $file_h

# 在此处添加方法声明
for name in ${imgNames[@]}
do
  echo "" >> $file_h
  echo "+ (instancetype)jr_${name};" >> $file_h
done

echo "" >> $file_h
echo "@end" >> $file_h
echo "" >> $file_h
echo "NS_ASSUME_NONNULL_END" >> $file_h

# 创建UIImage+JRHelper.m文件
file_m="shell/UIImage+JRHelper.m"
echo "#import \"UIImage+JRHelper.h\"" > $file_m
echo "" >> $file_m
echo "@implementation UIImage (JRHelper)" >> $file_m

# 在此处添加方法实现
for name in ${imgNames[@]}
do
  echo "" >> $file_m
  echo "+ (instancetype)jr_${name} {" >> $file_m
  echo "    return [UIImage imageNamed:@\"${name}\"];" >> $file_m
  echo "}" >> $file_m
done

echo "" >> $file_m
echo "@end" >> $file_m
