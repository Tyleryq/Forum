<%@page import="PO.Post"%>
<%@page import="PO.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>fly极简社区页面</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/fly/res/layui/css/layui.css" type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/fly/res/css/global.css" type="text/css">
  <script src="${pageContext.request.contextPath}/fly/res/mods/jquery-3.4.1.min.js" type="text/javascript"></script>
</head>
<body>

<div class="fly-header layui-bg-black">
  <div class="layui-container">
    <a class="fly-logo" href="/">
      <img src="${pageContext.request.contextPath}/fly/res/images/logo.png" alt="layui">
    </a>
    <ul class="layui-nav fly-nav layui-hide-xs">
      <li class="layui-nav-item layui-this">
        <a href="/"><i class="iconfont icon-jiaoliu"></i>交流</a>
      </li>
      <li class="layui-nav-item">
        <a href="case/case.html"><i class="iconfont icon-iconmingxinganli"></i>案例</a>
      </li>
      <li class="layui-nav-item">
        <a href="http://www.layui.com/" target="_blank"><i class="iconfont icon-ui"></i>框架</a>
      </li>
    </ul>
    
    <ul class="layui-nav fly-nav-user">
      
      <c:choose>
      <c:when test="${sessionScope.duser==null }">
	      <!-- 未登入的状态 -->
	      <li class="layui-nav-item">
	        <a class="iconfont icon-touxiang layui-hide-xs" href="user/login.html"></a>
	      </li>
	      <li class="layui-nav-item">
	         <a href="${pageContext.request.contextPath}/fly/html/user/login.jsp">登入</a>
	      </li>
	      <li class="layui-nav-item">
	        <a href="${pageContext.request.contextPath}/fly/html/user/reg.jsp">注册</a>
	      </li>
	      <li class="layui-nav-item layui-hide-xs">
	        <a href="/app/qq/" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" title="QQ登入" class="iconfont icon-qq"></a>
	      </li>
	      <li class="layui-nav-item layui-hide-xs">
	        <a href="/app/weibo/" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" title="微博登入" class="iconfont icon-weibo"></a>
	      </li>
	   	</c:when>
      
      	<c:otherwise>
	      <!-- 登入后的状态 -->
	      <li class="layui-nav-item">
	        <a class="fly-nav-avatar" href="javascript:;">
	          <cite class="layui-hide-xs">${sessionScope.duser.name }</cite>
	          <i class="iconfont icon-renzheng layui-hide-xs" title="认证信息：layui 作者"></i>
	          <i class="layui-badge fly-badge-vip layui-hide-xs">VIP${sessionScope.duser.VIPRank }</i>
	          <img src="${pageContext.request.contextPath}/fly/res/images/touxiang/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg">
	        </a>
	        <dl class="layui-nav-child">
	          <dd><a href="user/set.jsp"><i class="layui-icon">&#xe620;</i>基本设置</a></dd>
	          <dd><a href="user/message.html"><i class="iconfont icon-tongzhi" style="top: 4px;"></i>我的消息</a></dd>
	          <dd><a href="user/home.html"><i class="layui-icon" style="margin-left: 2px; font-size: 22px;">&#xe68e;</i>我的主页</a></dd>
	          <hr style="margin: 5px 0;">
	          <dd><a href="logout.action" style="text-align: center;">退出</a></dd>
	        </dl>
	      </li>
	     </c:otherwise>
      
      </c:choose>
    </ul>
  </div>
</div>

<div class="fly-panel fly-column">
  <div class="layui-container">
    <ul class="layui-clear">
      <li class="layui-hide-xs layui-this"><a href="/user/index.jsp">首页</a></li> 
      <li><a href="jie/index.jsp">提问</a></li> 
      <li><a href="jie/index.html">分享<span class="layui-badge-dot"></span></a></li> 
      <li><a href="jie/index.html">讨论</a></li> 
      <li><a href="jie/index.html">建议</a></li> 
      <li><a href="jie/index.html">公告</a></li> 
      <li><a href="jie/index.html">动态</a></li> 
      <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><span class="fly-mid"></span></li> 
      
      <c:if test="${sessionScope.duser!=null }">
	      <!-- 用户登入后显示 -->
	      <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="user_index.action">我发表的贴</a></li> 
	      <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="user_index.action">我收藏的贴</a></li> 
	  </c:if>
    </ul> 
    
    <c:choose>
    <c:when test="${sessionScope.duser!=null }">
    <c:url value="/post/toaddtopic.do" var="addurl" scope="page"></c:url>
    <div class="fly-column-right layui-hide-xs"> 
      <span class="fly-search"><i class="layui-icon"></i></span> 
      <a href="${addurl }" class="layui-btn">发表新帖</a> 
    </div> 
    <div class="layui-hide-sm layui-show-xs-block" style="margin-top: -10px; padding-bottom: 10px; text-align: center;"> 
      <a href="${addurl }" class="layui-btn">发表新帖</a> 
    </div> 
    </c:when>
    <c:otherwise>
    	<div class="fly-column-right layui-hide-xs"> 
      <span class="fly-search"><i class="layui-icon"></i></span> 
      <a href="${pageContext.request.contextPath}/fly/html/user/login.jsp" class="layui-btn">发表新帖</a> 
    </div> 
    <div class="layui-hide-sm layui-show-xs-block" style="margin-top: -10px; padding-bottom: 10px; text-align: center;"> 
      <a href="${pageContext.request.contextPath}/fly/html/user/login.jsp" class="layui-btn">发表新帖</a> 
    </div> 
    </c:otherwise>
    </c:choose>
  </div>
