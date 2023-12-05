const mode = document.getElementById("jsmode");
mode.addEventListener("click", function() {
  if (mode.innerText === "바뀌기 전 text") {
    mode.innerText = "바뀐 text!";
  } else {
    mode.innerText = "바뀌기 전 text";
  }
});