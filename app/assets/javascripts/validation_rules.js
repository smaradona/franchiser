var validator = new FormValidator('franchise_form', [{
    name: 'franchise[owner_name]',
    display: 'Nombre del Titular',
    rules: 'required|min_length[5]'
}, {
    name: 'franchise[owner_phone]',
    rules: 'numeric'
}, {
    name: 'franchise[owner_email]',
    display: 'Email del Titular',
    rules: 'valid_email'
}, {
    name: 'franchise[area]',
    display: 'Area de Cobertura',
    rules: 'required'
}, {
    name: 'franchise[latitude]',
    display: 'Coordenadas de la Franquicia',
    rules: 'required'
}], function(errors, event) {
    if (errors.length > 0) {
        var errorString = '';
        var errorsDiv = document.getElementById('errorsDiv');

        for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
            document.getElementById(errors[i].id).className += ' errorete';
            errorString += errors[i].message + '<br />';
        }
        errorsDiv.innerHTML = errorString;
    }
});