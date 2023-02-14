
function actionToggle() {
  var sidebar = document.getElementById('js-trigger');
  sidebar.classList.toggle('open-sidebar');
}

var trigger = document.getElementById('js-trigger');
if(trigger){
  trigger.addEventListener('click', function(){
    var target = document.getElementById('sidebar');
    target.classList.toggle('open-sidebar');
  }, false);
}