'use strict';

const section = document.querySelector('[data-sessao]');
const start = document.querySelector('[data-inicio]');
const rest = document.querySelector('[data-descanso]');
const statusRest = document.querySelector('[data-rest-status]');
const family = 'movi-treino:' + (section?.dataset.sessao ?? '') + ':';
const format = (seconds, showHours = false) => {
    const n = Math.max(0, Math.floor(seconds));
    const sections = [Math.floor(n / 60) % 60, n % 60];
    if (showHours || n >= 3600) sections.unshift(Math.floor(n / 3600));
    return sections.map((value) => String(value).padStart(2, '0')).join(':');
};
const now = () => Math.floor(Date.now() / 1000);
let end = Number(rest?.dataset.descanso ?? 0);
let paused = 0;
let activeRequest = false;

function tick() {
    if (start) start.textContent = format(now() - Number(start.dataset.inicio), true);
    if (!rest) return;
    rest.textContent = format(paused || end - now());
    if (end && end <= now()) {
        end = 0;
        statusRest.textContent = 'Descanso concluído.';
    }
}
tick();
if (start || rest) window.setInterval(tick, 500);

async function post(form, submitter, fields) {
    const body = new FormData(form, submitter ?? undefined);
    for (const [key, value] of Object.entries(fields ?? {})) body.set(key, value);
    const response = await fetch(form.action, {
        method: 'POST',
        body,
        headers: { Accept: 'application/json' },
        redirect: 'follow',
    });
    if (!response.headers.get('content-type')?.includes('application/json')) {
        throw new Error('A sessão pode ter expirado. Reabra esta página antes de tentar novamente.');
    }
    const data = await response.json();
    if (!response.ok) throw new Error(data.erro ?? 'Falha ao salvar.');
    return data;
}

async function setRest(form, submitter, seconds) {
    if (activeRequest) return;
    activeRequest = true;
    try {
        const data = await post(form, submitter, { segundos: String(seconds) });
        end = Number(data.descanso ?? 0);
        paused = 0;
        statusRest.textContent = seconds ? 'Cronômetro atualizado.' : 'Descanso encerrado.';
        pauseButton.textContent = 'Pausar';
        tick();
    } catch (error) {
        statusRest.textContent = error.message;
    } finally {
        activeRequest = false;
    }
}
const pauseButton = document.querySelector('[data-rest-pause]');
if (pauseButton) {
    pauseButton.hidden = false;
    pauseButton.addEventListener('click', async () => {
        const form = pauseButton.closest('form');
        if (paused) return setRest(form, null, paused);
        const remaining = Math.max(0, end - now());
        if (!remaining || activeRequest) return;
        activeRequest = true;
        try {
            await post(form, null, { segundos: '0' });
            end = 0;
            paused = remaining;
            pauseButton.textContent = 'Retomar';
            statusRest.textContent = 'Descanso pausado nesta página.';
            tick();
        } catch (error) {
            statusRest.textContent = error.message;
        } finally {
            activeRequest = false;
        }
    });
}
document.querySelectorAll('[data-rest-form]').forEach((form) => {
    form.addEventListener('submit', (event) => {
        event.preventDefault();
        const values = new FormData(form, event.submitter ?? undefined);
        const seconds = Number(values.get('segundos'));
        if (Number.isInteger(seconds) && seconds >= 0) setRest(form, event.submitter, seconds);
    });
});

const editable = (form) =>
    Array.from(form.elements).filter(
        (field) => field.name && ['number', 'textarea', 'select-one'].includes(field.type),
    );
