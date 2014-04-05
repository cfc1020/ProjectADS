$(document.body).append('<div id="advblock" style="position: absolute; opacity: 1; top: 0; left: 0;">h</div>');
setTimeout(function() {
  if (!$('#advblock').height()) {
    window.location.href = "/adblock_problem.html";
  }
}, 
1
);
setTimeout(function() {
  $("#advblock").remove();
}, 
10);
