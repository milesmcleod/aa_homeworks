document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.height = 500;
  canvas.width = 500;

  const ctx = canvas.getContext('2d');

  ctx.fillStyle = 'teal';
  ctx.fillRect(0, 0, 500, 500);

  ctx.fillStyle = 'magenta';
  ctx.fillRect(20, 20, 200, 200);

  ctx.beginPath();
  ctx.arc(300, 300, 50, 0, 100);
  ctx.strokeStyle = 'purple';
  ctx.lineWidth = 4;
  ctx.stroke();
  ctx.fillStyle = 'purple';
  ctx.fill();
});
