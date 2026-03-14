document.addEventListener("DOMContentLoaded", function() {
    console.log("DOM fully loaded and parsed");

    function loadComponent(elementId, filePath) {
        fetch(filePath)
            .then(response => {
                if (!response.ok) throw new Error(`Failed to load ${filePath}: ${response.statusText}`);
                return response.text();
            })
            .then(data => {
                console.log(`${filePath} loaded successfully`);
                document.getElementById(elementId).innerHTML = data;
            })
            .catch(err => console.error(`Error loading ${filePath}:`, err));
    }

    loadComponent('headerLoad', 'components/header.html');
    loadComponent('footerLoad', 'components/footer.html');
});
