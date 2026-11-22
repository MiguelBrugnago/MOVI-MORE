'use strict';
// SVG nativo: sem CDN, rastreamento ou envio de dados de saúde a terceiros.
document.querySelectorAll('[data-pontos]').forEach((container) => {
    const pontos = JSON.parse(container.dataset.pontos);
    const svg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
    svg.setAttribute('viewBox', '0 0 400 220');
    svg.setAttribute('role', 'img');
    svg.setAttribute('aria-label', container.dataset.rotulo + '. Valores disponíveis na tabela abaixo.');
    // Cria cada parte no namespace SVG e usa textContent para os rótulos vindos dos dados.
    const add = (tag, attrs, text) => {
        const node = document.createElementNS(svg.namespaceURI, tag);
        Object.entries(attrs).forEach(([k, v]) => node.setAttribute(k, v));
        if (text !== undefined) node.textContent = text;
        svg.append(node);
        return node;
    };
    const valores = pontos.map((p) => Number(p.valor));
    const datas = pontos.map((p) => Date.parse(p.data + 'T12:00:00Z'));
    const min = Math.min(...valores),
        max = Math.max(...valores),
        amplitude = max - min || 1;
    const inicio = Math.min(...datas),
        fim = Math.max(...datas);
    // Uma única data fica no centro; valores iguais usam amplitude 1 para evitar divisão por zero.
    const coords = pontos.map((p, i) => [
        fim === inicio ? 220 : 60 + ((datas[i] - inicio) / (fim - inicio)) * 310,
        170 - ((Number(p.valor) - min) / amplitude) * 130,
    ]);
    add('path', { d: 'M60 25 V180 H380', fill: 'none', stroke: '#98aeb9' });
    add('text', { x: 55, y: 174, 'text-anchor': 'end', 'font-size': 12 }, min.toLocaleString('pt-BR'));
    if (max !== min) add('text', { x: 55, y: 44, 'text-anchor': 'end', 'font-size': 12 }, max.toLocaleString('pt-BR'));
    add('text', { x: 60, y: 205, 'font-size': 12 }, pontos[0].data);
    add('text', { x: 380, y: 205, 'text-anchor': 'end', 'font-size': 12 }, pontos[pontos.length - 1].data);
    add('polyline', {
        points: coords.map((c) => c.join(',')).join(' '),
        fill: 'none',
        stroke: '#075d72',
        'stroke-width': 2,
    });
    coords.forEach(([cx, cy], i) => {
        const circle = add('circle', { cx, cy, r: 4, fill: '#075d72' });
        const title = document.createElementNS(svg.namespaceURI, 'title');
        title.textContent = pontos[i].data + ': ' + valores[i].toLocaleString('pt-BR');
        circle.append(title);
    });
    container.append(svg);
});
document.querySelectorAll('.fisico-comparacao').forEach((section) => {
    const dados = JSON.parse(section.querySelector('[data-comparacao-dados]').textContent);
    const selects = section.querySelectorAll('[data-comparar]');
    // Recalcula a comparação localmente quando muda uma das duas avaliações selecionadas.
    const render = () => {
        const [a, b] = [...selects].map((s) => dados.avaliacoes.find((a) => String(a.id) === s.value));
        const table = document.createElement('table');
        const linha = (valores, head = false) => {
            const tr = document.createElement('tr');
            valores.forEach((v) => {
                const td = document.createElement(head ? 'th' : 'td');
                td.textContent = v;
                tr.append(td);
            });
            table.append(tr);
        };
        linha(['Indicador', 'Inicial', 'Final', 'Variação'], true);
        const format = (v) =>
            v == null ? 'Não informado' : Number(v).toLocaleString('pt-BR', { maximumFractionDigits: 3 });
        // A diferença é o valor final menos o inicial. Para gordura em porcentagem, a diferença é expressa em pontos percentuais.
        Object.entries(dados.metricas).forEach(([chave, [nome, unidade]]) => {
            const x = a.medidas[chave],
                y = b.medidas[chave];
            linha([
                nome + ' (' + unidade + ')',
                format(x),
                format(y),
                x == null || y == null ? '—' : format(y - x) + (unidade === '%' ? ' p.p.' : ' ' + unidade),
            ]);
        });
        section.querySelector('[data-comparacao-saida]').replaceChildren(table);
    };
    selects.forEach((s) => s.addEventListener('change', render));
    render();
});
