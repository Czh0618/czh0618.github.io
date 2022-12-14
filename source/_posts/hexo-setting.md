---
layout: drafts
title: hexo setting
tags: hexo
comments: true
toc: true
top: true
categories: 个人
date: 2022-11-20 16:30:01
---


上一篇已经描述过了博客的技术选型，接下来就让我们来具体详解一下hexo的搭建之旅吧！
#### 主题选择
hexo支持丰富的主体插件选择，具体可以参考[这里](https://hexo.io/themes/index.html),也可以在GitHub上寻找相关主题(搜索hexo-theme)，这里我采用的是[Next](https://theme-next.iissnan.com/)主题,github地址为`https://github.com/iissnan/hexo-theme-next/`，这个主题的受欢迎程度也是很高的，相较而言更简洁，当然也可以做自己的主题，不过这都是后话了，现在遵循拿来即用的原则。

#### 开放评论
这里主要还是基于第三方的评论系统，目前Next主题支持的有：
- [disqus](https://disqus.com/)
    > 目前是很好用的一个评论系统，但是由于是墙外的应用，对于国内常规用户来说还是不太友好，暂时忍痛割爱了,不过可以看下效果图
    ![](../img/hexo/b58881c0039f94ad26162a407723f701.png)
- [changyan](https://changyan.kuaizhan.com/)
    > 这是一个国内的平台,不知道为何，现在国内的好多应用都需要关注公众号，so不是太喜欢，贴个效果图感受一下
    ![](../img/hexo/C6E72794-EED6-4E70-955E-D542DE228C7E.png)
- [valine](https://www.leancloud.cn/)
    > valine是基于leanCloud的无后端评论系统，所以：

    ``` txt
    注册LeanCode账号
    创建Valine应用
    进入应用，点击设置>应用Keys获取appId,appKey
    在主题配置文件_config.yml,这里的路径是next/_config.yml中找到valine然后配置上即可
    ```
    - 优化
        - 主要是优化valine在博客中的一些样式，比如去处掉Powered By，文本等，具体可以在主题的css目录下创建一个comment文件夹，放自己的自定义的样式，我这里是next/source/css/_common下创建comment文件夹，再创建comment.styl样式文件，里面写优化的样式，写完之后要在main.styl引入才可生效
        - 可以在主题中开启评论邮箱通知，自定义placeholder等
    
- gitalk
    首先要注册GitHub应用，https://github.com/settings/applications/new
    注册完成之后，把Client ID和Client secrets填写到主题的_config.yml里面，gittalk对应的位置，开启即可

    ``` txt
    gitalk:
        enable: true  #启用gitalk
        github_id:   #github帐号 例：CodeHaotian
        id: location.pathname  #此设置参照下文常见问题说明
        repo:   #存放评论的仓库名称
        client_id:   #application的id，即上文Client ID
        client_secret:  #application的密码，即上文Client Secret
        admin_user:  #页面显示联系**初始化评论 例：CodeHaotian
        distraction_free_mode: true # Facebook-like distraction free mode
        # Gitalk's display language depends on user's browser or system environment
        # If you want everyone visiting your site to see a uniform language, you can set a force language value
        # Available values: en | es-ES | fr | ru | zh-CN | zh-TW
        language: zh-CN
    ```
- [livere](https://livere.com/introduce)
    > 来必力，一家韩国的评论系统，这里不多做阐述了，感兴趣的大家可以去看看，不过不是太推荐
- [rating](https://widgetpack.com/)

#### 统计字数
使用hexo-word-counter统计文章的字数以及预期阅读时间。完成配置后，可以在每篇文章开头和页面底部显示字数和阅读时间
- 安装

``` bin
$ npm install hexo-word-counter
$ hexo clean
```
- 配置
在主配置文件_config.yml尾部添加

``` json
symbols_count_time:
  symbols: true
  time: true
  total_symbols: true
  total_time: true
  exclude_codeblock: false
  awl: 4  # 平均字节长度，默认为4，cn≈2，en≈5，
  wpm: 275 # 每分钟阅读次数，默认为275，Slow≈200，Normal≈275，Fast≈350
  suffix: "mins."
```

#### 站点运行时间
打开`\themes\next\layout\_partial\footer.swig`,在最后位置添加一串js代码

``` js
<div>
<span id="timeDate">载入天数...</span><span id="times">载入时分秒...</span>
<script>
    var now = new Date(); 
    function createtime() { 
        var grt= new Date("2020/11/09 00:00:00");//在此处修改你的建站时间
        now.setTime(now.getTime()+250); 
        days = (now - grt ) / 1000 / 60 / 60 / 24; dnum = Math.floor(days); 
        hours = (now - grt ) / 1000 / 60 / 60 - (24 * dnum); hnum = Math.floor(hours); 
        if(String(hnum).length ==1 ){hnum = "0" + hnum;} minutes = (now - grt ) / 1000 /60 - (24 * 60 * dnum) - (60 * hnum); 
        mnum = Math.floor(minutes); if(String(mnum).length ==1 ){mnum = "0" + mnum;} 
        seconds = (now - grt ) / 1000 - (24 * 60 * 60 * dnum) - (60 * 60 * hnum) - (60 * mnum); 
        snum = Math.round(seconds); if(String(snum).length ==1 ){snum = "0" + snum;} 
        document.getElementById("timeDate").innerHTML = "已运行 "+dnum+" 天 "; 
        document.getElementById("times").innerHTML = hnum + " 小时 " + mnum + " 分 " + snum + " 秒"; 
    } 
setInterval("createtime()",250);
</script>
</div>
```

#### 总访问人数
Next主题默认支持,修改/theme/next/_config.yml中的busuanzi_count，改为true即可.`这个只是很普通的显示总站的访问量和人数`

#### 推荐文章
这里使用的是第三方的一款插件，具体预览效果可以看：
![recommend](../img/hexo/20221214153329.jpg)

- 安装插件
``` bash
npm install hexo-recommended-posts --save
```
- 下载推荐文章列表
在编辑完新的文章之后，使用如下命令获取推荐列表
``` bash
hexo recommend
```
- 自定义
如果默认配置不满足需求，可以在hexo的根目录`_config.yml`里添加配置：
``` json
recommended_posts:
  server: https://api.truelaurel.com #后端推荐服务器地址
  timeoutInMillis: 10000 #服务时长，超过此时长，则使用离线推荐模式
  internalLinks: 2 #内部文章数量
  externalLinks: 1 #外部文章数量
  fixedNumber: false
  autoDisplay: true #自动在文章底部显示推荐文章
  excludePattern: []
  titleHtml: <h1>猜你喜欢<span style="font-size:0.45em; color:gray">（由<a href="https://github.com/huiwang/hexo-recommended-posts">hexo文章推荐插件</a>驱动）</span></h1> #自定义标题
```
其中 `excludePattern` 可以添加想要被过滤的链接的正则表达式, 如配置为 `["example.com"]`, 则所有包含 `example.com` 的链接都会从推荐文章中过滤掉.

`fixedNumber` 字段用来控制是否返回固定数量的推荐文章, 如果默认推荐文章不够的话会填充当前文章的前后文章作为推荐文章.
#### 阅读进度
找到next主题的`_config.yml`找到`reading_progress`,把false改为true即可，默认是支持的

#### 文章简介
目前hexo不再支持老的auto_excerpt，所以现在我们引入新的插件
- hexo-excerpt
    - 安装
        ``` bash
        npm install hexo-excerpt --save
        ```
        打开hexo根目录的`_config.yml`添加如下配置
        ``` json
        excerpt:
            depth: 2  #按层来算，也就是按代码块来算
            excerpt_excludes: []
            more_excludes: []
            hideWholePostExcerpts: true
        ```
        打开主题的配置文件`/theme/next/_config.yml`,将`excerpt_description`设置为`true`,`read_more_btn`设置为`true`
        注：按代码块的显示可能有些不太友好，所以下面我们引入第二个插件
- hexo-auto-excerpt
    - 安装
        ``` bash
        npm install hexo-auto-excerpt --save
        ```
        安装完成后在hexo的根目录`_config.yml`下添加`excerpt_length: 100`即可，表示摘要的字数
        注：这个会把文本块打乱，只是以文字显示在首页
#### 性能优化
待定

#### 域名设置
域名可以在[freenom.com](http://www.freenom.com/)上面注册一个免费的`前提需要有梯子`,然后可以搜索自己的想要的域名，最高可以免费12个月哦，添加完之后有个配置forward url可以设置自己的GitHub page域名，这样访问注册的域名就可以跳转到GitHub page访问博客了。

#### SEO搜索
- Google Search
登录[谷歌站点](https://developers.google.com/search)，添加自己的站点域名，然后选择TXT验证，完毕之后，添加个人站点地图
