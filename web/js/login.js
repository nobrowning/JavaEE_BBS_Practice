window.onload=function(){
	bodyHeight=document.documentElement.clientHeight;//获取一屏高度
	document.getElementsByClassName('contain')[0].style.height=bodyHeight+"px";
	var Getform=document.getElementsByClassName("login-form")[0];
	var Getname=document.getElementById("name");
	var Getpass=document.getElementById("pass");
	var Getnamespace=document.getElementsByClassName("name_space")[0];
	var Getpasswdspace=document.getElementsByClassName("passwd_space")[0];


	Getname.onkeyup=function(){
		if(Getname.value.length>0){
			Getnamespace.innerHTML="";
		}		
	}
	Getpass.onkeyup=function(){
		if(Getpass.value.length>0){
			Getpasswdspace.innerHTML="";
		}			
	}
	Getform.onsubmit=function(){
		if(Getname.value==""){
			Getnamespace.innerHTML="请输入用户名";
			Getname.focus();
			return false;			
		}else if(Getname.value.length>=20){
			Getnamespace.innerHTML="请输入小于20个字符的用户名";
			Getname.focus();
			return false;			
		}
		if(Getpass.value==""){
			Getpasswdspace.innerHTML="请输入密码";
			Getpass.focus();
			return false;			
		}else if(Getname.value.length>=20){
			Getnamespace.innerHTML="请输入小于20个字符的密码";
			Getname.focus();
			return false;			
		}
	}
}

