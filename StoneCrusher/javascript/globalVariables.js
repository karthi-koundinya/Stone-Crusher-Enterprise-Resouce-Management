var _displayPage = "";
var _clearFlag = false;
var _isUpdate = false;
function fixheaderTable() {
	var commodityTable = $('#commodityTable');
	if(_displayPage != "stockTransfer" && commodityTable.length > 0) {
		$('#commodityTable').fixheadertable({
		    colratio    : [250, 110, 110, 50],
		    height      : 335,
		    width		: 553,
		    fixedColumns: 1
		});
	} else {
		commodityTable.fixheadertable({
		    colratio    : [250, 110, 110, 250, 50],
		    height      : 330,
		    width		: 803,
		    fixedColumns: 1
		});
	}
	$(".headtable.ui-state-default").css('margin-right','17px');
	$("#commodities").css('margin-top','15px')
}

validateFields = function(content, location, condCheck) {
	var id = "";
	var errorMessage = "Please Provide Value";
	$(content).find("input[type='text'], input[type='number'], select, textarea").each(function(i, ele){
		if(!$(this).hasClass('notMandatory')) {
		var value = $.trim($(this).val());
		if(!$(this).is(":disabled") && $(this).is(":visible") && (value.length == 0 || (condCheck == 0 ? parseInt(value) : value) == condCheck)) {
			id = this;
			return false;
		} else if($(this).hasClass("selectpicker") 
				&& this.value.length == 0 
				&& !$(this).is(":disabled") 
				&& $(this).parent().is(":visible")) {
			id = $(this).siblings('div');
			errorMessage = "Please Select Value";
			$('.popover').remove();
			return false;
		}
		}
	});
	if(id == "") {
		$(content).find("input[type='radio']").each(function(i, ele){
			var typeName = $(this).attr('name');
			if($(content).find("input[type='radio'][name='"+typeName+"']:checked").length == 0) {
				id = $(this).closest(".radiobutton-div");
				errorMessage = "Please Select Value";
				$('.popover').remove();
				return false;
			}
		});
	}
	if(id != "") {
		$(id).parent().addClass('has-error');
		$(id).popover({
			placement:location,
			content:errorMessage,
			delay: {show:500}
			});
		$(id).popover('show');
		if($(id).siblings(".popover ").length > 1) {
			$(id).siblings(".popover ").last().remove();
		}
		return false;
	}	
	return true;
}

clearFields = function(content){
	$(content).find("input[type='text'], input[type='number'], select, textarea").val('');
}

getFloatValue = function(value) {
	return value == null || $.trim(value).length == 0 ? 0 : parseFloat(value);
}
getIntValue = function(value) {
	return value == null || $.trim(value).length == 0 ? 0 : parseInt(value);
}
getValue = function(value, returnValue) {
	return value == null ? returnValue : value;
}

function formatDate(date, isTime) {
	var hours = date.getHours();
	var minutes = date.getMinutes();
	var ampm = hours >= 12 ? 'pm' : 'am';
	hours = hours % 12;
	hours = hours ? hours : 12; // the hour '0' should be '12'
	minutes = minutes < 10 ? '0'+minutes : minutes;
	var day = date.getDate();
	if(day < 10) {
		day = "0"+day;
	}
	var month = (date.getMonth()+1);
	if(month < 10) {
		month = "0" + month;
	}
	var dateTime =  day + "." + month + "." + date.getFullYear();
	if(isTime) {
		dateTime += " " + hours + ':' + minutes + ' ' + ampm;
	}
	
	return  dateTime;
}

function printPopUp(page) 
{
	var address = _contextPath + "/jsp/"+page+".jsp?Time="+ (new Date()).getTime();
	$.ajax({
		url: address,
		success: function(html){
			var mywindow = window.open('', 'my div', 'height=400,width=600');
		    mywindow.document.write(html);
		    mywindow.document.close(); // necessary for IE >= 10
		    mywindow.focus(); // necessary for IE >= 10
		    mywindow.print();
		   // mywindow.close();
		}
	});
}