const toggleBtn = document.querySelector('.navbar_toogleBtn');
const menu = document.querySelector('.navbar_menu');
const bttn = document.querySelector('.aaa');
const icons = document.querySelector('.navbar_icons');

toggleBtn.addEventListener('click',() => {
    menu.classList.toggle('active');
    bttn.classList.toggle('active');
    icons.classList.toggle('active');

});