window.addEventListener('scroll', function() {
  var footer = document.getElementById('footer');
  var contentHeight = document.body.scrollHeight;
  var yOffset = window.pageYOffset;
  var windowHeight = window.innerHeight;

  // Verifica se a posição atual da barra de rolagem está perto do final da página
  if (yOffset + windowHeight >= contentHeight) {
    footer.style.display = 'block'; // Mostra o footer
  } else {
    footer.style.display = 'none'; // Esconde o footer
  }
});
