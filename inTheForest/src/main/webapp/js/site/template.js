let alinks = document.querySelectorAll('header a');

for(let i = 0; i < alinks.length; i++){
    alinks[i].addEventListener('click', (e) => {
        for(let i = 0; i < alinks.length; i++){
            alinks[i].classList.remove('active');
        }
        e.target.classList.add('active');
    });
}

//페이지 이동 시 template header 색상 적용 필요