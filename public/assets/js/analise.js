'use strict';
document.querySelectorAll('[data-musculo]').forEach(regiao => {
    regiao.addEventListener('click', () => {
        const detalhe = document.getElementById('musculo-' + regiao.dataset.musculo);
        if (!detalhe) return;
        detalhe.open = true;
        detalhe.querySelector('summary').focus({preventScroll: true});
        document.getElementById('mapa-status').textContent = regiao.getAttribute('aria-label');
    });
    regiao.addEventListener('keydown', evento => {
        if (evento.key === ' ') { evento.preventDefault(); regiao.dispatchEvent(new MouseEvent('click', {bubbles: true})); }
    });
});
