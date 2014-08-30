$( document ).ready(function() {
  $("img.main_page_img").mouseover(function(event) {
    createTooltip(event);
  }).mouseout(function(event){
    hideTooltip(event);
  });
});

function createTooltip(event){
  $('<div class="tooltip">Test</div>').appendTo('body');
  positionTooltip(event);
};

function hideTooltip(event){
  $('body').find('div.tooltip').remove();
};

function positionTooltip(event){
  var tPosX = event.pageX;
  var tPosY = event.pageY;
  $('div.tooltip').css({'position': 'absolute', 'top': tPosY + 'px', 'left': tPosX + 'px'});
}
