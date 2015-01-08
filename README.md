AFNetworking-demo
=================

AFNetworking2.5.0的一个完整实现demo<br />  

view    项目中的各种viewcontroller<br />  

common  共通类,各种基类<br />  
  APIClient             网络请求单例<br />  
  BaseModel             实体的父类 继承Jastor 可以直接把字典映射成对象<br />  
  BaseViewController    本项目所有ViewController的父类<br />  
  Util                  项目工具类 用于写一些常用的类方法<br />  
  
model   实体<br />  
  
vendor 各种第三方组件<br />  
  AFNetworking          网络请求框架<br />  
  UIKit+AFNetworking    AFNetworking 扩展<br />  
  Jastor                字典映射成对象组件<br />  
  category              各种实用扩展<br />  
  
Constant.h 项目中用到的各种宏定义 已经包含到了**Prefix.pch文件中<br />  


server.php  服务器端与afnetworking交互的demo<br />  
