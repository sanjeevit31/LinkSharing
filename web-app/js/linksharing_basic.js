var clock={
    hours:function(){return new Date().getHours()},
minutes:function(){return new Date().getMinutes()},
seconds:function(){return new Date().getSeconds()}
}
function dateTime_() {
    document.getElementById('time_').innerHTML=''+clock.hours()+':'+clock.minutes()+':'+clock.seconds()
    interval=   setInterval(function(){showTime()}, 1000);
}

function showTime(){
    var time1=clock.hours()+':'+clock.minutes()+':'+clock.seconds()
    document.getElementById('time_').innerHTML=''+time1
    }

function showStates(){

    document.getElementById("state").style.visibility="visible";
}


