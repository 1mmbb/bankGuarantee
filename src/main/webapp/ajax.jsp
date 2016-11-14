<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>  
              
        </style>  
        <script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>  
        <script type="text/javascript">  
            $(function(){  
                //调用加载数据函数  
                loadstu();  
                  
                //为添加按钮绑定一个添加动作  
                $("#aid").click(function(){  
                    $("#fill").show();  
                    $("#myform").show();  
                });  
            });  
              
            //加载学生信息  
            function loadstu(){  
                $.ajax({  
                    url:"/selectAllUser",  
                    type:"GET",  
                    dataType:"json",  
                    success:function(data){  
                        //alert(data);  
                        var str=null;  
                        for(var i=0;i<data.length;i++){  
                            str+="<tr>";  
                            str+="<td>"+data[i].username+"</td>";  
                            str+="<td>"+data[i].userpwd+"</td>";  
                            str+="<td>"+data[i].usertruename+"</td>";  
                            str+="<td>"+data[i].userstate+"</td>";  
                            str+="<td><a href=\"javascript:void(0);\" onclick='doDel("+data[i].userid+",this)'>删除</a></td>";  
                            str+="</tr>";  
                              
                        }  
                        $("#stuid tbody").empty();  
                        $("#stuid tbody").append(str);  
                    }  
                });  
            }  
              
            //删除函数  
            function doDel(userid,ob){  
                //执行ajax删除  
                if(confirm("确定要删除吗？"))  
                $.ajax({  
                    url:"/deleteUser",  
                    type:"POST",  
                    data:{userid:userid},  
                    dataType:"json",  
                    success:function(res){  
                        //判断是否删除成功  
                        if(res>0){  
                            //alert(res.num);  
                            $(ob).parents("tr").remove();  
                        }  
                    },  
                    error:function(){  
                        alert('error');  
                    }  
                });  
            }  
              
            //执行添加  
            function doAdd(form){  
                alert($(form).serialize());  
                 $.ajax({  
                    url:"/addUser",  
                    type:"POST",  
                    data:$(form).serialize(),  
                    dataType:"json",  
                    success:function(res){  
                        if(res>0){  
                            $('#fill').hide();  
                            $('#myform').hide();  
                            $(form).find(":reset").trigger("click");  
                            loadstu();//重新加载  
                        }else{  
                            alert('添加失败！');  
                        }  
                    }  
                }); 
                  
                return false;  
            }  
        </script> 
</head>
<body>  
        <h3>用户信息</h3><button id="aid">添加</button>  
        <table id="stuid" width="500" border="1">  
            <thead>  
                <tr>  
                    <th>姓名</th><th>密码</th><th>真实姓名</th><th>状态</th> 
                    <th>操作</th>  
                </tr>  
            </thead>  
            <tbody>  
                  
            </tbody>  
        </table>  
          
          
        <div id="fill" style="width:100%;height:100%;background-color:#000;position:absolute;top:0px;left:0px;opacity:0.3;display:none;z-index:100">  
        </div>  
          
        <div id="myform" style="width:100%;height:100%;position:absolute;top:0px;left:0px;z-index:101;display:none">  
            <form  action="" method="post" onsubmit="return doAdd(this)">  
            <table width="340" border="0" style="margin:20% auto;background-color:#fff">  
                <tr>  
                    <td>姓名：</td>  
                    <td><input type='text' name="username"/></td>  
                </tr>  
                <tr>  
                    <td>密码：</td>  
                    <td><input type='text' name="userpwd"/></td>  
                </tr>  
                <tr>  
                    <td>真实姓名：</td>  
                    <td><input type='text' name="usertruename"/></td> 
                     
                </tr>  
                <tr>  
                    <td>状态：</td>  
                    <td>  
                        <input type='radio' name="userstate" value="1"/>正常
                        <input type='radio' name="userstate" value="0"/>锁定
                    </td> 
                </tr>  
                <tr>  
                    <td> </td>  
                    <td >  
                        <input type='submit' value="添加"/>   
                        <input type='reset' value="重置"/>   
                        <input type="button" onclick="$('#fill').hide();$('#myform').hide();" value="关闭"/>  
                    </td>  
                </tr>  
            </table>  
            </form>  
        </div>  
          
          
    </body>  
</html>