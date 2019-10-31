#!/bin/bash
  
# 清空文件内容

# 函数：判断是否是imageset
isImageset(){
  str="$1"
  # 从右边第几个字符开始，一直到结束，表示从右边第七个字符开始，一直到结束
  # 左边的第一个字符是用 0 表示，右边的第一个字符用 0-1 表示
  suffix=${str:0-9}
  if [ ${#suffix} == 0 ]
  then
    return 0;
  elif [ $suffix = ".imageset" ]
  then
    return 1;
  else
    return 0;
  fi
}

# 数组：存放图片名称
imgNames=()

# 函数：获取图片名称
getImgName(){
  str="$1"
  # %号截取，删除右边字符，保留左边字符，%/* 表示从右边开始，删除第一个 / 号及右边的字符
  imgName=${str%.*}
  # 将图片名称添加至数组中
  imgNames=("${imgNames[@]}" $imgName)
}

# 函数：遍历目录搜索图片名称
searchImgs(){
  dir="$1"
  for file in `ls $dir`
  do
    if [[ $file == *.* ]]
    then
      # 判断是否是imageset
      isImageset $file
      if [ $? == 1 ]
      then
        getImgName $file
      fi
    else
      # 递归处理多级目录
      searchImgs "$dir/$file"
      # 递归遍历会改变dir，导致下次递归的路径错误，需要重置dir
      dir="$1"
    fi
  done
}

# 获取Assets.xcassets路径，外部传入
path="$1"
searchImgs $path

. ./shell/create.sh
