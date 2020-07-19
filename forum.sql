/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : forum

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 18/07/2020 10:21:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` int(11) NOT NULL,
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `collectTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `mail`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL,
  `sendTime` datetime(0) NULL DEFAULT NULL,
  `postid` int(11) NULL DEFAULT NULL,
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(11) NOT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT 0,
  `sort` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, '2020-07-18 08:34:02', '大三实习生，字节跳动面经分享，已拿Offer', '计科大三学生，无实习无项目经历成绩普通\n\n一面3.9：40min\nHashMap和ConcurrentHashMap的区别\n\nvector，list\n\nC++多态，虚函数机制\n\n进程通信\n\n进程线程差异\n\nTCP三次握手四次挥手细节\n\n算法题：最长不重复字串（HashTable，O(N)）\n\n面试官人非常好，有一些遗漏的知识点会给你指出来并且讲解，也很耐心。\n\n二面3.15：1h\nJava多态（看程序说结果，比较复杂，还考察了override和overwrite）\n\n二叉搜索树\n\nB树b+树\n\n红黑树删除算法\n\n用互斥锁实现读写锁，写者优先\n\n算法题：有100个方格，每个上面有毒蘑菇和体力蘑菇，毒蘑菇减体力体力蘑菇加体力，当前体力是能跳到的最远距离，求是否能跳到最远方格，如果可以，求落在第100格上的最大剩余体力\n\n二面面试官挺严肃的，回答问题不会肯定或者否定你，听完你的回答就会直接继续下一个知识点，节奏非常紧凑。面完我一度以为凉了，结果十分钟后hr打电话通知三面，而且三面面试官说前面的两次面试官评价挺高。所以小伙伴碰到比较严肃的面试官也不要灰心，平常心回答就好\n\n三面3.17： 1h\n服务方法调用\n\nRPC/Netty\n\n序列化/反序列化\n\n10亿找Top10000，需要考虑分片，如果用最小堆需要考虑高效合并\n\n要考虑等待时间且带有优先权的打印机，设计数据结构使打印任务高效\n\n二十四点牌\n\n在三面开始的时候面试官问了能够实习的时间和想要实习的地点，猜测可能是leader直接面试（最后也正好去了这个面试官在的城市），人很和善，不过问题都不是我准备过的基础题型，碰到的时候还是有一点束手无策。\n\n3.27收到offer啦！等了快两周终于拿到心心念念的offer哈哈！\n其实准备字节跳动的面试还是需要着重准备基础部分（数据结构、算法、操作系统、计算机网络），另外对做算法题的要求很高，如果在看到题目的时候能直接给出这个题目的最优时空复杂度解法，面试官对你的评价会很高。\n\n如果基础知识比较扎实了，可以看看网络上的面试经验，找找自己不会的知识点，查漏补缺。\n\n也祝大家都能拿到心仪的offer！\n\n絮叨\n首先恭喜一下读者，让敖丙我去，我是肯定面不过，这些好多都没准备过，我之前说校招比社招难，真的没框你们，所以仔们，真的得好好准备呀。\n\n说一下最近我的事情吧，最近小忙，文章输出频率不比以前了，而且最近熬夜熬多了好像头发少了，我后面还是控制下熬夜的事情。\n\n最后发个意见征集吧，不知道写啥了，我在写一个分布式锁的，下周发出来，其他就不知道了，你们留言看看你们想看啥，我看到感兴趣的我就写了。\n', '1231312@qq.com', 0, 99);
