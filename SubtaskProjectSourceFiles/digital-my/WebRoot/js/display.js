 window.onload = function(){
        var smallBox = document.querySelector(".productImg-smallBox");
        var bigBox = document.querySelector(".productImg-bigBox");
        var bigImg = document.querySelector(".big");
        var mask = document.querySelector(".mask");
        smallBox.onmouseenter = function(){
            mask.style.opacity = 1;
            bigBox.style.display = "block";
        }
        smallBox.onmouseleave = function(){
            mask.style.opacity = 0;
            bigBox.style.display = "none";
        }
		  var left = 0, top= 0;
        smallBox.onmousemove = function(event){
            var e = event || window.event;
            left = e.clientX - this.offsetParent.offsetLeft - mask.offsetWidth / 2;
            top = e.clientY - this.offsetParent.offsetTop - mask.offsetHeight / 2;
            if(left <= 0){
                left = 0;
            }
            else if(left > smallBox.offsetWidth - mask.offsetWidth){
              left = smallBox.offsetWidth - mask.offsetWidth;
            }
            if(top <= 0){
                top = 0;
            }
            else if(top > smallBox.offsetHeight - mask.offsetHeight){
                top = smallBox.offsetHeight - mask.offsetHeight;
            }
            mask.style.left = left + "px";
            mask.style.top = top + "px";
            bigImg.style.left = -left * 2+ "px";
            bigImg.style.top = -top * 2+ "px";
        }
    }