const getDraft = (key) => {
    try {
        return JSON.parse(sessionStorage.getItem(key) ?? 'null');
    } catch {
        return null;
    }
};
const setDraft = (key, values) => {
    try {
        sessionStorage.setItem(key, JSON.stringify(values));
    } catch {
        /* O salvamento no servidor continua disponível. */
    }
};
const removeDraft = (key) => {
    try {
        sessionStorage.removeItem(key);
    } catch {
        /* O armazenamento local é opcional. */
    }
};
function bindSeries(root = document) {
    for (const form of root.querySelectorAll('[data-serie-form]')) {
        const key = family + form.dataset.item + ':' + form.dataset.serie;
        const fields = editable(form);
        const status = form.querySelector('[data-save-status]');
        const chave = form.elements.namedItem('chave');
        const card = form.closest('[data-serie-card]');
        const autosave = start && form.dataset.serie !== '0' && card.dataset.estado === 'pendente';
        let scheduled;
        const valuesNow = () => Object.fromEntries(fields.map((field) => [field.name, field.value]));
        const draft = getDraft(key);
        if (draft) {
            for (const field of fields) if (typeof draft[field.name] === 'string') field.value = draft[field.name];
            if (chave && /^[a-f0-9]{32}$/.test(draft.chave ?? '')) chave.value = draft.chave;
            form.closest('details').open = true;
            status.textContent = 'Rascunho recuperado nesta aba. Salve para enviar ao servidor.';
        }
        const store = () => {
            const values = valuesNow();
            if (chave) values.chave = chave.value;
            setDraft(key, values);
        };
        const savePending = async () => {
            if (!form.isConnected || !form.checkValidity()) return;
            if (activeRequest) {
                scheduled = window.setTimeout(savePending, 600);
                return;
            }
            activeRequest = true;
            const snapshot = JSON.stringify(valuesNow());
            status.textContent = 'Salvando rascunho…';
            try {
                await post(form, null, { estado: 'pendente', modo: 'rascunho' });
                // Se houve outra edição durante o envio, a aba ainda precisa do rascunho.
                if (snapshot === JSON.stringify(valuesNow())) {
                    removeDraft(key);
                    status.textContent = 'Rascunho salvo no treino.';
                }
            } catch (error) {
                status.textContent = error.message + ' O rascunho continua nesta aba.';
            } finally {
                activeRequest = false;
            }
        };
        const changed = () => {
            store();
            if (autosave) {
                window.clearTimeout(scheduled);
                scheduled = window.setTimeout(savePending, 950);
            }
        };
        form.addEventListener('input', changed);
        form.querySelectorAll('[data-preencher]').forEach((button) =>
            button.addEventListener('click', (event) => {
                for (const [name, value] of Object.entries(JSON.parse(event.currentTarget.dataset.preencher))) {
                    const input = form.elements.namedItem(name);
                    if (input) input.value = value;
                }
                changed();
            }),
        );
        form.addEventListener('submit', async (event) => {
            event.preventDefault();
            if (activeRequest) {
                status.textContent = 'Aguarde o salvamento atual.';
                return;
            }
            activeRequest = true;
            window.clearTimeout(scheduled);
            store();
            status.textContent = 'Salvando…';
            try {
                const request = post(form, event.submitter);
                form.inert = true;
                const data = await request;
                removeDraft(key);
                if (!data.serie) {
                    window.location.reload();
                    return;
                }
                const template = document.createElement('template');
                // O fragmento vem das views do próprio servidor, que escapam os dados do usuário.
                template.innerHTML = data.serie + (data.novaSerie ?? '');
                const updated = template.content.firstElementChild;
                updated.open = updated.dataset.estado === 'pendente';
                bindSeries(template.content);
                card.replaceWith(template.content);
                if (rest) {
                    const updatedEnd = Number(data.descanso ?? 0);
                    if (updatedEnd && updatedEnd !== end) {
                        paused = 0;
                        pauseButton.textContent = 'Pausar';
                        statusRest.textContent = 'Descanso iniciado.';
                    }
                    end = updatedEnd;
                    tick();
                }
                updated.querySelector('summary')?.focus({ preventScroll: true });
            } catch (error) {
                status.textContent = error.message + ' Seus valores continuam no formulário.';
            } finally {
                form.inert = false;
                activeRequest = false;
            }
        });
    }
}
bindSeries();
const confirmation = document.createElement('dialog');
confirmation.className = 'treino-dialogo';
confirmation.setAttribute('aria-labelledby', 'treino-dialogo-titulo');
confirmation.setAttribute('aria-describedby', 'treino-dialogo-mensagem');
confirmation.innerHTML =
    '<h2 id="treino-dialogo-titulo">Confirmar ação</h2><p id="treino-dialogo-mensagem"></p>' +
    '<form method="dialog" class="treino-acoes"><button value="cancelar" autofocus>Voltar</button>' +
    '<button value="confirmar">Confirmar</button></form>';
if (document.querySelector('[data-confirm]')) document.body.append(confirmation);
let pendingConfirmation;
confirmation.addEventListener('close', () => {
    if (confirmation.returnValue === 'confirmar' && pendingConfirmation?.form.isConnected) {
        const { form, button } = pendingConfirmation;
        form.requestSubmit(button);
    }
    pendingConfirmation = undefined;
});
document.addEventListener('submit', (event) => {
    const button = event.submitter;
    const message = button?.dataset.confirm;
    if (!message || pendingConfirmation?.button === button) return;
    if (typeof confirmation.showModal !== 'function') {
        if (!window.confirm(message)) event.preventDefault();
        return;
    }
    event.preventDefault();
    if (confirmation.open) return;
    pendingConfirmation = { form: event.target, button };
    confirmation.querySelector('p').textContent = message;
    confirmation.returnValue = 'cancelar';
    confirmation.showModal();
});
