const formulario = document.querySelector('form');
const senha = document.querySelector('#senha');
const confirmar = document.querySelector('#confirmar_senha');
const erro = document.querySelector('#erro-senha');

/** Sincroniza a mensagem visível com a validação nativa do campo de confirmação.
 * @returns {boolean} Indica se a senha e a confirmação coincidem. */
function validarSenhas() {
    const diferentes = senha.value !== confirmar.value;

    confirmar.setCustomValidity(diferentes ? 'As senhas não coincidem.' : '');

    erro.textContent = diferentes ? 'As senhas não coincidem.' : '';

    return !diferentes;
}

senha.addEventListener('input', validarSenhas);
confirmar.addEventListener('input', validarSenhas);

// Confere novamente no envio e pede ao navegador que apresente a mensagem no campo de confirmação.
formulario.addEventListener('submit', (evento) => {
    if (!validarSenhas()) {
        evento.preventDefault();
        confirmar.reportValidity();
    }
});
