window.onload=function(){
	var fileBtn = $("input[type=file]");
    fileBtn.on("change", function(){
        var index = $(this).val().lastIndexOf("\\");
        var sFileName = $(this).val().substr((index+1));
        $("#rightText").html(sFileName);
//插入图片
        //判断是否支持FileReader
        if (window.FileReader) {
            var reader = new FileReader();
        } else {
            alert("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
        }
        var Img=document.getElementById("inputFile").value;
        var file = this.files[0];
        var imageType = /^image\//;
//      //是否是图片
//      if (!imageType.test(file.type)) {
//          alert("请选择图片！");
//          return;
//      }
        //读取完成
        reader.onload = function(e) {
            //获取图片dom
            var textbox=document.getElementsByClassName("textbox")[0];
		    textbox.appendChild(createEle("img","apend_img",e.target.result));
            //图片路径设置为读取的图片
//          img.src = e.target.result;
        };
        reader.readAsDataURL(file);

    });
//删除图片

	var textbox=document.getElementsByClassName("textbox")[0];
	textbox.onkeyup=function(){
		var oEvent = window.event; 
		var Img=document.getElementById("inputFile").value;
		if (oEvent.keyCode == 8) { 
			if(textbox.getElementsByTagName("img").length==0){
				Img="";
				document.getElementById("rightText").innerHTML="";
				
			}	
		}
	
	}

//提交
	var Sub=document.getElementsByClassName("sub")[0];
	var Form=document.getElementsByClassName("form_sub")[0];
	Sub.onclick=function(){
//表单验证
		if(textbox.innerText.length>300){
			alert("您所输入的内容超出范围,请输入小于300个字符的内容");
			textbox.focus();
			return false;
		}



		var url = Form.getAttribute("action");
		Form.setAttribute("action",url+"&textbox="+textbox.innerText);
		Form.submit();
	}
	//加innerHtml的样式
	function createEle(nodeName,klass,Src){
		if(nodeName){
			var newNode;
			newNode=document.createElement(nodeName);
			if(klass){
				newNode.setAttribute('class',klass);
			}
			if(Src){
				newNode.setAttribute('src',Src);
			}
			return newNode;
		}
		else{
			return false;
		}
	}
	

}