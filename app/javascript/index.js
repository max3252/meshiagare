window.addEventListener('load', function(){
const pics_src = ["images/meshiagare.top01.jpg","images/meshiagare.top03.jpg","images/meshiagare.top04.jpg","images/meshiagare.top02.jpg","images/meshiagare.top05.jpg"];
let num = -1;
 
 
function slideshow_timer(){
  if (num === 4){
    num = 0;
  } 
  else {
    num ++;
  }
  document.getElementById("mypic").src = pics_src[num];
}
 
setInterval(slideshow_timer, 5000);
})