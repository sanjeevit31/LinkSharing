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
function resourceType(){
    var type=document.getElementById('type').value
   if(type=='Link')
    {
        document.getElementById('resourceTypeLabel').innerHTML='URL'
       document.getElementById('resourceType').innerHTML='<input type="url" value="" id="url_path" name="url_path"/>'
    }
    else {
       document.getElementById('resourceTypeLabel').innerHTML='File'
        document.getElementById('resourceType').innerHTML='<input type="file"  required="" id="url_path" name="url_path"/>'
    }

}






