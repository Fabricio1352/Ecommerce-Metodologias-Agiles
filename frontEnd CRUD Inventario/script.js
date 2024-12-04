document.addEventListener('DOMContentLoaded', function() {
    const cuadro = document.getElementById('cuadro');
    const modal = document.getElementById('modal');
    const closeButton = document.querySelector('.close-button');
    const form = document.getElementById('form');
    const elementosContainer = document.getElementById('elementos-container');
    const modalTitle = document.getElementById('modal-title');
    const submitButton = document.getElementById('submit-button');
    let editingElement = null;

    cuadro.addEventListener('click', function() {
        modal.style.display = 'block';
        modalTitle.textContent = 'Crear Nuevo Elemento';
        submitButton.textContent = 'Crear';
        editingElement = null;
    });

    closeButton.addEventListener('click', function() {
        modal.style.display = 'none';
        editingElement = null;
        form.reset();
    });

    window.addEventListener('click', function(event) {
        if (event.target == modal) {
            modal.style.display = 'none';
            editingElement = null;
            form.reset();
        }
    });

    form.addEventListener('submit', function(event) {
        event.preventDefault();

        const nombre = document.getElementById('nombre').value;
        const precio = document.getElementById('precio').value;
        const unidades = document.getElementById('unidades').value;
        const imagenInput = document.getElementById('imagen');
        const imagenFile = imagenInput.files[0];

        if (imagenFile) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const imagenSrc = e.target.result;

                if (editingElement) {
                    editingElement.querySelector('img').src = imagenSrc;
                    editingElement.querySelector('h3').textContent = nombre;
                    editingElement.querySelector('.precio').textContent = `Precio: $${precio}`;
                    editingElement.querySelector('.unidades').textContent = `Unidades: ${unidades}`;
                    editingElement = null;
                } else {
                    const nuevoElementoWrapper = document.createElement('div');
                    nuevoElementoWrapper.className = 'elemento-wrapper';

                    const nuevoElemento = document.createElement('div');
                    nuevoElemento.className = 'elemento';
                    nuevoElemento.innerHTML = `
                        <img src="${imagenSrc}" alt="${nombre}">
                        <h3>${nombre}</h3>
                        <p class="precio">Precio: $${precio}</p>
                        <p class="unidades">Unidades: ${unidades}</p>
                        <div class="elemento-buttons">
                            <button class="update-button">Actualizar</button>
                            <button class="delete-button">Borrar</button>
                        </div>
                    `;

                    nuevoElementoWrapper.appendChild(nuevoElemento);
                    elementosContainer.appendChild(nuevoElementoWrapper);

                    const updateButton = nuevoElemento.querySelector('.update-button');
                    const deleteButton = nuevoElemento.querySelector('.delete-button');

                    updateButton.addEventListener('click', function() {
                        editingElement = nuevoElemento;
                        document.getElementById('nombre').value = nombre;
                        document.getElementById('precio').value = precio;
                        document.getElementById('unidades').value = unidades;
                        modalTitle.textContent = 'Editar Elemento';
                        submitButton.textContent = 'Actualizar';
                        modal.style.display = 'block';
                    });

                    deleteButton.addEventListener('click', function() {
                        elementosContainer.removeChild(nuevoElementoWrapper);
                    });
                }

                modal.style.display = 'none';
                form.reset();
            };
            reader.readAsDataURL(imagenFile);
        } else {
            alert('Por favor, selecciona una imagen.');
        }
    });
});
