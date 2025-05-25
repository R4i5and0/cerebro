document.addEventListener("DOMContentLoaded", () => {
    const starsContainer = document.querySelector('.stars');

    if (starsContainer) {
        for (let i = 0; i < 150; i++) {
            const star = document.createElement('div');
            star.className = 'star';

            const size = Math.random() * 2 + 1 + 'px';
            star.style.width = size;
            star.style.height = size;
            star.style.top = Math.random() * 100 + '%';
            star.style.left = Math.random() * 100 + '%';
            star.style.position = 'absolute';
            star.style.borderRadius = '50%';

            // Cores suaves que combinam com o roxo cósmico
            const colors = ['#ff99ff', '#cc66ff', '#9966ff', '#66ccff', '#ffffff'];
            const color = colors[Math.floor(Math.random() * colors.length)];

            star.style.background = color;
            star.style.opacity = Math.random() * 0.6 + 0.4; // Mantém uma opacidade média para evitar contraste forte
            star.style.boxShadow = `0 0 ${Math.random() * 8 + 2}px ${color}`;
            star.style.animation = `blink ${Math.random() * 5 + 3}s infinite ease-in-out`;

            starsContainer.appendChild(star);
        }
    }
});

// Adicionando animação CSS para brilho suave
const style = document.createElement('style');
style.textContent = `
    @keyframes blink {
        0%, 100% { opacity: 0.3; transform: scale(1); }
        50% { opacity: 1; transform: scale(1.2); }
    }
    .star {
        transition: transform 0.5s ease-in-out;
    }
`;
document.head.appendChild(style);

document.addEventListener("DOMContentLoaded", function () {
    console.log("JavaScript carregado!");

    const modal = document.getElementById("sugerirFilmeModal");
    modal.addEventListener("shown.bs.modal", function () {
        console.log("Modal aberto!");
    });
});