$(document.body).append('<div id="advblock" style="position: absolute; opacity: 1; top: 0; left: 0;">&nbsp;</div>');
setTimeout(function() {
  if (!$('#advblock').height()) {
    window.location.href = "/adblock_problem.html";
  }
}, 
100);
