const testimonials = document.querySelectorAll('.testimonial');
const slider = document.querySelector('.slider');
const arrows = document.querySelectorAll('.arrow');
let currentIndex = 0;

function updateTestimonial(currentIndex) {
    slider.style.transform = `translateX(${-100 * currentIndex}%)`;
}

function changeTestimonial(direction) {
    currentIndex = (currentIndex + direction + testimonials.length) % testimonials.length;
    updateTestimonial(currentIndex);
}

let slideInterval = setInterval(() => changeTestimonial(1), 3000);

arrows.forEach(arrow => {
    arrow.addEventListener('click', () => {
        clearInterval(slideInterval);
        changeTestimonial(arrow.classList.contains('right') ? 1 : -1);
        slideInterval = setInterval(() => changeTestimonial(1), 3000);
    });
});
