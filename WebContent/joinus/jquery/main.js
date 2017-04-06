/**
 * 
 */

var canvas = document.getElementById("canvas");

canvas.width = document.body.clientWidth;
canvas.height = document.body.clientHeight;
canvas.style.width = canvas.width + "px";
canvas.style.height = canvas.height + "px";

var ctx = canvas.getContext('2d');

var rect = new Rectangle(15,15,50,50);
var rect2 = new Rectangle(80,15,50,50);

setInterval(function(){


    ctx.clearRect(0,0,canvas.width,canvas.height);

    rect.Draw(ctx,"red");
    rect2.Draw(ctx,"blue");
},33);