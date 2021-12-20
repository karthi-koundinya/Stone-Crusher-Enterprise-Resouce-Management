$(document).ready(function(){
	$("#loading").hide();
	$("li.home").addClass('active');
    /** Modifications **/
	$('body').on('shown.bs.popover', function (e) {
		if($.trim($(e.target).val()) != "") {
			$('.popover').remove();
		} else if($(e.target).hasClass("bootstrap-select")) {
			if($(e.target).siblings('select').val() != "@@@") {
				$('.popover').remove();
			}
		}
	});
	customizeItems($("#roomSummary"));
	/** End **/
	/*$.fn.hasScrollBar = function() {
        return this.get(0).scrollHeight > this.height() - 5;
    }*/
	/* To allow only numbers in text field */
	$('body').on('keydown', '.onlyNumbers', function(e){
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
             // Allow: Ctrl+A
            (e.keyCode == 65 && e.ctrlKey === true) ||
             // Allow: home, end, left, right
            (e.keyCode >= 35 && e.keyCode <= 39)||
            // Allow: Ctrl+V
            ((e.keyCode == 86 || e.keyCode == 67 || e.keyCode == 90) && e.ctrlKey === true)
        	) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
	/* End */

	$('body').on('keydown','.has-error input',function(){
		$(this).parent().removeClass('has-error');
		$(this).popover('hide');
	});
	$('body').on('change','select',function(){
		$(this).parent().removeClass('has-error');
		$(this).popover('hide');
	});

	
	/* Menus and sub menus click trigger */
	 $('body').on('click','li.btn-click',function(e, clearFlag){
		$('li.active').removeClass('active');
		if($(this).parent().parent().hasClass('dropdown')) {
			$(this).parent().parent().addClass('active');
		} else {
			$(this).addClass('active');
		}
		var clickedArea = $(this).attr('data-id');
		if(clickedArea == "Home") {
			window.location.href = "mainframe.action";
	 	} else if(clickedArea == "Booking") {
	 		window.location.href = "booking.action";
	 	} else if(clickedArea == "Check Out") {
			window.location.href = "checkout.action";
	 	} else if(clickedArea == "Reports") {
	 		window.location.href = "reports.action";
	 	} else if(clickedArea == "Room Info") {
	 		displayRoomPage();
	 	} else if(clickedArea == "Tax Declaration") {
	 		$("#taxDeclaration").modal('show');
	 	} else if(clickedArea == 'AddUser') {
	 		displayUserPage();
	 	}
	 });
	/* jQuery('#roomType').fixheadertable({
	    colratio    : [50, 150, 150, 150, 50],
	    height      : 150,
	    fixedColumns: 1
	});*/
	 
});

function openPage(page) {
	$("#iframePrint").attr('src','');
	$("#printModel").modal('hide');
	$("li[data-id='"+page+"']").trigger('click',true);
}
function getFileName() {
	var idFile = $("#idFile").val();
	alert(idFile);
	$("#myFileFileName").val(idFile);
}