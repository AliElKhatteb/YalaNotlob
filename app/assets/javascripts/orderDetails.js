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
  function myFunction() {
    var x = document.getElementById("myDIV");
    if (x.style.display === "block") {
      x.style.display = "none";
    } else {myFunctionbtn
      x.style.display = "block";
    }
  }


  function myFunctionbtn() {
    var x = document.getElementById("mydiv");
    if (x.style.display === "block") {
      x.style.display = "none";
    } else {
      x.style.display = "block";
    }
  }

  function neww() {
    var y = document.getElementById("viewinvited");
    if (y.style.display === "block") {
      y.style.display = "none";
    } else {
      y.style.display = "block";
    }
  }