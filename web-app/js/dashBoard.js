$('#leftPanel').on('click', '.topics', function () {

    if ($(this).children('span.plus').text() == '+') {
    $(this).children('span.plus').html('-')
    $(this).css("height", "100px");
    $(this).children('div.summeryDiv').show();
    }
else {
    $(this).children('span.plus').html('+')
    $(this).css("height", "24px");
    $(this).children('div.summeryDiv').hide()
    }

})

$('#rightPanel').on('click', '.topics', function () {
    var userId = $(this).data('id')
    if ($(this).children('span.plus').text() == '+') {
    $(this).children('span.plus').html('-')
    $(this).css("height", "80px");
    $(this).children('div.recentTopicDiv').show();
    var targetDiv=$(this).children('div.recentTopicDiv')

        $.ajax({type:'POST',data:{'userId': userId},
            url:'/LinkSharing/topic/userRecentTopics',
            success:function(data,textStatus){jQuery(targetDiv).html(data);},
            error:function(XMLHttpRequest,textStatus,errorThrown){}});return false;
}
else {
    $(this).children('span.plus').html('+')
    $(this).css("height", "24px");
    $(this).children('div.recentTopicDiv').hide()
    }

})
