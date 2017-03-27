window.onload=function(){
	bodyHeight=document.documentElement.clientHeight;//获取一屏高度
	document.getElementsByClassName('contain')[0].style.height=bodyHeight+"px";
	var Getform=document.getElementsByClassName("login-form")[0];
	var Getname=document.getElementById("name");
	var Getpass=document.getElementById("pass");
	var Getemail=document.getElementById("email");	
	var Getbirthday=document.getElementById("birthday");	
	var Getnamespace=document.getElementsByClassName("name_space")[0];
	var Getpasswdspace=document.getElementsByClassName("passwd_space")[0];
	var Getemialspace=document.getElementsByClassName("email_space")[0];
	var Getbirthdayspace=document.getElementsByClassName("birthday_space")[0];
	
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
	Getemail.onkeyup=function(){
		if(Getemail.value.length>0){
			Getemialspace.innerHTML="";
		}			
	}	
	Getbirthday.onkeyup=function(){
		if(Getbirthday.value.length>0){
			Getbirthdayspace.innerHTML="";
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
		}else if(Getpass.value.length>=20){
			
			Getpasswdspace.innerHTML="请输入小于20个字符的密码";
			Getpass.focus();
			return false;			
		}
		if(Getemail.value==""){
			Getemialspace.innerHTML="请输入邮箱";
			Getemail.focus();
			return false;			
		}else if(Getemail.value.length>=30){
			Getemialspace.innerHTML="请输入小于30个字符的邮箱";
			Getemail.focus();
			return false;			
		}
		if(Getbirthday.value==""){
			Getbirthdayspace.innerHTML="请输入生日";
			Getbirthday.focus();
			return false;			
		}else if(Getbirthday.value.length>=20){
			Getbirthdayspace.innerHTML="请输入合法日期";
			Getbirthday.focus();
			return false;			
		}
	}
}

