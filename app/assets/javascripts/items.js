function increaseAmount() {
    var value = parseInt(document.getElementById('number').value, 10);
    value = isNaN(value) ? 0 : value;
    value++;
    document.getElementById('number').value = value;
  }
  
  function decreaseAmount() {
    var value = parseInt(document.getElementById('number').value, 10);
    value = isNaN(value) ? 0 : value;
    value < 1 ? value = 1 : '';
    value--;
    document.getElementById('number').value = value;
  }
  function decreasePrice()
 {
    var value = parseInt(document.getElementById('price').value, 10);
    value = isNaN(value) ? 0 : value;
    value < 1 ? value = 1 : '';
    value--;
    document.getElementById('price').value = value;
  }
  
  function   increasePrice()
  {
    var value = parseInt(document.getElementById('price').value, 10);
    value = isNaN(value) ? 0 : value;
    value < 1 ? value = 1 : '';
    value++;
    document.getElementById('price').value = value;
  }
  let list =document.getElementsByClassName('popup')
  for(let i = 0; i < list.length; i++) {
    list[i].addEventListener("click", function() {
     
    })
  }
 


  function view_div() {
    var x = document.getElementById("myDIV");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
  } 




 