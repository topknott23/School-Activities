
document.getElementById('paymentForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent form submission

    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const serviceChoice = document.getElementById('serviceChoice').value;
    const additionalInfo = document.getElementById('additionalInfo').value;

   
    if (name && email && serviceChoice) {
     
        alert(`Payment Successful!\n\nName: ${name}\nEmail: ${email}\nService: ${serviceChoice}\nAdditional Info: ${additionalInfo || 'None'}`);

     
        window.location.href = 'payment.html'; 
    } else {
        alert('Please fill out all required fields.');
    }
});