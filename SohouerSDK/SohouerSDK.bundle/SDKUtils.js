
defineClass('YYDiskCache', {
    __trimRecursively: function () {
        console.log("关闭LRU算法");
    },
    __trimToCount:function(countLimit){
        console.log("关闭LRU算法");
    },
    __trimInBackground:function(countLimit){
        console.log("关闭LRU算法");
    },
    __trimToCost:function(countLimit){
        console.log("关闭LRU算法");
    },
    __trimToAge:function(countLimit){
        console.log("关闭LRU算法");
    },
    __trimToFreeDiskSpace:function(targetFreeDiskSpace){
        console.log("关闭LRU算法");
    },
    initWithPath: function(path) {
        console.log("修改文件大小");
        return self.initWithPath_inlineThreshold(path, 1024*20000); // 20KB
    },
});
