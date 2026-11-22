'use strict';
document.querySelectorAll('[data-musculo]').forEach((regiao) => {
    // A região e o painel de detalhes compartilham o identificador do músculo. Ao abrir, o foco vai para o resumo acessível.
    regiao.addEventListener('click', () => {
        const detalhe = document.getElementById('musculo-' + regiao.dataset.musculo);
        if (!detalhe) return;
        detalhe.open = true;
        detalhe.querySelector('summary').focus({ preventScroll: true });
        document.getElementById('mapa-status').textContent = regiao.getAttribute('aria-label');
    });
    // A barra de espaço repete a ação do clique e evita rolar a página.
    regiao.addEventListener('keydown', (evento) => {
        if (evento.key === ' ') {
            evento.preventDefault();
            regiao.dispatchEvent(new MouseEvent('click', { bubbles: true }));
        }
    });
});