INSERT INTO `post` VALUES (2, '2020-07-18 08:50:05', '都前后端分离了，咱就别做页面跳转了！统统 JSON 交互', '前两天有个小伙伴在微信上问松哥，这前后端分离开发后，认证这一块到底是使用传统的 session 还是使用像 JWT 这样的 token 来解决呢？\n\n这确实代表了两种不同的方向。\n\n传统的通过 session 来记录用户认证信息的方式我们可以理解为这是一种有状态登录，而 JWT 则代表了一种无状态登录。可能有小伙伴对这个概念还不太熟悉，我这里就先来科普一下有状态登录和无状态登录。\n\n1. 无状态登录\n1.1 什么是有状态\n有状态服务，即服务端需要记录每次会话的客户端信息，从而识别客户端身份，根据用户身份进行请求的处理，典型的设计如 Tomcat 中的 Session。例如登录：用户登录后，我们把用户的信息保存在服务端 session 中，并且给用户一个 cookie 值，记录对应的 session，然后下次请求，用户携带 cookie 值来（这一步有浏览器自动完成），我们就能识别到对应 session，从而找到用户的信息。这种方式目前来看最方便，但是也有一些缺陷，如下：\n\n服务端保存大量数据，增加服务端压力\n服务端保存用户状态，不支持集群化部署\n1.2 什么是无状态\n微服务集群中的每个服务，对外提供的都使用 RESTful 风格的接口。而 RESTful 风格的一个最重要的规范就是：服务的无状态性，即：\n\n服务端不保存任何客户端请求者信息\n客户端的每次请求必须具备自描述信息，通过这些信息识别客户端身份\n那么这种无状态性有哪些好处呢？\n\n客户端请求不依赖服务端的信息，多次请求不需要必须访问到同一台服务器\n服务端的集群和状态对客户端透明\n服务端可以任意的迁移和伸缩（可以方便的进行集群化部署）\n减小服务端存储压力\n1.3 如何实现无状态\n无状态登录的流程：\n\n首先客户端发送账户名/密码到服务端进行认证\n认证通过后，服务端将用户信息加密并且编码成一个 token，返回给客户端\n以后客户端每次发送请求，都需要携带认证的 token\n服务端对客户端发送来的 token 进行解密，判断是否有效，并且获取用户登录信息\n1.4 各自优缺点\n使用 session 最大的优点在于方便。你不用做过多的处理，一切都是默认的即可。松哥本系列前面几篇文章我们也都是基于 session 来讲的。\n\n但是使用 session 有另外一个致命的问题就是如果你的前端是 Android、iOS、小程序等，这些 App 天然的就没有 cookie，如果非要用 session，就需要这些工程师在各自的设备上做适配，一般是模拟 cookie，从这个角度来说，在移动 App 遍地开花的今天，我们单纯的依赖 session 来做安全管理，似乎也不是特别理想。\n\n这个时候 JWT 这样的无状态登录就展示出自己的优势了，这些登录方式所依赖的 token 你可以通过普通参数传递，也可以通过请求头传递，怎么样都行，具有很强的灵活性。\n\n不过话说回来，如果你的前后端分离只是网页+服务端，其实没必要上无状态登录，基于 session 来做就可以了，省事又方便。\n\n好了，说了这么多，本文我还是先来和大家说说基于 session 的认证，关于 JWT 的登录以后我会和大家细说，如果小伙伴们等不及，也可以先看看松哥之前发的关于 JWT 的教程：Spring Security 结合 Jwt 实现无状态登录。\n\n2. 登录交互\n在上篇文章中，松哥和大家捋了常见的登录参数配置问题，对于登录成功和登录失败，我们还遗留了一个回调函数没有讲，这篇文章就来和大家细聊一下。\n\n2.1 前后端分离的数据交互\n在前后端分离这样的开发架构下，前后端的交互都是通过 JSON 来进行，无论登录成功还是失败，都不会有什么服务端跳转或者客户端跳转之类。\n\n登录成功了，服务端就返回一段登录成功的提示 JSON 给前端，前端收到之后，该跳转该展示，由前端自己决定，就和后端没有关系了。\n\n登录失败了，服务端就返回一段登录失败的提示 JSON 给前端，前端收到之后，该跳转该展示，由前端自己决定，也和后端没有关系了。\n\n首先把这样的思路确定了，基于这样的思路，我们来看一下登录配置。\n\n2.2 登录成功\n之前我们配置登录成功的处理是通过如下两个方法来配置的：\n\ndefaultSuccessUrl\nsuccessForwardUrl\n这两个都是配置跳转地址的，适用于前后端不分的开发。除了这两个方法之外，还有一个必杀技，那就是 successHandler。\n\nsuccessHandler 的功能十分强大，甚至已经囊括了 defaultSuccessUrl 和 successForwardUrl 的功能。我们来看一下：\n\n.successHandler((req, resp, authentication) -> {\n    Object principal = authentication.getPrincipal();\n    resp.setContentType(\"application/json;charset=utf-8\");\n    PrintWriter out = resp.getWriter();\n    out.write(new ObjectMapper().writeValueAsString(principal));\n    out.flush();\n    out.close();\n})\n1\n2\n3\n4\n5\n6\n7\n8\nsuccessHandler 方法的参数是一个 AuthenticationSuccessHandler 对象，这个对象中我们要实现的方法是 onAuthenticationSuccess。\n\nonAuthenticationSuccess 方法有三个参数，分别是：\n\nHttpServletRequest\nHttpServletResponse\nAuthentication\n有了前两个参数，我们就可以在这里随心所欲的返回数据了。利用 HttpServletRequest 我们可以做服务端跳转，利用 HttpServletResponse 我们可以做客户端跳转，当然，也可以返回 JSON 数据。\n\n第三个 Authentication 参数则保存了我们刚刚登录成功的用户信息。', '1231312@qq.com', 0, 99);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '北京',
  `VIPRank` int(11) NULL DEFAULT 0,
  `credit` int(11) NOT NULL DEFAULT 100,
  `sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mail`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1231312@qq.com', '小红', 'lueSGJZetyySpUndWjMBEg==', NULL, NULL, 0, 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
