const formulario = document.querySelector('form');
const senha = document.querySelector('#senha');
const confirmar = document.querySelector('#confirmar_senha');
const erro = document.querySelector('#erro-senha');

function validarSenhas() {
    const diferentes = senha.value !== confirmar.value;

    confirmar.setCustomValidity(diferentes ? 'As senhas não coincidem.' : '');

    erro.textContent = diferentes ? 'As senhas não coincidem.' : '';

    return !diferentes;
}

senha.addEventListener('input', validarSenhas);
confirmar.addEventListener('input', validarSenhas);

formulario.addEventListener('submit', (evento) => {
    if (!validarSenhas()) {
        evento.preventDefault();
        confirmar.reportValidity();
    }
});
