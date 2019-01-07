$(function(){
    var index = $(".mypage-tabs li").index(this);
    $(".mypage-item-list li").css('display','none');
    $('.mypage-item-list li').css('display','block');
    $(".mypage-tabs li").removeClass('active');
    $(this).addClass('active');
  });
});
