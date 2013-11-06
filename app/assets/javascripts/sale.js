function paddy(n) {
    var pad = "00";
	var result = (pad+n).slice(-pad.length);
    return result;
}
function openDialogBox(element) {
                element.dialog('open');
}
function getHoursMinutes(dateTime){
	var dat=new Date(Date.parse(dateTime));
	return paddy(dat.getHours(),2)+":"+paddy(dat.getMinutes());
}
function getBookingsForDate(dateTxt){
	var dateParam=dateTxt==null?{}:{dateOfWeek:dateTxt};
	$.getJSON("/sale/getDatesInAWeek.json",dateParam,function(datesInAWeek){
		$(".days").empty();
		for(var key in datesInAWeek){
			if(datesInAWeek.hasOwnProperty(key)){
				$("#day_"+key).text(datesInAWeek[key]);
			}
		}
    	$.getJSON("/sale/getBookings.json",dateParam,function(data){
			$(".salaElem").remove();
			$.each(data,function(i,booking){
				var elemId="booking_"+booking.id;
				$("#"+booking.room.id+"_"+booking.day).append("<div class=\"salaElem\" id=\""+elemId+"\">"
				+getHoursMinutes(booking.at)+" - "+getHoursMinutes(booking.finish)+" - "+ booking.customer.nick
				+"</div>");
				$("#"+elemId).data("booking",booking);
			});
		});
	});
}
function toISOTimestamp(hours,minutes,day){
	var daySplit=day.split("-");
	return daySplit[2]+"-"+daySplit[1]+"-"+daySplit[0]+"T"+paddy(hours)+":"+paddy(minutes)+":00UTC+0100";
}
function createOrUpdateBooking(aulaName,roomId,day,dayName,bookingId,customerId,customerForBooking,from_h,from_m,to_h,to_m){
	$("#aulaName").empty();
    $("#dayName").empty();
    putValInJqueryId("bookingId",bookingId);
    putValInJqueryId("customerId",customerId);
    putValInJqueryId("customerForBooking",customerForBooking);
    putValInJqueryId("from_h",from_h);
    putValInJqueryId("from_m",from_m);
    putValInJqueryId("to_h",to_h);
    putValInJqueryId("to_m",to_m);
    $("#aulaName").text(aulaName);
    $("#roomId").val(roomId);
    $("#day").val(day);
    $("#dayName").text(dayName);
    openDialogBox($("#bookingCU"));
}
function putValInJqueryId(jqueryId,val){
	$("#"+jqueryId).val(val==null?"":val);
}
