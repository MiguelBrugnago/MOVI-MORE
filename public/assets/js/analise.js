'use strict';

const mapaMuscular = document.getElementById('mapa');

if (mapaMuscular) {
    const statusMapa = mapaMuscular.querySelector('#mapa-status');
    let regiaoSelecionada = null;

    const abrirDetalheMuscular = (regiao) => {
        const detalhe = document.getElementById(`musculo-${regiao.dataset.musculo}`);
        const resumo = detalhe?.querySelector('summary');

        if (!resumo) {
            return null;
        }

        regiaoSelecionada?.removeAttribute('aria-current');
        regiao.setAttribute('aria-current', 'location');
        regiaoSelecionada = regiao;

        detalhe.open = true;
        resumo.focus({ preventScroll: true });

        if (statusMapa) {
            statusMapa.textContent = regiao.getAttribute('aria-label') ?? '';
        }

        return detalhe;
    };

    mapaMuscular.querySelectorAll('[data-musculo]').forEach((regiao) => {
        regiao.addEventListener('click', (evento) => {
            if (evento.altKey || evento.ctrlKey || evento.metaKey || evento.shiftKey) {
                return;
            }

            abrirDetalheMuscular(regiao);
        });

        regiao.addEventListener('keydown', (evento) => {
            if (evento.key !== ' ') {
                return;
            }

            const detalhe = abrirDetalheMuscular(regiao);

            if (detalhe) {
                evento.preventDefault();

                const destino = `#${detalhe.id}`;

                if (window.location.hash === destino) {
                    detalhe.scrollIntoView({ block: 'start' });
                } else {
                    window.location.hash = destino;
                }
            }
        });
    });
}