</div>

<div class="layui-container">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md8">
      <div class="fly-panel">
        <div class="fly-panel-title fly-filter">
          <a>置顶</a>
          <a href="#signin" class="layui-hide-sm layui-show-xs-block fly-right" id="LAY_goSignin" style="color: #FF5722;">去签到</a>
        </div>
        
        <jsp:useBean id="postDAO" class="DAO.PostDAO" scope="page"></jsp:useBean>
        <jsp:useBean id="userDAO" class="DAO.UserDAO" scope="page"></jsp:useBean>
        <jsp:useBean id="tauthor" class="PO.User" scope="page"></jsp:useBean>
        <jsp:useBean id="tpost" class="PO.Post" scope="page"></jsp:useBean>
        <%List<Post> posts=postDAO.findAllPost();
        pageContext.setAttribute("posts", posts);%>
        
        <ul class="fly-list">
        <c:forEach items="${pageScope.posts }" var="post">
          <li>
            <a href="authorhome.action?mail=${post.mail }" class="fly-avatar">
              <img src="${pageContext.request.contextPath}/fly/res/images/touxiang/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" alt="">
            </a>
            <h2>
              <a class="layui-badge">动态</a>
              <a href="jie_detail.action?postid=${post.id }">${post.title }</a>
            </h2>
            <div class="fly-list-info">
            <jsp:setProperty property="mail" value="${post.mail }" name="tpost"/>
            <%tauthor = userDAO.findUserByMail(tpost.getMail());
             pageContext.setAttribute("tauthor", tauthor);%>
              <a href="authorhome.action?mail=${post.mail }" link>
                <cite>${tauthor.name }</cite>
                <i class="iconfont icon-renzheng" title="认证信息：XXX"></i>
                <i class="layui-badge fly-badge-vip">VIP${tauthor.VIPRank }</i>
              </a>
              <span>刚刚</span>
              
              <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
              <span class="layui-badge fly-badge-accept layui-hide-xs">已结</span>
              <span class="fly-list-nums"> 
                <i class="iconfont icon-pinglun1" title="回答"></i> 66
              </span>
            </div>
            <div class="fly-list-badge">
              <!--
              <span class="layui-badge layui-bg-black">置顶</span>
              <span class="layui-badge layui-bg-red">精帖</span>
              -->
            </div>
          </li>
          </c:forEach>
          
        </ul>
      </div>

      <div class="fly-panel" style="margin-bottom: 0;">
        
        <div class="fly-panel-title fly-filter">
          <a href="" class="layui-this">综合</a>
          <span class="fly-mid"></span>
          <a href="">未结</a>
          <span class="fly-mid"></span>
          <a href="">已结</a>
          <span class="fly-mid"></span>
          <a href="">精华</a>
          <span class="fly-filter-right layui-hide-xs">
            <a href="" class="layui-this">按最新</a>
            <span class="fly-mid"></span>
            <a href="">按热议</a>
          </span>
        </div>

        <ul class="fly-list">    
        
         <c:forEach items="${pageScope.posts }" var="post">    
          <li>
            <a href="user/home.html" class="fly-avatar">
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" alt="贤心">
            </a>
            <h2>
              <a class="layui-badge">分享</a>
              <a href="jie_detail.action?postid=${post.id }">${post.title }</a>
            </h2>
            <div class="fly-list-info">
            <jsp:setProperty property="mail" value="${post.mail }" name="tpost"/>
            <%tauthor = userDAO.findUserByMail(tpost.getMail());
             pageContext.setAttribute("tauthor", tauthor);%>
               <a href="authorhome.action?mail=${post.mail }" link>
                <cite>${tauthor.name }</cite>
                <!--
                <i class="iconfont icon-renzheng" title="认证信息：XXX"></i>
                <i class="layui-badge fly-badge-vip">VIP3</i>
                -->
              </a>
              <span>刚刚</span>
              
              <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
              <!--<span class="layui-badge fly-badge-accept layui-hide-xs">已结</span>-->
              <span class="fly-list-nums"> 
                <i class="iconfont icon-pinglun1" title="回答"></i> 66
              </span>
            </div>
            <div class="fly-list-badge">
              <!--<span class="layui-badge layui-bg-red">精帖</span>-->
            </div>
          </li>
  		</c:forEach>
  
        </ul>
        <div style="text-align: center">
          <div class="laypage-main">
            <a href="jie/index.jsp" class="laypage-next">更多求解</a>
          </div>
        </div>

      </div>
    </div>
    <div class="layui-col-md4">

      <div class="fly-panel">
        <h3 class="fly-panel-title">温馨通道</h3>
        <ul class="fly-panel-main fly-list-static">
          <li>
            <a href="http://fly.layui.com/jie/4281/" target="_blank">CNSDN论坛</a>
          </li>
          <li>
            <a href="http://fly.layui.com/jie/5366/" target="_blank">
              layui 常见问题的处理和实用干货集锦
            </a>
          </li>
          <li>
            <a href="http://fly.layui.com/jie/4281/" target="_blank">CNSDN论坛</a>
          </li>
          <li>
            <a href="http://fly.layui.com/jie/5366/" target="_blank">
              layui 常见问题的处理和实用干货集锦
            </a>
          </li>
          <li>
            <a href="http://fly.layui.com/jie/4281/" target="_blank">CNSDN论坛</a>
          </li>
        </ul>
      </div>


      <div class="fly-panel fly-signin">
        <div class="fly-panel-title">
          签到
          <i class="fly-mid"></i> 
          <a href="javascript:;" class="fly-link" id="LAY_signinHelp">说明</a>
          <i class="fly-mid"></i> 
          <a href="javascript:;" class="fly-link" id="LAY_signinTop">活跃榜<span class="layui-badge-dot"></span></a>
          <span class="fly-signin-days">已连续签到<cite>16</cite>天</span>
        </div>
        <div class="fly-panel-main fly-signin-main">
          <button class="layui-btn layui-btn-danger" id="LAY_signin" onclick="signfunc()">今日签到</button>
          <span>可获得<cite>5</cite>飞吻</span>
          
          <!-- 已签到状态 -->
          <!--
          <button class="layui-btn layui-btn-disabled">今日已签到</button>
          <span>获得了<cite>20</cite>飞吻</span>
          -->
        </div>
      </div>

      <div class="fly-panel fly-rank fly-rank-reply" id="LAY_replyRank">
        <h3 class="fly-panel-title">回贴周榜</h3>
        <dl>
          <!--<i class="layui-icon fly-loading">&#xe63d;</i>-->
          <dd>
            <a href="user/home.html">
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
            </a>
          </dd>
        </dl>
      </div>

      <dl class="fly-panel fly-list-one">
        <dt class="fly-panel-title">本周热议</dt>
        
         <c:forEach items="${pageScope.posts }" var="post">
         
	        <dd>
	          <a href="jie_detail.action?postid=${post.id }">${post.title }</a>
	          <span><i class="iconfont icon-pinglun1"></i> 16</span>
	        </dd>
        
        </c:forEach>
        

        <!-- 无数据时 -->
        <!--
        <div class="fly-none">没有相关数据</div>
        -->
      </dl>

      <div class="fly-panel">
        <div class="fly-panel-title">
          这里可作为广告区域
        </div>
        <div class="fly-panel-main">
          <a href="http://layim.layui.com/?from=fly" target="_blank" class="fly-zanzhu" time-limit="2019.05.25-2099.01.01" style="background-color: #5FB878;">LayIM 3.0 - layui 旗舰之作</a>
        </div>
      </div>
      
      <div class="fly-panel fly-link">
        <h3 class="fly-panel-title">友情链接</h3>
        <dl class="fly-panel-main">
          <dd><a href="http://www.layui.com/" target="_blank">layui</a><dd>
          <dd><a href="http://layim.layui.com/" target="_blank">WebIM</a><dd>
          <dd><a href="http://layer.layui.com/" target="_blank">layer</a><dd>
          <dd><a href="http://www.layui.com/laydate/" target="_blank">layDate</a><dd>
          <dd><a href="mailto:xianxin@layui-inc.com?subject=%E7%94%B3%E8%AF%B7Fly%E7%A4%BE%E5%8C%BA%E5%8F%8B%E9%93%BE" class="fly-link">申请友链</a><dd>
        </dl>
      </div>

    </div>
  </div>
</div>

<div class="fly-footer">
  <p><a href="http://fly.layui.com/" target="_blank">Fly社区</a> 2019 &copy; <a href="http://www.layui.com/" target="_blank">Yang Qun 出品</a></p>
  <p>
    <a href="http://fly.layui.com/jie/3147/" target="_blank">付费计划</a>
    <a href="http://www.layui.com/template/fly/" target="_blank">获取Fly社区模版</a>
    <a href="http://fly.layui.com/jie/2461/" target="_blank">微信公众号</a>
  </p>
</div>
 
<script src="${pageContext.request.contextPath}/fly/res/layui/layui.js"></script>
<script>
layui.cache.page = '';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: '${pageContext.request.contextPath}/fly/res/images/avatar/00.jpg'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "3.0.0"
  ,base: '../res/mods/' //这里实际使用时，建议改成绝对路径
}).extend({
  fly: 'index'
}).use('fly');

function signfunc() {
	console.log("签到");
	$.get("Signin",function(data,status) {
		alert(data);
	});
}
</script>

<%-- <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script> --%>

</body>
</html>