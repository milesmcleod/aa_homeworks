document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!

  let form = document.getElementById("fav-form");
  form.addEventListener("submit", event => {
    event.preventDefault();
    const favoritePlace = document.getElementsByClassName("favorite-input");
    const place = favoritePlace[0].value;
    favoritePlace[0].value = "";
    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = place;
    ul.appendChild(li);
  });



  // adding new photos

  // --- your code here!

  let button = document.getElementsByClassName("photo-show-button")[0];
  button.addEventListener("click", event => {
    let div = document.getElementsByClassName("photo-form-container")[0];
    if (div.className === 'photo-form-container'){
      div.className = 'photo-form-container hidden';
    } else {
      div.className = 'photo-form-container';
    }


  });

  let form2 = document.querySelectorAll(".photo-form-container form")[0];
  let url = document.getElementsByClassName("photo-url-input")[0];
  form2.addEventListener("submit", event => {
    event.preventDefault();
    const ul = document.getElementsByClassName("dog-photos")[0];
    let li = document.createElement("li");
    let img = document.createElement("img");
    img.src = (`${url.value}`);
    url.value = '';
    li.append(img);
    ul.append(li);
  });



});
