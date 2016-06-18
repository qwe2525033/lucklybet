jQuery(function() {
    jQuery.each(FormParams, function(i, n) {
        jQuery("#" + n).unbind('submit').bind('submit', function() {
            var isSubmit = true;
            jQuery(this).find("[regex],[url]:not([regex])").each(function() {
                var offset = jQuery(this).offset();
                if (offset.top > 0 && offset.left > 0) {
                    jQuery('p#vmsg').remove();
                    if (jQuery(this).attr("regex") == undefined) {
                        if (!ajax_validate(jQuery(this))) {
                            isSubmit = false;
                        }
                    } else {
                        if (!validate(jQuery(this))) {
                            isSubmit = false;
                        }
                    }
                    if (!isSubmit) {
                        if (jQuery(this).attr("msg") != undefined) {
                            var width = jQuery(this)[0].offsetWidth;
                            var bindwidth = 0;
                            if (jQuery(this).attr("bind") != undefined) {
                                bindwidth = jQuery("#" + jQuery(this).attr("bind"))[0].offsetWidth;
                            }
                            var height = jQuery(this).height() > 25 ? 25 : jQuery(this).height();
							var topheight = jQuery(this).height() > 25 ? (jQuery(this).height()-25) : 0;
                            jQuery('body').append('<p id="vmsg" style="position: absolute;padding-left:5px;padding-right:5px;font-size:12px;color:#FF0000;background-color:#EEF3F7;border:1px solid #CCCCCC;-moz-border-radius: 5px;-webkit-border-radius: 5px;z-index: 9999;height:' + height + 'px;line-height:' + height + 'px;">' + jQuery(this).attr("msg") + '</p>');
                            jQuery('p#vmsg').css({
                                top: (offset.top) + topheight + 'px',
                                left: (offset.left + width + bindwidth+5) + 'px'
                            });
                            //jQuery('p#vmsg').bgiframe();
                            jQuery(this).focus();
                            return false;
                        }
                    } else {
                        jQuery('p#vmsg').remove();
                    }
                }
            });
            if (typeof (isExtendsValidate) != "undefined") {
                if (isSubmit && isExtendsValidate) {
					return extendsValidate(n);
                }
            }
            return isSubmit;
        });
    });
});
function clearAllMsg(){
	jQuery.each(FormParams, function(i, n) {
		jQuery(this).find("[regex],[url]:not([regex])").each(function(){
			var offset = jQuery(this).offset();
			if (offset.top > 0 && offset.left > 0) {
				change_error_style(jQuery(this), "remove");
				change_exten_msg(jQuery(this),null,"remove");
			}
		});
    });
	jQuery('p#vmsg').remove();
}
function showValidateMsg(obj){
	var offset = obj.offset();
	if(obj.attr("msg") != undefined){
		var width = obj[0].offsetWidth;
        var bindwidth = 0;
        if (obj.attr("bind") != undefined) {
        	bindwidth = jQuery("#" + obj.attr("bind"))[0].offsetWidth;
        }
        var height = obj.height() > 25 ? 25 : obj.height();
		var topheight = obj.height() > 25 ? (obj.height()-25) : 0;
        jQuery('body').append('<p id="vmsg" style="position: absolute;padding-left:5px;padding-right:5px;font-size:12px;color:#FF0000;background-color:#EEF3F7;border:1px solid #CCCCCC;-moz-border-radius: 5px;-webkit-border-radius: 5px;z-index: 9999;height:' + height + 'px;line-height:' + height + 'px;">' + obj.attr("msg") + '</p>');
        jQuery('p#vmsg').css({
        	top: (offset.top) + topheight + 'px',
            left: (offset.left + width + bindwidth+5) + 'px'
        });
		obj.focus();
		return false;
	}
}
function validate(obj){
	var reg = new RegExp(obj.attr("regex"));
	var objValue = obj.val();
	if(!reg.test(objValue)){
		change_error_style(obj,"add");
		change_msg(obj,null,"remove");
		return false;
	}else{
		if(obj.attr("url") == undefined){
			change_error_style(obj,"remove");
			change_msg(obj,null,"remove");
			return true;
		}else{
			if(obj.attr("url").length > 0){
				return ajax_validate(obj);
			}else{
				return true;
			}
		}
	}
}
function ajax_validate(obj){
	var url_str = obj.attr("url");
	if(url_str.indexOf("?") != -1){
		url_str = url_str+"&"+obj.attr("name")+"="+obj.val()+"&rand="+Math.random();
	}else{
		url_str = url_str+"?"+obj.attr("name")+"="+obj.val()+"&rand="+Math.random();
	}
	var feed_back = jQuery.ajax({url: url_str,cache: false,async: false}).responseText;
	feed_back = feed_back.replace(/(^\s*)|(\s*jQuery)/g, "");
	if(feed_back == 'success'){
		change_error_style(obj,"remove");
		change_msg(obj,null,"remove");
		return true;
	}else{
		change_error_style(obj,"add");
		change_msg(obj,feed_back,"add");
		return false;
	}
}
function change_msg(obj,msg,action_type){
	if(obj.attr("msg") == undefined){
		obj.attr("is_msg_null","yes");
	}
	if(action_type == "add"){
		if(obj.attr("is_msg_null") == "yes"){
			obj.attr("msg",msg);
		}else{
			if(msg != null){
				if(obj.attr("msg_bak") == undefined){
					obj.attr("msg_bak",obj.attr("msg"));
					obj.attr("msg",msg);
				}
			}
		}
	}else{
		if(obj.attr("is_msg_null") == "yes"){
			obj.removeAttr("msg");
			obj.removeAttr("msg_bak");
		}else{
			obj.attr("msg",obj.attr("msg_bak"));
			obj.removeAttr("msg_bak");
		}
	}
}
function change_exten_msg(obj,msg,action_type){
	if(obj.attr("msg") == undefined){
		obj.attr("is_msg_null","yes");
	}
	if(action_type == "add"){
		if(obj.attr("is_msg_null") == "yes"){
			obj.attr("msg",msg);
			showValidateMsg(obj);
		}else{
			if(msg != null){
				if(obj.attr("msg_bak") == undefined){
					obj.attr("msg_bak",obj.attr("msg"));
					obj.attr("msg",msg);
					showValidateMsg(obj);
				}
			}
		}
	}else{
		if(obj.attr("is_msg_null") == "yes"){
			obj.removeAttr("msg");
			obj.removeAttr("msg_bak");
			jQuery('p#vmsg').remove();
		}else{
			obj.attr("msg",obj.attr("msg_bak"));
			obj.removeAttr("msg_bak");
			jQuery('p#vmsg').remove();
		}
	}
}
function change_error_style(obj,action_type){
	if(action_type == "add"){
		obj.css('border','1px solid #FF0000');
	}else{
		obj.css('border','1px solid #D0D1D3');
	}
}
jQuery.fn.validate_callback = function(msg,action_type,options){
	this.each(function(){
		if(action_type == "failed"){
			change_error_style(jQuery(this),"add");
			change_exten_msg(jQuery(this),msg,"add");
		}else{
			change_error_style(jQuery(this),"remove");
			change_exten_msg(jQuery(this),null,"remove");
		}
	});
};